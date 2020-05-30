-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2020 at 05:24 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minecraft`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `uuid` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `expires` bigint(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `creditstore_history`
--

CREATE TABLE `creditstore_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `newbal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `creditstore_item`
--

CREATE TABLE `creditstore_item` (
  `id` varchar(255) NOT NULL,
  `disp` int(10) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `gamemode` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  `price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditstore_item`
--

INSERT INTO `creditstore_item` (`id`, `disp`, `name`, `command`, `gamemode`, `description`, `imgurl`, `price`) VALUES
('dun_24h_shield', 1010, '24 Hour Shield', 'shield 24h', 'dungeons', 'Not ready to have your gold stolen just yet? This item increases your time in shield by <b>24 hours</b>, so that others may not attack you.<br><br>While shielded, you can still invite others to friendly challenges against your dungeon, as well as rebuild & <b>/publish</b> your dungeon, but you may not attack others.', '/img/mc/png/shield-icon.png', 100),
('dun_3d_shield', 1020, '3 Day Shield', 'shield 3d', 'dungeons', 'Not ready to have your gold stolen just yet? This item increases your time in shield by <b>3 days</b>, so that others may not attack you.<br><br>While shielded, you can still invite others to friendly challenges against your dungeon, as well as rebuild & <b>/publish</b> your dungeon, but you may not attack others.', '/img/mc/png/shield-icon.png', 200),
('dun_7d_shield', 1030, '7 Day Shield', 'shield 7d', 'dungeons', 'Not ready to have your gold stolen just yet? This item increases your time in shield by <b>7 days</b>, so that others may not attack you.<br><br>While shielded, you can still invite others to friendly challenges against your dungeon, as well as rebuild & <b>/publish</b> your dungeon, but you may not attack others.', '/img/mc/png/shield-icon.png', 400),
('dun_gold_token', 1000, 'Gold Token', 'token', 'dungeons', '"Not enough gold"? If you hate that message, then this item might be for you. This item instantly adds <b>10,000 gold</b> to your account. But spend it quickly, or it might get stolen!', '/img/mc/png/Gold%20Ingot.png', 200),
('ms_lootbox', 0, 'Loot Box', 'lootbox', 'survival', 'Tired of searching for chests that don\'t even contain the special item you want?This item spawns a Loot Box that contains <b>5 special items</b>, with one <b>guaranteed rare or better</b>!', '/img/mc/png/lootbox.png', 50),
('ms_mega_lootbox', 10, 'Mega Loot Box', 'megalootbox', 'survival', 'This is the best of the best. This item spawns a Mega Loot Box, which contains <b>5 special items</b>, with at least <b>one guaranteed legendary</b>!', '/img/mc/png/enderchest.png', 250),
('ms_mythic_lootbox', 10, 'Mythic Loot Box', 'mythiclootbox', 'survival', 'The newest entry in the <B>Loot Box</b> series, this one is guaranteed to give you a bang for your buck! You get <b>9 random special items</b>, with one of them being <b>Mythic</b>, at least one being <b>Epic or better</b>, and at least two of them being <b>Rare or better</b>!', '/img/mc/png/enderchest.png', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `gamemodes`
--

CREATE TABLE `gamemodes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `shortdesc` text NOT NULL,
  `longdesc` text NOT NULL,
  `picture_loc` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamemodes`
--

INSERT INTO `gamemodes` (`id`, `name`, `color`, `alias`, `shortdesc`, `longdesc`, `picture_loc`, `available`) VALUES
('dungeons', 'Dungeons', 'mc-gold', 'Build & Strategy PvP', 'Build your own Dungeon to safeguard your supplies! Use anything from redstone traps & labyrinths to monsters you can upgrade with armor & weapons! Attack other players\' dungeons to get their loot!', '<h3>Dungeons</h3>\r\n\r\nIn HCMCPVP\'s brand new game mode "Dungeons", you build your own dungeon and attack other players\' dungeons for great loot!\r\n\r\n<h3>Build your own!</h3>\r\n\r\nEvery player gets access to a bunch of materials they can purchase using the <b>/shop</b>. Make your dungeon stronger by placing down traps, and even monsters you can equip with gear as good as full diamond! Make sure no one beats your dungeon by making it as strong as you can.\r\n\r\n<h3>Raid others!</h3>\r\n\r\nAttack other players\' dungeons to steal their gold! Type <b>/attack</b> to see a list of dungeons you can attack, and how much they are worth. Make sure to upgrade your battle gear so you don\'t go in without any equipment. Get strong, and get that sweet loot!\r\n\r\n<h3>100% unique Strategy PvP</h3>\r\n\r\nDungeons is a one of a kind game mode in the world of Minecraft. The possibilities are nearly endless: Huge labyrinths, epic mob fights, mega traps, and much more! If you\'d like anything added to the game, put it in the forums!', '/img/mc/dungeons_big.png', 1),
('epidemic', 'Epidemic', 'mc-dark_green', 'Team PvP', 'Play on one of many prebuilt maps and scavenge them for resources. Get strong together, fight the infections and find the panic room -- or die and join the side of the undead!', '<h3>Coming soon to HCMCPVP!</h3>', '/img/mc/epidemic_big.png', 0),
('royal-arena', 'Royal Arena', 'mc-blue', 'Strategy PvP', 'Fight other players in an epic 1v1 strategic showdown. Mine gold to pay your monsters, so that they attack the enemy for you! Why fight yourself if you can let Skeletons, Zombies, Vindicators (and many more) do the job for you? (inspired by Clash Royale)', '<h3>Royal Arena</h3>\r\n\r\nPvP in Minecraft has evolved. A small faction of Steves & Alexes has decided that physical combat was beneath them. Instead, they use their hard-earned gold to pay monster mercenaries to attack their enemies.\r\n\r\n<h3>Clash Royale in Minecraft!</h3>\r\n\r\nThis game mode is based off of the popular mobile game "Clash Royale". Those who play CR, will find Royal Arena very easy to understand.\r\n\r\n<h3>Never-before-seen Gameplay!</h3>\r\n\r\nInstead of fighting yourself, you mine gold and pay monsters to attack the enemy fort. If you defeat the enemy\'s King Skeleton, or the enemy player themselves, you win!\r\n\r\n<h3>Join the fight yourself!</h3>\r\n\r\nIf you feel the monsters aren\'t doing the job for you, you can join the fight yourself and bash in the enemy team\'s head! But be aware that your health does not regenerate in this mode!\r\n\r\n<h3>Spectate others\' matches!</h3>\r\n\r\nWhile waiting for your match to begin, you can spectate other people\'s matches and learn from their strategies! Never before in Minecraft has spectating been almost as fun as playing yourself!', '/img/mc/mcarena_big.png', 0),
('survival', 'Mythic Survival', 'mc-dark_purple', 'Survival', 'Explore a 100% custom generated world, over 200 custom biomes, many additional structures and underground dungeons. Fight mythic bosses and claim legendary artifacts from chests and fights! No rules: PVP ANYWHERE!', '<h3><b>What is "Mythic" Survival?</b></h3>\r\n\r\nMythic Survival is Survival with a twist! You can find special items on this server, by doing activities you would normally do in survival. In addition, the mode increases the difficulty of gameplay and increases PvP potential. Join to find out more!\r\n\r\n<h3><b>Tracking</b></h3>\r\n\r\nYou can plant trackers on other players and quietly follow them to their home base by tracking their location. For you that means you shouldn\'t let anyone with a tracker come near you, of course!\r\n\r\n<h3><b>Warps</b></h3>\r\n\r\nEvery player starts with 5 warps plus a <b>/home</b> warp they can set at any point in the world. You could have a warp for your mob trap, or maybe even one for your dining room. Everything is up to you! Type <b>/help warps</b> in-game to find out how to use them.<br><br>You can also unlock more warps by finding certain items in chests all across the world and expand your warp limit to a final maximum of 20.\r\n\r\n<h3><b>Near-Limitless & Custom World</b></h3>\r\n\r\nUnlike on many other Hardcore PvP servers that have a very small world border, this world is nearly limitless, with its border currently being set at 200,000 blocks from the center.  This doesn\'t mean that there won\'t be any PvP though, as players can loot special items that allow them to force other players to duel them. Most biomes are also custom, the world features over 200 new biomes that can\'t be found in vanilla Minecraft.\r\n\r\n<h3><b>Special Items</b></h3>\r\n\r\nChests and hostile mobs have a chance to reward you with special items, that each have unique functionality. Some examples include:\r\n<ul>\r\n<li><b>Mob Eggs:</b> Use them on a Mob to capture it (like a Pokemon) and release it anywhere you want!</li>\r\n<li><b>Spyglass:</b> Peek into another player\'s inventory to see what they have!</li>\r\n<li><b>Special Armor, Weapons & Tools:</b> Collect a variety of special armor, weapons & tools that either have higher enchantments, or give you special powers!</li>\r\n<li><b>Mob Essence Extractors:</b> Use them on a mob to make your very own mob spawner you can place anywhere you like!</li>\r\n</ul>\r\n\r\nAnd MANY more! Type <b>/items</b> in-game to see the full list.\r\n\r\n<h3><b>Intelligent Chat</b></h3>\r\n\r\nThe chat is the second most important part of a server (right after gameplay). You have three chat modes on Hardcore Survival:\r\n<ul>\r\n<li><b>Global Chat (default):</b> Enables you to chat with everyone on the server.</li>\r\n<li><b>Local Chat:</b> Only shows your chat messages to nearby players (useful for forming teams).</li>\r\n<li><b>Whisper Mode:</b> You can toggle whisper mode for a certain player, so you won\'t have to type <i>/w &lt;name&gt;</i> every time you send a message. You can thank us later :)</li>\r\n</ul>\r\n\r\n<h3><b>Anti-Cheat</b></h3>We have excellent plugins for busting hackers. Our server is <b>hacker-proof since 2012</b>! Every hacker gets <b>banned within one day</b> and permanent bans are active on all of our servers, so don\'t even try!', '/img/mc/hcpvp_big.png', 1),
('warfronts', 'Warfronts', 'mc-red', 'Kit PvP', 'Play on a huge map and capture control points to lead your team to victory! Gather resources and recruit monster mercenaries along the way, and use your class\' unique playstyle to crush your opponent!', '<h3>Coming soon to HCMCPVP!</h3>', '/img/mc/tdm_big.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `has_creditstore_item`
--

CREATE TABLE `has_creditstore_item` (
  `uuid` varchar(256) NOT NULL,
  `creditstore_item_id` varchar(256) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_stats`
--

CREATE TABLE `player_stats` (
  `uuid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `premium_code` int(11) NOT NULL DEFAULT '0',
  `premium_expiration` bigint(20) NOT NULL DEFAULT '-1',
  `linked` tinyint(1) NOT NULL DEFAULT '0',
  `vbUserId` int(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sps_won` int(10) NOT NULL DEFAULT '0',
  `sps_played` int(10) NOT NULL DEFAULT '0',
  `dun_def` int(11) NOT NULL DEFAULT '0',
  `dun_att` int(11) NOT NULL DEFAULT '0',
  `ra_won` int(11) NOT NULL DEFAULT '0',
  `ra_played` int(11) NOT NULL DEFAULT '0',
  `honor` int(10) NOT NULL DEFAULT '0',
  `event_score` int(10) NOT NULL DEFAULT '0',
  `most_honor` int(10) NOT NULL DEFAULT '0',
  `playtime` int(10) NOT NULL DEFAULT '0',
  `hcpvp_kills` int(10) NOT NULL DEFAULT '0',
  `credits` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `hostname` varchar(255) NOT NULL,
  `gamemode` varchar(255) NOT NULL,
  `players_online` int(10) NOT NULL DEFAULT '0',
  `max_players` int(10) NOT NULL DEFAULT '0',
  `lastactivity` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`hostname`, `gamemode`, `players_online`, `max_players`, `lastactivity`) VALUES
('arena0', 'royal-arena', 0, 50, 1506409200),
('dun0', 'dungeons', 0, 50, 1590778966),
('lobby', 'hub', 0, 1500, 1590778959),
('sps0', 'speed-survival', 0, 50, 1498576988),
('survival', 'survival', 0, 100, 1590778975);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `features` varchar(5000) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `percent` int(3) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `title`, `features`, `startdate`, `enddate`, `percent`, `active`) VALUES
(2, 'Minions & Squads for Epidemic', 'New Features:<br>\n<ul>\n<li><b>Zombies & Skeletons</b><br>Infected will have the ability to spawn and control minions (depending on their infection type). The minions will follow their owner and try to kill every enemy in sight.</li>\n<li><b>Squads</b><br>Humans will have the ability to request a squad of villagers who will bring supplies.</li>\n<li><b>New Maps</b><br>There will be <b>one</b> new map coming with this update.</li>\n<li><b>Zombie & Skeleton Echelon</b><br>There will still be a host infection, but also freely wandering zombies and skeletons.<br>The zombies will search for houses and hide in there to be ready when a player comes by and the skeletons will be wandering around the map.</li>\n<li><b>Wolf-Tamer</b><br>There will be a new credit store item containing wolf eggs and bones.</li>\n</ul>', '2013-08-08 19:47:54', '2017-03-02 02:00:58', 10, 0),
(3, 'Class Presets for Team Deathmatch', 'New Features:<br>\r\n<ul>\r\n<li><b>Class Presets</b><br>In addition to your custom class you will be able to select from certain class presets.</li>\r\n<li><b>Credit Store Additions</b><br>Lots of class builder items will be added to the credit store.</li>\r\n</ul><br><br>\r\n\r\nBug Fixes:<br>\r\n<ul>\r\n<li><b>Random Anvil</b><br>Players will no longer have random anvils in their inventory.</li>\r\n</ul>', '2013-08-12 06:58:50', '2013-08-16 08:15:53', 100, 0),
(4, 'The Disease & Smoke Bombs for Epidemic', 'New Features:<br>\r\n<ul>\r\n<li><b>The Disease</b><br>With every hit inflicted by an infection (or shot by a long range infection) there is a 1% chance that you may get infected even if you\'re not low on health. However you won\'t be infected instantly but instead you\'ll get "the disease". It takes about 1 min and 30 seconds and by the time you get nausea and slowness (not instantly as well, nausea comes first, then slowness) and you will be talking gibberish to other humans (like "where are my blueberries?"). If you don\'t cure the disease within the given time you will become an infection and the player who had given you the disease will get 300 points for an ambush bonus. The cure for the disease is random and individual to the disease itself. It can however be only one of the following items: Water, Milk, Bread, Golden Apple. It may happen that you get the disease more than once in a match (e.g. after curing your first disease) and therefore there will be different cures for each time you get the disease.</li>\r\n<li><b>Smoke Bombs</b><br>Humans will be able to craft smoke bombs using only wooden planks and sticks. With these smoke bombs they will be able to instantly escape a house (teleport on its roof) on any time. It is also possible to just teleport up when standing underneath a block. Be creative!</li>\r\n<li><b>Team-Killing</b><br>Humans will also be able to team-kill. If you spot and kill a diseased human you will get 300 points for disaster-avoidance, the diseased human will teleport to spawn, instantly become an infection and the player who diseased the human will only get 100 points as if it was a regular infection. If you happen to kill a human who is not diseased, you will get minus 500 points for being a lousy team member. If your score drops below minus 1000 points, you will get kicked from the match and be unable to rejoin until the current match has ended.</li>\r\n<li><b>"How To Survive"</b><br>Players will spawn with a written book called "How To Survive" explaining the most important aspects of the game and providing useful information for newer players.</li>\r\n</ul><br>\r\n\r\nMinor Changes:<br>\r\n<ul>\r\n<li><b>Apples</b><br>Infections will no longer receive apples when a stack of mob eggs is depleted.</li>\r\n</ul>\r\n\r\n<br>Bug Fixes:<br>\r\n<ul>\r\n<li><b>Death Loop</b><br>Humans will no longer end up in a death loop if they die and there\'s only one human left.</li>\r\n</ul>', '2013-08-16 12:49:54', '2013-08-16 13:49:56', 100, 0),
(5, 'May Update #1', '<b>Additions</b><ul>\r\n<li>New Credit Store items for Epidemic <b>[DONE]</b></li>\r\n<li>More opportunities to use Q-Credits<b>[DONE]</b></li>\r\n<li>Q-Credit-purchased Credit Store items will no longer appear, so you know which items you don\'t already have<b>[DONE]</b></li></ul>\r\n<br><b>Changes</b><ul><li>Assistant infection will be removed (Epidemic) <b>[DONE]</b></li>\r\n<li>Smoke Bomb recipe will be changed (sticks replaced by Iron Pickaxe) <b>[DONE]</b></li>\r\n</ul><br><b>Fixes</b><ul>\r\n<li>"I\'m sorry, there was an error..." will be fixed <b>[DONE]</b></li>\r\n</ul>\r\n<br><br>This list is subject to change. Points may be added or removed any time.\r\n\r\n<b>[DONE]</b> = Feature is already completed and will definitely be applied in the update.', '2014-04-27 00:00:00', '2014-05-10 00:00:00', 0, 0),
(6, 'May Update #2 - Epidemic (Balance Update)', '<b>Additions</b>\r\n<ul>\r\n<li>Craftable Item "Num Lock": Craftable using an Iron Door and a compass. Locks an Iron Door for 90 seconds if applied. The door won\'t be able to be destroyed by infections  (rage excluded).</li>\r\n<li>Credit Store Item "Emergency Smoke Bomb": Type /smoke to have a single squad member containing 4 smoke bombs drop directly above you.</li>\r\n<li>Uses-Items will be able to be purchased using Q-Credits.</li>\r\n</ul>\r\n<br>\r\n<b>Changes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br>\r\n<b>Fixes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br><br>\r\n\r\nThis list is subject to change. Points may be added or removed any time.<br>\r\n<b>All Q-Credit items will last forever.</b>', '2014-05-12 00:00:00', '2014-06-10 00:00:00', 0, 0),
(7, 'June Update #1 - <s>Referrals</s> Map Wipe', '<b>Additions</b>\r\n<ul>\r\n<li>none, sorry</li>\r\n</ul>\r\n<br>\r\n<b>Changes</b>\r\n<ul>\r\n<li>Website statistics will be wiped</li>\r\n<li>Main Server world will be wiped</li>\r\n<li>Tekkit server will be shut down</li>\r\n</ul>\r\n<br>\r\n<b>Fixes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br><br>\r\n\r\nThis list is subject to change. Points may be added or removed any time.<br>', '2014-06-02 00:00:00', '2014-06-21 00:00:00', 0, 0),
(8, '<s>June Update #2 - TDM</s>', '<b>Additions</b><ul><li>Credit Store Item "Companion" (Q-Credits only): have a dog follow you and join you in the fight. <br>Collar color and name customizable in the Member\'s Area.<br>Dogs can\'t <b>kill</b> anyone and do less damage than usually, but have more health.<br>Dogs die and respawn as their owner dies and respawns.</li><li>New class: Turtle</li></ul><br><b>Changes</b><ul><li>DarkWizard will be replaced by Firestarter. Players owning DarkWizard will receive the new class for free.</li></ul><br><b>Fixes</b><ul><li>none (yet)</li></ul><br><br>This list is subject to change. Points may be added or removed any time.<br><b>All Q-Credit items will last forever.</b>', '2014-06-16 00:00:00', '2014-06-01 00:00:00', 0, 0),
(9, 'July Update #1 - Maps', '<b>Additions</b>\r\n<ul>\r\n<li>New Map "Dark Hazard" for TDM & Epidemic</li>\r\n<li>New individual map for TDM</li>\r\n<li><s>New individual map for Epidemic</s></li>\r\n<li><s>New TDM class: Dampener</s></li>\r\n</ul>\r\n<br>\r\n<b>Changes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br>\r\n<b>Fixes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br><br>\r\n\r\nThis list is subject to change. Points may be added or removed any time.', '2014-06-30 00:00:00', '2014-07-20 12:00:00', 0, 0),
(10, '<s>July Update #2 - Cosmetics</s>', '<b>Additions</b>\r\n<ul>\r\n<li>New map "Hellfire" for TDM & Epidemic</li>\r\n<li><s>Credits will be able to be used to purchase prestige elements<br>\r\ne.g. a golden badge next to your name on the player rankings</s></li>\r\n</ul>\r\n<br>\r\n<b>Changes</b>\r\n<ul>\r\n<li>Dead Epidemic players will be spectators instead of being sent to the lobby</li>\r\n</ul>\r\n<br>\r\n<b>Fixes</b>\r\n<ul>\r\n<li>none (yet)</li>\r\n</ul>\r\n<br><br>\r\n\r\nThis list is subject to change. Points may be added or removed any time.', '2014-07-14 00:00:00', '2014-07-28 00:00:00', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD UNIQUE KEY `player` (`uuid`);

--
-- Indexes for table `creditstore_history`
--
ALTER TABLE `creditstore_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditstore_item`
--
ALTER TABLE `creditstore_item`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `gamemodes`
--
ALTER TABLE `gamemodes`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `has_creditstore_item`
--
ALTER TABLE `has_creditstore_item`
  ADD PRIMARY KEY (`uuid`,`creditstore_item_id`);

--
-- Indexes for table `player_stats`
--
ALTER TABLE `player_stats`
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD UNIQUE KEY `hostname` (`hostname`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creditstore_history`
--
ALTER TABLE `creditstore_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
