#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Config.h"
#include "Map.h"

struct DynamicLootRatesConfig {
    bool enabled = true;
    
    uint32 dungeonLootGroupRate = 1;
    uint32 dungeonLootReferenceRate = 1;

    uint32 raidLootGroupRate = 1;
    uint32 raidLootReferenceRate = 1;
};

DynamicLootRatesConfig config;

class DynamicLootRates_WorldScript : public WorldScript {
public:
    DynamicLootRates_WorldScript()
            : WorldScript("DynamicLootRates_WorldScript") {
    }

    void OnBeforeConfigLoad(bool /*reload*/) override {
        config.enabled = sConfigMgr->GetOption<bool>("DynamicLootRates.Enable", true);
        config.dungeonLootGroupRate = sConfigMgr->GetOption<uint32>("DynamicLootRates.Dungeon.Rate.GroupAmount", 1);
        config.dungeonLootReferenceRate = sConfigMgr->GetOption<uint32>("DynamicLootRates.Dungeon.Rate.ReferencedAmount", 1);
        config.raidLootGroupRate = sConfigMgr->GetOption<uint32>("DynamicLootRates.Raid.Rate.GroupAmount", 1);
        config.raidLootReferenceRate = sConfigMgr->GetOption<uint32>("DynamicLootRates.Raid.Rate.ReferencedAmount", 1);
    }
};

class DynamicLootRates_GlobalScript : public GlobalScript
{
public:
    DynamicLootRates_GlobalScript() : GlobalScript("DynamicLootRates_GlobalScript") {}

    void OnAfterCalculateLootGroupAmount(Player const *player, Loot & /*loot*/, uint16 /*lootMode*/, uint32 &groupAmount, LootStore const & /*store*/) override
    {
        if (!config.enabled) {
            return;
        }

        if (isDungeon(player->GetMap())) {
            groupAmount = config.dungeonLootGroupRate;
            LOG_DEBUG("module", "mod_dynamic_loot_rates: In dungeon: Applying loot group rate of {}", groupAmount);
            return;
        }

        if (isRaid(player->GetMap())) {
            groupAmount = config.raidLootGroupRate;
            LOG_DEBUG("module", "mod_dynamic_loot_rates: In raid: Applying loot group rate of {}", groupAmount);
            return;
        }
    }

    void OnAfterRefCount(Player const *player, LootStoreItem * /*LootStoreItem*/, Loot & /*loot*/, bool /*canRate*/, uint16 /*lootMode*/, uint32 &maxcount, LootStore const & /*store*/) override
    {
        if (!config.enabled) {
            return;
        }

        if (isDungeon(player->GetMap())) {
            maxcount = config.dungeonLootGroupRate;
            LOG_DEBUG("module", "mod_dynamic_loot_rates: In dungeon: Applying loot reference rate of {}", maxcount);
            return;
        }

        if (isRaid(player->GetMap())) {
            maxcount = config.raidLootGroupRate;
            LOG_DEBUG("module", "mod_dynamic_loot_rates: In raid: Applying loot reference rate of {}", maxcount);
            return;
        }
    }

    bool isDungeon(Map* map) {
        return map->IsDungeon() && !map->IsRaid();
    }

    bool isRaid(Map* map) {
        return map->IsRaid();
    }
};

// Add all scripts in one
void AddDynamicLootRateScripts()
{
    new DynamicLootRates_WorldScript();
    new DynamicLootRates_GlobalScript();
}
