drop table users;

create table users(
	seq			varchar2(20)	primary key,
	id			varchar2(20)	unique not null,
	password	varchar2(20),
	name		varchar2(20),
	role		varchar2(5)
);

create sequence users_seq
increment by 1
start with 1
minvalue 1
maxvalue 10000
nocycle
nocache
noorder;

insert into users values(users_seq.NEXTVAL, 'admin', 'admin', '관리자', 'Admin');
insert into users values(users_seq.NEXTVAL, 'hongkd', '1234', '홍길동', 'User');
insert into users values(users_seq.NEXTVAL, 'spet', 'spet', '슈펫', 'Brand');
insert into users values(users_seq.NEXTVAL, 'maru', 'maru', '이누마루', 'Brand');
insert into users values(users_seq.NEXTVAL, 'cat', 'cat', '채셔캣', 'Brand');

insert into users values(users_seq.NEXTVAL, 'kangkc', '1234', '강감찬', 'User');
insert into users values(users_seq.NEXTVAL, 'leess', '1234', '이순신', 'User');

select * from users;

select * from users where role = 'Brand';

select * from TAB;
