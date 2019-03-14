-- 用户银行信息备份表
create table kkcx.actor_bank_account_bak
(
  actorid          integer           not null,
  bankuser         varchar(60),
  bankname         varchar(30),
  bankaddr         varchar(120),
  bankcard         varchar(30),
  idnumber         varchar(18),
  telephone        varchar(11),
  qq               varchar(12),
  avatar           varchar(64),
  name             varchar(256),
  dtime            timestamp(6),
  servicecompanyid varchar(10),
  bak_time         timestamp default now()
);

comment on column kkcx.actor_bank_account_bak.actorid
is '主播id';

comment on column kkcx.actor_bank_account_bak.bankuser
is '银行卡用户名称';

comment on column kkcx.actor_bank_account_bak.bankname
is '银行名称';

comment on column kkcx.actor_bank_account_bak.bankaddr
is '银行卡支行地址';

comment on column kkcx.actor_bank_account_bak.bankcard
is '银行卡号';

comment on column kkcx.actor_bank_account_bak.idnumber
is '身份证号码';

comment on column kkcx.actor_bank_account_bak.telephone
is '手机号';

comment on column kkcx.actor_bank_account_bak.qq
is 'qq号';

comment on column kkcx.actor_bank_account_bak.name
is '用户真实姓名';

comment on column kkcx.actor_bank_account_bak.dtime
is '操作时间';

comment on column kkcx.actor_bank_account_bak.servicecompanyid
is '经纪服务公司id';

comment on column kkcx.actor_bank_account_bak.bak_time
is '备份时间';

alter table kkcx.actor_bank_account_bak owner to kkcx;


-- 用户实名认证信息备份表
create table tshow.res_user_verify_bak
(
  user_id                  integer not null,
  verify_type              integer,
  verify_status            integer,
  cert_no                  varchar(255),
  cert_name                varchar(255),
  id_pic_font              text,
  id_pic_back              text,
  id_pic_on_hand           text,
  withdraw_id_pic_font     text,
  withdraw_id_pic_back     text,
  withdraw_id_pic_compose  text,
  id_pic_status            integer,
  verify_fail_reason       text,
  sign_electronic_contract integer,
  verify_mobile            varchar(64),
  gender                   integer,
  create_time              timestamp,
  update_time              timestamp,
  bak_time                 timestamp default now()
);

comment on table tshow.res_user_verify_bak
is '用户实名认证备份表';

comment on column tshow.res_user_verify_bak.user_id
is '认证用户id';

comment on column tshow.res_user_verify_bak.verify_type
is '实名认证方式 (1-巡管认证 2-芝麻认证)';

comment on column tshow.res_user_verify_bak.verify_status
is '认证状态 (1-已提交待认证 2-认证成功 3-认证失败)';

comment on column tshow.res_user_verify_bak.cert_no
is '认证身份证号码';

comment on column tshow.res_user_verify_bak.cert_name
is '认证真实姓名';

comment on column tshow.res_user_verify_bak.id_pic_font
is '原始身份证正面照 (只有认证方式是1-巡管认证才需要用户在app上传身份证原始照片)';

comment on column tshow.res_user_verify_bak.id_pic_back
is '原始身份证背面照';

comment on column tshow.res_user_verify_bak.id_pic_on_hand
is '原始手持身份证照';

comment on column tshow.res_user_verify_bak.withdraw_id_pic_font
is '提现身份证正面照';

comment on column tshow.res_user_verify_bak.withdraw_id_pic_back
is '提现身份证背面照';

comment on column tshow.res_user_verify_bak.withdraw_id_pic_compose
is '提现身份证合成图';

comment on column tshow.res_user_verify_bak.id_pic_status
is '提现身份证照片审核状态 (-1-未上传 1-已上传待审核 2-审核通过 3-审核未通过)';

comment on column tshow.res_user_verify_bak.verify_fail_reason
is '认证失败原因';

comment on column tshow.res_user_verify_bak.sign_electronic_contract
is '是否签署电子合同 0-未签署 1-已签署 2-待签署';

comment on column tshow.res_user_verify_bak.verify_mobile
is '认证手机号码';

comment on column tshow.res_user_verify_bak.gender
is '认证用户性别';

comment on column tshow.res_user_verify_bak.create_time
is '创建时间';

comment on column tshow.res_user_verify_bak.update_time
is '修改时间';

comment on column tshow.res_user_verify_bak.bak_time
is '备份时间';

alter table tshow.res_user_verify_bak owner to tshow;
