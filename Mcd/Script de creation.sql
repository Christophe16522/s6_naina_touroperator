/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  28/02/2017 21:31:39                      */
/*==============================================================*/


drop index CLIENT_PK;

drop table CLIENT;

drop index ASSOCIATION_2_FK;

drop index ASSOCIATION_1_FK;

drop index PACK_VOYAGE_PK;

drop table PACK_VOYAGE;

drop index SUPER_ADMIN_PK;

drop table SUPER_ADMIN;

drop index TARIF_VOYAGE_PK;

drop table TARIF_VOYAGE;

drop index VOITURE_PK;

drop table VOITURE;

drop index ASSOCIATION_4_FK;

drop index ASSOCIATION_3_FK;

drop index VOYAGE_PK;

drop table VOYAGE;

drop index ASSOCIATION_5_FK;

drop index VOYAGE_CONFIRMER_PK;

drop table VOYAGE_CONFIRMER;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
   IDCLIENT             SERIAL               not null,
   NOMCLIENT            VARCHAR(50)          null,
   EMAILCLIENT          VARCHAR(50)          null,
   PASSCLIENT           VARCHAR(255)         null,
   constraint PK_CLIENT primary key (IDCLIENT)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
IDCLIENT
);

/*==============================================================*/
/* Table : PACK_VOYAGE                                          */
/*==============================================================*/
create table PACK_VOYAGE (
   IDPACKVOYAGE         SERIAL               not null,
   IDVOITURE            INT4                 not null,
   IDTARIFVOYAGE        INT4                 not null,
   DECRIPTION           VARCHAR(50)          null,
   constraint PK_PACK_VOYAGE primary key (IDPACKVOYAGE)
);

/*==============================================================*/
/* Index : PACK_VOYAGE_PK                                       */
/*==============================================================*/
create unique index PACK_VOYAGE_PK on PACK_VOYAGE (
IDPACKVOYAGE
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_1_FK on PACK_VOYAGE (
IDTARIFVOYAGE
);

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_2_FK on PACK_VOYAGE (
IDVOITURE
);

/*==============================================================*/
/* Table : SUPER_ADMIN                                          */
/*==============================================================*/
create table SUPER_ADMIN (
   IDSUPERADMIN         SERIAL               not null,
   LOGINSUPERADMIN      VARCHAR(30)          null,
   PASSSUPERADMIN       VARCHAR(30)          null,
   NIVEAUACCREDITATION  INT2                 null,
   constraint PK_SUPER_ADMIN primary key (IDSUPERADMIN)
);

/*==============================================================*/
/* Index : SUPER_ADMIN_PK                                       */
/*==============================================================*/
create unique index SUPER_ADMIN_PK on SUPER_ADMIN (
IDSUPERADMIN
);

/*==============================================================*/
/* Table : TARIF_VOYAGE                                         */
/*==============================================================*/
create table TARIF_VOYAGE (
   IDTARIFVOYAGE        SERIAL               not null,
   TRAJETVOYAGE         VARCHAR(50)          null,
   PRIXVOYAGE           MONEY                null,
   constraint PK_TARIF_VOYAGE primary key (IDTARIFVOYAGE)
);

/*==============================================================*/
/* Index : TARIF_VOYAGE_PK                                      */
/*==============================================================*/
create unique index TARIF_VOYAGE_PK on TARIF_VOYAGE (
IDTARIFVOYAGE
);

/*==============================================================*/
/* Table : VOITURE                                              */
/*==============================================================*/
create table VOITURE (
   IDVOITURE            SERIAL               not null,
   MATRICULEVOITURE     VARCHAR(8)           null,
   IMAGEVOITURE         VARCHAR(255)         null,
   PRIXLOCATIONVOITURE  MONEY                null,
   MODELVOITURE         VARCHAR(50)          null,
   constraint PK_VOITURE primary key (IDVOITURE)
);

/*==============================================================*/
/* Index : VOITURE_PK                                           */
/*==============================================================*/
create unique index VOITURE_PK on VOITURE (
IDVOITURE
);

/*==============================================================*/
/* Table : VOYAGE                                               */
/*==============================================================*/
create table VOYAGE (
   IDVOYAGE             SERIAL               not null,
   IDPACKVOYAGE         INT4                 not null,
   IDCLIENT             INT4                 not null,
   DATEDEBUTVOYAGE      DATE                 null,
   DATEFINVOYAGE        DATE                 null,
   constraint PK_VOYAGE primary key (IDVOYAGE)
);

/*==============================================================*/
/* Index : VOYAGE_PK                                            */
/*==============================================================*/
create unique index VOYAGE_PK on VOYAGE (
IDVOYAGE
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK on VOYAGE (
IDCLIENT
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_4_FK on VOYAGE (
IDPACKVOYAGE
);

/*==============================================================*/
/* Table : VOYAGE_CONFIRMER                                     */
/*==============================================================*/
create table VOYAGE_CONFIRMER (
   IDVOYAGECONFIRMER    SERIAL               not null,
   IDVOYAGE             INT4                 not null,
   constraint PK_VOYAGE_CONFIRMER primary key (IDVOYAGECONFIRMER)
);

/*==============================================================*/
/* Index : VOYAGE_CONFIRMER_PK                                  */
/*==============================================================*/
create unique index VOYAGE_CONFIRMER_PK on VOYAGE_CONFIRMER (
IDVOYAGECONFIRMER
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_5_FK on VOYAGE_CONFIRMER (
IDVOYAGE
);

alter table PACK_VOYAGE
   add constraint FK_PACK_VOY_ASSOCIATI_TARIF_VO foreign key (IDTARIFVOYAGE)
      references TARIF_VOYAGE (IDTARIFVOYAGE)
      on delete restrict on update restrict;

alter table PACK_VOYAGE
   add constraint FK_PACK_VOY_ASSOCIATI_VOITURE foreign key (IDVOITURE)
      references VOITURE (IDVOITURE)
      on delete restrict on update restrict;

alter table VOYAGE
   add constraint FK_VOYAGE_ASSOCIATI_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table VOYAGE
   add constraint FK_VOYAGE_ASSOCIATI_PACK_VOY foreign key (IDPACKVOYAGE)
      references PACK_VOYAGE (IDPACKVOYAGE)
      on delete restrict on update restrict;

alter table VOYAGE_CONFIRMER
   add constraint FK_VOYAGE_C_ASSOCIATI_VOYAGE foreign key (IDVOYAGE)
      references VOYAGE (IDVOYAGE)
      on delete restrict on update restrict;

