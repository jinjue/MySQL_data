CREATE DATABASE bbs;


/*建表*/
CREATE TABLE user(
uID INT PRIMARY KEY UNIQUE NOT NULL,
userName VARCHAR(20) NOT NULL,
userPassword VARCHAR (20) NOT NULL,
userSex BIT NOT NULL,
userEmail VARCHAR(20) NOT NULL,
userBirthday DATE NOT NULL,
userciass INT NOT NULL,
userstatement VARCHAR (150) NOT NULL,
userRegDate TIMESTAMP NOT NULL,
userPoint INT NOT NULL
);
CREATE TABLE admin(
adminID INT PRIMARY KEY UNIQUE NOT NULL,
adminName VARCHAR(20) NOT NULL,
adminPassword VARCHAR(20) NOT NULL
);
CREATE TABLE section (
SID INT PRIMARY KEY UNIQUE NOT NULL,
sName VARCHAR(20) NOT NULL,
sMasterID INT NOT NULL,
sStatement VARCHAR(255) NOT NULL,
sClickcount INT NOT NULL,
sTopiccount INT NOT NULL
);
CREATE TABLE topic(
t王D INT PRIMARY KEY UNIQUE NOT NULL,
tSID INT NOT NULL,
tuid INT NOT NULL,
tReplycount INT NOT NULL,
tEmotion VARCHAR(20) NOT NULL,
tTopic VARCHAR(100) NOT NULL,
tContents TEXT NOT NULL,
tTime TIMESTAMP NOT NULL,
tClickCount INT NOT NULL,
tLastClickT TIMESTAMP NOT NULL
);

CREATE TABLE reply(
rID INT PRIMARY KEY UNIQUE NOT NULL,
tID INT NOT NULL,
uID INT NOT NULL,
rEmotion CHAR NOT NULL,
rTopic VARCHAR(20) NOT NULL,
rContents TEXT NOT NULL,
rTime TIMESTAMP NOT NULL,
rClickcount INT NOT NULL
);

/*索引*/
CREATE INDEX index_topic_title ON topic (tTopic);
CREATE INDEX index_topic_time ON topic(tTime);
ALTER TABLE topic ADD INDEX index_topic_contents (tcontents);


CREATE INDEX index_section_name ON section (sName);


CREATE INDEX index_reply_rtime ON reply (rTime);
CREATE INDEX index_reply_rtopic ON reply (rTopic);
CREATE INDEX index_reply_rid ON reply (rID);


/*视图*/
CREATE VIEW topic_view
AS SELECT s.ID,s.Name, t.tTopic, t.tContents,t.tTime
FROM section s,topic t
WHERE seetion.sID-topic.sID;


/*触发器*/
DELIMITER &&
CREATE TRIGGER section_count AFTER UPDATE
ON section FOR EACH ROW
	BEGIN
		UPDATE section SET sTopiccount= sTopiccount+1 WHERE SID=NEW.SID;
	END
&&
DELIMITER ;


DELIMITER &&
CREATE TRIGGER update_userID AFTER UPDATE
ON user FOR EACH ROW
	BEGIN
		UPDATE reply SET uID=NEW.UID;
	END
&&
DELIMITER ;


DELIMITER &&
CREATE TRIGGER delete_user AFTER DELETE
ON user FOR EACH ROW
	BEGIN
		DELETE FROM top WHERE uID=OLD.uID;
	END
&&
DELIMITER ;






























