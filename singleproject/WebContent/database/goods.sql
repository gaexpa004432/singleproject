create table human(
id varchar2(100) primary key,
pw varchar2(100) ,
name varchar2(100)
)
;
create table auction(
no varchar2(100) primary key,
name varchar2(100) ,
limit timestamp,
picture varchar2(100),
startprice number(10),
id varchar2(100)
)
create sequence goods_seq
increment by 1
start with 1;

create table bidding(
bid_no varchar2(100) primary key,
no varchar2(100),
price number(10),
id varchar2(100)
);

create table history(
his_no number primary key,
limit timestamp,
picture varchar2(100),
id varchar2(100),
no varchar2(100));

select a.limit ,a.picture , b.id  ,a.no, max(b.price) from auction a , bidding b where a.no = b.no and systimestamp > a.limit group by b.id,a.limit ,a.picture ,a.no;
from auction a where systimestamp > limit;
bidding 을 옥션 만듦과 동시에 생성 
추가 입찰건에 관해서는 업데이트 적용