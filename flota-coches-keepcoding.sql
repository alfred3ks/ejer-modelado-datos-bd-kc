-- Creamos el esquema:
create schema flotacocheskeepcoding;

-- Creamos las tablas:
-- aseguradora:📌
create table flotacocheskeepcoding.aseguradora(
  id_aseguradora serial primary key,
  nombre_aseguradora varchar(40) not null
);

-- grupo_empresarial:📌
create table flotacocheskeepcoding.grupo_empresarial(
  id_grupo serial not null primary key,
  nombre_grupo varchar(40) not null
);

-- marca:📌
create table flotacocheskeepcoding.marca(
  id_marca serial primary key,
  nombre_marca varchar(40) not null,
  id_grupo int not null,
  constraint pk_marca foreign key (id_grupo) references flotacocheskeepcoding.grupo_empresarial(id_grupo)
);

-- revisión:📌
create table flotacocheskeepcoding.revision(
  id_revision serial primary key,
  importe float4 not null,
  kilometraje_rev int not null,
  fecha_rev DATE not null,
  moneda varchar(30) not null
);

-- coches📌
create table flotacocheskeepcoding.coches(
  id_coche int not null primary key,
  matricula varchar(12) not null,
  modelo varchar(30) not null,
  color varchar(15) not null,
  kilometraje int not null,
  comp_seguros varchar(30) not null,
  num_poliza int not null,
  fecha_compra DATE not null,
  id_aseguradora int not null,
  id_marca int not null,
  constraint pk_coche_aseguradora foreign key (id_aseguradora) references flotacocheskeepcoding.aseguradora(id_aseguradora),
  constraint pk_coche_marca foreign key (id_marca) references flotacocheskeepcoding.marca(id_marca)
);

-- coche_pasa_revision📌
create table flotacocheskeepcoding.coche_pasa_revision(
  id_revision int not null,
  id_coche int not null,
  primary key (id_coche, id_revision),
  constraint pk_coche_pasa_revision_revision foreign key (id_revision) references flotacocheskeepcoding.revision(id_revision),
  constraint pk_coche_pasa_revision_coche foreign key (id_coche) references flotacocheskeepcoding.coches(id_coche)
);

-- insert de la data:
insert into flotacocheskeepcoding.aseguradora (nombre_aseguradora) values
('Alliance'),
('Allianz'),
('Mapfre'),
('Generali'),
('Axa');

insert into flotacocheskeepcoding.grupo_empresarial (nombre_grupo) values
('Renault-Nissan-Mitsubishi Alliance'),
('PSA Peugeot S.A.'),
('Hyundai Motor Group');

insert into flotacocheskeepcoding.marca (nombre_marca,id_grupo) values
('Renault',1),
('Citroën',2),
('Nissan',1),
('Kia',3),
('Peugeot',2),
('Hyundai',3);

insert into flotacocheskeepcoding.revision (importe, kilometraje_rev, fecha_rev, moneda) values
(8854.8, 19345, '2018-07-09', 'Peso Mexicano'),
(50.0,   22765, '2020-02-03', 'Euro'),
(590.0,  11937, '2020-07-14', 'Euro'),
(669.6,  45588, '2021-08-01', 'Dólar'),
(530.0,  29114, '2009-07-10', 'Euro'),

(290.0, 32000, '2010-03-09', 'Dolar'),
(200.0, 29114, '2022-07-11', 'Euro'),
(123.0, 29114, '2017-05-10', 'Peso Colombiano'),
(985.0, 29114, '2006-03-04', 'Euro'),
(850.0, 20272, '2009-06-01', 'Euro');

insert into flotacocheskeepcoding.coches (id_coche, matricula, modelo, color, kilometraje, comp_seguros, num_poliza,fecha_compra, id_aseguradora, id_marca) values
(1, '6743DYG', 'Rio',       'Gris Plateado',  76387,   'Alliance',   116398,    '2007-06-25', 1, 4),
(2, '7764GTD', 'Tucson',    'Verde',          54522,   'Mapfre',     136882,    '2012-10-01', 3, 6),
(3, '0827DBB', 'Megane',    'Gris Plateado',  39061,   'Alliance',   40647,     '2006-07-24', 1, 1),
(4, '6788DRX', 'i30',       'Blanco',         36066,   'Axa',        7094,      '2007-11-15', 5, 4),
(5, '4221JXR', 'Rio',       'Azul',           50166,   'Generali',   174298,    '2018-03-19', 4, 4),
(6, '7136BCS', '206',       'Blanco',         43363,   'Generali',   6062,      '2001-02-09', 4, 5),
(7, '2066BYF', 'Berlingo',  'Gris Plateado',  57697,   'Allianz',    126373,    '1999-03-14', 2, 2),
(8, '5022JZD', 'i30',       'Verde',          63426,   'Mapfre',     173686,    '2016-03-07', 3, 4),
(9, '7466DMG', 'Clio',      'Gris Plateado',  85722,   'Axa',        145462,    '2007-03-31', 5, 1),
(10,'9775BVC', 'i30',       'Gris Plateado',  29962,   'Mapfre',     64092,     '2001-03-14', 3, 3);

insert into flotacocheskeepcoding.coche_pasa_revision (id_revision, id_coche) values
(1, 10),
(2, 6),
(3, 2),
(4, 8),
(5, 4),
(6, 3),
(7, 5),
(8, 1),
(9, 7),
(10, 9);

-- Consulta:
SELECT
  m.nombre_marca AS "Marca",
  co.modelo AS "Modelo",
  g.nombre_grupo AS "Grupo",
  co.fecha_compra AS "Fecha de Compra",
  co.matricula AS "Matrícula",
  co.color AS "Color",
  co.kilometraje AS "Total de Kilómetros",
  a.nombre_aseguradora AS "Empresa de Seguros",
  co.num_poliza AS "Número de Póliza"
FROM
  flotacocheskeepcoding.coches AS co
INNER JOIN
  flotacocheskeepcoding.marca AS m
ON
  co.id_marca = m.id_marca
INNER JOIN
  flotacocheskeepcoding.grupo_empresarial AS g
ON
  m.id_grupo = g.id_grupo
INNER JOIN
  flotacocheskeepcoding.aseguradora AS a
ON
  co.id_aseguradora = a.id_aseguradora;

