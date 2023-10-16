ALTER TABLE reply
	DROP
		CONSTRAINT FK_community_TO_reply
		CASCADE;

ALTER TABLE PRODUCT
	DROP
		CONSTRAINT FK_brandMember_TO_PRODUCT
		CASCADE;

ALTER TABLE buy
	DROP
		CONSTRAINT FK_productbuy_TO_buy
		CASCADE;

ALTER TABLE buy
	DROP
		CONSTRAINT FK_delivery_TO_buy
		CASCADE;

ALTER TABLE buy
	DROP
		CONSTRAINT FK_pointAp_TO_buy
		CASCADE;

ALTER TABLE buy
	DROP
		CONSTRAINT FK_couponAp_TO_buy
		CASCADE;

ALTER TABLE productbuy
	DROP
		CONSTRAINT FK_PRODUCT_TO_productbuy
		CASCADE;

ALTER TABLE productbuy
	DROP
		CONSTRAINT FK_userMember_TO_productbuy
		CASCADE;

ALTER TABLE productbuy
	DROP
		CONSTRAINT FK_basket_TO_productbuy
		CASCADE;

ALTER TABLE code
	DROP
		CONSTRAINT FK_divisionCode_TO_code
		CASCADE;

ALTER TABLE code
	DROP
		CONSTRAINT FK_PRODUCT_TO_code
		CASCADE;

ALTER TABLE basket
	DROP
		CONSTRAINT FK_userMember_TO_basket
		CASCADE;

ALTER TABLE basket
	DROP
		CONSTRAINT FK_PRODUCT_TO_basket
		CASCADE;

ALTER TABLE keep
	DROP
		CONSTRAINT FK_userMember_TO_keep
		CASCADE;

ALTER TABLE keep
	DROP
		CONSTRAINT FK_PRODUCT_TO_keep
		CASCADE;

ALTER TABLE keep
	DROP
		CONSTRAINT FK_brandMember_TO_keep
		CASCADE;

ALTER TABLE review
	DROP
		CONSTRAINT FK_PRODUCT_TO_review
		CASCADE;

ALTER TABLE review
	DROP
		CONSTRAINT FK_userMember_TO_review
		CASCADE;

ALTER TABLE review
	DROP
		CONSTRAINT FK_comments_TO_review
		CASCADE;

ALTER TABLE md
	DROP
		CONSTRAINT FK_brandMember_TO_md
		CASCADE;

ALTER TABLE md
	DROP
		CONSTRAINT FK_PRODUCT_TO_md
		CASCADE;

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

ALTER TABLE brandTheme
	DROP
		CONSTRAINT FK_brandMember_TO_brandTheme
		CASCADE;

ALTER TABLE brandInfo
	DROP
		CONSTRAINT FK_brandMember_TO_brandInfo
		CASCADE;

ALTER TABLE pointAp
	DROP
		CONSTRAINT FK_point_TO_pointAp
		CASCADE;

ALTER TABLE pointAp
	DROP
		CONSTRAINT FK_userMember_TO_pointAp
		CASCADE;

ALTER TABLE couponAp
	DROP
		CONSTRAINT FK_coupon_TO_couponAp
		CASCADE;

ALTER TABLE couponAp
	DROP
		CONSTRAINT FK_userMember_TO_couponAp
		CASCADE;

ALTER TABLE userMember
	DROP
		CONSTRAINT FK_membership_TO_userMember
		CASCADE;

ALTER TABLE askAnswer
	DROP
		CONSTRAINT FK_askenter_TO_askAnswer
		CASCADE;

ALTER TABLE askAnswer
	DROP
		CONSTRAINT FK_brandMember_TO_askAnswer
		CASCADE;

ALTER TABLE brandMember
	DROP
		UNIQUE (
			bm_id
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE userMember
	DROP
		UNIQUE (
			um_mid
		)
		CASCADE
		KEEP INDEX;

ALTER TABLE community
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE reply
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE PRODUCT
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE buy
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE delivery
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE productbuy
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE code
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE divisionCode
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE basket
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE keep
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE membership
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE coupon
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE point
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE md
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE ask
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE brandMember
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE brandTheme
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE brandInfo
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE comments
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE askReview
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE pointAp
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE couponAp
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE userMember
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE askenter
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE askAnswer
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX UIX_brandMember;

DROP INDEX UIX_userMember;

DROP INDEX PK_community;

DROP INDEX PK_reply;

DROP INDEX PK_PRODUCT;

DROP INDEX PK_buy;

DROP INDEX PK_delivery;

DROP INDEX PK_productbuy;

DROP INDEX PK_code;

DROP INDEX PK_divisionCode;

DROP INDEX PK_basket;

DROP INDEX PK_keep;

DROP INDEX PK_membership;

DROP INDEX PK_coupon;

DROP INDEX PK_point;

DROP INDEX PK_review;

DROP INDEX PK_md;

DROP INDEX PK_ask;

DROP INDEX PK_brandMember;

DROP INDEX PK_brandTheme;

DROP INDEX PK_brandInfo;

DROP INDEX PK_comments;

DROP INDEX PK_askReview;

DROP INDEX PK_pointAp;

DROP INDEX PK_couponAp;

DROP INDEX PK_userMember;

DROP INDEX PK_askenter;

DROP INDEX PK_askAnswer;

/* 커뮤니티 */
DROP TABLE community 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 상품 */
DROP TABLE PRODUCT 
	CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE buy 
	CASCADE CONSTRAINTS;

/* 배송업체 */
DROP TABLE delivery 
	CASCADE CONSTRAINTS;

/* 주문상품 */
DROP TABLE productbuy 
	CASCADE CONSTRAINTS;

/* 코드 */
DROP TABLE code 
	CASCADE CONSTRAINTS;

/* 코드분류 */
DROP TABLE divisionCode 
	CASCADE CONSTRAINTS;

/* 장바구니 */
DROP TABLE basket 
	CASCADE CONSTRAINTS;

/* 찜 */
DROP TABLE keep 
	CASCADE CONSTRAINTS;

/* 멤버십 */
DROP TABLE membership 
	CASCADE CONSTRAINTS;

/* 쿠폰 */
DROP TABLE coupon 
	CASCADE CONSTRAINTS;

/* 포인트 */
DROP TABLE point 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* MD */
DROP TABLE md 
	CASCADE CONSTRAINTS;

/* 브랜드문의 */
DROP TABLE ask 
	CASCADE CONSTRAINTS;

/* 브랜드 */
DROP TABLE brandMember 
	CASCADE CONSTRAINTS;

/* 브랜드 테마 */
DROP TABLE brandTheme 
	CASCADE CONSTRAINTS;

/* 브랜드 정보 */
DROP TABLE brandInfo 
	CASCADE CONSTRAINTS;

/* 리뷰댓글 */
DROP TABLE comments 
	CASCADE CONSTRAINTS;

/* 문의 댓글 */
DROP TABLE askReview 
	CASCADE CONSTRAINTS;

/* 포인트 적용 */
DROP TABLE pointAp 
	CASCADE CONSTRAINTS;

/* 쿠폰적용 */
DROP TABLE couponAp 
	CASCADE CONSTRAINTS;

/* User */
DROP TABLE userMember 
	CASCADE CONSTRAINTS;

/* 입점문의 */
DROP TABLE askenter 
	CASCADE CONSTRAINTS;

/* 입점문의 답변 */
DROP TABLE askAnswer 
	CASCADE CONSTRAINTS;
	
select * from tab;

DROP TABLE ask;
DROP TABLE askReview;
DROP TABLE comments;
DROP TABLE community;
DROP TABLE review;

purge recyclebin;

select * from ASK;
select * from ASKREVIEW;
select * from USERMEMBER;

update ask set UM_NO = null where A_NO = 1;

/* 브랜드 */
insert into BRANDMEMBER(bm_no,bm_id,bm_password,bm_manager,bm_email,bm_tel,bm_ars,bm_agree) values(1,'1','2','3','4','5','6','0');
/* 브랜드 정보 */
insert into brandinfo(bm_no,bi_biznum,bi_name,bi_tel,bi_repr,bi_commnum,bi_addr,bi_desc,bi_bizlic,bi_shop,bi_insta,bi_sns,bi_fax)values(1,'1','2','3','4','5','6','7','8','9','10','11','12');
/* 브랜드 테마 */
insert into brandtheme(bm_no,bt_color,bt_logo,bt_font)values(1,'1','2','3');
/* 입점문의 */
insert into ASKENTER(ae_no,ae_name,ae_tel,ae_email,ae_title,ae_content,ae_file,ae_pw)values(1,'1','2','3','4','5','6','7');
/* 입점문의 답변 */
insert into ASKANSWER(ae_no, bm_no, aa_content, aa_status)values(1,1,'집가고싶다','3');
/* 상품 */
insert into product(p_pno,bm_no,p_name,p_detail,p_price,p_disprice,p_start,p_end,p_delivery,p_as,p_ox,p_pimg,p_dimg,p_deldis,p_count) values(1,1,'1','2',1,1,'3','4','5','6','7','8','9',1,1);
/* MD */
insert into MD(md_no,bm_no,p_pno)values(1,1,1);
/* 코드분류 */
insert into DIVISIONCODE(dc_pcno,dc_name,dc_ex)values(1,'1',1);
/* 코드 */
insert into code(p_pno,dc_pcno,c_name,c_ex) values(1,1,'1',1);
/* 리뷰댓글 */
insert into COMMENTS(cm_no,cm_content,cm_id,cm_status)values(1,'2','3','5');
/* 멤버십 */
insert into MEMBERSHIP(ms_grade,ms_desc,ms_sale) values(1,'할인','15%');
/* 커뮤니티 */
insert into COMMUNITY(cm_bdno,cm_writer,cm_title,cm_desc,cm_cnt,cm_del) values (1,'1','2','3',0,'0');
/* 댓글 */
insert into REPLY(r_no, cm_bdno, r_content, r_del, r_writer) values(1,1,'1','0','30');
/* User */
insert into USERMEMBER (um_no, um_mid, um_ars, um_grade, um_password, um_ymd, um_gender, um_addr, um_email, um_tel, um_snsch,um_emailch, ms_grade)VALUES(1,'1','2','3','4','5','6','7','8','9','10','11',1);
/* 리뷰 */
insert into REVIEW(rv_no,p_pno,um_no,rv_status,rv_star,cm_no)values(1,1,1,'0',1,1);
/* 문의 댓글 */
insert into ASKREVIEW(ar_no,ar_content,ar_status,ar_id)values(1,'1','2','1');
/* 브랜드문의 */
insert into ask(a_no,a_title,a_content,um_no,bm_no,a_pmm,a_status,ar_no)values(1,'1','2',1,1,'1','2',1);
/* 찜 */
insert into keep(k_no,um_no,p_pno,bm_no) values(1,1,1,1);
/* 장바구니 */
insert into basket(s_no,um_no,p_pno,s_quantity) values(1,1,1,1);
/* 포인트 */
insert into point(pp_payno,pp_name,pp_desc) values(1,'1','2');
/* 포인트 적용 */
insert into POINTAP(pa_no,pp_payno,um_no,pa_point,pa_status)values(1,1,1,1,'5')
/* 주문상품 */
INSERT INTO productbuy(o_odno, p_pno, o_pquantity, s_no,o_pno1,o_pno2,o_pno3,o_pno1qu,o_pno2qu,o_pno3qu,um_no) VALUES(1,1,1,1,'a','b','c',1,1,1,1);
/* 쿠폰 */
insert into coupon(cp_cpno,cp_name,cp_content,cp_image,cp_enddate)values(1,'2',1,'3','20221011');
/* 쿠폰적용 */
insert into couponAp(cpa_no,cp_cpno,um_no,cpa_status)VALUES(1,1,1,5);
/* 배송업체 */
insert into DELIVERY(d_dno,d_cpname,d_odno,d_rpnname,d_tel,d_addr,d_register,d_price) values(1,'1','2','3','4','5','6',3000);
/* 주문 */
insert into BUY(po_no,o_odno,po_total,pa_no,cpa_no,d_dno,po_drequest,po_price,po_ptype,po_name,po_number,po_addr,po_status) values(1,1,1,1,1,1,'1',1,'2','3','4','5','6');