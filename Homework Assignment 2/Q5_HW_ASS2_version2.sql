/* DB software browser for SQLite is used for running SQL queries
* First create one table named qualifiedInstructor.
* Insert values into the table using insert command.
* For each row in the qualifiedInstructor table, first check whether there is a row 
with the same subject name in the subjects menu.
* Select the rows satisfied with the above condition.
* Then this query only output the rows that instrutors can teach the same number of subjects as the number of subjects there in the subjects menu.
  */


CREATE TABLE qualifiedInstructor( 
    Instructor VARCHAR2(20) NOT NULL, 
    Subject VARCHAR2(20) NOT NULL 
);

insert into qualifiedInstructor values ('Aleph','Scratch');
insert into qualifiedInstructor values ('Aleph','Java');
insert into qualifiedInstructor values ('Aleph','Processing');
insert into qualifiedInstructor values ('Bit','Python');
insert into qualifiedInstructor values ('Bit','JavaScript');
insert into qualifiedInstructor values ('Bit','Java');
insert into qualifiedInstructor values ('CRC','Python');
insert into qualifiedInstructor values ('CRC','JavaScript');
insert into qualifiedInstructor values ('Dat','Scratch');
insert into qualifiedInstructor values ('Dat','Python');
insert into qualifiedInstructor values ('Dat','JavaScript');
insert into qualifiedInstructor values ('Emscr','Scratch');
insert into qualifiedInstructor values ('Emscr','Processing');
insert into qualifiedInstructor values ('Emscr','JavaScript');
insert into qualifiedInstructor values ('Emscr','Python');

CREATE TABLE subjects 
( 
Subject varchar2(25) not null
)

insert into subjects values ('Scratch');
insert into subjects values ('JavaScript');
insert into subjects values ('Python');

SELECT Instructor 
FROM qualifiedInstructor
WHERE Subject in (SELECT S.Subject FROM subjects as S)
GROUP BY Instructor 
having count(distinct(Subject))= (select count(*) from subjects)