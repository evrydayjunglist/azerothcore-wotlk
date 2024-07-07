SET
@Entry    := 7500000,
@Model    := 25609,
@Name     := "Edward Findle",
@Title    := "Heirloom Hoarder",
@Icon     := "Speak",
@MinLevel := 25,
@MaxLevel := 25,
@Faction  := 35,
@NPCFlag  := 129,
@Rank     := 0,
@Type     := 7,
@Script   := "npc_heirloom_hoarder";

-- Creature template
DELETE FROM `creature_template` WHERE `entry`=@Entry;
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `unit_class`, `unit_flags`, `type`, `ScriptName`) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 2, @Type, @Script);
