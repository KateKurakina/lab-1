CREATE TABLE IF NOT EXISTS STUDY_GROUP (
                                           id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                           name  TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS SUBJECT (
                                       id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                       name  TEXT NOT NULL,
                                       short_name TEXT NOT NULL
);


CREATE TABLE IF NOT EXISTS STUDENT_LOCAL (
                                             id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                             surname TEXT NOT NULL,
                                             name TEXT NOT NULL,
                                             second_name TEXT NOT NULL,
                                             study_group_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS STUDENT (
                                       id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                       surname TEXT NOT NULL,
                                       name TEXT NOT NULL,
                                       second_name TEXT NOT NULL,
                                       study_group_id INTEGER NOT NULL
);

INSERT INTO SUBJECT
VALUES (1, 'Проектирование информационных систем', 'ПрИС');
INSERT INTO SUBJECT
VALUES (2, 'Системы искусственного интеллекта', 'СИИ');
INSERT INTO SUBJECT
VALUES (3, 'Программная инженерия', 'ПИ');
INSERT INTO SUBJECT
VALUES (4, 'Национальная система информационной безопасности', 'НСИБ');
INSERT INTO SUBJECT
VALUES (5, 'Системный анализ', 'СисАнал');
INSERT INTO SUBJECT
VALUES (6, 'Распределенные базы данных', 'РБД');
INSERT INTO SUBJECT
VALUES (7, 'Системное программное обеспечение', 'СПО');


CREATE TABLE IF NOT EXISTS STUDY_PLAN (
                                          id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                          subject_id INTEGER NOT NULL,
                                          exam_type_id INTEGER NOT NULL
);

INSERT INTO STUDY_PLAN VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 1),
(4, 3, 1),
(5, 4, 2),
(6, 5, 1),
(7, 6, 2),
(8, 7, 1);

CREATE TABLE IF NOT EXISTS EXAM_TYPE (
                                         id INTEGER PRIMARY KEY NOT NULL,
                                         type TEXT NOT NULL
);

INSERT INTO EXAM_TYPE VALUES
(1, 'Экзамен'),
(2, 'Зачет'),
(3, 'Зачет с оценкой'),
(4, 'Курсовая');

CREATE TABLE IF NOT EXISTS JOURNAL (
                                       id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                       student_id INTEGER NOT NULL,
                                       study_plan_id INTEGER NOT NULL,
                                       in_time BIT NOT NULL,
                                       count INTEGER NOT NULL,
                                       mark_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS MARK (
                                    id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
                                    name TEXT NOT NULL,
                                    value TEXT NOT NULL
);


INSERT INTO MARK VALUES
(1, 'Отлично', 5),
(2, 'Хорошо', 4),
(3, 'Удовлетворительно', 3),
(4, 'Неудовлетворительно', 2),
(5, 'Зачет', 'з'),
(6, 'Незачет', 'н'),
(7, 'Неявка', '');





alter table STUDENT add foreign key (study_group_id) references STUDY_GROUP(id);
alter table STUDENT_LOCAL add foreign key (study_group_id) references STUDY_GROUP(id);
alter table STUDY_PLAN add foreign key (subject_id) references SUBJECT(id);
alter table STUDY_PLAN add foreign key (exam_type_id) references EXAM_TYPE(id);
alter table JOURNAL add foreign key (student_id) references STUDENT(id);
alter table JOURNAL add foreign key (study_plan_id) references STUDY_PLAN(id);
alter table JOURNAL add foreign key (mark_id) references MARK(id);


INSERT INTO STUDY_GROUP VALUES
( 1,  '00000'),
( 2,  '11111'),
( 3,  '22222');

INSERT INTO  STUDENT_LOCAL(id,name,surname,second_name,study_group_id) VALUES
( 5689, 'Kurakina', 'Ekaterina', '11111', 1),
( 2221, 'BBBBB', 'bbbbb', '11111', 2),
( 3212, 'CCCCC', 'ccccc', '22222', 2),
( 4121, 'DDDDD', 'ddddd', '33333', 1),
( 5121, 'EEEEE', 'eeeee', '44444', 3);

--
-- INSERT INTO  STUDENT_LOCAL VALUES
-- ( 1, 'AAAAA', 'aaaaa', '11111', 1),
-- ( 2, 'BBBBB', 'bbbbb', '11111', 2),
-- ( 3, 'CCCCC', 'ccccc', '22222', 2),
-- ( 4, 'DDDDD', 'ddddd', '33333', 1),
-- ( 5, 'EEEEE', 'eeeee', '44444', 3);


-- INSERT INTO  JOURNAL VALUES
-- ( 1, 1, 1, 0, 105, 1),
-- ( 2, 2, 2, 1, 105, 7),
-- ( 3, 3, 3, 1, 104, 5),
-- ( 4, 4, 4, 0, 103, 2),
-- ( 5, 5, 7, 0, 103, 3);
