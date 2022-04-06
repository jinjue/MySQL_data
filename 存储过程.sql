DROP PROCEDURE proc_2;
DELIMITER //
CREATE PROCEDURE proc_2(IN uname1 VARCHAR(20))
	BEGIN
      SELECT score as 积分 FROM user WHERE uname=uname1;
	END;//
	DELIMITER ;

CALL proc_2('平平人生');
CALL proc_2('感动心灵');

DROP PROCEDURE proc_3;
DELIMITER //
CREATE PROCEDURE proc_3(IN uname1 VARCHAR(20))
	BEGIN
      SET @num=(SELECT COUNT(*)FROM b_order WHERE
			uid=(SELECT uid FROM user WHERE uname=uname1));
	  IF @num>0
		THEN
		SELECT * FROM book WHERE bid IN (
			SELECT bid FROM b_order WHERE uid=(
			SELECT uid FROM user WHERE uname=uname1));
      ELSE 
        SELECT CONCAT(uname1,"没有订购图书");
      END IF;
	END //
	DELIMITER ;
CALL proc_3('四十不惑');

CREATE VIEW book_view(图书编号,图书名称,作者,价格,出版社,图书类别)
AS
SELECT bid,bname,author,price,publisher,cid FROM book;
SELECT * FROM book_view;

SELECT 图书名称,价格 FROM book_view ORDER BY 价格 DESC;

SELECT 图书名称,价格 FROM book_view ORDER BY 价格 DESC LIMIT 3;

