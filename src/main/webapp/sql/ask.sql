CREATE TABLE ask (
	a_no		VARCHAR2(50)	primary key, /* 문의번호 */
	a_title		VARCHAR2(200), /* 문의명 */
	a_content	VARCHAR2(2000), /* 문의내용 */
	um_no 		VARCHAR2(50), /* 회원번호 */
	bm_no 		VARCHAR2(20), /* 브랜드번호 */
	a_date 		DATE	default		sysdate, /* 문의날짜 */
	a_status 	VARCHAR2(10) /* 문의상태 */
);

select * from ASK order by a_no desc;

select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , b.name
  from ask a
  	 , users b
 where 1 = 1
   and a.um_no = b.seq
   and a.bm_no = '3'
   and a.a_status not in ('0')

union all

select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , b.name
  from ask a
  	 , users b
 where 1 = 1
   and a.bm_no = b.seq
   and a.bm_no = '3'
   and a.a_pmm is not null
   and a.a_status not in ('0')
 order by a_no desc
 ;

select a.a_no
	 , a.a_title
	 , a.a_content
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.um_no = b.seq
   and a.bm_no = c.seq
   and a.um_no is not null
   and a.bm_no is not null

union all
   
select a.a_no
	 , a.a_title
	 , a.a_content
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.um_no = b.seq
   and a.a_pmm = c.seq
   and a.um_no is not null
   and a.a_pmm is not null

union all

select a.a_no
	 , a.a_title
	 , a.a_content
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.bm_no = b.seq
   and a.a_pmm = c.seq
   and a.bm_no is not null
   and a.a_pmm is not null
   ;
 
update ASK
   set a_pmm = '1'
 where 1 = 1
   and a_no in ('12', '13')
   ;

select (select name from users where seq = a.um_no) as um_no_1
	 , (select name from users where seq = a.bm_no) as bm_no_1
	 , (select name from users where seq = a.a_pmm) as a_pmm_1
	 , um_no
	 , bm_no
	 , a_pmm
  from ask a
 where 1 = 1
   and a_no = '15'
   ;

select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , a.bm_no
	 , a.a_pmm
	 , a.a_date
	 , decode(a.a_status, '1', '작성됨', '2', '수정됨', '3', '답변됨') as a_status
	 , a.ar_no
	 , u.name
  from ask a
  	 , users u
 where 1 = 1
   --and a.bm_no = u.seq
   --and a.um_no = u.seq
   --and a.a_pmm = u.seq
   and a.a_no = '16'
   ;

select *
  from askreview
 where 1 = 1
 ;

update askreview
   set ar_id = '3'
 where 1 = 1
   and ar_id is null
   ;

update askreview
   set ar_id = null
 where ar_no = '16'
 ;
   
select *
  from all_tables
 where 1 = 1
   and OWNER = 'SCOTT'
   ;

select a.ar_no
	 , a.ar_content
	 , a.ar_date
	 , decode(a.ar_status, '1', '작성됨', '2', '수정됨') as ar_status
	 , b.name
  from askReview a
  	 , users b
 where 1 = 1
   and a.ar_id = b.seq
   and ar_no = '13'
   ;

select *
  from ASKREVIEW
 where 1 = 1
 ;

delete from askreview where ar_no = '12';

select *
  from USERS
 where 1 = 1
 ;

alter table askreview add AR_VIEW_YN VARCHAR2(2) default 'N';

update askreview
   set AR_VIEW_YN = 'N'
 where 1 = 1
   and ar_no = '16'
   ;


select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , a.bm_no
	 , a.a_pmm
	 , a.a_date
	 , decode(a.a_status, '1', '작성됨', '2', '수정됨', '3', '답변됨') as a_status
	 , a.ar_no
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.um_no = b.seq
   and a.bm_no = c.seq
   and a.um_no is not null
   and a.bm_no is not null
   and a.a_status not in ('0')
   ;

select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , a.bm_no
	 , a.a_pmm
	 , a.a_date
	 , decode(a.a_status, '1', '작성됨', '2', '수정됨', '3', '답변됨') as a_status
	 , a.ar_no
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.um_no = b.seq
   and a.a_pmm = c.seq
   and a.um_no is not null
   and a.a_pmm is not null
   and a.a_status not in ('0')
   ;

select a.a_no
	 , a.a_title
	 , a.a_content
	 , a.um_no
	 , a.bm_no
	 , a.a_pmm
	 , a.a_date
	 , decode(a.a_status, '1', '작성됨', '2', '수정됨', '3', '답변됨') as a_status
	 , a.ar_no
	 , b.name as name_1
	 , c.name as name_2
  from ask a
  	 , users b
  	 , users c
 where 1 = 1
   and a.bm_no = b.seq
   and a.a_pmm = c.seq
   and a.bm_no is not null
   and a.a_pmm is not null
   and a.a_status not in ('0')
   ;

update ASK
   set a_pmm = '1'
 where a_pmm = '0'
 ;

update ASK
   set bm_no = '5'
 where a_no in ('20', '28')
 ;

delete from ASK;

select *
  from users
 where 1 = 1
   and (ID like '%a%'
   	or PASSWORD like '%a%'
   	or NAME like '%a%')
   	;

/* 이 아래줄 부분으로 작업 부탁드립니다. */

/* 브랜드문의 */
CREATE TABLE ask (
	a_no NUMBER(3) NOT NULL, /* 문의번호 pk */
	a_title VARCHAR2(200), /* 문의명 */
	a_content VARCHAR2(1000), /* 문의내용 */
	um_no NUMBER(3), /* 회원번호 fk */
	bm_no NUMBER(3), /* 브랜드번호 fk */
	a_pmm VARCHAR2(20), /* PMM */
	a_date DATE DEFAULT SYSDATE, /* 문의날짜 */
	a_status VARCHAR2(10), /* 문의상태 */
	ar_no NUMBER(3) /* 답변번호 fk */
);

ALTER TABLE ask ADD CONSTRAINT PK_ask PRIMARY KEY (a_no);

delete from ASK;

drop table ask;

SELECT * FROM ASK ORDER BY A_NO DESC;

desc ask

ALTER TABLE ask
	DROP
		CONSTRAINT FK_userMember_TO_ask
		CASCADE;

ALTER TABLE ask
	DROP
		CONSTRAINT FK_askReview_TO_ask
		CASCADE;

ALTER TABLE ask
	DROP
		CONSTRAINT FK_brandMember_TO_ask
		CASCADE;

/*
UPDATE ask SET a_status = '1' where a_status is null;
select * from ask where a_status not in ('1', '0');
SELECT * from ask where a_status is null;
*/