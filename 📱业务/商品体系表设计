1.类目属性库表(sxc_category_properties_template) 新增

2.类目属性库模板表(sxc_category_template) 新增

3.属性分类表(sxc_property_type) 新增  数据初始化

4.基础属性关系表(sxc_property_relation) 新增  数据初始化

5.类目属性关联表(sxc_cat_properties) 新增

6.类目属性值关联表(sxc_cat_property_values) 新增

7.spu属性关联表(sxc_spu_property_values) 新增parent_property_id字段和联合主键设置

CREATE TABLE `sxc_cat_properties` (
  `category_id` int(11) NOT NULL COMMENT '商品类目id',
  `property_id` int(11) NOT NULL COMMENT '属性id',
  `parent_property_id` int(11) NOT NULL COMMENT '父属性id',
  `property_type` int(11) NOT NULL COMMENT '属性类型',
  `property_name` varchar(255) NOT NULL COMMENT '属性名（冗余字段）',
  `features` varchar(4000) DEFAULT NULL COMMENT '特征值',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:删除 1:可用',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `operator_id` int(11) NOT NULL COMMENT '操作者id',
  PRIMARY KEY (`category_id`,`property_id`,`parent_property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目属性关联表';

CREATE TABLE `sxc_cat_property_values` (
  `category_id` int(11) NOT NULL COMMENT '商品类目id',
  `property_id` int(11) NOT NULL COMMENT '属性id',
  `parent_property_id` int(11) NOT NULL COMMENT '父属性id',
  `value_id` int(11) NOT NULL COMMENT '属性值id',
  `value_data` varchar(255) NOT NULL COMMENT '属性值（冗余字段）',
  `property_type` int(11) DEFAULT NULL COMMENT '属性类型',
  `property_name` varchar(255) DEFAULT NULL COMMENT '属性名（冗余字段）',
  `property_alias_name` varchar(255) DEFAULT NULL COMMENT '属性值别名',
  `features` varchar(4000) DEFAULT NULL COMMENT '特征值',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:删除 1:可用',
  `operator_id` int(11) NOT NULL COMMENT '操作者id',
  PRIMARY KEY (`category_id`,`property_id`,`parent_property_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目属性值关联表';

CREATE TABLE `sxc_category_properties_template` (
  `template_id` int(11) NOT NULL COMMENT '类目模板id',
  `category_id` int(11) NOT NULL COMMENT '商品类目id',
  `property_id` int(11) NOT NULL COMMENT '属性id',
  `property_type` int(11) NOT NULL COMMENT '属性类型',
  `property_alias_name` varchar(255) DEFAULT NULL COMMENT '属性别名',
  `key_property` int(11) NOT NULL COMMENT '是否关键属性 1:关键 ;0:非关键',
  `required` int(11) NOT NULL COMMENT '是否必选 1:必选;0:非必选',
  `entry_type` int(11) NOT NULL COMMENT '录入类型( 1：列表选择-枚举  2：手工录入-非枚举   3：区间   4：标签)',
  `multi_selected` int(11) NOT NULL COMMENT '是否多选 1:多选; 0:单选',
  `property_name` varchar(255) NOT NULL COMMENT '属性名（冗余字段）',
  `sorted_order` int(11) NOT NULL COMMENT '多个属性排序',
  `features` varchar(4000) DEFAULT NULL COMMENT '特征值',
  `parent_property_id` int(11) NOT NULL COMMENT '父属性id',
  `parent_value_id` int(11) DEFAULT NULL COMMENT '父属性值id',
  `status` int(11) DEFAULT '1' COMMENT '类目属性状态(暂时无用)',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:删除 1:可用',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `operator_id` int(11) NOT NULL COMMENT '操作者id',
  PRIMARY KEY (`template_id`,`category_id`,`property_id`,`parent_property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目属性库表（类目属性发布模板）';

CREATE TABLE `sxc_category_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目模板id',
  `name` varchar(255) DEFAULT NULL COMMENT '类目模板名称',
  `cat_id` int(11) NOT NULL COMMENT '类目ID',
  `cat_name` varchar(255) NOT NULL DEFAULT '' COMMENT '类目名称',
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '0:删除 1:可用',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='类目模板';

CREATE TABLE `sxc_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性分类id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父属性分类id',
  `property_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性分类名称',
  `level` int(11) NOT NULL COMMENT '属性分类级别',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_creator` int(11) NOT NULL COMMENT '创建者id',
  `gmt_modifier` int(11) DEFAULT NULL COMMENT '修改者id',
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '状态,0:无效 1:有效',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '运营状态(暂时无用)----0:未生效; 1:运营确认;',
  `description` varchar(3000) DEFAULT NULL COMMENT '属性分类详细描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='属性分类表';

CREATE TABLE `sxc_property_values` (
  `property_id` int(11) NOT NULL COMMENT '属性id',
  `value_id` int(11) NOT NULL COMMENT '属性值id',
  `sorted_order` int(11) NOT NULL COMMENT '多个属性排序',
  `status` int(11) NOT NULL COMMENT '状态（暂时无用）',
  `property_type` int(11) NOT NULL COMMENT '属性类型',
  `features` varchar(4000) DEFAULT NULL COMMENT '特征值',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `property_name` varchar(255) NOT NULL COMMENT '属性名称（冗余字段）',
  `value_data` varchar(255) NOT NULL COMMENT '属性值（冗余字段）',
  `state` int(11) NOT NULL COMMENT '0:删除 1:可用',
  `operator_id` int(11) NOT NULL COMMENT '操作者id',
  PRIMARY KEY (`property_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础属性关联表';

CREATE TABLE `sxc_property_relation` (
  `property_id` int(11) NOT NULL COMMENT '属性id',
  `property_name` varchar(11) DEFAULT NULL COMMENT '属性名称',
  `property_type` int(11) DEFAULT NULL COMMENT '属性分类',
  `parent_property_id` int(11) NOT NULL COMMENT '父属性id',
  `parent_property_name` varchar(255) DEFAULT '' COMMENT '父属性名称',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `gmt_creator` int(11) NOT NULL COMMENT '创建者id',
  `gmt_modifier` int(11) DEFAULT NULL COMMENT '修改者id',
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '状态,0:无效 1:有效',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '运营状态(暂时无用)----0:未生效; 1:运营确认;',
  PRIMARY KEY (`property_id`,`parent_property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='基础属性关联关系表';