ALTER TABLE `eb_system_config` ADD `input_type` VARCHAR(20) NULL DEFAULT 'input' COMMENT '表单类型' AFTER `type`;
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('system_delivery_time', 'text', 5, '', 0, 'required:true,digits:true,min:0', 100, 0, '"7"', '自动收货时间(天)', '系统自动收货时间(0为不设置自动收货)', 0, 1);
INSERT INTO `eb_system_group` (`name`, `info`, `config_name`, `fields`) VALUES ('首页文字配置', '首页文字配置', 'routine_index_page', '[{"name":"\\u5feb\\u901f\\u9009\\u62e9\\u7b80\\u4ecb","title":"fast_info","type":"input","param":"\\u4e0a\\u767e\\u79cd\\u5546\\u54c1\\u5206\\u7c7b\\u4efb\\u60a8\\u9009\\u62e9"},{"name":"\\u7cbe\\u54c1\\u63a8\\u8350\\u7b80\\u4ecb","title":"bast_info","type":"input","param":"\\u8bda\\u610f\\u63a8\\u8350\\u54c1\\u8d28\\u5546\\u54c1"},{"name":"\\u9996\\u53d1\\u65b0\\u54c1\\u7b80\\u4ecb","title":"first_info","type":"input","param":"\\u591a\\u4e2a\\u4f18\\u8d28\\u5546\\u54c1\\u6700\\u65b0\\u4e0a\\u67b6"},{"name":"\\u4fc3\\u9500\\u5355\\u54c1\\u7b80\\u4ecb","title":"sales_info","type":"input","param":"\\u5e93\\u5b58\\u5546\\u54c1\\u4f18\\u60e0\\u4fc3\\u9500\\u6d3b\\u52a8"},{"name":"\\u5feb\\u901f\\u9009\\u62e9\\u5206\\u7c7b\\u4e2a\\u6570","title":"fast_number","type":"input","param":"10"},{"name":"\\u7cbe\\u54c1\\u63a8\\u8350\\u4e2a\\u6570","title":"bast_number","type":"input","param":"10"},{"name":"\\u9996\\u53d1\\u65b0\\u54c1\\u4e2a\\u6570","title":"first_number","type":"input","param":"10"}]');
SELECT id as gid FROM eb_system_group WHERE config_name = 'routine_index_page' LIMIT 1 into @gid;
INSERT INTO `eb_system_group_data` (`gid`, `value`, `add_time`, `sort`, `status`) VALUES (@gid, '{"fast_info":{"type":"input","value":"\\u4e0a\\u767e\\u79cd\\u5546\\u54c1\\u5206\\u7c7b\\u4efb\\u60a8\\u9009\\u62e9"},"bast_info":{"type":"input","value":"\\u8bda\\u610f\\u63a8\\u8350\\u54c1\\u8d28\\u5546\\u54c1"},"first_info":{"type":"input","value":"\\u591a\\u4e2a\\u4f18\\u8d28\\u5546\\u54c1\\u6700\\u65b0\\u4e0a\\u67b6"},"sales_info":{"type":"input","value":"\\u5e93\\u5b58\\u5546\\u54c1\\u4f18\\u60e0\\u4fc3\\u9500\\u6d3b\\u52a8"},"fast_number":{"type":"input","value":"10"},"bast_number":{"type":"input","value":"10"},"first_number":{"type":"input","value":"10"}}', 1565146071, 1, 1);
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'fast_info';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'bast_info';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'first_info';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'sales_info';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'fast_number';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'bast_number';
DELETE FROM `eb_system_config` WHERE `eb_system_config`.`menu_name` = 'first_number';
CREATE TABLE `eb_user_token` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户 id',
  `token` varchar(512) NOT NULL COMMENT 'token',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `expires_time` datetime NOT NULL COMMENT '到期时间',
  `login_ip` varchar(32) DEFAULT NULL COMMENT '登录ip',
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE  `eb_store_service_log` ADD  `msn_type` tinyint(1) NOT NULL DEFAULT  '1' COMMENT  '消息类型 1=文字 2=表情 3=图片 4=语音';
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('system_delivery_time', 'text', 'input',  5, '', 0, 'required:true,digits:true,min:0', 100, 0, '"7"', '自动收货时间(天)', '系统自动收货时间(0为不设置自动收货)', 0, 1);
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('sms_account', 'text', 'input', 18, '', '', '', '', '', '"tangkai"', '账号', '短信后台的登录账号', 0, 1);
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('sms_token', 'text', 'input', 18, '', '', '', '', '', '"tangkai123."', 'token', '短信token', 0, 1);
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('h5_avatar', 'upload', '"http:\/\/static-shop.qolai.com\/408b6201908261022242113.png"', 1, '', 1, '', '', '', '', '用户H5默认头像', '用户H5默认头像', 0, 1);
SELECT id as pid FROM eb_system_menus WHERE controller = 'setting' LIMIT 1 into @pid;
INSERT INTO `eb_system_menus` ( `pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES (@pid, '', '短信设置', 'admin', 'sms', 'index', '[]', '0', '1', '1');
SELECT id as pid FROM eb_system_menus WHERE controller = 'sms' LIMIT 1 into @pk;
INSERT INTO `eb_system_menus` (`pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES (@pk, '', '短信模板', 'admin', 'sms.smsTemplateApply', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` (`pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES (@pk, '', '短信配置', 'admin', 'sms.smsConfig', 'index', '{\"type\":\"4\",\"tab_id\":\"18\"}', '1', '1', '1');
INSERT INTO `eb_system_menus` (`pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES (@pk, '', '短信购买', 'admin', 'sms.smsPay', 'index', '[]', '0', '1', '1');
INSERT INTO `eb_system_menus` (`pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES (@pk, '', '公共短信模板', 'admin', 'sms.smsPublicTemp', 'index', '[]', '0', '1', '1');
SELECT id as bid FROM eb_system_config_tab WHERE eng_title = 'basics' LIMIT 1 into @bid;
INSERT INTO `eb_system_config` (`menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('news_slides_limit', 'text', 'number', @bid, NULL, NULL, 'required:true,digits:true,min:1', '100', NULL, '3', '新闻幻灯片限制数量', '新闻幻灯片限制数量', '0', '1');
SELECT id as cid FROM eb_system_config_tab WHERE eng_title = 'store' LIMIT 1 into @cid;
INSERT INTO `eb_system_config` (`menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('offline_pay_status', 'radio', NULL, @cid, '1=>开启\n2=>关闭', NULL, NULL, NULL, NULL, '\"2\"', '线下支付状态', '线下支付状态', '0', '1');
ALTER TABLE `eb_store_service` ADD `customer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否展示统计管理 1展示 0不展示';
SELECT id as apiid FROM eb_system_config WHERE menu_name = 'api' LIMIT 1 into @apiid;
UPDATE `eb_system_config` SET `value`='\"\\/api\\/wechat\\/serve\"', `info`='接口地址', `desc`='微信接口例如：http://www.abc.com/api/wechat/serve' WHERE (`id`=@apiid);
ALTER TABLE  `eb_user` ADD  `login_type` VARCHAR( 36 ) NOT NULL DEFAULT  '' COMMENT  '用户登陆类型，h5,wechat,routine';
SET @fieldrmm = '\\r\\n\/pages\/admin\/index=>后台订单管理\\r\\n\/pages\/service\/index=>联系客服"}]';
SELECT id as rmmid,LEFT(fields, length(fields) - 3) FROM eb_system_group WHERE config_name = 'routine_my_menus' LIMIT 1 into @rmmid,@fieldsrmm;
UPDATE `eb_system_group` SET `fields`= CONCAT(@fieldsrmm, @fieldrmm) WHERE (`id`= @rmmid);
SET @field = ',{"name":"\\u516c\\u4f17\\u53f7\\u8df3\\u8f6c\\u8def\\u5f84","title":"wap_url","type":"select","param":"\\/user\\/add_manage=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/user\\/vip=>\\u4f1a\\u5458\\u4e2d\\u5fc3\\n\\/activity\\/bargain\\/record=>\\u780d\\u4ef7\\u8bb0\\u5f55\\n\\/user\\/user_promotion=>\\u63a8\\u5e7f\\u4e2d\\u5fc3\\n\\/user\\/account=>\\u6211\\u7684\\u4f59\\u989d\\n\\/collection=>\\u6211\\u7684\\u6536\\u85cf\\n\\/user\\/user_coupon=>\\u4f18\\u60e0\\u5238\\n\\/customer\\/list=>\\u5ba2\\u670d\\u5217\\u8868\\n\\/customer\\/index=>\\u540e\\u53f0\\u8ba2\\u5355\\u7ba1\\u7406"}]';
SELECT id as rhmid,LEFT(fields, length(fields) - 1) FROM eb_system_group WHERE config_name = 'routine_home_menus' LIMIT 1 into @rhmid,@fields;
UPDATE `eb_system_group` SET `fields`= CONCAT(@fields, @field) WHERE (`id`= @rhmid);
SELECT id as rhrnid,LEFT(fields, length(fields) - 1) FROM eb_system_group WHERE config_name = 'routine_home_roll_news' LIMIT 1 into @rhrnid,@fields;
UPDATE `eb_system_group` SET `fields`= CONCAT(@fields, @field) WHERE (`id`= @rhrnid);
SELECT id as rmmid,LEFT(fields, length(fields) - 1) FROM eb_system_group WHERE config_name = 'routine_my_menus' LIMIT 1 into @rmmid,@fields;
UPDATE `eb_system_group` SET `fields`= ' [{"name":"\\u83dc\\u5355\\u540d","title":"name","type":"input","param":""},{"name":"\\u56fe\\u6807(52*52)","title":"pic","type":"upload","param":""},{"name":"\\u5c0f\\u7a0b\\u5e8f\\u8df3\\u8f6c\\u8def\\u5f84","title":"url","type":"select","param":"\\/pages\\/user_address_list\\/index=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/pages\\/user_vip\\/index=>\\u4f1a\\u5458\\u4e2d\\u5fc3\\n\\/pages\\/activity\\/user_goods_bargain_list\\/index=>\\u780d\\u4ef7\\u8bb0\\u5f55\\n\\/pages\\/user_spread_user\\/index=>\\u63a8\\u5e7f\\u4e2d\\u5fc3\\n\\/pages\\/user_money\\/index=>\\u6211\\u7684\\u4f59\\u989d\\n\\/pages\\/user_goods_collection\\/index=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/user_coupon\\/index=>\\u4f18\\u60e0\\u5238\\n\\/pages\\/admin\\/index=>\\u540e\\u53f0\\u8ba2\\u5355\\u7ba1\\u7406\\n\\/pages\\/service\\/index=>\\u8054\\u7cfb\\u5ba2\\u670d"},{"name":"\\u516c\\u4f17\\u53f7\\u8df3\\u8f6c\\u8def\\u5f84","title":"wap_url","type":"select","param":"\\/user\\/add_manage=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/user\\/vip=>\\u4f1a\\u5458\\u4e2d\\u5fc3\\n\\/activity\\/bargain\\/record=>\\u780d\\u4ef7\\u8bb0\\u5f55\\n\\/user\\/user_promotion=>\\u63a8\\u5e7f\\u4e2d\\u5fc3\\n\\/user\\/account=>\\u6211\\u7684\\u4f59\\u989d\\n\\/collection=>\\u6211\\u7684\\u6536\\u85cf\\n\\/user\\/user_coupon=>\\u4f18\\u60e0\\u5238\\n\\/customer\\/list=>\\u5ba2\\u670d\\u5217\\u8868\\n\\/customer\\/index=>\\u540e\\u53f0\\u8ba2\\u5355\\u7ba1\\u7406"}]' WHERE (`id`= @rmmid);
SET @field = ',{"name":"公众号跳转路径","title":"wap_link","type":"select","param":"\/activity\/goods_seckill=>秒杀列表\\r\\n\/activity\/bargain=>砍价列表\\r\\n\/activity\/group=>拼团列表"}]';
SELECT id as rhaid,LEFT(fields, length(fields) - 1) FROM eb_system_group WHERE config_name = 'routine_home_activity' LIMIT 1 into @rhaid,@fields;
UPDATE `eb_system_group` SET `fields`= CONCAT(@fields, @field) WHERE (`id`= @rhaid);
ALTER TABLE `eb_wechat_user` DROP INDEX `openid`, ADD INDEX `openid`(`openid`) USING BTREE;
UPDATE `eb_system_menus` SET `is_show` = 0 WHERE (controller = 'user.user_notice');
SELECT id as wypid FROM eb_system_menus WHERE menu_name = '页面设置' LIMIT 1 into @wypid;
UPDATE `eb_system_menus` SET `is_show` = 0 WHERE (pid = @wypid);
UPDATE `eb_system_menus` SET `is_show` = 0 WHERE (id = @wypid);
SELECT id as rilid FROM eb_system_config WHERE menu_name = 'routine_index_logo' LIMIT 1 into @rilid;
UPDATE `eb_system_config` SET `config_tab_id` = 5, `info` = '首页logo图标', `desc` = '首页logo图标尺寸(127*45)' WHERE (id = @rilid);
DROP TABLE eb_token;
INSERT INTO `eb_system_menus` ( `pid`, `icon`, `menu_name`, `module`, `controller`, `action`, `params`, `sort`, `is_show`, `access`) VALUES
( 289, '', '应用配置', 'admin', 'setting.systemConfig', 'index', '{"type":"1","tab_id":"2"}', 127, 1, 1),
( 289, '', '支付配置', 'admin', 'setting.systemConfig', 'index', '{"type":"2","tab_id":"4"}', 120, 1, 1);
UPDATE `eb_system_menus` SET `menu_name`='数据配置' WHERE `menu_name`='模块数据配置';
UPDATE `eb_system_menus` SET `menu_name`='数据配置' WHERE `menu_name`='模块数据配置';
SELECT id as systempid2 FROM eb_system_menus WHERE menu_name = '数据配置' LIMIT 1 into @systempid2;
UPDATE `eb_system_menus` SET `pid`=@pid WHERE `id`=@systempid2;
SELECT id as configid FROM `eb_system_config_tab` WHERE `eng_title` = 'wechat_share' into @configid;
DELETE FROM `eb_system_config_tab` WHERE `eng_title` = 'wechat_share';
UPDATE `eb_system_config` SET `config_tab_id`=2 WHERE `config_tab_id`=@configid;
UPDATE  `eb_system_config_tab` SET  `type` =  '2' WHERE  `eb_system_config_tab`.`id` =4;
UPDATE  `eb_system_config_tab` SET  `type` =  '1' WHERE  `eb_system_config_tab`.`id` =7;
UPDATE  `eb_system_config` SET  `input_type` =  'color' WHERE  `eb_system_config`.`id` =76;
UPDATE  `eb_system_menus` SET  `pid` =  @pid WHERE  `menu_name` ='客服管理';
DELETE FROM `eb_system_menus` WHERE `menu_name` = '小程序配置';
ALTER TABLE `eb_user` ADD `brokerage_price` DECIMAL(8,2) NOT NULL DEFAULT '0' COMMENT '佣金金额' AFTER `now_money`;
UPDATE `eb_system_attachment` SET `att_dir` = replace(att_dir ,'/public',''),`satt_dir` = replace(satt_dir ,'/public','');

INSERT INTO `eb_system_config`(`id`, `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES (143, 'tengxun_map_key', 'text', 'input', 10, NULL, NULL, '', 100, NULL, '', '腾讯地图KEY', '腾讯地图KEY', 0, 1);
INSERT INTO `eb_system_config`(`id`, `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES (142, 'store_self_mention', 'radio', NULL, 10, '0=>关闭\n1=>开启', NULL, NULL, NULL, NULL, '\"1\"', '是否开启门店自提', '是否开启门店自提', 0, 1);

UPDATE `eb_system_config` SET `info`='密码' WHERE (`id`='126') LIMIT 1;
UPDATE `eb_system_menus` SET `is_show`='0' WHERE (`id`='476') LIMIT 1;
INSERT INTO `eb_system_config` ( `menu_name`, `type`, `input_type`, `config_tab_id`, `parameter`, `upload_type`, `required`, `width`, `high`, `value`, `info`, `desc`, `sort`, `status`) VALUES ('sms_verification_code', 'text', 'input', 18, '', '', '', '', '', '100006', '通用验证码 模板ID', '模板ID', 0, 1);
