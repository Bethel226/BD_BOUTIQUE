/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  10/03/2022 15:45:22                      */
/*==============================================================*/


drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists Role_utilisateur;

drop table if exists Utlisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table : Achat                                                */
/*==============================================================*/
create table Achat
(
   id_achat             int not null,
   id_art               int not null,
   Date                 datetime,
   Quantite             int,
   Prix_unitaire        float,
   Prix_total           float,
   primary key (id_achat)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   id_art               int not null,
   id_cat               int not null,
   Libelle              varchar(254),
   Description          varchar(254),
   Prix_unitaire        float,
   Quantite             int,
   Categorie            varchar(254),
   primary key (id_art)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   id_cat               int not null,
   Nom                  varchar(254),
   primary key (id_cat)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   id_clt               int not null,
   id_achat             int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adresse              varchar(254),
   Telephone            int,
   Email                varchar(254),
   primary key (id_clt)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   id_four              int not null,
   id_achat             int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adresse              varchar(254),
   Telephone            int,
   Email                varchar(254),
   primary key (id_four)
);

/*==============================================================*/
/* Table : Role_utilisateur                                     */
/*==============================================================*/
create table Role_utilisateur
(
   id_rol               int not null,
   Nom                  varchar(254),
   primary key (id_rol)
);

/*==============================================================*/
/* Table : Utlisateur                                           */
/*==============================================================*/
create table Utlisateur
(
   id_utl               int not null,
   id_achat             int not null,
   id_vent              int not null,
   id_rol               int not null,
   Nom                  varchar(254),
   Email                varchar(254),
   Mot_de_passe         varchar(254),
   primary key (id_utl)
);

/*==============================================================*/
/* Table : Vente                                                */
/*==============================================================*/
create table Vente
(
   id_vent              int not null,
   id_art               int not null,
   date                 datetime,
   Quantite             int,
   Prix_unitaire        float,
   Prix_total           int,
   primary key (id_vent)
);

alter table Achat add constraint FK_Association_3 foreign key (id_art)
      references Article (id_art) on delete restrict on update restrict;

alter table Article add constraint FK_Association_1 foreign key (id_cat)
      references Categorie (id_cat) on delete restrict on update restrict;

alter table Client add constraint FK_Association_2 foreign key (id_achat)
      references Achat (id_achat) on delete restrict on update restrict;

alter table Fournisseur add constraint FK_Association_4 foreign key (id_achat)
      references Achat (id_achat) on delete restrict on update restrict;

alter table Utlisateur add constraint FK_Association_5 foreign key (id_achat)
      references Achat (id_achat) on delete restrict on update restrict;

alter table Utlisateur add constraint FK_Association_6 foreign key (id_vent)
      references Vente (id_vent) on delete restrict on update restrict;

alter table Utlisateur add constraint FK_Association_7 foreign key (id_rol)
      references Role_utilisateur (id_rol) on delete restrict on update restrict;

alter table Vente add constraint FK_Association_8 foreign key (id_art)
      references Article (id_art) on delete restrict on update restrict;

