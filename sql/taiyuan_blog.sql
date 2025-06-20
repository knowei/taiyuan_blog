/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : taiyuan_blog

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 20/06/2025 10:40:11
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`
(
    `id`            bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `post_id`       bigint NOT NULL COMMENT '文章ID',
    `user_id`       bigint NULL DEFAULT NULL COMMENT '评论用户ID',
    `reply_user_id` bigint NULL DEFAULT NULL COMMENT '@的用户',
    `nick_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
    `email`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `author_img`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
    `browser_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
    `os_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
    `ip`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求ip',
    `content`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
    `parent_id`     bigint NULL DEFAULT 0 COMMENT '父评论ID（0表示一级评论）',
    `like_count`    int NULL DEFAULT 0 COMMENT '点赞总数',
    `create_time`   datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint NULL DEFAULT NULL COMMENT '作者ID（关联 blog_user.id）',
    `title`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
    `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图片',
    `summary`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '摘要',
    `content`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
    `category_id` bigint NULL DEFAULT NULL COMMENT '分类ID（关联 blog_category.id）',
    `view_count`  int NULL DEFAULT 0 COMMENT '浏览量',
    `like_count`  int NULL DEFAULT 0 COMMENT '点赞数',
    `is_resource` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否为资源贴（0否，1是）',
    `status`      varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0草稿，1发布）',
    `is_top`      tinyint NULL DEFAULT 0 COMMENT '是否置顶（0否，1是）',
    `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_resource
-- ----------------------------
DROP TABLE IF EXISTS `post_resource`;
CREATE TABLE `post_resource`
(
    `id`                     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `post_id`                bigint                                                        NOT NULL COMMENT '文章id',
    `url`                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '百度网盘，夸克，123网盘',
    `open_password`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提取密码',
    `decompression_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '解压密码',
    `create_time`            datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`            datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_resource
-- ----------------------------

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `post_id`     bigint NULL DEFAULT NULL COMMENT '文章ID（关联 blog_post.id）',
    `tag_id`      bigint NULL DEFAULT NULL COMMENT '标签ID（关联 blog_tag.id）',
    `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_tag
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-06-10 16:51:21', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-06-10 16:51:21', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-06-10 16:51:21', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-06-10 16:51:21', '', NULL,
        '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-06-10 16:51:21',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-06-10 16:51:21', '', NULL,
        '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config`
VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-06-10 16:51:21', '',
        NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config`
VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-06-10 16:51:21',
        '', NULL,
        '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-10 16:51:18', '',
        NULL);
INSERT INTO `sys_dept`
VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);
INSERT INTO `sys_dept`
VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin',
        '2025-06-10 16:51:18', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '其他操作');
INSERT INTO `sys_dict_data`
VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-06-10 16:51:21', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (100, 0, '草稿', '0', 'post_status', NULL, 'primary', 'N', '0', 'admin', '2025-06-16 11:39:21', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (101, 0, '发布', '1', 'post_status', NULL, 'success', 'N', '0', 'admin', '2025-06-16 11:39:34', 'admin',
        '2025-06-16 11:39:43', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-06-10 16:51:20', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type`
VALUES (100, '文章状态', 'post_status', '0', 'admin', '2025-06-16 11:38:54', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE,
    INDEX            `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
    INDEX            `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-10 16:54:38');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-10 16:54:55');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-10 17:29:40');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-10 17:52:12');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '1', '验证码已失效', '2025-06-11 10:13:44');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-11 10:13:50');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-11 11:03:48');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-12 10:02:12');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 09:11:15');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 09:53:04');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-16 10:36:05');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 10:39:07');
INSERT INTO `sys_logininfor`
VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-06-16 11:42:08');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 11:42:13');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 13:35:21');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 14:19:12');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-16 16:11:56');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-17 14:28:52');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-06-17 14:37:17');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-17 14:37:20');
INSERT INTO `sys_logininfor`
VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 10:23:12');
INSERT INTO `sys_logininfor`
VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 10:23:33');
INSERT INTO `sys_logininfor`
VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 11:05:48');
INSERT INTO `sys_logininfor`
VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 13:38:07');
INSERT INTO `sys_logininfor`
VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-20 09:13:02');
INSERT INTO `sys_logininfor`
VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-06-20 09:17:42');
INSERT INTO `sys_logininfor`
VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-20 09:17:46');
INSERT INTO `sys_logininfor`
VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-20 10:39:37');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
    `route_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
    `is_frame`    int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-06-10 16:51:19',
        '', NULL, '系统管理目录');
INSERT INTO `sys_menu`
VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin',
        '2025-06-10 16:51:19', '', NULL, '系统监控目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2025-06-10 16:51:19', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2025-06-10 16:51:19', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list',
        'tree-table', 'admin', '2025-06-10 16:51:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2025-06-10 16:51:19', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2025-06-10 16:51:19', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list',
        'edit', 'admin', '2025-06-10 16:51:19', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2025-06-10 16:51:19', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-06-10 16:51:19', '',
        NULL, '日志管理菜单');
INSERT INTO `sys_menu`
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2025-06-10 16:51:19', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu`
VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list',
        'druid', 'admin', '2025-06-10 16:51:19', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu`
VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2025-06-10 16:51:19', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu`
VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis', 'admin', '2025-06-10 16:51:19', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu`
VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis-list', 'admin', '2025-06-10 16:51:19', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu`
VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0',
        'monitor:operlog:list', 'form', 'admin', '2025-06-10 16:51:19', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu`
VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2025-06-10 16:51:19', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2025-06-10 16:51:19', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2000, '文章管理', 0, 0, 'post', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'post', 'admin',
        '2025-06-10 17:30:38', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2001, '文章列表', 2000, 1, 'list', 'post/list/index', NULL, '', 1, 0, 'C', '0', '0', '', '#', 'admin',
        '2025-06-10 17:31:31', 'admin', '2025-06-10 17:32:06', '');
INSERT INTO `sys_menu`
VALUES (2002, '文章发布', 2000, 4, 'publish', 'post/publish/index', NULL, '', 1, 0, 'C', '0', '0', NULL, '#', 'admin',
        '2025-06-10 17:33:24', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2003, '标签', 2000, 7, 'tag', 'post/tag/index', NULL, '', 1, 0, 'C', '0', '0', '', '#', 'admin',
        '2025-06-16 14:20:14', 'admin', '2025-06-16 14:20:20', '');
INSERT INTO `sys_menu`
VALUES (2004, '分类', 2000, 10, 'category', 'post/category/index', NULL, '', 1, 0, 'C', '0', '0', NULL, '#', 'admin',
        '2025-06-16 14:20:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int                                                          NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime NULL DEFAULT NULL COMMENT '操作时间',
    `cost_time`      bigint NULL DEFAULT 0 COMMENT '消耗时间',
    PRIMARY KEY (`oper_id`) USING BTREE,
    INDEX            `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
    INDEX            `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
    INDEX            `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"post\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-10 17:30:38', 47);
INSERT INTO `sys_oper_log`
VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章列表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"post/list/index\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-10 17:31:31', 17);
INSERT INTO `sys_oper_log`
VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"post/list/index\",\"createTime\":\"2025-06-10 17:31:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"文章列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"post/list/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-10 17:31:57', 17);
INSERT INTO `sys_oper_log`
VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"post/list/index\",\"createTime\":\"2025-06-10 17:31:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"文章列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"list\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-10 17:32:06', 16);
INSERT INTO `sys_oper_log`
VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"post/publish/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章发布\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"publish\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-10 17:33:24', 21);
INSERT INTO `sys_oper_log`
VALUES (105, '岗位管理', 2, 'com.knowei.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/post', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2025-06-10 16:51:19\",\"flag\":false,\"params\":{},\"postCode\":\"hr\",\"postId\":3,\"postName\":\"人力资源\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-11 10:14:05', 33);
INSERT INTO `sys_oper_log`
VALUES (106, '字典类型', 1, 'com.knowei.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"文章状态\",\"dictType\":\"post_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 11:38:54', 33);
INSERT INTO `sys_oper_log`
VALUES (107, '字典数据', 1, 'com.knowei.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"草稿\",\"dictSort\":0,\"dictType\":\"post_status\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 11:39:21', 50);
INSERT INTO `sys_oper_log`
VALUES (108, '字典数据', 1, 'com.knowei.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"1\",\"dictSort\":0,\"dictType\":\"post_status\",\"dictValue\":\"发布\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 11:39:35', 18);
INSERT INTO `sys_oper_log`
VALUES (109, '字典数据', 2, 'com.knowei.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2025-06-16 11:39:34\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"发布\",\"dictSort\":0,\"dictType\":\"post_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 11:39:43', 19);
INSERT INTO `sys_oper_log`
VALUES (110, '菜单管理', 1, 'com.knowei.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"/post/tag/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"标签\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"tag\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 14:20:14', 55);
INSERT INTO `sys_oper_log`
VALUES (111, '菜单管理', 2, 'com.knowei.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"post/tag/index\",\"createTime\":\"2025-06-16 14:20:14\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"标签\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"tag\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 14:20:20', 22);
INSERT INTO `sys_oper_log`
VALUES (112, '菜单管理', 1, 'com.knowei.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"post/category/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"分类\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-16 14:20:51', 14);
INSERT INTO `sys_oper_log`
VALUES (113, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0,
        NULL, '2025-06-17 14:31:14', 21);
INSERT INTO `sys_oper_log`
VALUES (114, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0,
        NULL, '2025-06-17 14:31:19', 4);
INSERT INTO `sys_oper_log`
VALUES (115, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0,
        NULL, '2025-06-17 14:31:31', 6);
INSERT INTO `sys_oper_log`
VALUES (116, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/116', '127.0.0.1', '内网IP', '116',
        '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-06-17 14:31:42', 3);
INSERT INTO `sys_oper_log`
VALUES (117, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1055', '127.0.0.1', '内网IP', '1055',
        '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-06-17 14:31:46', 7);
INSERT INTO `sys_oper_log`
VALUES (118, '角色管理', 3, 'com.knowei.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '[2]', NULL, 1, '普通角色已分配,不能删除',
        '2025-06-17 14:31:58', 51);
INSERT INTO `sys_oper_log`
VALUES (119, '角色管理', 4, 'com.knowei.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin',
        '研发部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":2,\"userId\":2}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-17 14:32:19', 18);
INSERT INTO `sys_oper_log`
VALUES (120, '角色管理', 3, 'com.knowei.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:23', 34);
INSERT INTO `sys_oper_log`
VALUES (121, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:40', 21);
INSERT INTO `sys_oper_log`
VALUES (122, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/115', '127.0.0.1', '内网IP', '115', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:44', 21);
INSERT INTO `sys_oper_log`
VALUES (123, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1055', '127.0.0.1', '内网IP', '1055', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:47', 18);
INSERT INTO `sys_oper_log`
VALUES (124, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1056', '127.0.0.1', '内网IP', '1056', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:49', 13);
INSERT INTO `sys_oper_log`
VALUES (125, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1057', '127.0.0.1', '内网IP', '1057', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:51', 12);
INSERT INTO `sys_oper_log`
VALUES (126, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1059', '127.0.0.1', '内网IP', '1059', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:53', 18);
INSERT INTO `sys_oper_log`
VALUES (127, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1058', '127.0.0.1', '内网IP', '1058', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:54', 17);
INSERT INTO `sys_oper_log`
VALUES (128, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/1060', '127.0.0.1', '内网IP', '1060', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:56', 11);
INSERT INTO `sys_oper_log`
VALUES (129, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/116', '127.0.0.1', '内网IP', '116', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:32:59', 14);
INSERT INTO `sys_oper_log`
VALUES (130, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/117', '127.0.0.1', '内网IP', '117', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:33:24', 13);
INSERT INTO `sys_oper_log`
VALUES (131, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/3', '127.0.0.1', '内网IP', '3', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:33:26', 13);
INSERT INTO `sys_oper_log`
VALUES (132, '通知公告', 3, 'com.knowei.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/notice/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:33:50', 8);
INSERT INTO `sys_oper_log`
VALUES (133, '通知公告', 3, 'com.knowei.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/notice/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:33:52', 8);
INSERT INTO `sys_oper_log`
VALUES (134, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102',
        '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-06-17 14:34:07', 3);
INSERT INTO `sys_oper_log`
VALUES (135, '用户管理', 3, 'com.knowei.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:16', 39);
INSERT INTO `sys_oper_log`
VALUES (136, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/post/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '董事长已分配,不能删除',
        '2025-06-17 14:34:35', 6);
INSERT INTO `sys_oper_log`
VALUES (137, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/post/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:38', 17);
INSERT INTO `sys_oper_log`
VALUES (138, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/post/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:40', 12);
INSERT INTO `sys_oper_log`
VALUES (139, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/post/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:41', 15);
INSERT INTO `sys_oper_log`
VALUES (140, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/post/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '董事长已分配,不能删除',
        '2025-06-17 14:34:46', 6);
INSERT INTO `sys_oper_log`
VALUES (141, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102',
        '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-06-17 14:34:52', 4);
INSERT INTO `sys_oper_log`
VALUES (142, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:53', 14);
INSERT INTO `sys_oper_log`
VALUES (143, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:57', 11);
INSERT INTO `sys_oper_log`
VALUES (144, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:34:58', 14);
INSERT INTO `sys_oper_log`
VALUES (145, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103',
        '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-06-17 14:35:00', 4);
INSERT INTO `sys_oper_log`
VALUES (146, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:35:02', 15);
INSERT INTO `sys_oper_log`
VALUES (147, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:35:04', 10);
INSERT INTO `sys_oper_log`
VALUES (148, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:35:05', 10);
INSERT INTO `sys_oper_log`
VALUES (149, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:35:06', 19);
INSERT INTO `sys_oper_log`
VALUES (150, '用户管理', 2, 'com.knowei.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-06-10 16:51:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2025-06-17 14:28:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[],\"pwdUpdateDate\":\"2025-06-10 16:51:18\",\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}',
        NULL, 1, '不允许操作超级管理员用户', '2025-06-17 14:35:37', 1);
INSERT INTO `sys_oper_log`
VALUES (151, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:37:09', 12);
INSERT INTO `sys_oper_log`
VALUES (152, '部门管理', 3, 'com.knowei.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:37:11', 12);
INSERT INTO `sys_oper_log`
VALUES (153, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/post/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '董事长已分配,不能删除', '2025-06-17 14:37:33', 5);
INSERT INTO `sys_oper_log`
VALUES (154, '岗位管理', 3, 'com.knowei.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/post/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-17 14:38:01', 22);
INSERT INTO `sys_oper_log`
VALUES (155, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1020', '127.0.0.1', '内网IP', '1020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:20', 44);
INSERT INTO `sys_oper_log`
VALUES (156, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1021', '127.0.0.1', '内网IP', '1021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:21', 15);
INSERT INTO `sys_oper_log`
VALUES (157, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1022', '127.0.0.1', '内网IP', '1022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:23', 18);
INSERT INTO `sys_oper_log`
VALUES (158, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1023', '127.0.0.1', '内网IP', '1023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:25', 18);
INSERT INTO `sys_oper_log`
VALUES (159, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1024', '127.0.0.1', '内网IP', '1024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:28', 11);
INSERT INTO `sys_oper_log`
VALUES (160, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:18:30', 15);
INSERT INTO `sys_oper_log`
VALUES (161, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1049', '127.0.0.1', '内网IP', '1049', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:23', 60);
INSERT INTO `sys_oper_log`
VALUES (162, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1050', '127.0.0.1', '内网IP', '1050', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:24', 18);
INSERT INTO `sys_oper_log`
VALUES (163, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1051', '127.0.0.1', '内网IP', '1051', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:26', 16);
INSERT INTO `sys_oper_log`
VALUES (164, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1052', '127.0.0.1', '内网IP', '1052', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:28', 21);
INSERT INTO `sys_oper_log`
VALUES (165, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1053', '127.0.0.1', '内网IP', '1053', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:29', 15);
INSERT INTO `sys_oper_log`
VALUES (166, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/1054', '127.0.0.1', '内网IP', '1054', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:32', 12);
INSERT INTO `sys_oper_log`
VALUES (167, '菜单管理', 3, 'com.knowei.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/110', '127.0.0.1', '内网IP', '110', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-06-20 09:31:34', 13);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                           NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-06-10 16:51:19', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2025-06-10 16:51:19', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`         bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`         bigint NULL DEFAULT NULL COMMENT '部门ID',
    `user_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
    `nick_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
    `user_type`       varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
    `phonenumber`     varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
    `sex`             char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
    `password`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
    `del_flag`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`      datetime NULL DEFAULT NULL COMMENT '最后登录时间',
    `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`     datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, NULL, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-20 10:39:37',
        '2025-06-10 16:51:18', 'admin', '2025-06-10 16:51:18', '', '2025-06-20 10:39:37', '管理员');
INSERT INTO `sys_user`
VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2025-06-10 16:51:18',
        '2025-06-10 16:51:18', 'admin', '2025-06-10 16:51:18', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`
(
    `id`          bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
    `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------

SET
FOREIGN_KEY_CHECKS = 1;
