#include "mod_achievements.h"

#include "Config.h"
#include "Chat.h"
#include "Player.h"

void AccountAchievementsWorldScript::LoadAchievementWhitelist()
{
    auto qResult = WorldDatabase.Query("SELECT achievement_id FROM account_achievements_whitelist");

    if (!qResult)
    {
        LOG_WARN("module", ">> Loaded 0 account achievements from account_achievements_whitelist.");
        return;
    }

    uint32 count = 0;

    do
    {
        auto fields = qResult->Fetch();

        uint32 achievementId = fields[0].Get<uint32>();

        achievementWhitelist.emplace(achievementId);

        count++;
    }
    while (qResult->NextRow());

    LOG_INFO("module", Acore::StringFormatFmt(">> Loaded {} account achievements from account_achievements_whitelist.", count));
}

void AccountAchievementsWorldScript::OnAfterConfigLoad(bool reload)
{
    if (reload)
    {
        achievementWhitelist.clear();
    }

    LoadAchievementWhitelist();
}

void AccountAchievementsPlayerScript::OnLogin(Player* player)
{
    if (!sConfigMgr->GetOption<bool>("Account.Achievements.Enable", true))
    {
        return;
    }

    if (sConfigMgr->GetOption<bool>("Account.Achievements.Announce", true))
    {
        ChatHandler(player->GetSession()).SendSysMessage("This server is running the |cff4CFF00AccountAchievements |rmodule.");
    }

    std::vector<uint32> guids;

    // Select all the player guids
    {
        QueryResult qResult = CharacterDatabase.Query("SELECT guid, race FROM characters WHERE account = {}", player->GetSession()->GetAccountId());

        if (!qResult)
        {
            return;
        }

        do
        {
            Field* fields = qResult->Fetch();

            uint32 race = fields[1].Get<uint8>();
            uint32 guid = fields[0].Get<uint32>();

            if ((Player::TeamIdForRace(race) == player->GetTeamId()))
            {
                guids.push_back(guid);
            }

        } while (qResult->NextRow());
    }

    std::vector<uint32> achievements;

    // Use the guids to find achievements
    {
        for (auto& i : guids)
        {
            QueryResult qResult = CharacterDatabase.Query("SELECT achievement FROM character_achievement WHERE guid = {}", i);

            if (!qResult)
            {
                continue;
            }

            do
            {
                uint32 achievementId = qResult->Fetch()[0].Get<uint32>();

                // Only include whitelisted achievements.
                if (!IsAchievementWhitelisted(achievementId))
                {
                    continue;
                }

                achievements.push_back(achievementId);
            } while (qResult->NextRow());
        }
    }

    // Apply all the achievements found
    for (auto& i : achievements)
    {
        AddAchievement(player, i);
    }
}

void AccountAchievementsPlayerScript::AddAchievement(Player* player, uint32 achievementId)
{
    if(player->HasAchieved(achievementId))
    {
        return;
    }

    auto achievement = sAchievementStore.LookupEntry(achievementId);
    if (!achievement)
    {
        LOG_ERROR("module", Acore::StringFormatFmt("Tried to add achievement '{}' to player '{}' but the achievement does not exist!", player->GetName(), achievementId));
        return;
    }

    player->CompletedAchievement(achievement);
}

bool AccountAchievementsPlayerScript::IsAchievementWhitelisted(uint32 achievementId)
{
    return achievementWhitelist.find(achievementId) != achievementWhitelist.end();
}

void AddAccountAchievementsScripts()
{
    new AccountAchievementsWorldScript();
    new AccountAchievementsPlayerScript();
}
