use VentasVip;

create table Administrador (
	idAdmin int PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR (50) NOT NULL,
	apellido NVARCHAR (50) NOT NULL,
	usuario NVARCHAR (50) NOT NULL,
	clave NVARCHAR (50) NOT NULL
);

create table Productos (
	idProductos int PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR (50) NOT NULL,
	precio float not null,
);

create table ClienteUniforme (
	idClienteUniforme int PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR (50) NOT NULL,
	apellido NVARCHAR (50) NOT NULL,
	celular int not null,
);

create table VentaUniforme (
	idVenta int PRIMARY KEY IDENTITY (1,1),
	idCliente int NOT NULL,
	idProductos int NOT NULL,
	cantidad int not null,
	fecha date default GETDATE (),
	montoTotal float not null,
	estado BIT DEFAULT 0
);

create table Pagos (
	idPagos int PRIMARY KEY IDENTITY (1,1),
	idVenta int NOT NULL,
	fechaPago date default GETDATE(),
	montopagado float not null,
);


ALTER TABLE VentaUniforme ADD FOREIGN KEY (idCliente) REFERENCES ClienteUniforme (idClienteUniforme);
ALTER TABLE VentaUniforme ADD FOREIGN KEY (idProductos) REFERENCES Productos (idProductos);

ALTER TABLE Pagos ADD FOREIGN KEY (idVenta) REFERENCES VentaUniforme (idVenta);

// Comiteando