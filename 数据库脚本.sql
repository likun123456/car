/*
注：
1 “数据库脚本.sql”运行方法：全选内容复制到MySQL查询命令行或Navicat里执行即可(脚本运行成功后，就可以删除掉了)
2 登录帐号见t_user表(默认：admin/123456，该帐号建议保留好不删除)
*/

-- DROP DATABASE IF EXISTS car;
CREATE DATABASE car CHARACTER SET utf8;
USE car;

-- DROP TABLE  `t_user`;
CREATE TABLE `t_user`(
    `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键' ,
    `username` varchar(500) COMMENT '用户名' ,
    `password` varchar(500) COMMENT '密码' ,
    `real_name` varchar(500) COMMENT '姓名' ,
    `user_sex` varchar(500) COMMENT '性别:男/女' ,
    `user_phone` varchar(500) COMMENT '手机' ,
    `user_text` varchar(500) COMMENT '备注' ,
    `user_type` varchar(500) COMMENT '类型:管理员/普通用户' 
) COMMENT='用户' ;

-- DROP TABLE  `t_notice`;
CREATE TABLE `t_notice`(
    `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键' ,
    `notice_name` varchar(500) COMMENT '标题' ,
    `notice_text` varchar(500) COMMENT '内容' ,
    `notice_type` varchar(500) COMMENT '类型' ,
    `create_date` varchar(500) COMMENT '创建时间' 
) COMMENT='公告' ;

-- DROP TABLE  `t_car`;
CREATE TABLE `t_car`(
    `id` bigint AUTO_INCREMENT PRIMARY KEY COMMENT '主键' ,
    `car_pai` varchar(500) COMMENT '车牌' ,
    `car_name` varchar(500) COMMENT '品牌型号' ,
    `car_chexing` varchar(500) COMMENT '车型' ,
    `car_cheng` varchar(500) COMMENT '里程' ,
    `car_indate` varchar(500) COMMENT '购买日期' ,
    `car_status` varchar(500) COMMENT '状态:正常/故障' ,
    `car_user` varchar(500) COMMENT '驾驶员' ,
    `car_phone` varchar(500) COMMENT '联系方式' ,
    `car_text` varchar(500) COMMENT '备注' 
) COMMENT='车辆' ;

INSERT INTO `t_car` VALUES (1, '京A9999', '奔驰S400', '轿车', '400', '2025-10-03', '正常', '张三', '13588888888', '服役多年的商务车');
INSERT INTO `t_car` VALUES (2, '京B8888', '奥迪A6', '卡车', '300', '2025-10-03', '故障', '李四', '13855555555', '快报废了');
INSERT INTO `t_notice` VALUES (1, '系统上线了！', '你懂的！！！！', '资讯', '1970-08-21 01:01:01');
INSERT INTO `t_user` VALUES (1, 'admin', '123456', '老王', '女' , '13588888888', '是一个好人', '管理员');
INSERT INTO `t_user` VALUES (2, 'a', '123456', '王八', '男' , '13855555555', '5555', '普通用户');
SELECT * FROM `t_user`;

