# Bootcamp Full Stack Web - KeepCoding
## Ejercicio del Módulo modelado de datos e introducción a sql.

Intructor: Francisco Molina.

Práctica de Modelado y SQL:
## Introducción.

La práctica consistirá en dar solución al enunciado de la práctica (siguiente punto) mediante la  creación  del  modelo  Entidad  Relación  normalizado  y  un  fichero  con  los  comandos  DDL para la creación del modelo diseñado así como los comandos DML para cargar las tablas.
Es  obligatorio  que  el  script  sea  100%  autónomo,  de  tal  forma  que  solo  haya  que  abrirlo  y ejecutar y este cree todo lo necesario. (tablas, PKs, relaciones, datos). El script se ejecutará en PostgreSQL Si se produce un error al ejecutar el script la práctica no será corregida y será automáticamente no apto. En el script debéis crear un espacio de trabajo y crear todos los objetos en ese espacio de trabajo (no usar public).

En resumen, habrá que entregar un archivo hecho en (https://app.diagrams.net/) con el modelo Entidad/Relación y otro con el script SQL.

## Enunciado:

En KeepCoding queremos gestionar la flota de vehículos de empresa, controlando los modelos de los coches, las marcas y el grupo empresarial de la marca (por ejemplo: VW SEAT, Audi etc. pertenecen al grupo VAN). De los coches también necesitamos saber el color del coche, su matrícula, el número total de kilómetros que tiene, la compañía aseguradora (Mapfre, MMT, AXA, etc), el número de póliza, fecha de compra etc.
A demás queremos controlar de cada coche las revisiones que se ha pasado al coche sabiendo los Kms que tenía en el momento de la revisión, la fecha de la revisión y el importe de la revisión.
Aparte del script, habrá que entregar una consulta SQL para sacar el siguiente listado de coches activos que hay en KeepCoding:

- Nombre modelo, marca y grupo de coches (los nombre de todos)
- Fecha de compra
- Matricula
- Nombre del color del coche
- Total de kilómetros
- Nombre empresa que está asegurado el coche
- Numero de póliza

Nota: Los importes se debe controlar la moneda (EURO, DÓLAR etc.).

KeepCoding© All rights reserved.
(https://www.keepcoding.io)

## Alfredo Sánchez - @alfred3ks