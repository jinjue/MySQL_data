SELECT * FROM boookstore.user WHERE score>500;

SELECT uname as username,tnum as telephone FROM boookstore.user WHERE score<200;

SELECT uname,email FROM boookstore.user WHERE email LIKE '%qq.com%';

SELECT * FROM boookstore.b_order WHERE orderdate LIKE'2016-10%';

SELECT DISTINCT uid FROM boookstore.b_order;

SELECT bname,price FROM boookstore.book ORDER BY price DESC;

SELECT bname,price FROM boookstore.book ORDER BY price DESC LIMIT 3;

SELECT max(price) as "最高价格",min(price) as "最低价格",avg(price) as "平均价格" FROM boookstore.book;

SELECT count(cid=1 OR NULL) as "历史类总数",count(cid=2 OR NULL) as "家教类总数",count(cid=3 OR NULL) as "文化类总数",count(cid=4 OR NULL) as "小说类总数" FROM boookstore.book; 
SELECT cid,count(cid) FROM boookstore.book GROUP BY cid;

SELECT DISTINCT cid,MAX(price) as 最高价格,MIN(price) as 最低价格,AVG(price) as 平均价格 FROM boookstore.book GROUP BY cid;

SELECT uid,sum(ordernum) as "订购总数" FROM boookstore.b_order GROUP BY uid HAVING sum(ordernum)>3;

SELECT bname,price,cname FROM boookstore.book CROSS JOIN boookstore.category;

SELECT uname,tnum,ordernum FROM boookstore.user as u,boookstore.b_order as o  
WHERE u.uid=o.uid AND bid=(
  select bid from boookstore.book
    where bname="平凡的世界") GROUP BY uname;

SELECT uname,tnum FROM boookstore.user as u,boookstore.b_order as o 
  WHERE u.uid=o.uid GROUP BY uname;

SELECT bname,price FROM boookstore.book as b,boookstore.b_order as o 
  WHERE b.bid !=ALL(
   select o.bid from boookstore.book as b,boookstore.b_order as o
     WHERE b.bid=o.oid)GROUP BY bname;

SELECT uname,tnum,bname,ordernum,price,discount 
 FROM boookstore.user as u,boookstore.book as b,boookstore.b_order as o
 WHERE u.uid=o.uid AND b.bid=o.bid;

