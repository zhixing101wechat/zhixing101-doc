/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/9/3 22:29:23                            */
/*==============================================================*/


drop table if exists BN_BOOK_COMMENT;

drop table if exists BN_USER_VIEW_BOOK_HISTORY;

drop table if exists BN_USER_VIEW_BOOK_STORE_PLACE;

drop table if exists MST_BOOK;

drop table if exists MST_BOOKSHELF;

drop table if exists MST_BOOK_STORAGE_PLACE;

drop table if exists MST_USER;

/*==============================================================*/
/* Table: BN_BOOK_COMMENT                                       */
/*==============================================================*/
create table BN_BOOK_COMMENT
(
   id                   int not null comment 'ID',
   book_id              int comment '评论图书ID',
   content              varchar(8192) comment '评论内容',
   comment_time         datetime comment '评论时间',
   source               varchar(128) comment '评论来源',
   user_id              int comment '评论者用户ID',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
/* Table: BN_USER_VIEW_BOOK_HISTORY                             */
/*==============================================================*/
create table BN_USER_VIEW_BOOK_HISTORY
(
   id                   int not null comment 'ID',
   user_id              int comment '用户ID',
   book_id              int comment '图书ID',
   last_view_time       datetime comment '最近浏览时间',
   view_count           int comment '浏览次数',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
/* Table: BN_USER_VIEW_BOOK_STORE_PLACE                         */
/*==============================================================*/
create table BN_USER_VIEW_BOOK_STORE_PLACE
(
   id                   int not null comment 'ID',
   user_id              int comment '用户ID',
   book_store_place_id  int comment '图书存放点ID',
   last_view_time       datetime comment '最近浏览时间',
   view_count           int comment '浏览次数',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
   primary key (id)
);

alter table BN_USER_VIEW_BOOK_STORE_PLACE comment '用户浏览存书点历史记录表';

/*==============================================================*/
/* Index: index_id                                              */
/*==============================================================*/
create index index_id on BN_USER_VIEW_BOOK_STORE_PLACE
(
   id
);

/*==============================================================*/
/* Table: MST_BOOK                                              */
/*==============================================================*/
create table MST_BOOK
(
   id                   int not null comment 'ID',
   title_author         varchar(512) comment '题名与责任者',
   title                varchar(512) comment '题名',
   version_description  varchar(32) comment '版本说明',
   author               varchar(512) comment '作者',
   publication_distribution varchar(512) comment '出版发行项',
   press                varchar(512) comment '出版社',
   carrier_form         varchar(64) comment '载体形态项',
   language             varchar(32) comment '语言',
   general_note         varchar(512) comment '一般附注项',
   summary              varchar(2048) comment '摘要',
   isbn                 varchar(64) comment 'ISBN',
   keywords             varchar(512) comment '主题词',
   chn_book_cate_id     varchar(64) comment '中图法分类号',
   index_book_id        varchar(64) comment '索书号',
   price                varchar(64) comment '定价',
   bookshelf_id         varchar(16) comment '书架ID',
   detail_position      varchar(128) comment '具体存放位置',
   is_borrowed          varchar(1) comment '借阅状态',
   front_cover_pic_id   varchar(64) comment '正面照片ID',
   backbone_pic_id      varchar(64) comment '书脊照片ID',
   back_cover_pic_id    varchar(64) comment '封底照片ID',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
/* Index: index_title                                           */
/*==============================================================*/
create index index_title on MST_BOOK
(
   title
);

/*==============================================================*/
/* Index: index_author                                          */
/*==============================================================*/
create index index_author on MST_BOOK
(
   author
);

/*==============================================================*/
/* Index: index_keywords                                        */
/*==============================================================*/
create index index_keywords on MST_BOOK
(
   keywords
);

/*==============================================================*/
/* Index: index_chn_book_cate_id                                */
/*==============================================================*/
create index index_chn_book_cate_id on MST_BOOK
(
   chn_book_cate_id
);

/*==============================================================*/
/* Index: index_press                                           */
/*==============================================================*/
create index index_press on MST_BOOK
(
   press
);

/*==============================================================*/
/* Index: index_summary                                         */
/*==============================================================*/
create index index_summary on MST_BOOK
(
   summary
);

/*==============================================================*/
/* Index: index_isbn                                            */
/*==============================================================*/
create index index_isbn on MST_BOOK
(
   isbn
);

/*==============================================================*/
/* Table: MST_BOOKSHELF                                         */
/*==============================================================*/
create table MST_BOOKSHELF
(
   id                   int not null comment 'ID',
   name                 varchar(512) comment '书架名',
   floor                varchar(8) comment '楼层',
   room_no              varchar(16) comment '房间号',
   bookshelf_pic_id     varchar(2048) comment '书架图片ID',
   longtitude           varchar(32) comment '经度',
   latitude             varchar(32) comment '纬度',
   book_storage_place_id int comment '所属图书存放点ID',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
   id                   int not null comment 'ID',
   name                 varchar(512) comment '存放点名称',
   description          varchar(2048) comment '存放点描述',
   longtitude           varchar(32) comment '经度',
   latitude             varchar(32) comment '纬度',
   province_id          varchar(32) comment '省份',
   city_id              varchar(32) comment '城市',
   district_id          varchar(32) comment '区县',
   street_id            varchar(32) comment '街道',
   address_detail       varchar(512) comment '详细地址',
   phone                varchar(32) comment '联系电话',
   mobile_phone         varchar(32) comment '手机',
   owner_user_id        varchar(16) comment '存放点所有人ID',
   open_time            varchar(512) comment '开放时间',
   traffic              varchar(2048) comment '交通',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
   id                   int not null comment 'ID',
   username             varchar(128) comment '用户名',
   wechat_open_id       varchar(128) comment '微信OpenID',
   mobile_phone         varchar(32) comment '手机',
   qq_id                varchar(32) comment 'QQ',
   wechat_id            varchar(128) comment '微信号',
   weibo_id             varchar(512) comment '新浪微博',
   email_address        varchar(64) comment '电子邮箱',
   create_user          varchar(16) comment '创建者',
   create_time          datetime comment '创建时间',
   update_user          varchar(16) comment '更新者',
   update_time          datetime comment '更新时间',
   delete_flag          varchar(1) comment '删除标志',
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
      references MST_BOOK (id);

alter table BN_BOOK_COMMENT add constraint FK_Reference_2 foreign key (user_id)
      references MST_USER (id);

alter table BN_USER_VIEW_BOOK_HISTORY add constraint FK_Reference_7 foreign key (user_id)
      references MST_USER (id);

alter table BN_USER_VIEW_BOOK_HISTORY add constraint FK_Reference_8 foreign key (book_id)
      references MST_BOOK (id);

alter table BN_USER_VIEW_BOOK_STORE_PLACE add constraint FK_Reference_5 foreign key (book_store_place_id)
      references MST_BOOK_STORAGE_PLACE (id);

alter table BN_USER_VIEW_BOOK_STORE_PLACE add constraint FK_Reference_6 foreign key (user_id)
      references MST_USER (id);

alter table MST_BOOK add constraint FK_Reference_3 foreign key (id)
      references MST_BOOKSHELF (id);

alter table MST_BOOKSHELF add constraint FK_Reference_4 foreign key (book_storage_place_id)
      references MST_BOOK_STORAGE_PLACE (id);
