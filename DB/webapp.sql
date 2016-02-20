-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-02-20 08:29:56
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webapp`
--

-- --------------------------------------------------------

--
-- 表的结构 `webapp_action`
--

CREATE TABLE IF NOT EXISTS `webapp_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `webapp_action`
--

INSERT INTO `webapp_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_action_log`
--

CREATE TABLE IF NOT EXISTS `webapp_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=240 ;

--
-- 转存表中的数据 `webapp_action_log`
--

INSERT INTO `webapp_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-06 10:34登录了后台', 1, 1449369298),
(2, 10, 1, 2130706433, 'Menu', 93, '操作url：/admin.php?s=/Menu/edit.html', 1, 1449384829),
(3, 10, 1, 2130706433, 'Menu', 93, '操作url：/admin.php?s=/Menu/edit.html', 1, 1449384838),
(4, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-07 09:27登录了后台', 1, 1449451663),
(5, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449452217),
(6, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/add.html', 1, 1449452268),
(7, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449452402),
(8, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449452432),
(9, 9, 1, 2130706433, 'channel', 2, '操作url：/admin.php?s=/Channel/edit.html', 1, 1449457289),
(10, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449458271),
(11, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449470472),
(12, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449471196),
(13, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/add.html', 1, 1449471260),
(14, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449471270),
(15, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449471271),
(16, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449472603),
(17, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449478702),
(18, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449478722),
(19, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449478796),
(20, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1449478816),
(21, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-08 08:18登录了后台', 1, 1449533897),
(22, 11, 1, 2130706433, 'category', 41, '操作url：/admin.php?s=/Category/add.html', 1, 1449536977),
(23, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/add.html', 1, 1449537088),
(24, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539625),
(25, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539668),
(26, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539679),
(27, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539789),
(28, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539826),
(29, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539834),
(30, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/add.html', 1, 1449539864),
(31, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539872),
(32, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/add.html', 1, 1449539907),
(33, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449539912),
(34, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1449540094),
(35, 11, 1, 2130706433, 'category', 41, '操作url：/admin.php?s=/Category/edit.html', 1, 1449540107),
(36, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449540116),
(37, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449545925),
(38, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449545946),
(39, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449545952),
(40, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449545957),
(41, 11, 1, 2130706433, 'category', 45, '操作url：/admin.php?s=/Category/add.html', 1, 1449546004),
(42, 11, 1, 2130706433, 'category', 46, '操作url：/admin.php?s=/Category/add.html', 1, 1449546055),
(43, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546063),
(44, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546069),
(45, 11, 1, 2130706433, 'category', 41, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546070),
(46, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/add.html', 1, 1449546104),
(47, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546113),
(48, 11, 1, 2130706433, 'category', 41, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546115),
(49, 11, 1, 2130706433, 'category', 45, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546119),
(50, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546120),
(51, 11, 1, 2130706433, 'category', 48, '操作url：/admin.php?s=/Category/add.html', 1, 1449546181),
(52, 11, 1, 2130706433, 'category', 45, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546194),
(53, 11, 1, 2130706433, 'category', 46, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546197),
(54, 11, 1, 2130706433, 'category', 48, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546198),
(55, 11, 1, 2130706433, 'category', 49, '操作url：/admin.php?s=/Category/add.html', 1, 1449546261),
(56, 11, 1, 2130706433, 'category', 50, '操作url：/admin.php?s=/Category/add.html', 1, 1449546301),
(57, 11, 1, 2130706433, 'category', 51, '操作url：/admin.php?s=/Category/add.html', 1, 1449546329),
(58, 11, 1, 2130706433, 'category', 52, '操作url：/admin.php?s=/Category/add.html', 1, 1449546362),
(59, 11, 1, 2130706433, 'category', 49, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546428),
(60, 11, 1, 2130706433, 'category', 49, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546431),
(61, 11, 1, 2130706433, 'category', 50, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546433),
(62, 11, 1, 2130706433, 'category', 51, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546435),
(63, 11, 1, 2130706433, 'category', 52, '操作url：/admin.php?s=/Category/edit.html', 1, 1449546436),
(64, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449552091),
(65, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449552109),
(66, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449553970),
(67, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449555640),
(68, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556089),
(69, 11, 1, 2130706433, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556111),
(70, 11, 1, 2130706433, 'category', 41, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556126),
(71, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556139),
(72, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556736),
(73, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556746),
(74, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556755),
(75, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449556764),
(76, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449557057),
(77, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449560679),
(78, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449560840),
(79, 8, 1, 2130706433, 'attribute', 33, '操作url：/admin.php?s=/Attribute/remove/id/33.html', 1, 1449560952),
(80, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449560968),
(81, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449561048),
(82, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449561234),
(83, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449561343),
(84, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449561476),
(85, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-09 08:51登录了后台', 1, 1449622300),
(86, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449629570),
(87, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449630279),
(88, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449630556),
(89, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449630707),
(90, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449630780),
(91, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449630861),
(92, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449631027),
(93, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449631056),
(94, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449643386),
(95, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449643631),
(96, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449643654),
(97, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449643674),
(98, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644048),
(99, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644262),
(100, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644278),
(101, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644310),
(102, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644318),
(103, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644478),
(104, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644487),
(105, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644672),
(106, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644687),
(107, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644722),
(108, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644732),
(109, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644834),
(110, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449644863),
(111, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645192),
(112, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645223),
(113, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645260),
(114, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645372),
(115, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645380),
(116, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645950),
(117, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449645986),
(118, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646000),
(119, 11, 1, 2130706433, 'category', 1, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646060),
(120, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646067),
(121, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646076),
(122, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646082),
(123, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646089),
(124, 11, 1, 2130706433, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646099),
(125, 11, 1, 2130706433, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449646109),
(126, 11, 1, 2130706433, 'category', 53, '操作url：/admin.php?s=/Category/add.html', 1, 1449646990),
(127, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449647147),
(128, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449647180),
(129, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449647202),
(130, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449647393),
(131, 11, 1, 2130706433, 'category', 54, '操作url：/admin.php?s=/Category/add.html', 1, 1449648403),
(132, 11, 1, 2130706433, 'category', 53, '操作url：/admin.php?s=/Category/edit.html', 1, 1449651071),
(133, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-10 11:43登录了后台', 1, 1449719013),
(134, 11, 1, 2130706433, 'category', 53, '操作url：/admin.php?s=/Category/edit.html', 1, 1449719024),
(135, 11, 1, 2130706433, 'category', 40, '操作url：/admin.php?s=/Category/edit.html', 1, 1449724992),
(136, 11, 1, 2130706433, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1449725108),
(137, 11, 1, 2130706433, 'category', 43, '操作url：/admin.php?s=/Category/edit.html', 1, 1449725835),
(138, 11, 1, 2130706433, 'category', 45, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728855),
(139, 11, 1, 2130706433, 'category', 46, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728863),
(140, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728872),
(141, 11, 1, 2130706433, 'category', 48, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728881),
(142, 11, 1, 2130706433, 'category', 49, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728890),
(143, 11, 1, 2130706433, 'category', 50, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728906),
(144, 11, 1, 2130706433, 'category', 51, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728916),
(145, 11, 1, 2130706433, 'category', 52, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728925),
(146, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449728990),
(147, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449729040),
(148, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449729380),
(149, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449729434),
(150, 8, 1, 2130706433, 'attribute', 34, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449729715),
(151, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449729743),
(152, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449729750),
(153, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449729794),
(154, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449729849),
(155, 8, 1, 2130706433, 'attribute', 34, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449729894),
(156, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449730091),
(157, 8, 1, 2130706433, 'attribute', 35, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449730372),
(158, 8, 1, 2130706433, 'attribute', 36, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449730441),
(159, 7, 1, 2130706433, 'model', 4, '操作url：/admin.php?s=/Model/update.html', 1, 1449730507),
(160, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449730692),
(161, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-10 15:04登录了后台', 1, 1449731088),
(162, 8, 1, 2130706433, 'attribute', 37, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449731764),
(163, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1449731787),
(164, 8, 1, 2130706433, 'attribute', 37, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449732021),
(165, 8, 1, 2130706433, 'attribute', 38, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449732197),
(166, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1449732239),
(167, 7, 1, 2130706433, 'model', 2, '操作url：/admin.php?s=/Model/update.html', 1, 1449732857),
(168, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/Model/update.html', 1, 1449733363),
(169, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733425),
(170, 8, 1, 2130706433, 'attribute', 40, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733480),
(171, 8, 1, 2130706433, 'attribute', 39, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733489),
(172, 8, 1, 2130706433, 'attribute', 41, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733557),
(173, 8, 1, 2130706433, 'attribute', 23, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733677),
(174, 11, 1, 2130706433, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1449733774),
(175, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/Model/update.html', 1, 1449733802),
(176, 7, 1, 2130706433, 'model', 5, '操作url：/admin.php?s=/Model/update.html', 1, 1449733862),
(177, 8, 1, 2130706433, 'attribute', 42, '操作url：/admin.php?s=/Attribute/update.html', 1, 1449733963),
(178, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-11 08:48登录了后台', 1, 1449794911),
(179, 11, 1, -1062727812, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1449796568),
(180, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449796576),
(181, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449796756),
(182, 8, 1, -1062727812, 'attribute', 38, '操作url：/admin.php?s=/Attribute/remove/id/38.html', 1, 1449798512),
(183, 8, 1, -1062727812, 'attribute', 37, '操作url：/admin.php?s=/Attribute/remove/id/37.html', 1, 1449798516),
(184, 7, 1, -1062727812, 'model', 6, '操作url：/admin.php?s=/Model/update.html', 1, 1449799358),
(185, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449801387),
(186, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-13 08:38登录了后台', 1, 1449967117),
(187, 7, 1, -1062727812, 'model', 13, '操作url：/admin.php?s=/Model/update.html', 1, 1449974140),
(188, 7, 1, -1062727812, 'model', 13, '操作url：/admin.php?s=/Model/update.html', 1, 1449974216),
(189, 7, 1, -1062727812, 'model', 14, '操作url：/admin.php?s=/Model/update.html', 1, 1449975171),
(190, 7, 1, -1062727812, 'model', 14, '操作url：/admin.php?s=/Model/update.html', 1, 1449975211),
(191, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449976122),
(192, 7, 1, -1062727812, 'model', 15, '操作url：/admin.php?s=/Model/update.html', 1, 1449976323),
(193, 7, 1, -1062727812, 'model', 15, '操作url：/admin.php?s=/Model/update.html', 1, 1449976359),
(194, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449976422),
(195, 7, 1, -1062727812, 'model', 17, '操作url：/admin.php?s=/Model/update.html', 1, 1449987827),
(196, 7, 1, -1062727812, 'model', 17, '操作url：/admin.php?s=/Model/update.html', 1, 1449987878),
(197, 7, 1, -1062727812, 'model', 17, '操作url：/admin.php?s=/Model/update.html', 1, 1449987951),
(198, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1449988133),
(199, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1449988241),
(200, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1449988655),
(201, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1449992444),
(202, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-13 16:16登录了后台', 1, 1449994614),
(203, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-14 08:22登录了后台', 1, 1450052535),
(204, 1, 1, -1062731398, 'member', 1, 'admin在2015-12-15 08:19登录了后台', 1, 1450138791),
(205, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-15 09:32登录了后台', 1, 1450143171),
(206, 8, 1, -1062727812, 'attribute', 61, '操作url：/admin.php?s=/Attribute/update.html', 1, 1450145004),
(207, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1450145252),
(208, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1450145643),
(209, 8, 1, -1062727812, 'attribute', 62, '操作url：/admin.php?s=/Attribute/update.html', 1, 1450146753),
(210, 7, 1, -1062727812, 'model', 18, '操作url：/admin.php?s=/Model/update.html', 1, 1450146770),
(211, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-16 08:47登录了后台', 1, 1450226840),
(212, 11, 1, -1062727812, 'category', 53, '操作url：/admin.php?s=/Category/edit.html', 1, 1450226873),
(213, 11, 1, -1062727812, 'category', 54, '操作url：/admin.php?s=/Category/edit.html', 1, 1450226951),
(214, 11, 1, -1062727812, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1450227278),
(215, 11, 1, -1062727812, 'category', 53, '操作url：/admin.php?s=/Category/edit.html', 1, 1450228902),
(216, 11, 1, -1062727812, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1450229954),
(217, 11, 1, -1062727812, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1450246661),
(218, 11, 1, -1062727812, 'category', 47, '操作url：/admin.php?s=/Category/edit.html', 1, 1450246699),
(219, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-17 09:01登录了后台', 1, 1450314066),
(220, 9, 1, -1062727812, 'channel', 2, '操作url：/admin.php?s=/Channel/edit.html', 1, 1450318680),
(221, 9, 1, -1062727812, 'channel', 3, '操作url：/admin.php?s=/Channel/edit.html', 1, 1450318703),
(222, 11, 1, -1062727812, 'category', 55, '操作url：/admin.php?s=/Category/add.html', 1, 1450321324),
(223, 11, 1, -1062727812, 'category', 55, '操作url：/admin.php?s=/Category/edit.html', 1, 1450321334),
(224, 11, 1, -1062727812, 'category', 55, '操作url：/admin.php?s=/Category/edit.html', 1, 1450321669),
(225, 11, 1, -1062727812, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1450335404),
(226, 11, 1, -1062727812, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1450335983),
(227, 11, 1, -1062727812, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1450336819),
(228, 11, 1, -1062727812, 'category', 39, '操作url：/admin.php?s=/Category/edit.html', 1, 1450336829),
(229, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450338527),
(230, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450338643),
(231, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450338672),
(232, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450340614),
(233, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450340679),
(234, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-17 16:51登录了后台', 1, 1450342296),
(235, 1, 1, -1062727812, 'member', 1, 'admin在2015-12-18 11:16登录了后台', 1, 1450408613),
(236, 11, 1, -1062727812, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1450415784),
(237, 11, 1, -1062727812, 'category', 44, '操作url：/admin.php?s=/Category/edit.html', 1, 1450415802),
(238, 11, 1, -1062727812, 'category', 2, '操作url：/admin.php?s=/Category/edit.html', 1, 1450416931),
(239, 11, 1, -1062727812, 'category', 42, '操作url：/admin.php?s=/Category/edit.html', 1, 1450417463);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_addons`
--

CREATE TABLE IF NOT EXISTS `webapp_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `webapp_addons`
--

INSERT INTO `webapp_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(18, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1449816030, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"2076566","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(26, 'UploadImages', '多图上传', '多图上传插件', 1, '{"gallery_auto":"false","gallery_buttonCursor":"hand","gallery_fileSizeLimit":"2MB","gallery_height":"30","gallery_width":"120","gallery_multi":"true","gallery_progressData":"speed"}', 'larry', '0.1', 1449988096, 0);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_attachment`
--

CREATE TABLE IF NOT EXISTS `webapp_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_attribute`
--

CREATE TABLE IF NOT EXISTS `webapp_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=63 ;

--
-- 转存表中的数据 `webapp_attribute`
--

INSERT INTO `webapp_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 1, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1449733677, 1383891243, '', 0, '', 'regex', '', 0, 'function'),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(39, 'job', '专家职称', 'char(80) NOT NULL', 'string', '', '专家职称', 1, '', 5, 0, 1, 1449733489, 1449733425, '', 3, '', 'regex', '', 3, 'function'),
(61, 'address', '义诊地点', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 1, 1, 1450145004, 1450145004, '', 3, '', 'regex', '', 3, 'function'),
(58, 'gallery', '图片集', 'varchar(255) NOT NUL', 'gallery', '', 'json格式的图片路径集合', 1, '', 18, 0, 1, 1449988096, 1449988096, '', 3, '', 'regex', '', 3, 'function'),
(40, 'honor', '专家荣誉', 'char(80) NOT NULL', 'string', '', '专家荣誉', 1, '', 5, 0, 1, 1449733480, 1449733480, '', 3, '', 'regex', '', 3, 'function'),
(41, 'content', '文章内容', 'text NOT NULL', 'editor', '', '专家详情', 1, '', 5, 0, 1, 1449733557, 1449733557, '', 3, '', 'regex', '', 3, 'function'),
(42, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 1, '0:html\r\n1:ubb\r\n2:markdown', 5, 0, 1, 1449733963, 1449733963, '', 3, '', 'regex', '', 3, 'function'),
(59, 'content', '图片内容', 'text NOT NULL', 'editor', '', '图片内容', 1, '', 18, 0, 1, 1449988096, 1449988096, '', 3, '', 'regex', '', 3, 'function'),
(60, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL', 'select', '0', '', 1, '', 18, 0, 1, 1449988096, 1449988096, '', 3, '', 'regex', '', 3, 'function'),
(62, 'population', '受众人数', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 18, 1, 1, 1450146753, 1450146753, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `webapp_auth_extend`
--

CREATE TABLE IF NOT EXISTS `webapp_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `webapp_auth_extend`
--

INSERT INTO `webapp_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_auth_group`
--

CREATE TABLE IF NOT EXISTS `webapp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `webapp_auth_group`
--

INSERT INTO `webapp_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `webapp_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `webapp_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `webapp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- 转存表中的数据 `webapp_auth_rule`
--

INSERT INTO `webapp_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `webapp_category`
--

CREATE TABLE IF NOT EXISTS `webapp_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `webapp_category`
--

INSERT INTO `webapp_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'gynecology', '妇科', 0, 0, 10, '', '', '', 'index', '', '', '', '2', '2', '1', 0, 0, 1, 0, 1, '1', '', 1379474947, 1449646060, 1, 1, ''),
(2, 'activityForGynecology', '优惠活动', 1, 0, 10, '1', '', '妇科优惠活动', 'lists', 'activity', 'activitydetail', '', '2', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1450416931, 1, 6, ''),
(39, 'infertility', '不孕不育', 0, 1, 10, '', '', '', 'index', '', '', '', '2', '2', '2,1', 0, 0, 1, 0, 1, '', NULL, 1449452268, 1450336829, 1, 20, ''),
(40, 'diseasesForGynecology', '疾病查询', 1, 1, 10, '', '', '', 'lists', 'diseases', '', '', '2', '2', '1', 0, 0, 1, 0, 0, '', NULL, 1449471260, 1449724992, 1, 7, ''),
(41, 'fertility', '生殖健康', 0, 2, 10, '', '', '', 'index', '', '', '', '2', '2', '2,1,3', 0, 0, 1, 0, 0, '', NULL, 1449536977, 1449556126, 1, 3, ''),
(42, 'clinic', '慈善义诊', 0, 3, 10, '', '', '', 'lists', 'clinic', 'clinicdetail', '', '18', '18', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449537088, 1450417463, 1, 4, ''),
(43, 'expertForGynecology', '知名专家', 1, 2, 10, '', '', '', 'lists', 'expert', 'expertdetail', '', '2', '2', '2', 0, 1, 1, 0, 0, '', NULL, 1449539864, 1449725835, 1, 5, ''),
(44, 'technologyForGynecology', '特色技术', 1, 3, 6, '', '', '', 'lists', '', 'defaultdetail', '', '2', '2', '3', 0, 1, 1, 0, 0, '', NULL, 1449539907, 1450415802, 1, 8, ''),
(45, 'activityForInfertility', '优惠活动', 39, 0, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546004, 1449728855, 1, 6, ''),
(46, 'diseasesForInfertility', '疾病查询', 39, 1, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546055, 1449728863, 1, 7, ''),
(47, 'expertForInfertility', '知名专家', 39, 2, 10, '', '', '', 'lists', 'expert', 'expertdetail', '', '5', '5', '3', 0, 1, 1, 0, 0, '', NULL, 1449546104, 1450246699, 1, 11, ''),
(48, 'technologyForInfertility', '特色技术', 39, 3, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546181, 1449728881, 1, 8, ''),
(49, 'activityForFertility', '优惠活动', 41, 0, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546261, 1449728890, 1, 6, ''),
(50, 'diseasesForFertility', '疾病查询', 41, 1, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546301, 1449728906, 1, 7, ''),
(51, 'expertForFertility', '知名专家', 41, 2, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546329, 1449728916, 1, 11, ''),
(52, 'technologyForFertility', '特色技术', 41, 3, 10, '', '', '', '', '', '', '', '2', '2', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1449546362, 1449728925, 1, 8, ''),
(53, 'pqy', '盆腔炎盆腔炎', 40, 0, 10, '', '', '', 'lists', '', 'defaultdetail', '', '2', '2', '3', 0, 1, 1, 0, 0, '', NULL, 1449646990, 1450228902, 1, 10, ''),
(54, 'bdyc', '白带异常', 40, 0, 10, '', '', '', 'lists', '', '', '', '2', '2', '3', 0, 1, 1, 0, 0, '', NULL, 1449648403, 1450226951, 1, 0, ''),
(55, 'simple', '单页内容', 0, 4, 10, '', '', '', '', '', '', '', '2', '2', '2', 0, 1, 0, 0, 0, '', NULL, 1450321324, 1450321669, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `webapp_channel`
--

CREATE TABLE IF NOT EXISTS `webapp_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `webapp_channel`
--

INSERT INTO `webapp_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(2, 0, '品牌历程', 'Index/history', 2, 1379475131, 1450318680, 1, 0),
(3, 0, '来院路线', 'Index/map', 3, 1379475154, 1450318703, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_config`
--

CREATE TABLE IF NOT EXISTS `webapp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `webapp_config`
--

INSERT INTO `webapp_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '红房子医院', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '红房子医院', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP,OneThink', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'blue_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_document`
--

CREATE TABLE IF NOT EXISTS `webapp_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `webapp_document`
--

INSERT INTO `webapp_document` (`id`, `uid`, `name`, `title`, `category_id`, `group_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '', 'OneThink1.1开发版发布8', 44, 0, '期待已久的OneThink最新版发布,期待已久的OneThink最新版发布,期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 47, 0, 0, 0, 1406001360, 1450415748, 1),
(2, 1, '', 'OneThink1.1开发版发布7', 44, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 57, 0, 0, 0, 1449476400, 1450415742, 1),
(3, 1, '', '宫颈糜烂体检套餐8', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 9, 1, 1481241600, 0, 60, 0, 0, 0, 1449625320, 1450408660, 1),
(4, 1, '', '宫颈糜烂体检套餐7', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 17, 1, 1481241600, 0, 147, 0, 0, 0, 1449629820, 1450408655, 1),
(6, 1, '', '董青梅', 47, 0, '输卵管性不孕、多囊卵巢综合症、排卵功能障碍等疾病', 0, 0, 5, 3, 0, 0, 12, 1, 0, 0, 221, 0, 0, 0, 1449733980, 1450249134, 1),
(7, 1, '', '关爱老人义诊活动', 42, 0, '温州红房子医院，瓯海慈善总会', 0, 0, 18, 3, 0, 0, 14, 1, 0, 0, 262, 0, 0, 0, 1450064880, 1450243797, 1),
(8, 1, '', 'OneThink1.1开发版发布', 53, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 20, 0, 0, 0, 1450226914, 1450226914, 1),
(9, 1, '', 'OneThink1.1开发版发布', 53, 0, '期待已久的OneThink最新版发布,期待已久的OneThink最新版发布,期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 41, 0, 0, 0, 1450226880, 1450227837, 1),
(10, 1, '', '品牌历程', 55, 0, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1450321380, 1450337008, 1),
(11, 1, '', '来院路线', 55, 0, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1450322940, 1450334591, 1),
(12, 1, '', '宫颈糜烂体检套餐6', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 17, 1, 1481241600, 0, 147, 0, 0, 0, 1450340640, 1450408650, 1),
(13, 1, '', '宫颈糜烂体检套餐5', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 9, 1, 1481241600, 0, 60, 0, 0, 0, 1450340640, 1450408644, 1),
(14, 1, '', '宫颈糜烂体检套餐4', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 9, 1, 1481241600, 0, 60, 0, 0, 0, 1450340640, 1450408638, 1),
(15, 1, '', '宫颈糜烂体检套餐3', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 17, 1, 1481241600, 0, 149, 0, 0, 0, 1450340640, 1450408634, 1),
(16, 1, '', '宫颈糜烂体检套餐2', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 17, 1, 1481241600, 0, 149, 0, 0, 0, 1450340640, 1450408629, 1),
(17, 1, '', '宫颈糜烂体检套餐1', 2, 0, '宫颈糜烂体检套餐仅需58元', 0, 0, 2, 3, 0, 0, 9, 1, 1481241600, 0, 67, 0, 0, 0, 1450340640, 1450408624, 1),
(18, 1, '', 'OneThink1.1开发版发布6', 44, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 57, 0, 0, 0, 1450415700, 1450415737, 1),
(19, 1, '', 'OneThink1.1开发版发布5', 44, 0, '期待已久的OneThink最新版发布,期待已久的OneThink最新版发布,期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 47, 0, 0, 0, 1450415700, 1450415733, 1),
(20, 1, '', 'OneThink1.1开发版发布4', 44, 0, '期待已久的OneThink最新版发布,期待已久的OneThink最新版发布,期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 47, 0, 0, 0, 1450415700, 1450415728, 1),
(21, 1, '', 'OneThink1.1开发版发布3', 44, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 57, 0, 0, 0, 1450415700, 1450415722, 1),
(22, 1, '', 'OneThink1.1开发版发布2', 44, 0, '期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 57, 0, 0, 0, 1450415700, 1450415717, 1),
(23, 1, '', 'OneThink1.1开发版发布1', 44, 0, '期待已久的OneThink最新版发布,期待已久的OneThink最新版发布,期待已久的OneThink最新版发布', 0, 0, 2, 3, 0, 0, 0, 1, 0, 0, 48, 0, 0, 0, 1450415700, 1450415713, 1),
(24, 1, '', '关爱老人义诊活动', 42, 0, '温州红房子医院，瓯海慈善总会', 0, 0, 18, 3, 0, 0, 14, 1, 0, 0, 236, 0, 0, 0, 1450417418, 1450417418, -1),
(25, 1, '', '关爱老人义诊活动', 42, 0, '温州红房子医院，瓯海慈善总会', 0, 0, 18, 3, 0, 0, 14, 1, 0, 0, 236, 0, 0, 0, 1450417421, 1450417421, -1),
(26, 1, '', '关爱老人义诊活动', 42, 0, '温州红房子医院，瓯海慈善总会', 0, 0, 18, 3, 0, 0, 14, 1, 0, 0, 236, 0, 0, 0, 1450417433, 1450417433, -1),
(27, 1, '', '关爱老人义诊活动', 42, 0, '温州红房子医院，瓯海慈善总会', 0, 0, 18, 3, 0, 0, 14, 1, 0, 0, 236, 0, 0, 0, 1450417449, 1450417449, -1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_document_article`
--

CREATE TABLE IF NOT EXISTS `webapp_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `webapp_document_article`
--

INSERT INTO `webapp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(2, 0, '<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(10, 0, '<img src="/Uploads/Editor/2015-12-17/567262cd600ad.jpg" alt="" /> \r\n<div class="content-block-title">\r\n	<b>品牌历程</b>&nbsp;/&nbsp;Brand History\r\n</div>\r\n<div class="list-block media-list">\r\n	<ul>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722ad49c98d.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1884年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						西方传教士医师进入中国。玛格利 特·威廉逊女士捐款5000美元，租房两 间，在上海西门外创办门诊部。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722ade5e56d.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1885年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						美国基督教女公会捐款建造新舍。为纪念玛格利特·威廉逊女士，将医院命名为玛格利特·威廉逊医院，中文名为"上海西门妇孺医院"。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722af7ddb5d.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1952年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						以上海西门妇孺医院为主体，同红十字会第一医院妇产科及中山医院的妇产科合并为上海医学院妇产科学院。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b04b0fdb.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1960年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						王淑贞主编、出版了我国第一本高等医学院校妇产科教科书《妇产科学》。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b0d54ba0.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1962年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						批准成为上海市红十字妇产科医院，同年被卫生部、世界卫生组织联合国儿童 基金会批命名为“爱婴医院”。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b1635c00.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							1994年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						医院在试管婴儿技术上取得重大突破，华东地区例试管婴儿在红房子医院杨浦院区试孕成功。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b1e10091.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							2011年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						红房子医院荣获全国十佳妇科医院荣誉称号。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b251b75a.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							2012年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						温州红房子医院被授予为温州市出租车司机体检指定医院，为全市数百名出租车司机免费体检。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b2d305e6.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							2013年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						上海红房子医院院长庄依亮亲临温州主推“百日快孕诊疗体系”温州推行。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li>\r\n			<div class="item-content">\r\n				<div class="item-media">\r\n					<img src="/Uploads/Editor/2015-12-17/56722b34748a2.jpg" alt="" /> \r\n				</div>\r\n				<div class="item-inner">\r\n					<div class="item-title-row">\r\n						<div class="item-title color-red">\r\n							2014年\r\n						</div>\r\n					</div>\r\n					<div class="item-subtitle">\r\n						红房子院士陈列馆在上海黄浦院区开馆，4个展区尽显红房子130年悠长韵味。\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>', '', 0),
(3, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(4, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(8, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(9, 0, '<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(11, 0, '<div class="content-block-title">\r\n	&nbsp;\r\n</div>\r\n<div class="content-block-title">\r\n	<b>来院路线</b>&nbsp;/&nbsp;Map\r\n</div>\r\n<div class="content-block">\r\n	<img src="http://api.map.baidu.com/staticimage?center=120.652062%2C28.014355&zoom=19&width=420&height=220&markers=120.652062%2C28.014355&markerStyles=l%2CA" alt="" /> \r\n</div>\r\n<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			公交路线\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					2路、5路、10路、21路、22路、22路专线、23路、25路、27路、37路、55路、58路、59路、60路、74路、101路、105路、111路、301路\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			公交站点\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					线路\r\n				</div>\r\n				<div class="item-after">\r\n					站点\r\n				</div>\r\n				<div class="item-after">\r\n					详情\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					2路\r\n				</div>\r\n				<div class="item-after center">\r\n					御史桥站—西站(红房子医院)-双屿客运中心站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D2%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					5路\r\n				</div>\r\n				<div class="item-after center">\r\n					火车站广场站—西站(红房子医院)-双屿温化生活区站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D5%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					10路\r\n				</div>\r\n				<div class="item-after center">\r\n					飞霞桥—西站(红房子医院)-藤桥\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D10%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					21路\r\n				</div>\r\n				<div class="item-after center">\r\n					大禅寺—西站(红房子医院)\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D21%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					22路\r\n				</div>\r\n				<div class="item-after center">\r\n					兰田标准厂房—西站(红房子医院)\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D22%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					22路<br />\r\n专线\r\n				</div>\r\n				<div class="item-after center">\r\n					火车站广场站—西站(红房子医院)-双屿温化生活区站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D22%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					23路\r\n				</div>\r\n				<div class="item-after center">\r\n					汽车南站—西站(红房子医院)-桥下\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D23%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					25路\r\n				</div>\r\n				<div class="item-after center">\r\n					火车站广场站—西站(红房子医院)-火车站广场站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D25%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					27路\r\n				</div>\r\n				<div class="item-after center">\r\n					火车站广场站—西站(红房子医院)-火车站广场站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D27%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					37路\r\n				</div>\r\n				<div class="item-after center">\r\n					岙外车站—西站(红房子医院)-飞霞桥\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D37%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					55路\r\n				</div>\r\n				<div class="item-after center">\r\n					黄龙住宅区—西站(红房子医院)-高新科技园\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D55%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					58路\r\n				</div>\r\n				<div class="item-after center">\r\n					岷岗—西站(红房子医院)-市行政中心\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D58%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					59路\r\n				</div>\r\n				<div class="item-after center">\r\n					双屿客运中心北始发站—西站(红房子医院)-温州乐园\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D59%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					60路\r\n				</div>\r\n				<div class="item-after center">\r\n					火车站广场—西站(红房子医院)-上塘\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D60%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					74路\r\n				</div>\r\n				<div class="item-after center">\r\n					火车南站—西站(红房子医院)-新城站西\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D74%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					101路\r\n				</div>\r\n				<div class="item-after center">\r\n					陈村—西站(红房子医院)-杨府山公交始发站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D101%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					105路\r\n				</div>\r\n				<div class="item-after center">\r\n					龙峰山庄—西站(红房子医院)-东小区始发站\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D105%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					111路\r\n				</div>\r\n				<div class="item-after center">\r\n					正岙村—西站(红房子医院)-火车站广场\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D111%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					301路\r\n				</div>\r\n				<div class="item-after center">\r\n					潘岙—西站(红房子医院)-上江\r\n				</div>\r\n				<div class="item-after">\r\n					<a target="_blank" class="external" href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D301%26c%3D178">查看</a> \r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		立即预约\r\n	</div>\r\n</div>', '', 0),
(12, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(13, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(14, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(15, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(16, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0);
INSERT INTO `webapp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(17, 0, '<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			套餐内容\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					项目\r\n				</div>\r\n				<div class="item-after">\r\n					价格\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊\r\n				</div>\r\n				<div class="item-after">\r\n					10元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规\r\n				</div>\r\n				<div class="item-after">\r\n					15元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG\r\n				</div>\r\n				<div class="item-after">\r\n					5元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜\r\n				</div>\r\n				<div class="item-after">\r\n					50元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)\r\n				</div>\r\n				<div class="item-after">\r\n					68元\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			检查目的\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					妇科内诊：<br />\r\n妇科常规检查，了解盆腔，子宫，宫颈，阴道，外阴常见疾病。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					白带常规：<br />\r\n用于检查阴道内有无滴虫，念珠菌，杂菌，阴道清洁度，酸碱度，是筛查阴道炎的一种有效手段。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					尿HCG：<br />\r\n检查是否已怀孕\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					电子阴道镜：<br />\r\n电子数码阴道镜下检查外阴，阴道情况，子宫颈炎症病变情况等。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					超声多普勒彩超(子宫,附件)：<br />\r\n超声多普勒下检查盆腔，子宫，子宫内膜及子宫附件的情况。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			适应人群\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					人流、月经不调、宫颈疾病、妇科炎症、肿瘤、私密整形、孕检\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big color-red">\r\n		套餐原价：<del>148元</del>　优惠价：58元\r\n	</div>\r\n</div>', '', 0),
(18, 0, '<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(19, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(20, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(21, 0, '<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(22, 0, '<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(23, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_document_download`
--

CREATE TABLE IF NOT EXISTS `webapp_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `webapp_document_expert`
--

CREATE TABLE IF NOT EXISTS `webapp_document_expert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job` char(80) NOT NULL COMMENT '专家职称',
  `honor` char(80) NOT NULL COMMENT '专家荣誉',
  `content` text NOT NULL COMMENT '文章内容',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `webapp_document_expert`
--

INSERT INTO `webapp_document_expert` (`id`, `job`, `honor`, `content`, `parse`) VALUES
(6, '副主任医师', '红房子上海不孕不育专家组副组长', '<div style="text-align:center;">\r\n	<img src="/Uploads/Editor/2015-12-16/567107ac0f8c6.jpg" alt="" /> \r\n</div>\r\n<div class="list-block">\r\n	<ul>\r\n		<li class="item-divider">\r\n			<b class="color-red">个人荣誉</b> \r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					不孕不育科副主任医师、 硕士研究生\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					百日快孕诊疗体系技术顾问\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					红房子上海不孕不育专家组副组长\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					全国不孕不育诊疗突出贡献奖获得者\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			<b class="color-red">专业资质</b> \r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					　　师从于著名妇产科专家李光仪（腹腔镜之父）、夏恩兰教授（宫腔镜之母），曾在三甲医院（红房子上海集爱遗传与不孕不育中心）进修深造，在不孕不育和妇科的诊疗上积累了丰富的临床经验。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			<b class="color-red">专业擅长</b> \r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					　　擅长采用宫腹腔镜微创技术手术治疗输卵管性不孕、多囊卵巢综合症、排卵功能障碍、难治性不孕、原发及继发性不孕等疾病，在手术后中药调整内分泌及促排卵治疗女性不孕怀孕率处于国内领先水平。特别是独创的输卵管宫角植入术，解决了输卵管间质部阻塞造成的不孕症的历史性难题。\r\n				</div>\r\n			</div>\r\n		</li>\r\n		<li class="item-divider">\r\n			<b class="color-red">主要成就</b> \r\n		</li>\r\n		<li class="item-content purpose">\r\n			<div class="item-inner">\r\n				<div class="item-title">\r\n					　　多次受邀参加国内生殖医学学术交流会议，在省级医学刊物上发表生殖医学论文10多篇。是我国首先提出多囊卵巢综合征分型诊断标准和夫妻同治理念的不孕不育专家之一。也是我市唯一熟练掌握了辅助生育技术如人工受精、试管婴儿等高难度技术的资深专家。\r\n				</div>\r\n			</div>\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div class="content-block">\r\n	<div class="button button-big button-fill color-red">\r\n		立即预约\r\n	</div>\r\n</div>', 0);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_document_gallery`
--

CREATE TABLE IF NOT EXISTS `webapp_document_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gallery` varchar(255) NOT NULL COMMENT '图片集合',
  `content` text NOT NULL COMMENT '图片内容',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `address` varchar(255) NOT NULL COMMENT '义诊地点',
  `population` int(10) unsigned NOT NULL COMMENT '受众人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档模型图片集表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `webapp_document_gallery`
--

INSERT INTO `webapp_document_gallery` (`id`, `gallery`, `content`, `parse`, `address`, `population`) VALUES
(7, 'id:14;path:/Uploads/Picture/2015-12-16/5670f60e3f606.jpg|id:15;path:/Uploads/Picture/2015-12-16/5670f60e55e0e.jpg|id:16;path:/Uploads/Picture/2015-12-16/5670f60e69edd.jpg|', '院长高周松亲自为市民义诊松台广场', 0, '三垟街道黄屿村', 100);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_file`
--

CREATE TABLE IF NOT EXISTS `webapp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_hooks`
--

CREATE TABLE IF NOT EXISTS `webapp_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `webapp_hooks`
--

INSERT INTO `webapp_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'SocialComment,Attachment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'UploadImagesForm', '显示多图上传表单', 1, 1449815554, 'UploadImages', 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_member`
--

CREATE TABLE IF NOT EXISTS `webapp_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `webapp_member`
--

INSERT INTO `webapp_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 50, 17, 0, 1449369269, 3232239484, 1450408613, 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_menu`
--

CREATE TABLE IF NOT EXISTS `webapp_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- 转存表中的数据 `webapp_menu`
--

INSERT INTO `webapp_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_model`
--

CREATE TABLE IF NOT EXISTS `webapp_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `webapp_model`
--

INSERT INTO `webapp_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5","37","38"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1449732857, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(5, 'expert', '专家', 1, '', 1, '{"1":["3","39","40","12","5","41","2"],"2":["16","14","13","17","20","19","11","10","9"]}', '1:基础,2:扩展', '', '', '', '', '', '', 10, '', '', 1449733363, 1449733862, 1, 'MyISAM'),
(18, 'gallery', '图片集', 1, '', 1, '{"1":["3","20","61","62","58","59","5","2"],"2":["12","16","14","13","17","19","11","10","60","9"]}', '1:基础,2:扩展', '', '', '', '', '', '', 10, '', '', 1449988096, 1450146770, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `webapp_picture`
--

CREATE TABLE IF NOT EXISTS `webapp_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `webapp_picture`
--

INSERT INTO `webapp_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2015-12-07/5664fa5c657a2.png', '', '3ddfb6357451f914d8e9fc7e42582dca', 'fc010e9c7340ca106bd6ea090dd47451da84acde', 1, 1449458266),
(2, '/Uploads/Picture/2015-12-08/566639fbbd7bd.png', '', '587553f04958de82dacc6c854d60c26b', '794b998fd01676942bb5d06c0173f54aa6a80dc2', 1, 1449540091),
(3, '/Uploads/Picture/2015-12-08/56663a063ac54.png', '', 'f87e9ad0a009b9c0733d14b0390a7ca0', '1d1b2744f6785bb80faede85e145f7a708dba175', 1, 1449540102),
(4, '/Uploads/Picture/2015-12-08/56663a11940a6.png', '', '02c14dcfff3d310fbc6b2af503570125', '3321f5c53e770ee52a177ca1ba25e2da0b8bbc87', 1, 1449540113),
(5, '/Uploads/Picture/2015-12-08/56667876d8552.png', '', 'ed9bc5a43585e624cb1ebd3595466d5b', 'b6bc20b9921345e0056b7c4042e61a87dbe6ba54', 1, 1449556086),
(6, '/Uploads/Picture/2015-12-08/56667afdd4ccf.png', '', '665e8125ba9a6ed406af89d719c5fb70', 'd3014c568dde937e9d783fd13e00cad00d032cf0', 1, 1449556733),
(7, '/Uploads/Picture/2015-12-08/56667b0825d6d.png', '', '9bcd2c8af1fc966e2cda799b69996053', 'cfa2e76ea212cf9ee68558f6e94fb6bc0e1bc661', 1, 1449556744),
(8, '/Uploads/Picture/2015-12-08/56667b1ab335d.png', '', 'f756f00f7c6111a137a8c26c3046a0c7', '5a82317d1b2975e31e5aa681a6c2e4500e041323', 1, 1449556762),
(9, '/Uploads/Picture/2015-12-09/566786feec667.jpg', '', '5df9ea0df9a2766f7bac40e9f908124b', 'a9e42b4b9e3621a9968b9324de501c1e63d2b915', 1, 1449625342),
(10, '/Uploads/Picture/2015-12-09/5667eb7d04b3c.gif', '', '23ae99a06f57d906dcf7cc01d40fa8a4', 'f552439a11181c05008664bc5038070cd3d48bc5', 1, 1449651067),
(11, '/Uploads/Picture/2015-12-10/56691b66668f3.png', '', '914a24827bc2f71f164a4bf7fa0f3531', '4de5889bdc7285ee2ce9199f4ee868ca66be6081', 1, 1449728870),
(12, '/Uploads/Picture/2015-12-10/5669222d22748.png', '', 'b0b47c1b97292f137b969b277454607e', 'dcd29a9990e6bed212b204fad4b918cf7ccbe76f', 1, 1449730605),
(13, '/Uploads/Picture/2015-12-14/566e61b061f32.png', '', 'c1498d63710b77e64af580d0e0d4cbca', '5ea8029ec41c9bf7eed9277807e7919cae1646da', 1, 1450074544),
(14, '/Uploads/Picture/2015-12-16/5670f60e3f606.jpg', '', 'ffa50b3240ce5c61743df0c8ac122817', '433e909e0213be9acdfeb27f277f5da47b0150df', 1, 1450243598),
(15, '/Uploads/Picture/2015-12-16/5670f60e55e0e.jpg', '', '44bf763e49e6b7ef401c76d7829de27a', 'eb5b115f9957313a91dac1114ff3249d381abd02', 1, 1450243598),
(16, '/Uploads/Picture/2015-12-16/5670f60e69edd.jpg', '', '31dd9f74abdfc59c4a894dc18588abd9', 'a7cf43053ecccb0216acfbc36a1bcbcb0c027a46', 1, 1450243598),
(17, '/Uploads/Picture/2015-12-17/567259ce6c935.jpg', '', 'bd68462a8c8f98281ebfa848ddb9fa8e', '1eb2e6c9713297c39a3787f410d0e6b3f11e4b51', 1, 1450334670),
(18, '/Uploads/Picture/2015-12-17/56725ca96559a.png', '', '2f38c63e9fd371f4d563c246249a8568', 'ed567e847a9d765d0a0f74b7ceb10940d8e57b04', 1, 1450335401),
(19, '/Uploads/Picture/2015-12-17/56725eed3d8f4.png', '', '3d13e5da336cfac1c5ba9abab96ef436', 'bc334b7eee518de6fb050846a3415b6ddb0bdc86', 1, 1450335981),
(20, '/Uploads/Picture/2015-12-17/5672623bc0d3e.png', '', '56e7dca38de048b1d93b4fa857f1fef2', '3c6eb61d5586937fbeee5f093eae6f034a22b127', 1, 1450336827);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `webapp_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `webapp_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `webapp_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `webapp_ucenter_member`
--

INSERT INTO `webapp_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '51f1f7ef769e76e4918f07d4ddd12a77', 'resinchem@qq.com', '', 1449369269, 2130706433, 1450408613, 3232239484, 1449369269, 1);

-- --------------------------------------------------------

--
-- 表的结构 `webapp_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `webapp_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_url`
--

CREATE TABLE IF NOT EXISTS `webapp_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `webapp_userdata`
--

CREATE TABLE IF NOT EXISTS `webapp_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
