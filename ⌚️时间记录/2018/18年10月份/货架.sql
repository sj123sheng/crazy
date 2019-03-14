-- 商品表新增6个字段
ALTER TABLE kkcx.res_product_info ADD distributor_commission_rate int NULL;
COMMENT ON COLUMN kkcx.res_product_info.distributor_commission_rate IS '分销商佣金比例';
ALTER TABLE kkcx.res_product_info ADD distributor_commission_amount bigint NULL;
COMMENT ON COLUMN kkcx.res_product_info.distributor_commission_amount IS '分销商佣金金额';
ALTER TABLE kkcx.res_product_info ADD support_return int NULL;
COMMENT ON COLUMN kkcx.res_product_info.support_return IS '是否支持退换货 0-不支持 1-支持';
ALTER TABLE kkcx.res_product_info ADD support_distribution int NULL;
COMMENT ON COLUMN kkcx.res_product_info.support_distribution IS '是否支持代理分销 0-不支持 1-支持';
COMMENT ON COLUMN kkcx.res_product_info.product_type IS '商品类型 1-拍卖商品 2-分销商品 3-普通商品';
ALTER TABLE kkcx.res_product_info ADD cat_id int NULL;
COMMENT ON COLUMN kkcx.res_product_info.cat_id IS '一级类目id';
ALTER TABLE kkcx.res_product_info ADD delete_flag int DEFAULT 1 NULL;
COMMENT ON COLUMN kkcx.res_product_info.delete_flag IS '是否删除 1-未删除 0-已删除';
-- 初始化是否删除字段和是否支持退换货字段
update kkcx.res_product_info set delete_flag = 1;
update kkcx.res_product_info set support_return = 1;

-- 订单表
ALTER TABLE kkcx.res_order_info ADD settle_status int DEFAULT 1 NULL;
COMMENT ON COLUMN kkcx.res_order_info.settle_status IS '订单结算状态 1-待结算 2-已结算';
ALTER TABLE kkcx.res_order_info ADD settle_time timestamp NULL;
COMMENT ON COLUMN kkcx.res_order_info.settle_time IS '结算时间';
-- 初始化订单结算状态数据
update kkcx.res_order_info set settle_status = 1;
update kkcx.res_order_info set settle_status = 2,settle_time = receive_time where order_state = 4;
-- 订单商品表
ALTER TABLE kkcx.res_order_item ADD support_return int NULL;
COMMENT ON COLUMN kkcx.res_order_item.support_return IS '是否支持退换货 0-不支持 1-支持';
ALTER TABLE kkcx.res_order_item ADD distributor_commission_rate int NULL;
COMMENT ON COLUMN kkcx.res_order_item.distributor_commission_rate IS '分销商佣金比例';
ALTER TABLE kkcx.res_order_item ADD distributor_commission_amount bigint NULL;
COMMENT ON COLUMN kkcx.res_order_item.distributor_commission_amount IS '分销商佣金金额';
-- 交易明细表
COMMENT ON COLUMN kkcx.hist_transaction_details.transaction_type IS '交易类型，1-货款，2-提现，3-退款 4-佣金支出 5-佣金收入';

-- 用户代理分销商品配置表
CREATE TABLE kkcx.conf_user_distribution_product
(
    user_id int,
    product_id int,
    create_time timestamp,
    is_valid    integer,
    CONSTRAINT conf_user_distribution_product_user_id_product_id_pk PRIMARY KEY (user_id, product_id)
);
COMMENT ON COLUMN kkcx.conf_user_distribution_product.user_id IS '用户id(代理分销商id)';
COMMENT ON COLUMN kkcx.conf_user_distribution_product.product_id IS '商品id';
COMMENT ON COLUMN kkcx.conf_user_distribution_product.create_time IS '添加时间';
COMMENT ON COLUMN kkcx.conf_user_distribution_product.is_valid is '是否上架 0-下架 1-上架';
COMMENT ON TABLE kkcx.conf_user_distribution_product IS '用户代理分销商品配置表';
alter table kkcx.conf_user_distribution_product owner to kkcx;

-- 用户商品管理配置表
CREATE TABLE kkcx.conf_user_product
(
    user_id int PRIMARY KEY,
    show_shelf_status int,
    create_time timestamp,
    update_time timestamp
);
COMMENT ON COLUMN kkcx.conf_user_product.user_id IS '用户id(分销代理和认证商家)';
COMMENT ON COLUMN kkcx.conf_user_product.show_shelf_status IS '货架入口显示状态 1：显示 0：不显示';
COMMENT ON COLUMN kkcx.conf_user_product.create_time IS '创建时间';
COMMENT ON COLUMN kkcx.conf_user_product.update_time IS '更新时间';
COMMENT ON TABLE kkcx.conf_user_product IS '用户商品管理配置表';
alter table kkcx.conf_user_product owner to kkcx;
-- 将线上所有直播购商家初始化货架入口为显示状态
insert into kkcx.conf_user_product
(
  user_id, show_shelf_status, create_time, update_time
) select actor_id, 1, now(), now() from kkcx.res_shop_info where shop_mode = 1;

