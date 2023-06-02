use formativaHogwarts;

select  * from usuarios;
select * from ocupacao;

alter table usuarios add telefone bigint(13);
alter table usuarios add foto varchar(150);

create table tarefa (
	id bigint not null auto_increment,
    titulo varchar(50) not null,
    descricao varchar(250) not null,
    solicitanteFK bigint not null,
    responsaveisFK bigint not null,
    localFK bigint not null,
    prazo date not null,
    fotos varchar(150),
    primary key (id),
    foreign key (solicitanteFK) references usuarios(id),
    foreign key (localFK) references locais(id),
    foreign key (responsaveisFK) references usuarios(id)
);

create table responsaveis(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
    responsavelFK bigint not null,
    primary key (id),
    foreign key (responsavelFK) references usuarios(id),
    foreign key (tarefaFK) references tarefa(id)
);

create table status(
	id bigint not null auto_increment,
    tarefaFK bigint not null,
	condicao enum ('Aberta', 'Em Andamento', 'Concluída', 'Encerrada') not null,
	data datetime default now() not null,
    comentario varchar(150) not null,
    fotos varchar(150),
	primary key (id),
    foreign key (tarefaFK) references tarefa(id)
);






