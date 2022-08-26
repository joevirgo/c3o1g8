-- tabla inicial tienda virtual.
create table perfiles (
	id int NOT NULL AUTO_INCREMENT,
	email varchar(50) unique NOT NULL,
	nombre varchar (50)  NOT NULL,
	apellido varchar(50)  NOT NULL,
	password varchar(50) NOT NULL,
	PRIMARY KEY (id)
);

create table tiendas(
	id int NOT NULL AUTO_INCREMENT,
	nombre varchar(50) NOT NULL,
	direccion varchar(50) NOT NULL,
	perfil_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (perfil_id) REFERENCES perfiles(id)
);

create table productos (
	id int NOT NULL AUTO_INCREMENT,
	nombre varchar(50) NOT NULL,
	descripcion varchar(50),
	precio double NOT NULL,
	imagen varchar(250),
	PRIMARY KEY (id)
);

create table inventarios (
	id int NOT NULL AUTO_INCREMENT,
	cantidad int (50) NOT NULL,
	producto_id int NOT NULL,
	tienda_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (tienda_id) REFERENCES tiendas(id)
);

create table entradas_salidas(
	id int NOT NULL AUTO_INCREMENT,
	cantidad int (50) NOT NULL,
	type enum ('entrada','salida') default 'salida',
	fecha timestamp default now(),
	producto_id int NOT NULL,
	tienda_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (producto_id) REFERENCES productos(id),
	FOREIGN KEY (tienda_id) REFERENCES tiendas(id)
);




