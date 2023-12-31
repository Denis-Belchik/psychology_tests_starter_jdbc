create datebase psychology_tests;

create schema psychology_tests;

drop TABLE psychology_tests.answer;

drop TABLE psychology_tests.answer_person;

drop TABLE psychology_tests.answer_key;

drop TABLE psychology_tests.question;

drop TABLE psychology_tests.test;

select replay from psychology_tests.answer_person
where person_username = ? and test_id = ?;




create table psychology_tests.answer_key
(
    id_ak serial primary key,
    question_id int references psychology_tests.question (id_q) not null,
    position    int not null,
    score int not null
);

create table psychology_tests.answer_person
(
    id_ap serial primary key,
    person_username varchar(100) not null,
    replay int not null,
    test_id int not null,
    replacement int,
--    person_username varchar(100) references psychology_tests.person (username) not null,
    question_id    int not null,
    position    int[]
);

create table psychology_tests.test
(
    id_t            serial primary key,
    enabled         boolean not null,
    author          varchar(255) not null,
    title           varchar(255) not null,
    description     text,
    date_create     timestamp not null,
    date_last_save  timestamp not null,
    group_quest     int not null,
    size            int not null,
    scale           int not null
);

create table psychology_tests.question
(
    id_q          serial primary key,
    test_id       int references psychology_tests.test (id_t) not null,
    body          text                not null,
    type          varchar(100)                not null
);

create table psychology_tests.answer
(
    id_a        serial primary key,
    question_id int references psychology_tests.question (id_q) not null,
    position    int not null,
    answer      varchar(255)                   not null
);

create table psychology_tests.person(
    username varchar(100) primary key,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    email varchar(100)  not null,
    password varchar(100) not null,
    role varchar(100) not null,
    enabled boolean not null,
    date_time timestamp not null
);

insert into psychology_tests.test (enabled, author, title, description,
    date_create, date_last_save, group_quest, size, scale)
values (true, 'Denis', 'EOMS Шелла', 'Методика предназначена для определения копинг-механизмов, направленности мышления при решении сложных задач в различных сферах деятельности, отношения к сложившимся обстоятельствам.',
    current_timestamp, current_timestamp, 1, 21, 4),
    (true, 'Denis', 'Для теста', 'Для теста.',
    current_timestamp, current_timestamp, 1, 4, 1);

insert into psychology_tests.question(test_id, body, type)
values (1, 'Я пытаюсь чему-то научиться из каждой ошибки, которую совершаю.', 'RADIO'),
       (1, 'Я часто переживаю из-за ошибок, когда занимаюсь чем-то.', 'RADIO'),
       (1, 'Я делаю все возможное, чтобы никто не знал о моих ошибках.', 'RADIO'),
       (1, 'Когда я совершаю ошибку, я пытаюсь понять, почему это произошло.', 'RADIO'),
       (1, 'Я считаю, что ошибки – это то, о чем нужно постоянно беспокоиться.', 'RADIO'),
       (1, 'Я считаю, что ошибки, о которых знают другие, могут принести больше вреда, чем пользы моей репутации.', 'RADIO'),
       (1, 'Я сознательно пытаюсь найти причину своих ошибок, чтобы улучшить свою работу.', 'RADIO'),
       (1, 'После того, как я что-то испортил, мне трудно справиться с чувством стыда из-за ошибки.', 'RADIO'),
       (1, 'Я обычно стараюсь избегать дискуссий о моих ошибках с коллегами.', 'RADIO'),
       (1, 'Я считаю, что большинство ошибок могут быть использованы для улучшения моей работы по конкретной задаче.', 'RADIO'),
       (1, 'Смущаюсь и чувствую себя глупым, когда осознаю, что допустил ошибку.', 'RADIO'),
       (1, 'Я предпочел бы думать о своих ошибках сам, чем говорить о них с другими.', 'RADIO'),
       (1, 'Я применяю информацию, которую я извлекаю из ошибок, в будущей работе.', 'RADIO'),
       (1, 'Когда я ошибаюсь, то вспоминаю, что вечно все порчу.', 'RADIO'),
       (1, 'Обсуждение моих ошибок – это зря потраченное время.', 'RADIO'),
       (1, 'Когда я делаю ошибку, я удостоверяюсь, что чему-то научился.', 'RADIO'),
       (1, 'Когда я совершаю ошибку, то долгое время чувствую себя очень расстроенным и злым.', 'RADIO'),
       (1, 'Когда я совершаю ошибку, я нахожу способы ее исправить, чтобы не страдать от каких-либо последствий.', 'RADIO'),
       (1, 'Каждый раз, когда я что-то путаю, я думаю о том, что я мог бы извлечь из ситуации.', 'RADIO'),
       (1, 'Я склонен испытывать сильное чувство беспокойства по поводу ошибок, независимо от того, над чем я работаю.', 'RADIO'),
       (1, 'Сокрытие собственных ошибок помогает мне избежать возможных последствий.', 'RADIO'),
       (2, 'qwe.', 'RADIO'),
       (2, 'asd.', 'RADIO'),
       (2, 'zcx.', 'CHECKBOX'),
       (2, 'rty.', 'CHECKBOX');


insert into psychology_tests.answer(question_id, position, answer)
values (1, 1, 'Совершенно не согласен'),
       (1, 2, 'Скорее согласен, чем не согласен'),
       (1, 3, 'Совершенно согласен'),
       (2, 1, 'Совершенно не согласен'),
       (2, 2, 'Скорее согласен, чем не согласен'),
       (2, 3, 'Совершенно согласен'),
       (3, 1, 'Совершенно не согласен'),
       (3, 2, 'Скорее согласен, чем не согласен'),
       (3, 3, 'Совершенно согласен'),
       (4, 1, 'Совершенно не согласен'),
       (4, 2, 'Скорее согласен, чем не согласен'),
       (4, 3, 'Совершенно согласен'),
       (5, 1, 'Совершенно не согласен'),
       (5, 2, 'Скорее согласен, чем не согласен'),
       (5, 3, 'Совершенно согласен'),
       (6, 1, 'Совершенно не согласен'),
       (6, 2, 'Скорее согласен, чем не согласен'),
       (6, 3, 'Совершенно согласен'),
       (7, 1, 'Совершенно не согласен'),
       (7, 2, 'Скорее согласен, чем не согласен'),
       (7, 3, 'Совершенно согласен'),
       (8, 1, 'Совершенно не согласен'),
       (8, 2, 'Скорее согласен, чем не согласен'),
       (8, 3, 'Совершенно согласен'),
       (9, 1, 'Совершенно не согласен'),
       (9, 2, 'Скорее согласен, чем не согласен'),
       (9, 3, 'Совершенно согласен'),
       (10, 1, 'Совершенно не согласен'),
       (10, 2, 'Скорее согласен, чем не согласен'),
       (10, 3, 'Совершенно согласен'),
       (11, 1, 'Совершенно не согласен'),
       (11, 2, 'Скорее согласен, чем не согласен'),
       (11, 3, 'Совершенно согласен'),
       (12, 1, 'Совершенно не согласен'),
       (12, 2, 'Скорее согласен, чем не согласен'),
       (12, 3, 'Совершенно согласен'),
       (13, 1, 'Совершенно не согласен'),
       (13, 2, 'Скорее согласен, чем не согласен'),
       (13, 3, 'Совершенно согласен'),
       (14, 1, 'Совершенно не согласен'),
       (14, 2, 'Скорее согласен, чем не согласен'),
       (14, 3, 'Совершенно согласен'),
       (15, 1, 'Совершенно не согласен'),
       (15, 2, 'Скорее согласен, чем не согласен'),
       (15, 3, 'Совершенно согласен'),
       (16, 1, 'Совершенно не согласен'),
       (16, 2, 'Скорее согласен, чем не согласен'),
       (16, 3, 'Совершенно согласен'),
       (17, 1, 'Совершенно не согласен'),
       (17, 2, 'Скорее согласен, чем не согласен'),
       (17, 3, 'Совершенно согласен'),
       (18, 1, 'Совершенно не согласен'),
       (18, 2, 'Скорее согласен, чем не согласен'),
       (18, 3, 'Совершенно согласен'),
       (19, 1, 'Совершенно не согласен'),
       (19, 2, 'Скорее согласен, чем не согласен'),
       (19, 3, 'Совершенно согласен'),
       (20, 1, 'Совершенно не согласен'),
       (20, 2, 'Скорее согласен, чем не согласен'),
       (20, 3, 'Совершенно согласен'),
       (21, 1, 'Совершенно не согласен'),
       (21, 2, 'Скорее согласен, чем не согласен'),
       (21, 3, 'Совершенно согласен'),
       (22, 1, 'q'),
       (22, 2, 'w'),
       (23, 1, 'a'),
       (23, 2, 's'),
       (24, 1, 'z'),
       (24, 2, 'x'),
       (25, 1, 'r'),
       (25, 2, 't');


insert into psychology_tests.answer_key(question_id, position, score)
values (1, 1, 0),
        (1, 2, 1),
        (1, 3, 2),
        (2, 1, 0),
        (2, 2, 1),
        (2, 3, 2),
        (3, 1, 0),
        (3, 2, 1),
        (3, 3, 2),
        (4, 1, 0),
        (4, 2, 1),
        (4, 3, 2),
        (5, 1, 0),
        (5, 2, 1),
        (5, 3, 2),
        (6, 1, 0),
        (6, 2, 1),
        (6, 3, 2),
        (7, 1, 0),
        (7, 2, 1),
        (7, 3, 2),
        (8, 1, 0),
        (8, 2, 1),
        (8, 3, 2),
        (9, 1, 0),
        (9, 2, 1),
        (9, 3, 2),
        (10, 1, 0),
        (10, 2, 1),
        (10, 3, 2),
        (11, 1, 0),
        (11, 2, 1),
        (11, 3, 2),
        (12, 1, 0),
        (12, 2, 1),
        (12, 3, 2),
        (13, 1, 0),
        (13, 2, 1),
        (13, 3, 2),
        (14, 1, 0),
        (14, 2, 1),
        (14, 3, 2),
        (15, 1, 0),
        (15, 2, 1),
        (15, 3, 2),
        (16, 1, 0),
        (16, 2, 1),
        (16, 3, 2),
        (17, 1, 0),
        (17, 2, 1),
        (17, 3, 2),
        (18, 1, 0),
        (18, 2, 1),
        (18, 3, 2),
        (19, 1, 0),
        (19, 2, 1),
        (19, 3, 2),
        (20, 1, 0),
        (20, 2, 1),
        (20, 3, 2),
        (21, 1, 0),
        (21, 2, 1),
        (21, 3, 2);

update psychology_tests.person set role = 'ROLE_ADMIN' where username = 'qwe'

update psychology_tests.person set enabled = false where username = 'zxc'















