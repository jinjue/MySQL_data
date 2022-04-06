DROP PROCEDURE student_gread;
DELIMITER //
CREATE PROCEDURE student_gread()
	BEGIN 
		SELECT s.sno 学号,s.sname 姓名,
			max(case when t.cname='文学欣赏' then c.grade else "" end) as 文学欣赏,
			max(case when t.cname='中国历史文化' then c.grade else "" end) as 中国历史文化,
			max(case when t.cname='视频编辑' then c.grade else "" end) as 视频编辑,
			max(case when t.cname='音乐欣赏' then c.grade else "" end) as 音乐欣赏,
			FORMAT(avg(grade),2) 平均分,
			(select 1+COUNT(平均成绩)from (
               select Sno,FORMAT(avg(grade),2) 
				as 平均成绩
				from Student1.course group by Sno) as t1 
				where 平均成绩 > T2.平均成绩) 名次
			FROM (Student1.student s LEFT JOIN Student1.course c ON S.SNO=C.SNO)
					LEFT JOIN Student1.timetable t ON C.CNO=T.CNO,
					(select Sno,FORMAT(avg(grade),2) as 平均成绩 from Student1.course group by Sno) as t2
			group by t2.sno;
	END;//
	DELIMITER ;

CALL student_gread();





DROP PROCEDURE yyl;
DELIMITER //
create procedure yyl()
BEGIN
select s.sno as 学号,s.sname as 姓名,
max(case when t.cname='文学欣赏' then c.grade else 0  end) as 文学欣赏,
max(case when t.cname='中国历史文化' then c.grade else 0 end) as 中国历史文化, 
max(case when t.cname='视频编辑' then c.grade else 0  end) as 视频编辑,
max(case when t.cname='音乐欣赏' then c.grade else 0  end) as 音乐欣赏,
round(AVG(c.grade),2) as 平均分,
(select @rank from (
select @rank := @rank + 1 as 排名
from (select @rank := 0) r 
order by 平均分
)) as 名次
from Student1.student s,Student1.timetable t,Student1.course c
where s.sno=c.sno and t.cno=c.cno
group by s.sno;

END;//
DELIMITER ;

CALL yyl();


DROP PROCEDURE IF EXISTS get_all_score;
DROP TABLE IF EXISTS stuscore ;
DELIMITER //
CREATE PROCEDURE  get_all_score()
BEGIN
	CREATE TABLE IF NOT EXISTS stuscore SELECT c.* FROM
		(
		SELECT a.*,(@counter :=@counter + 1) AS "名次" 
		FROM (
			SELECT e.sno "学号",s.sname "姓名",
				MAX(CASE e.cno WHEN "c001" THEN e.grade ELSE "" END) AS "文学欣赏",
				MAX(CASE e.cno WHEN "c002" THEN e.grade ELSE "" END) AS "中国历史文化",
				MAX(CASE e.cno WHEN "c003" THEN e.grade ELSE "" END) AS "视频编辑",
				MAX(CASE e.cno WHEN "c004" THEN e.grade ELSE "" END) AS "音乐欣赏",
				FORMAT(AVG(e.grade),2) AS "平均分"
			FROM Student1.student AS s,Student1.course AS e
			WHERE e.sno=s.sno
			GROUP BY e.sno
			ORDER BY AVG(e.grade) DESC
			) a,(SELECT @counter :=0) b
		) c
	ORDER BY 1 ASC;
END;//
DELIMITER ;

CALL get_all_score();

SELECT * FROM stuscore;
