create database board_db;
use board_db;
create table board_tbl(
	id int,
    name varchar(5),
	e_mail varchar(30),
    title varchar(50),
    content varchar(600),
    passwd varchar(20), 
    ref int,
    primary key(id)
);

insert into board_tbl values(1, '홍길동', 'abc@univ.ac.kr', '반갑습니다.', '반갑습니다. 처음 글 남깁니다.', '0000', 1);
select * from board_tbl;
