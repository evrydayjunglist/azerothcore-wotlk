DELETE FROM `acore_string` WHERE `entry` IN (30087, 30088, 30089, 30090, 30091, 30092);
INSERT INTO `acore_string` (`entry`, `content_default`, `locale_koKR`, `locale_frFR`, `locale_deDE`, `locale_zhCN`, `locale_zhTW`, `locale_esES`, `locale_esMX`, `locale_ruRU`) VALUES
(
    30087,
    '|cffffff00[|cffff0000ANTICHEAT ALERT|r|cffffff00]:|r |cFFFF8C00|r |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latency: %u ms - Report: %s',
    NULL,
    '|cffffff00[|cffff0000ALERTE ANTICHEAT|r|cffffff00]:|r |cFFFF8C00|r |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latence : %u ms - Rapport : %s',
    NULL, NULL, NULL,
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r |cFFFF8C00|r |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latencia: %u ms - Reporte: %s',
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r |cFFFF8C00|r |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latencia: %u ms - Reporte: %s',
    NULL
),
(
    30088,
    '|cffffff00[|cffff0000ANTICHEAT ALERT|r|cffffff00]:|r POSSIBLE TELEPORT HACK DETECTED|cFFFF8C00 [|Hplayer:%s|h%s|h|r|cFFFF8C00]|r - Latency: %u ms - GPS Diff x: %f, y: %f, z: %f',
    NULL,
    '|cffffff00[|cffff0000ALERTE ANTICHEAT|r|cffffff00]:|r POSSIBLE TÉLÉPORT HACK DÉTECTÉ|cFFFF8C00 [|Hplayer:%s|h%s|h|r|cFFFF8C00]|r - Latence : %u ms - Diff GPS x: %f, y: %f, z: %f',
    NULL, NULL, NULL,
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r POSIBLE HACK DE TELEPORTE DETECTADO|cFFFF8C00 [|Hplayer:%s|h%s|h|r|cFFFF8C00]|r - Latencia: %u ms - GPS Diff x: %f, y: %f, z: %f',
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r POSIBLE HACK DE TELEPORTE DETECTADO|cFFFF8C00 [|Hplayer:%s|h%s|h|r|cFFFF8C00]|r - Latencia: %u ms - GPS Diff x: %f, y: %f, z: %f',
    NULL
),
(
    30089,
    '|cffffff00[|cffff0000ANTICHEAT ALERT|r|cffffff00]:|r POSSIBLE IGNORE CONTROL HACK DETECTED|cFFFF8C00 %s|r - Latency: %u ms',
    NULL,
    '|cffffff00[|cffff0000ALERTE ANTICHEAT|r|cffffff00]:|r POSSIBLE IGNORE CONTROL HACK DÉTECTÉ|cFFFF8C00 %s|r - Latence : %u ms',
    NULL, NULL, NULL,
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r POSIBLE CONTROL DE HACK DETECTADO IGNORARADO|cFFFF8C00 %s|r - Latencia: %u ms',
    '|cffffff00[|cffff0000ALERTA ANTITRAMPAS|r|cffffff00]:|r POSIBLE CONTROL DE HACK DETECTADO IGNORARADO|cFFFF8C00 %s|r - Latencia: %u ms',
    NULL
),
(
    30090,
    '|cffffff00[|cffff0000ANTICHEAT ALERT|r|cffffff00]:|r TELEPORT HACK USED WHILE DUELING|cFFFF8C00 %s|r - Latency: %u ms vs |cFFFF8C00 %s|r - Latency: %u ms.',
    NULL,
    '|cffffff00[|cffff0000ALERTE ANTICHEAT|r|cffffff00]:|r TÉLÉPORT HACK UTILISÉ PENDANT UN DUEL|cFFFF8C00 %s|r - Latence : %u ms vs |cFFFF8C00 %s|r - Latence : %u ms.',
    NULL, NULL, NULL, NULL, NULL, NULL
),
(
    30091,
    '|cffffff00[|cffff0000ANTICHEAT ALERT|r|cffffff00]:|r BG Start Teleport\\Exploit Hack DETECTED|cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latency: %u ms',
    NULL,
    '|cffffff00[|cffff0000ALERTE ANTICHEAT|r|cffffff00]:|r Téléport Début BG\\Exploit Hack DÉTECTÉ|cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00] - Latence : %u ms',
    NULL, NULL, NULL, NULL, NULL, NULL
),
(
    30092,
    '|cffffff00[|cffff0000COUNTER MEASURE ALERT|r|cffffff00]:|r |cFFFF8C00|r %s |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00]',
    NULL,
    '|cffffff00[|cffff0000ALERTE CONTRE MESURE|r|cffffff00]:|r |cFFFF8C00|r %s |cFFFF8C00[|Hplayer:%s|h%s|h|r|cFFFF8C00]',
    NULL, NULL, NULL, NULL, NULL, NULL
);

DELETE FROM `command` WHERE  `name`='anticheat jail';
DELETE FROM `command` WHERE  `name`='anticheat delete';
DELETE FROM `command` WHERE  `name`='anticheat player';
DELETE FROM `command` WHERE  `name`='anticheat';
DELETE FROM `command` WHERE  `name`='anticheat global';
DELETE FROM `command` WHERE  `name`='anticheat parole';
DELETE FROM `command` WHERE  `name`='anticheat purge';
DELETE FROM `command` WHERE  `name`='anticheat warn';
INSERT INTO `command` (`name`, `security`, `help`) VALUES 
('anticheat', 2, 'Syntax: .anticheat\r\n\r\nDisplay the access level of anticheat commands if you possess the necessary permissions.'),
('anticheat global', 2, 'Syntax: .anticheat global\r\n\r\nDisplay if anticheat is active with global statistics.'),
('anticheat player', 2, 'Syntax: .anticheat player [$charactername]\r\n\r\nDisplay anticheat statistics of current session of player.'),
('anticheat delete', 3, 'Syntax: .anticheat delete [$charactername]\r\n\r\nDeletes anticheat statistics of current session of player.'),
('anticheat jail', 2, 'Syntax: .anticheat jail [$charactername]\r\n\r\nJails and restricts player and teleports GM cmd user to jail with no restrictions'),
('anticheat parole', 3, 'Syntax: .anticheat parole [$charactername]\r\n\r\nDeletes anticheat statistics, removes jail restrictions, and sends to faction capital of player.'),
('anticheat purge', 3, 'Syntax: .anticheat purge\r\n\r\nDeletes stored statistics of daily_players_reports table.'),
('anticheat warn', 2, 'Syntax: .anticheat warn [$charactername]\r\n\r\nSends individual player they are being monitored for possible cheating.');
