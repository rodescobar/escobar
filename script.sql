CREATE TABLE Usuarios 
( 
 usuario_id INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(100) NOT NULL,  
 email VARCHAR(100) NOT NULL,  
 senha VARCHAR(255) NOT NULL,  
 dt_nascimento DATE NOT NULL,  
 plano VARCHAR(10),  
 dt_inicio_plano DATE,  
 fg_admin INT NOT NULL DEFAULT '0',  
 UNIQUE (email)
); 

CREATE TABLE Filmes 
( 
 filme_id INT PRIMARY KEY AUTO_INCREMENT,  
 titulo VARCHAR(150) NOT NULL,  
 descricao VARCHAR(400),  
 ano_lancamento DATE,  
 diretor VARCHAR(100),  
 capa VARCHAR(255) NOT NULL,  
 genero VARCHAR(50) NOT NULL,  
); 

CREATE TABLE Series 
( 
 serie_id INT PRIMARY KEY AUTO_INCREMENT,  
 titulo VARCHAR(150) NOT NULL,  
 descricao VARCHAR(400) NOT NULL,  
 ano_lancamento DATE,  
 diretor VARCHAR(100),  
 capa INT NOT NULL,  
 genero VARCHAR(50) NOT NULL,  
); 

CREATE TABLE Episodios 
( 
 episodio_id INT PRIMARY KEY AUTO_INCREMENT,  
 temporada INT NOT NULL,  
 titulo VARCHAR(150) NOT NULL,  
 descricao VARCHAR(100) NOT NULL,  
 duracao INT NOT NULL,  
 idSeries INT,  
 UNIQUE (temporada)
); 

CREATE TABLE Favoritos 
( 
 favorito_id INT PRIMARY KEY AUTO_INCREMENT,  
 idUsuarios INT,  
 idFilmes INT,  
 idSeries INT,  
); 

ALTER TABLE Episodios ADD FOREIGN KEY(idSeries) REFERENCES Series (idSeries)
ALTER TABLE Favoritos ADD FOREIGN KEY(idUsuarios) REFERENCES Usuarios (idUsuarios)
ALTER TABLE Favoritos ADD FOREIGN KEY(idFilmes) REFERENCES Filmes (idFilmes)
ALTER TABLE Favoritos ADD FOREIGN KEY(idSeries) REFERENCES Series (idSeries)
