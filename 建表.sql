CREATE  TABLE `boookstore`.`user` (
  `uid` CHAR(4) NOT NULL ,
  `uname` VARCHAR(20) NULL ,
  `email` VARCHAR(20) NULL ,
  `tnum` VARCHAR(15) NULL ,
  `score` INT NULL ,
  PRIMARY KEY (`uid`) );
drop table `boookstore`.`user`;

CREATE  TABLE `boookstore`.`category` (
  `cid` INT NOT NULL ,
  `cname` VARCHAR(16) NULL ,
  PRIMARY KEY (`cid`) );
drop table `boookstore`.`category`;

CREATE  TABLE `boookstore`.`book` (
  `bid` INT NOT NULL ,
  `bname` VARCHAR(50) NOT NULL ,
  `author` CHAR(8) NULL ,
  `price` FLOAT NULL ,
  `publisher` VARCHAR(50) NULL ,
  `discount` FLOAT NULL ,
  `cid` INT NULL ,
  PRIMARY KEY (`bid`) ,
  INDEX `cid_idx` (`cid` ASC) ,
  CONSTRAINT `cid` FOREIGN KEY (`cid` ) REFERENCES `boookstore`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
drop table `boookstore`.`book`;

CREATE  TABLE `boookstore`.`b_order` (
  `oid` INT PRIMARY KEY AUTO_INCREMENT,
  `bid` INT NOT NULL ,
  `uid` CHAR(4) NOT NULL ,
  `ordernum` INT NULL DEFAULT 1 ,
  `orderdate` DATETIME NULL ,
  `deliverydate` DATETIME NULL );
drop table `boookstore`.`b_order`;













