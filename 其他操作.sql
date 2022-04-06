SELECT * FROM boookstore.user;

ALTER TABLE boookstore.user ADD `address` VARCHAR(15) NULL;
ALTER TABLE boookstore.user CHANGE `address` `way` VARCHAR(15) NULL;
ALTER TABLE boookstore.user DROP `way`;
ALTER TABLE boookstore.b_order CHANGE `orderbum` `ordernum` INT NULL;

ALTER TABLE boookstore.user MODIFY `uname` VARCHAR(20) NOT NULL;

SELECT * FROM boookstore.user;
INSERT INTO boookstore.user VALUE("1001","何仙姑","Hxg18@163.com","13320101991",20);
INSERT INTO boookstore.user VALUE("1002","平平人生","Lp001@126.com","13545158219",300);
INSERT INTO boookstore.user VALUE("1003","四十不惑","12345@qq.com","18688168818",1000);
INSERT INTO boookstore.user VALUE("1004","桃花岛主","810124@qq.com","13068011234",600);
INSERT INTO boookstore.user VALUE("1005","水灵","zs123@371.com","15838182503",150);
INSERT INTO boookstore.user VALUE("1006","感动心灵","gandong@tom.com","13641151234",500);

SELECT * FROM boookstore.category;
INSERT INTO boookstore.category VALUE(1,"历史");
INSERT INTO boookstore.category VALUE(2,"家教");
INSERT INTO boookstore.category VALUE(3,"文化");
INSERT INTO boookstore.category VALUE(4,"小说");

SELECT * FROM boookstore.book;
INSERT INTO boookstore.book VALUE(1,"中国时代","师永刚",39.0,"作家出版社",27.8,1);
INSERT INTO boookstore.book VALUE(2,"中国历史的屈辱","王重旭",26.0,"华夏出版社",18.2,2);
INSERT INTO boookstore.book VALUE(3,"择业要趁早","海文",28.0,"海天出版社",19.3,3);
INSERT INTO boookstore.book VALUE(4,"房间","爱玛",37.6,"人民文学出版社",26.3,4);
INSERT INTO boookstore.book VALUE(5,"平凡的世界","路遥",75,"北京出版社",63.75,4);
INSERT INTO boookstore.book VALUE(6,"心灵鸡汤","关然",27.0,"天豫出版社",20.0,3);
INSERT INTO boookstore.book VALUE(7,"蜕","赵婷",32.0,"上海出版社",28.5,3);

SELECT * FROM boookstore.b_order;
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1001",1,2,"2016-03-12");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1001",3,1,"2016-04-15");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1001",1,1,"2016-09-15");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1003",7,1,"2016-12-14");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1003",3,1,"2016-10-10");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1005",5,1,"2016-08-17");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1005",7,3,"2016-11-12");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1006",5,1,"2016-09-18");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1006",1,2,"2016-10-21");
INSERT INTO boookstore.b_order(uid,bid,ordernum,orderdate) VALUE("1006",7,2,"2016-11-21");


