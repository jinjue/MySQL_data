CREATE DATABASE webnews;
/*创建表*/
CREATE TABLE user(
userID INT PRIMARY KEY UNIQUE NOT NULL,
userName VARCHAR(20) NOT NULL,
userPassword VARCHAR(20) NOT NULL,
sexvar char (10) NOT NULL,
userEmail VARCHAR (20)NOT NULL
);

CREATE TABLE admin(
adminID INT PRIMARY KEY UNIQUE NOT NULL,
adminName VARCHAR(20) NOT NULL,
adminPassword VARCHAR(20) NOT NULL
);

CREATE TABLE roles(
roleID INT PRIMARY KEY UNIQUE NOT NULL,
roleName VARCHAR(20) NOT NULL
);

CREATE TABLE news(
newSID INT PRIMARY KEY UNIQUE NOT NULL,
newsTitle VARCHAR(50) NOT NULL,
newscontent TEXT NOT NULL,
newsDate TIMESTAMP,
newsDesc VARCHAR (50) NOT NULL,
newsImagePath VARCHAR (50) ,
newsRate INT NOT NULL,
newsIsCheck BIT NOT NULL,
newslsTop BIT NOT NULL
);

CREATE TABLE categroy(
categoryID INT PRIMARY KEY UNIQUE NOT NULL,
categoryName VARCHAR(50) NOT NULL,
categoryDesc VARCHAR (50) NOT NULL
);

CREATE TABLE comment (
commentID INT PRIMARY KEY UNIQUE NOT NULL,
commentTitle VARCHAR (50) NOT NULL,
commentContent TEXT NOT NULL,
commentDate DATETIME
);

CREATE TABLE admin_Roles(
aRID INT PRIMARY KEY UNIQUE NOT NULL,
adminID INT NOT NULL,
roleID INT NOT NULL
);

CREATE TABLE newsComment(
nCommentID INT PRIMARY KEY UNIQUE NOT NULL,
newsID INT NOT NULL,
commentID INT NOT NULL
);

CREATE TABLE news_Comment (
uCID INT PRIMARY KEY UNIQUE NOT NULL,
userID INT NOT NULL,
commentID INT NOT NULL
);

/*设计索引*/
CREATE INDEX index_new_title ON news (newsTitle);
CREATE INDEX index_new_date ON news (newsDate);
ALTER TABLE news ADD INDEX index_new_rate (newsRate);
CREATE INDEX index_categroy_name ON categroy (categroyName) ;
CREATE INDEX index_commenttitle ON comment (commentTitle);
CREATE INDEX index_comment_date ON comment (commentDate);

/*视图*/
CREATE VIEW news_view
AS SELECT c.commentID,n.newsID,n.newsRate, n.newsTitle,n.newsContent,n.newsDate
FROM news_Comment c, news n
WHERE news_Comment.newsID=news.newsID;


/*触发器*/
DELIMITER &&
CREATE TRIGGER update_newsID AFTER UPDATE
ON news 
FOR EACH ROW
	BEGIN
		UPDATE news_Comment SET newsID=NEW. newsID;
	END
&&
DELIMITER ;


DELIMITER &&
CREATE TRIGGER delete_user AFTER DELETE
ON user 
FOR EACH ROW
	BEGIN
	 DELETE FROM users_Comment WHERE userID=OLD.userID;
	END
&&
DELIMITER ;


































