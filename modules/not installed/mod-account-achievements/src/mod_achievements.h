#ifndef MODULE_MOD_ACHIEVEMENTS
#define MODULE_MOD_ACHIEVEMENTS

#include "ScriptMgr.h"

#include <unordered_set>

std::unordered_set<uint32> achievementWhitelist;

class AccountAchievementsWorldScript : public WorldScript
{
public:
    AccountAchievementsWorldScript() : WorldScript("AccountAchievementsWorldScript") { }

public:
    void OnAfterConfigLoad(bool /*reload*/) override;
    void LoadAchievementWhitelist();
};

class AccountAchievementsPlayerScript : public PlayerScript
{
public:
    AccountAchievementsPlayerScript() : PlayerScript("AccountAchievementsPlayerScript") { }

public:
    void OnLogin(Player* /*player*/) override;
    void AddAchievement(Player* /*player*/, uint32 /*achievementId*/);
    bool IsAchievementWhitelisted(uint32 /*achievementId*/);
};

#endif // MODULE_MOD_ACHIEVEMENTS
