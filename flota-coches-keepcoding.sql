-- Creamos el esquema:
create schema flotacocheskeepcoding;

-- Creamos las tablas:
create table flotacocheskeepcoding.coche(
  matricula varchar(12) not null primary key,
  modelo varchar(30) not null,
  color varchar(15) not null,
  kilometraje int not null,
  comp_seguros varchar(30) not null,
  num_poliza int not null,
  fecha_compra DATE not null,
  id_aseguradora int not null,
  id_marca int not null
);

create table flotacocheskeepcoding.aseguradora(
  id_aseguradora serial primary key,
  nombre_aseguradora varchar(40) not null
);

create table flotacocheskeepcoding.marca(
  id_marca serial primary key,
  nombre_marca varchar(40) not null
);

create table flotacocheskeepcoding.grupo_empresarial(
  id_grupo serial primary key,
  nombre_grupo varchar(40) not null,
  id_marca int not null
);

create table flotacocheskeepcoding.revision(
  id_revision serial primary key,
  importe int not null,
  kilometraje_rev int not null,
  fecha_rev DATE not null,
  moneda varchar(30) not null
);

create table flotacocheskeepcoding.coche_pasa_revision(
  id_revision serial primary key,
  matricula varchar(12)
);

-- Creamos las relaciones:
-- coche:
alter table flotacocheskeepcoding.coche add constraint pk_coche_aseguradora foreign key (id_aseguradora) references flotacocheskeepcoding.aseguradora(id_aseguradora);

alter table flotacocheskeepcoding.coche add constraint pk_coche_marca foreign key (id_marca) references flotacocheskeepcoding.marca(id_marca);

-- grupo_empresarial:
alter table flotacocheskeepcoding.grupo_empresarial add constraint pk_grupo_empresarial foreign key (id_marca) references flotacocheskeepcoding.marca(id_marca);

-- coche_pasa_revision:
alter table flotacocheskeepcoding.coche_pasa_revision add constraint pk_coche_pasa_revision_revision foreign key (id_revision) references flotacocheskeepcoding.revision(id_revision);

alter table flotacocheskeepcoding.coche_pasa_revision add constraint pk_coche_pasa_revision_coche foreign key (matricula) references flotacocheskeepcoding.coche(matricula);

-- insercion de datos:

