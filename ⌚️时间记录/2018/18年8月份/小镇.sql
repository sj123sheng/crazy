-- 行政区划编码
select * from conf_area_code where area_code = '330105009';

-- 作品
select * from res_town_work order by work_id desc;

-- 话题
select * from res_town_topic;

-- 评论
select * from town_work_comment;

-- 用户点赞作品
select * from user_praise_work;

-- 用户点赞评论
select * from user_praise_comment;

-- 用户(作品、评论)点赞消息
select * from user_praise_message;

-- 用户关注消息
select * from user_follow_message;

-- 系统消息
select * from town_system_message;

-- 置顶配置
select * from conf_town_top;

-- 乡镇用户信息和角色
select * from town_user_info;

select * from town_user_role;

-- 申请认证
select * from town_star_apply_info;

-- 用户标签
select * from tag_info;

select * from user_tag_relation;

-- 轮播图配置
select * from conf_area_banner;
select * from area_banner_page;