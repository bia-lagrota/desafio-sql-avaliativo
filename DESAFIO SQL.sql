create database db_fearsverse;
use db_fearsverse;

create table Episodios (
    id_episodio int primary key auto_increment,
    nome varchar(100) not null,
    localizacao varchar(100),
    ano_lancamento int
);

create table Personagens (
    id_personagem int primary key auto_increment,
    id_episodio int,
    nome varchar(100) not null,
    idade int,
    foreign key (id_episodio)
    references Episodios(id_episodio)
);

create table Ocorrencias (
    id_ocorrencia int primary key auto_increment,
    id_episodio int,
    id_personagem int,
    descricao varchar(200),
    tipo varchar(50),
    nivel_perigo int,
    foreign key (id_episodio)
    references Episodios(id_episodio),

    foreign key (id_personagem)
    references Personagens(id_personagem)
);

insert into Episodios (id_episodio, nome, localizacao, ano_lancamento)
values
(1, 'Home Alone', 'House', 2021),
(2, 'Norwood Hitchhike', 'Motel', 2021),
(3, 'Carson House', 'House', 2022),
(4, 'Ironbark Lookout', 'Park', 2022),
(5, 'Woodbury Getaway', 'House', 2023),
(6, 'Scratch Creek', 'City', 2023),
(7, 'Clearview Delivery', 'Delivery', 2024),
(8, 'Blackwood Cabin', 'Cabin', 2024),
(9, 'Pinecrest Shift', 'Gas', 2025),
(10, 'Silver Lake Camp', 'Camp', 2026);

insert into Personagens (id_personagem, id_episodio, nome, idade)
values
(1, 1, 'Julia', 18),
(2, 2, 'Beatriz', 18),
(3, 3, 'Camila', 18),
(4, 4, 'Livia', 19),
(5, 5, 'Isabela Bessa', 19),
(6, 6, 'Arthur', 20),
(7, 7, 'Bersi', 20),
(8, 8, 'Giovana', 19),
(9, 9, 'Isabela', 18),
(10, 10, 'Isabella', 19);

insert into Ocorrencias (id_episodio, id_personagem, descricao, tipo, nivel_perigo)
values
(1, 1, 'Descobre que não está sozinho em casa', 'Invasao', 6),
(2, 2, 'Acontecimentos sobrenaturais num motel', 'Aparicao', 9),
(3, 3, 'Sendo observado durante o trabalho de cuidar duma casa', 'Invasao', 8),
(4, 4, 'Há coisas estranhas na torre de vigia', 'Perseguicao', 10),
(5, 5, 'Coisas assustadoras numa viagem com os amigos em casa alugada', 'Invasao', 5),
(6, 6, 'Casal detido em cidade misteriosa', 'Detencao', 10),
(7, 7, 'A última entrega misteriosa', 'Armadilha', 9),
(8, 8, 'O armário misterioso na cabine da viagem', 'Misterio', 7),
(9, 9, 'Carro suspeito aparece numa madrugada', 'Aparicao', 7),
(10, 10, 'Monitora sofre experiencias sobrenaturais no fim do turno', 'Invasao', 8);

select * from Episodios;
select * from Personagens;
select * from Ocorrencias;

use db_fearsverse;

-- EXERCÍCIO 1
select Episodios.nome as episodio, Personagens.nome as personagem
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 2
select Episodios.nome as episodio, Personagens.nome as personagem,
Ocorrencias.descricao, Ocorrencias.tipo,
Ocorrencias.nivel_perigo
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio
inner join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem;

-- EXERCÍCIO 3
select Episodios.nome as episodio, Personagens.nome as personagem,
Ocorrencias.tipo
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio
inner join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem;

-- EXERCÍCIO 4
select Episodios.nome as episodio, Episodios.localizacao,
Personagens.nome as personagem
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 5
select Episodios.nome as episodio, Personagens.nome as personagem,
Episodios.ano_lancamento
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 6
select Episodios.nome as episodio, Personagens.nome as personagem
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio
inner join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem
where Ocorrencias.tipo = 'Invasao';

-- EXERCÍCIO 7
select Episodios.nome as episodio, Personagens.nome as personagem
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 8
select Episodios.nome as episodio, Episodios.localizacao,
Personagens.nome as personagem
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 9
select Personagens.nome as personagem, Episodios.nome as episodio
from Episodios
right join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 10
select Episodios.nome as episodio, Personagens.nome as personagem,
Ocorrencias.tipo
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio
left join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem;

-- EXERCÍCIO 11
select Episodios.nome as episodio
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio
where Personagens.id_personagem is null;

-- EXERCÍCIO 12
select Personagens.id_personagem, Personagens.nome,
Personagens.idade, Episodios.nome as episodio
from Episodios
right join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 13
select Personagens.nome as personagem, Episodios.nome as episodio
from Episodios
right join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 14
select Personagens.nome as personagem, Ocorrencias.descricao,
Ocorrencias.tipo, Ocorrencias.nivel_perigo
from Personagens
left join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem;

-- EXERCÍCIO 15
select Ocorrencias.id_ocorrencia, Episodios.nome as episodio,
Personagens.nome as personagem, Ocorrencias.descricao
from Episodios
right join Ocorrencias
on Episodios.id_episodio = Ocorrencias.id_episodio
left join Personagens
on Ocorrencias.id_personagem = Personagens.id_personagem;

-- EXERCÍCIO 16
select Personagens.nome as personagem
from Ocorrencias
right join Personagens
on Ocorrencias.id_personagem = Personagens.id_personagem
where Ocorrencias.id_ocorrencia is null;

-- EXERCÍCIO 17
select Episodios.nome as episodio, Personagens.nome as personagem,
Ocorrencias.descricao, Ocorrencias.nivel_perigo
from Episodios
inner join Personagens
on Episodios.id_episodio = Personagens.id_episodio
inner join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem
where Ocorrencias.nivel_perigo > 7;

-- EXERCÍCIO 18
select Episodios.nome as episodio, Personagens.nome as personagem
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 19
select Personagens.nome as personagem, Personagens.idade,
Episodios.nome as episodio, Episodios.localizacao
from Episodios
right join Personagens
on Episodios.id_episodio = Personagens.id_episodio;

-- EXERCÍCIO 20
select Episodios.nome as episodio, Episodios.localizacao,
Episodios.ano_lancamento,
Personagens.nome as personagem, Personagens.idade,
Ocorrencias.descricao, Ocorrencias.tipo,
Ocorrencias.nivel_perigo
from Episodios
left join Personagens
on Episodios.id_episodio = Personagens.id_episodio
left join Ocorrencias
on Personagens.id_personagem = Ocorrencias.id_personagem;