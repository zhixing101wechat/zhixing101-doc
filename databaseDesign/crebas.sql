/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/23 23:06:58                          */
/*==============================================================*/


drop table if exists BN_BOOK_COMMENT;

drop table if exists BN_USER_VIEW_BOOK_HISTORY;

drop table if exists BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY;

drop table if exists MST_BOOK;

drop table if exists MST_BOOKSHELF;

drop table if exists MST_BOOK_STORAGE_PLACE;

drop table if exists MST_USER;

/*==============================================================*/
/* Table: BN_BOOK_COMMENT                                       */
/*==============================================================*/
create table BN_BOOK_COMMENT
(
   id                   bigint not null auto_increment comment 'ID',
   book_id              bigint comment '评论图书ID',
   content              varchar(8192) comment '评论内容',
   comment_time         datetime comment '评论时间',
   source               varchar(8) comment '评论来源',
   user_id              bigint comment '评论者用户ID',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table BN_BOOK_COMMENT comment '书籍评论实体表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on BN_BOOK_COMMENT
(
   id
);

/*==============================================================*/
/* Index: index_book_id                                         */
/*==============================================================*/
create index index_book_id on BN_BOOK_COMMENT
(
   book_id
);

/*==============================================================*/
/* Index: index_user_id                                         */
/*==============================================================*/
create index index_user_id on BN_BOOK_COMMENT
(
   user_id
);

/*==============================================================*/
/* Table: BN_USER_VIEW_BOOK_HISTORY                             */
/*==============================================================*/
create table BN_USER_VIEW_BOOK_HISTORY
(
   id                   bigint not null auto_increment comment 'ID',
   user_id              bigint comment '用户ID',
   book_id              bigint comment '图书ID',
   last_view_time       datetime comment '最近浏览时间',
   view_count           int comment '浏览次数',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table BN_USER_VIEW_BOOK_HISTORY comment '用户浏览书籍历史记录表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on BN_USER_VIEW_BOOK_HISTORY
(
   id
);

/*==============================================================*/
/* Index: index_user_id                                         */
/*==============================================================*/
create index index_user_id on BN_USER_VIEW_BOOK_HISTORY
(
   user_id
);

/*==============================================================*/
/* Index: index_book_id                                         */
/*==============================================================*/
create index index_book_id on BN_USER_VIEW_BOOK_HISTORY
(
   book_id
);

/*==============================================================*/
/* Table: BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY                 */
/*==============================================================*/
create table BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY
(
   id                   bigint not null auto_increment comment 'ID',
   user_id              bigint comment '用户ID',
   book_storage_place_id bigint comment '图书存放点ID',
   last_view_time       datetime comment '最近浏览时间',
   view_count           int comment '浏览次数',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY comment '用户浏览存书点历史记录表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY
(
   id
);

/*==============================================================*/
/* Index: index_user_id                                         */
/*==============================================================*/
create index index_user_id on BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY
(
   user_id
);

/*==============================================================*/
/* Index: index_book_storage_place_id                           */
/*==============================================================*/
create index index_book_storage_place_id on BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY
(
   book_storage_place_id
);

/*==============================================================*/
/* Table: MST_BOOK                                              */
/*==============================================================*/
create table MST_BOOK
(
   id                   bigint not null auto_increment comment 'ID',
   title_author         varchar(256) comment '题名与责任者',
   title                varchar(256) comment '题名',
   version              varchar(32) comment '版本',
   publication          varchar(256) comment '出版发行项',
   author               varchar(256) comment '作者',
   publisher            varchar(256) comment '出版社',
   binding              varchar(32) comment '载体形态项',
   language             varchar(32) comment '语言',
   general_note         varchar(512) comment '一般附注项',
   summary              varchar(2048) comment '摘要',
   isbn_10              varchar(32) comment 'ISBN_10',
   isbn_13              varchar(32) comment 'ISBN_13',
   keywords             varchar(512) comment '主题词',
   chn_cate_id          varchar(64) comment '中图法分类号',
   index_id             varchar(64) comment '索书号',
   price                varchar(64) comment '定价',
   bookshelf_id         bigint comment '书架ID',
   position             varchar(128) comment '具体存放位置',
   is_borrowed          tinyint comment '借阅状态',
   front_cover          varchar(64) comment '正面照片ID',
   backbone             varchar(64) comment '书脊照片ID',
   back_cover           varchar(64) comment '封底照片ID',
   douban_image_url     varchar(256) comment '豆瓣图书图片URL',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table MST_BOOK comment '图书实体表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on MST_BOOK
(
   id
);

/*==============================================================*/
/* Table: MST_BOOKSHELF                                         */
/*==============================================================*/
create table MST_BOOKSHELF
(
   id                   bigint not null auto_increment comment 'ID',
   name                 varchar(128) comment '书架名',
   floor                varchar(8) comment '楼层',
   room                 varchar(16) comment '房间号',
   bookshelf_pic        varchar(64) comment '书架图片ID',
   longtitude           varchar(32) comment '经度',
   latitude             varchar(32) comment '纬度',
   book_storage_place_id bigint comment '所属图书存放点ID',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table MST_BOOKSHELF comment '书架实体表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on MST_BOOKSHELF
(
   id
);

/*==============================================================*/
/* Table: MST_BOOK_STORAGE_PLACE                                */
/*==============================================================*/
create table MST_BOOK_STORAGE_PLACE
(
   id                   bigint not null auto_increment comment 'ID',
   poi_id               varchar(32) comment '位置数据POI ID',
   name                 varchar(256) comment '存放点名称',
   description          varchar(2048) comment '存放点描述',
   longtitude           varchar(32) comment '经度',
   latitude             varchar(32) comment '纬度',
   province             varchar(32) comment '省份',
   city                 varchar(32) comment '城市',
   district             varchar(32) comment '区县',
   street               varchar(32) comment '街道',
   address              varchar(512) comment '详细地址',
   phone                varchar(32) comment '联系电话',
   mobile_phone         varchar(32) comment '手机',
   owner_user_id        bigint comment '存放点所有人ID',
   owner_wechat_open_id varchar(128) comment '微信OpenID',
   open_time            varchar(512) comment '开放时间',
   traffic              varchar(1024) comment '交通',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table MST_BOOK_STORAGE_PLACE comment '图书存放点实体表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on MST_BOOK_STORAGE_PLACE
(
   id
);

/*==============================================================*/
/* Table: MST_USER                                              */
/*==============================================================*/
create table MST_USER
(
   id                   bigint not null auto_increment comment 'ID',
   username             varchar(128) comment '用户名',
   nickname             varchar(128) comment '微信昵称',
   password             varchar(128) comment '密码',
   wechat_open_id       varchar(128) comment '微信OpenID',
   wechat_id            varchar(128) comment '微信号',
   mobile_phone         varchar(32) comment '手机',
   qq                   varchar(32) comment 'QQ',
   weibo                varchar(128) comment '新浪微博',
   email                varchar(128) comment '电子邮箱',
   sex                  tinyint comment '性别',
   user_image           varchar(64) comment '用户头像',
   create_user          bigint comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          bigint comment '更新者',
   update_time          datetime comment '更新时间',
   is_deleted           tinyint comment '删除标志',
   primary key (id)
);

alter table MST_USER comment '用户实体表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on MST_USER
(
   id
);

alter table BN_BOOK_COMMENT add constraint FK_Reference_1 foreign key (book_id)
      references MST_BOOK (id) on delete restrict on update restrict;

alter table BN_BOOK_COMMENT add constraint FK_Reference_2 foreign key (user_id)
      references MST_USER (id) on delete restrict on update restrict;

alter table BN_USER_VIEW_BOOK_HISTORY add constraint FK_Reference_7 foreign key (user_id)
      references MST_USER (id) on delete restrict on update restrict;

alter table BN_USER_VIEW_BOOK_HISTORY add constraint FK_Reference_8 foreign key (book_id)
      references MST_BOOK (id) on delete restrict on update restrict;

alter table BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY add constraint FK_Reference_5 foreign key (book_storage_place_id)
      references MST_BOOK_STORAGE_PLACE (id) on delete restrict on update restrict;

alter table BN_USER_VIEW_BOOK_STORE_PLACE_HISTORY add constraint FK_Reference_6 foreign key (user_id)
      references MST_USER (id) on delete restrict on update restrict;

alter table MST_BOOK add constraint FK_Reference_3 foreign key (bookshelf_id)
      references MST_BOOKSHELF (id) on delete restrict on update restrict;

alter table MST_BOOKSHELF add constraint FK_Reference_4 foreign key (book_storage_place_id)
      references MST_BOOK_STORAGE_PLACE (id) on delete restrict on update restrict;

