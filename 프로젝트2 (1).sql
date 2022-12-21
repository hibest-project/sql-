/*
create user 'project'@'localhost' identified by 'project';

create database project character set=utf8;

grant all privileges on project.* to 'project'@'localhost';
flush privileges;
*/
-- use project;


-- 찜목록
DROP TABLE wish_list;
-- 수강중인 강의
DROP TABLE listen_lecture;
-- 대댓글
DROP TABLE recomment;
-- 댓글
DROP TABLE comment;
-- 질문게시판
DROP TABLE qna_board;
-- 수강생
DROP TABLE listener;
-- 강의 별점
DROP TABLE lecture_grade;
-- 강의
DROP TABLE lecture;
-- 강사
DROP TABLE teacher;
-- 멘토링 별점
DROP TABLE mentoring_grade;
-- 멘토링
DROP TABLE mentoring;
-- 멘토
DROP TABLE mentor;
-- 질문댓글2
DROP TABLE comments;
-- 1:1질문
DROP TABLE inquiry_board;
-- 회원
DROP TABLE member;
-- d카테고리
DROP TABLE dtail_kategorie;
-- 카테고리
DROP TABLE kategorie;
-- 관리자
DROP TABLE admin;
-- 자주묻는질문
DROP TABLE q_n_board;






-- 회원
CREATE TABLE member (
	id       VARCHAR(100) NOT NULL, -- 회원 아이디
	name     VARCHAR(20)  NULL,     -- 회원 이름
	password VARCHAR(100) NULL,     -- 회원 비밀번호
	email    VARCHAR(100) NULL,     -- 회원 이메일
	birthday DATE         NULL,     -- 회원 생일
	address  VARCHAR(100) NULL,     -- 회원 주소
	gender   CHAR(1)      NULL,     -- 회원 성별
	phone    VARCHAR(13)  NULL,
    PRIMARY KEY (id)
)default charset =  utf8;

-- 회원
ALTER TABLE member
	ADD CONSTRAINT CK_gender -- 성별 체크
		CHECK (gender IN ('M', 'F'));

-- 찜목록
CREATE TABLE wish_list (
	wish_list_id INT(5)       NOT NULL AUTO_INCREMENT, -- 새 컬럼
	id           VARCHAR(100) NULL,     -- 회원 아이디
	lecture_id   INT(5)       NULL,      -- 강의 아이디
    		PRIMARY KEY (
			wish_list_id -- 새 컬럼
		)
)default charset =  utf8;

-- 수강중인 강의
CREATE TABLE listen_lecture (
	listen_lecture_id INT(5)       NOT NULL AUTO_INCREMENT, -- 새 컬럼
	id              VARCHAR(100) NULL,     -- 회원 아이디
	lecture_id      INT(5)       NULL ,     -- 강의 아이디
    PRIMARY KEY (
			listen_lecture_id -- 새 컬럼
		)
)default charset =  utf8;




-- 질문게시판
CREATE TABLE qna_board (
	board_id    INT(5)       NOT NULL AUTO_INCREMENT, -- 게시글번호
	teacher_id  INT(5)       NULL,     -- 강사아이디
	listener_id INT(5)       NULL,     -- 새 컬럼5
	title       VARCHAR(30)  NULL,     -- 새 컬럼
	content     VARCHAR(500) NULL,     -- 새 컬럼2
	image       VARCHAR(30)  NULL,     -- 새 컬럼3
	date        DATE         NULL,      -- 새 컬럼4
    PRIMARY KEY (
			board_id -- 게시글번호
		)
)default charset =  utf8;

-- 강사
CREATE TABLE teacher (
	teacher_id INT(5)       NOT NULL AUTO_INCREMENT, -- 강사아이디
	id         VARCHAR(100) NULL,     -- 회원 아이디
	name       VARCHAR(20)  NULL,     -- 이름
	email      VARCHAR(100) NULL,     -- 이메일
	phone      VARCHAR(13)  NULL,      -- 전화번호
    PRIMARY KEY (
			teacher_id -- 강사아이디
		)
)default charset =  utf8;

-- 댓글
CREATE TABLE comment (
	comment_id INT(5)       NOT NULL AUTO_INCREMENT, -- 댓글번호
	board_id   INT(5)       NULL,     -- 게시글번호
	id         VARCHAR(100) NULL,     -- 회원 아이디
	teacher_id INT(5)       NULL,     -- 강사아이디
	content    VARCHAR(500) NULL,     -- 내용
	date       DATE         NULL,     -- 날짜
	image      VARCHAR(30)  NULL,      -- 이미지
    PRIMARY KEY (
			comment_id -- 댓글번호
		)
)default charset =  utf8;

-- 강의
CREATE TABLE lecture (
	lecture_id    INT(5)       NOT NULL AUTO_INCREMENT, -- 강의 아이디
	kategorie_num INT(5)       NULL,     -- 카테고리 번호
	dtail_num     INT(5)       NULL,     -- 세부카테고리 번호
	teacher_id    INT(5)       NULL,     -- 강사아이디
	name          VARCHAR(50)  NULL,     -- 강의 이름
	price         VARCHAR(10)  NULL,     -- 가격
	video         VARCHAR(50)  NULL,     -- 영상
	image         VARCHAR(50)  NULL,     -- 이미지
	date   DATE         NULL,     -- 수강기간
	discount      INT(2)       NULL,     -- 할인율
	about_lecture  VARCHAR(500) NULL,     -- 강의소개
	introduce     VARCHAR(500) NULL,     -- 강사소개
	curriculum    VARCHAR(500) NULL,      -- 커리큘럼
    PRIMARY KEY (
			lecture_id -- 강의 아이디
		)
)default charset =  utf8;


-- 카테고리
CREATE TABLE kategorie (
	kategorie_num INT(5)      NOT NULL AUTO_INCREMENT, -- 카테고리 번호
	name          VARCHAR(50) NULL,      -- 카테고리이름
    PRIMARY KEY (
			kategorie_num -- 카테고리 번호
		)
)default charset =  utf8;




-- d카테고리
CREATE TABLE dtail_kategorie (
	dtail_num     INT(5)      NOT NULL AUTO_INCREMENT, -- 세부카테고리 번호
	kategorie_num INT(5)      NULL,     -- 카테고리 번호
	title         VARCHAR(50) NULL,      -- 디테일 이름
    PRIMARY KEY (
			dtail_num -- 세부카테고리 번호
		)
)default charset =  utf8;



-- 수강생
CREATE TABLE listener (
	listener_id INT(5)       NOT NULL AUTO_INCREMENT, -- 새 컬럼
	id          VARCHAR(100) NULL,     -- 회원 아이디
	lecture_id  INT(5)       NULL,      -- 강의 아이디
    PRIMARY KEY (
			listener_id -- 새 컬럼
		)
)default charset =  utf8;




-- 대댓글
CREATE TABLE recomment (
	recomment_id INT(5)       NOT NULL AUTO_INCREMENT, -- 새 컬럼
	comment_id   INT(5)       NULL,     -- 댓글번호
	content      VARCHAR(500) NULL,     -- 내용
	image        VARCHAR(30)  NULL ,     -- 이미지
    PRIMARY KEY (
			recomment_id -- 새 컬럼
		)
)default charset =  utf8;




-- 관리자
CREATE TABLE admin (
	id       VARCHAR(30) NOT NULL, -- 관리자 아이디
	password VARCHAR(30) NULL,      -- 관리자 비밀번호
    PRIMARY KEY (
			id -- 관리자 아이디
		)
)default charset =  utf8;

-- 멘토
CREATE TABLE mentor (
	mentor_id     INT(5)       NOT NULL AUTO_INCREMENT, -- 멘토 아이디
	id            VARCHAR(100) NULL,     -- 회원 아이디
	kategorie_num INT(5)       NULL,     -- 카테고리 번호
	email         VARCHAR(100) NULL,     -- 멘토 이메일
	name          VARCHAR(20)  NULL,     -- 멘토 이름
	phone         VARCHAR(13)  NULL,     -- 멘토 전화번호
	content       VARCHAR(150) NULL,     -- 멘토 소개
	career        VARCHAR(150) NULL,      -- 멘토 경력
    PRIMARY KEY (
			mentor_id -- 멘토 아이디
		)
)default charset =  utf8;


-- 멘토링
CREATE TABLE mentoring (
	mentoring_id INT(5)       NOT NULL AUTO_INCREMENT,-- 새 컬럼
	mentor_id    INT(5)       NULL,     -- 멘토 아이디
	id           VARCHAR(100) NULL,     -- 회원 아이디
	title        VARCHAR(50)  NULL,     -- 멘토링 글제목
	content      VARCHAR(500) NULL,     -- 멘토링 글내용
	rule         VARCHAR(100) NULL,     -- 멘토링 진행방식
	time         VARCHAR(20)  NULL,     -- 멘토링 시간
	price        VARCHAR(15)  NULL,      -- 멘토링 가격
    PRIMARY KEY (
			mentoring_id -- 새 컬럼
		)
)default charset =  utf8;




-- 강의 별점
CREATE TABLE lecture_grade (
	grade_num  INT(5)       NOT NULL AUTO_INCREMENT, -- 별점 번호
	lecture_id INT(5)       NULL,     -- 강의 아이디
	id         VARCHAR(100) NULL,     -- 회원 아이디
	content    VARCHAR(500) NULL,     -- 내용
	score      INT(11)      NULL,      -- 별점
    PRIMARY KEY (
			grade_num -- 별점 번호
		)
)default charset =  utf8;

-- 멘토링 별점
CREATE TABLE mentoring_grade (
	m_grade      INT(5)       NOT NULL AUTO_INCREMENT, -- 별점 번호
	mentoring_id INT(5)       NULL,     -- 새 컬럼
	id           VARCHAR(100) NULL,     -- 회원 아이디
	content      VARCHAR(500) NULL,     -- 내용
	score        INT(11)      NULL,      -- 별점
    PRIMARY KEY (
			m_grade -- 별점 번호
		)
)default charset =  utf8;


-- 1:1질문
CREATE TABLE inquiry_board (
	inquiry_id INT(10)      NOT NULL AUTO_INCREMENT, -- 질문번호
	id         VARCHAR(100) NULL,     -- 회원 아이디
	title      VARCHAR(100) NULL,     -- 질문제목
	content    VARCHAR(500) NULL,     -- 질문내용
	date       DATE         NULL,     -- 작성일자
	email      VARCHAR(100) NULL,      -- 이메일
    PRIMARY KEY (
			inquiry_id -- 질문번호
		)
)default charset =  utf8;

-- 질문댓글2
CREATE TABLE comments (
	comments_id INT(10)      NOT NULL AUTO_INCREMENT, -- 댓글번호
	inquiry_id  INT(10)      NULL,     -- 질문번호
	id          VARCHAR(30)  NULL,     -- 관리자 아이디
	admin_id    INT(10)      NULL,     -- 관리자아이디
	text        VARCHAR(100) NULL,     -- 댓글내용
	image       VARCHAR(30)  NULL,      -- 댓글이미지
    PRIMARY KEY (
			comments_id -- 댓글번호
		)
)default charset =  utf8;
-- 자주묻는질문
CREATE TABLE q_n_board (
	q_n_id  INT(10)       NOT NULL AUTO_INCREMENT, -- Q&A번호
	title   VARCHAR(100)  NULL,     -- Q&A제목
	content VARCHAR(4000) NULL,     -- Q&A내용
	image   VARCHAR(4000) NULL,      -- Q&A이미지
    PRIMARY KEY (
			q_n_id -- Q&A번호
		)
)default charset =  utf8;




-- 찜목록
ALTER TABLE wish_list
	ADD CONSTRAINT FK_member_TO_wish_list -- 회원 -> 찜목록
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 찜목록
ALTER TABLE wish_list
	ADD CONSTRAINT FK_lecture_TO_wish_list -- 강의 -> 찜목록
		FOREIGN KEY (
			lecture_id -- 강의 아이디
		)
		REFERENCES lecture ( -- 강의
			lecture_id -- 강의 아이디
		);

-- 수강중인 강의
ALTER TABLE listen_lecture
	ADD CONSTRAINT FK_member_TO_listen_lecture -- 회원 -> 수강중인 강의
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 수강중인 강의
ALTER TABLE listen_lecture
	ADD CONSTRAINT FK_lecture_TO_listen_lecture-- 강의 -> 수강중인 강의
		FOREIGN KEY (
			lecture_id -- 강의 아이디
		)
		REFERENCES lecture ( -- 강의
			lecture_id -- 강의 아이디
		);

-- 질문게시판
ALTER TABLE qna_board
	ADD CONSTRAINT FK_teacher_TO_qna_board -- 강사 -> 질문게시판
		FOREIGN KEY (
			teacher_id -- 강사아이디
		)
		REFERENCES teacher ( -- 강사
			teacher_id -- 강사아이디
		);

-- 질문게시판
ALTER TABLE qna_board
	ADD CONSTRAINT FK_listener_TO_qna_board -- 수강생 -> 질문게시판
		FOREIGN KEY (
			listener_id -- 새 컬럼5
		)
		REFERENCES listener ( -- 수강생
			listener_id -- 새 컬럼
		);

-- 강사
ALTER TABLE teacher
	ADD CONSTRAINT FK_member_TO_teacher -- 회원 -> 강사
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 댓글
ALTER TABLE comment
	ADD CONSTRAINT FK_qna_board_TO_comment -- 질문게시판 -> 댓글
		FOREIGN KEY (
			board_id -- 게시글번호
		)
		REFERENCES qna_board ( -- 질문게시판
			board_id -- 게시글번호
		);

-- 댓글
ALTER TABLE comment
	ADD CONSTRAINT FK_member_TO_comment -- 회원 -> 댓글
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 댓글
ALTER TABLE comment
	ADD CONSTRAINT FK_teacher_TO_comment -- 강사 -> 댓글
		FOREIGN KEY (
			teacher_id -- 강사아이디
		)
		REFERENCES teacher ( -- 강사
			teacher_id -- 강사아이디
		);

-- 강의
ALTER TABLE lecture
	ADD CONSTRAINT FK_dtail_kategorie_TO_lecture -- d카테고리 -> 강의
		FOREIGN KEY (
			dtail_num -- 세부카테고리 번호
		)
		REFERENCES dtail_kategorie ( -- d카테고리
			dtail_num -- 세부카테고리 번호
		);

-- 강의
ALTER TABLE lecture
	ADD CONSTRAINT FK_teacher_TO_lecture -- 강사 -> 강의
		FOREIGN KEY (
			teacher_id -- 강사아이디
		)
		REFERENCES teacher ( -- 강사
			teacher_id -- 강사아이디
		);

-- 강의
ALTER TABLE lecture
	ADD CONSTRAINT FK_kategorie_TO_lecture -- 카테고리 -> 강의
		FOREIGN KEY (
			kategorie_num -- 카테고리 번호
		)
		REFERENCES kategorie ( -- 카테고리
			kategorie_num -- 카테고리 번호
		);

-- d카테고리
ALTER TABLE dtail_kategorie
	ADD CONSTRAINT FK_kategorie_TO_dtail_kategorie -- 카테고리 -> d카테고리
		FOREIGN KEY (
			kategorie_num -- 카테고리 번호
		)
		REFERENCES kategorie ( -- 카테고리
			kategorie_num -- 카테고리 번호
		);

-- 수강생
ALTER TABLE listener
	ADD CONSTRAINT FK_member_TO_listener -- 회원 -> 수강생
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 수강생
ALTER TABLE listener
	ADD CONSTRAINT FK_lecture_TO_listener -- 강의 -> 수강생
		FOREIGN KEY (
			lecture_id -- 강의 아이디
		)
		REFERENCES lecture ( -- 강의
			lecture_id -- 강의 아이디
		);

-- 대댓글
ALTER TABLE recomment
	ADD CONSTRAINT FK_comment_TO_recomment -- 댓글 -> 대댓글
		FOREIGN KEY (
			comment_id -- 댓글번호
		)
		REFERENCES comment ( -- 댓글
			comment_id -- 댓글번호
		);

-- 멘토
ALTER TABLE mentor
	ADD CONSTRAINT FK_member_TO_mentor -- 회원 -> 멘토
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 멘토
ALTER TABLE mentor
	ADD CONSTRAINT FK_kategorie_TO_mentor -- 카테고리 -> 멘토
		FOREIGN KEY (
			kategorie_num -- 카테고리 번호
		)
		REFERENCES kategorie ( -- 카테고리
			kategorie_num -- 카테고리 번호
		);

-- 멘토링
ALTER TABLE mentoring
	ADD CONSTRAINT FK_mentor_TO_mentoring -- 멘토 -> 멘토링
		FOREIGN KEY (
			mentor_id -- 멘토 아이디
		)
		REFERENCES mentor ( -- 멘토
			mentor_id -- 멘토 아이디
		);

-- 멘토링
ALTER TABLE mentoring
	ADD CONSTRAINT FK_member_TO_mentoring -- 회원 -> 멘토링
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 강의 별점
ALTER TABLE lecture_grade
	ADD CONSTRAINT FK_lecture_TO_lecture_grade -- 강의 -> 강의 별점
		FOREIGN KEY (
			lecture_id -- 강의 아이디
		)
		REFERENCES lecture ( -- 강의
			lecture_id -- 강의 아이디
		);

-- 강의 별점
ALTER TABLE lecture_grade
	ADD CONSTRAINT FK_member_TO_lecture_grade -- 회원 -> 강의 별점
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 멘토링 별점
ALTER TABLE mentoring_grade
	ADD CONSTRAINT FK_mentoring_TO_mentoring_grade -- 멘토링 -> 멘토링 별점
		FOREIGN KEY (
			mentoring_id -- 새 컬럼
		)
		REFERENCES mentoring ( -- 멘토링
			mentoring_id -- 새 컬럼
		);

-- 멘토링 별점
ALTER TABLE mentoring_grade
	ADD CONSTRAINT FK_member_TO_mentoring_grade -- 회원 -> 멘토링 별점
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 1:1질문
ALTER TABLE inquiry_board
	ADD CONSTRAINT FK_member_TO_inquiry_board -- 회원 -> 1:1질문
		FOREIGN KEY (
			id -- 회원 아이디
		)
		REFERENCES member ( -- 회원
			id -- 회원 아이디
		);

-- 질문댓글2
ALTER TABLE comments
	ADD CONSTRAINT FK_admin_TO_comments -- 관리자 -> 질문댓글2
		FOREIGN KEY (
			id -- 관리자 아이디
		)
		REFERENCES admin ( -- 관리자
			id -- 관리자 아이디
		);

-- 질문댓글2
ALTER TABLE comments
	ADD CONSTRAINT FK_inquiry_board_TO_comments -- 1:1질문 -> 질문댓글2
		FOREIGN KEY (
			inquiry_id -- 질문번호
		)
		REFERENCES inquiry_board ( -- 1:1질문
			inquiry_id -- 질문번호
		);
        
-- 멤버 데이터
INSERT INTO member(name, id, password, email, birthday, address, gender, phone) VALUES('김개똥', 'abc', 'abc', 'abc@abc.com', '2000-12-11', '서울', 'M', '010-0000-0000');
INSERT INTO member(name, id, password, email, birthday, address, gender, phone) VALUES('한복순', 'abb', 'abb', 'abb@abb.com', '2002-03-11', '경기', 'F', '010-1111-2222');
INSERT INTO member(name, id, password, email, birthday, address, gender, phone) VALUES('이똑순', 'acc', 'acc', 'acc@acc.com', '2004-06-11', '경기', 'F', '010-2222-3333');
INSERT INTO member(name, id, password, email, birthday, address, gender, phone) VALUES('최복남', 'add', 'add', 'add@add.com', '2006-09-11', '경기', 'M', '010-4444-5555');

-- 강사 데이터
INSERT INTO teacher(teacher_id, name, email, phone) VALUES(1, '개나리', 'teacher1@teacher.com', '010-1234-5678');
INSERT INTO teacher(teacher_id, name, email, phone)  VALUES(2, '복숭아', 'teacher2@teacher.com', '010-1212-1212');
INSERT INTO teacher(teacher_id, name, email, phone)  VALUES(3, '진달래', 'teacher3@teacher.com', '010-3434-3434');
INSERT INTO teacher(teacher_id, name, email, phone)  VALUES(4, '선인장', 'teacher4@teacher.com', '010-5656-5656');

-- 카테고리
INSERT INTO kategorie(name) VALUES('디지털드로잉');
INSERT INTO kategorie(name) VALUES('드로잉');
INSERT INTO kategorie(name) VALUES('공예');
INSERT INTO kategorie(name) VALUES('요리.음식');
INSERT INTO kategorie(name) VALUES('음식');
INSERT INTO kategorie(name) VALUES('베이킹.디저트');
INSERT INTO kategorie(name) VALUES('음악');
INSERT INTO kategorie(name) VALUES('운동');
INSERT INTO kategorie(name) VALUES('라이프스타일');
INSERT INTO kategorie(name) VALUES('사진.영상');
INSERT INTO kategorie(name) VALUES('금융.제테크');
INSERT INTO kategorie(name) VALUES('창업.부업');
INSERT INTO kategorie(name) VALUES('성공마인드');
INSERT INTO kategorie(name) VALUES('프로그래밍');

-- d카테고리
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(1,'일러스트');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(1,'컨셉아트');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(1,'캐릭터드로잉');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(2,'펜.연필');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(2,'마카');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(2,'색연필');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(3,'대바늘 뜨개');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(3,'자수');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(3,'실 공예');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(4,'한식');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(4,'일식');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(4,'양식');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(5,'케이크');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(5,'제과');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(5,'제빵');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(6,'악기');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(6,'보컬.랩');
INSERT INTO dtail_kategorie(kategorie_num,title ) VALUES(6,'작곡.프로듀싱');

-- 강의
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'첫번째강의','30000원','','',curdate(), 1,'첫번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'두번째강의','10000원','','',curdate(), 1,'두번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'세번째강의','20000원','','',curdate(), 1,'세번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'네번째강의','40000원','','',curdate(), 1,'네번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'다섯번째강의','50000원','','',curdate(), 1,'다섯번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'여섯번째강의','60000원','','',curdate(), 1,'여섯번째강의입니다','첫번째 강의 소개','커리큘럼입니다');
insert into lecture (kategorie_num, dtail_num, teacher_id, name, price, video, image, date, discount, about_lecture, introduce, curriculum ) 
values (1,1,2,'일곱번째강의','70000원','','',curdate(), 1,'일곱번째강의입니다','첫번째 강의 소개','커리큘럼입니다');

-- 찜목록
INSERT INTO wish_list(id, lecture_id) VALUES('abb', 1);
INSERT INTO wish_list(id, lecture_id) VALUES('abb', 2);
INSERT INTO wish_list(id, lecture_id) VALUES('abb', 3);
INSERT INTO wish_list(id, lecture_id) VALUES('abb', 4);
INSERT INTO wish_list(id, lecture_id) VALUES('abc', 1);
INSERT INTO wish_list(id, lecture_id) VALUES('abc', 2);
INSERT INTO wish_list(id, lecture_id) VALUES('abc', 3);
INSERT INTO wish_list(id, lecture_id) VALUES('abc', 4);
INSERT INTO wish_list(id, lecture_id) VALUES('acc', 1);
INSERT INTO wish_list(id, lecture_id) VALUES('acc', 2);
INSERT INTO wish_list(id, lecture_id) VALUES('acc', 3);
INSERT INTO wish_list(id, lecture_id) VALUES('acc', 4);
INSERT INTO wish_list(id, lecture_id) VALUES('add', 1);
INSERT INTO wish_list(id, lecture_id) VALUES('add', 2);
INSERT INTO wish_list(id, lecture_id) VALUES('add', 3);
-- 수강중인 강의
INSERT INTO listen_lecture(id, lecture_id) VALUES('abb', 1);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abb', 2);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abb', 3);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abb', 4);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abc', 1);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abc', 2);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abc', 3);
INSERT INTO listen_lecture(id, lecture_id) VALUES('abc', 4);
INSERT INTO listen_lecture(id, lecture_id) VALUES('acc', 1);
INSERT INTO listen_lecture(id, lecture_id) VALUES('acc', 2);
INSERT INTO listen_lecture(id, lecture_id) VALUES('acc', 3);
INSERT INTO listen_lecture(id, lecture_id) VALUES('acc', 4);
INSERT INTO listen_lecture(id, lecture_id) VALUES('add', 1);
INSERT INTO listen_lecture(id, lecture_id) VALUES('add', 2);
INSERT INTO listen_lecture(id, lecture_id) VALUES('add', 3);

-- 수강생
INSERT INTO listener(id,lecture_id ) VALUES('abb',1);
INSERT INTO listener(id,lecture_id ) VALUES('abc',1);
INSERT INTO listener(id,lecture_id ) VALUES('acc',1);
INSERT INTO listener(id,lecture_id ) VALUES('add',2);
INSERT INTO listener(id,lecture_id ) VALUES('abb',2);
INSERT INTO listener(id,lecture_id ) VALUES('abc',3);
INSERT INTO listener(id,lecture_id ) VALUES('acc',3);
INSERT INTO listener(id,lecture_id ) VALUES('add',3);
INSERT INTO listener(id,lecture_id ) VALUES('abb',4);
INSERT INTO listener(id,lecture_id ) VALUES('abc',4);

-- 질문개시판
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(1, 1, '질문있습니다1.', '코딩을 어떻게하는고거죠', '','2022-12-11');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(1, 1, '질문있습니다2.', '코딩을 어떻게하는고거죠', '','2022-12-12');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(1, 3, '질문있습니다3.', '코딩을 어떻게하는고거죠', '','2022-12-13');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(2, 1, '질문있습니다4.', '코딩을 어떻게하는고거죠', '','2022-12-14');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(2, 2, '질문있습니다5.', '코딩을 어떻게하는고거죠', '','2022-12-15');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(2, 3, '질문있습니다6.', '코딩을 어떻게하는고거죠', '','2022-12-16');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(3, 1, '질문있습니다7.', '코딩을 어떻게하는고거죠', '','2022-12-17');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(3, 2, '질문있습니다8.', '코딩을 어떻게하는고거죠', '','2022-12-18');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(3, 3, '질문있습니다9.', '코딩을 어떻게하는고거죠', '','2022-12-19');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(4, 1, '질문있습니다10.', '코딩을 어떻게하는고거죠', '','2022-12-20');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(4, 2, '질문있습니다11.', '코딩을 어떻게하는고거죠', '','2022-12-21');
INSERT INTO qna_board(teacher_id, listener_id, title, content, image, date) VALUES(4, 3, '질문있습니다12.', '코딩을 어떻게하는고거죠', '','2022-12-22');

-- 댓글
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'abb', 1, '코디은 복붙으로 하는겁니다1.', '2022-12-26' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'abc', 2, '코디은 복붙으로 하는겁니다2.', '2022-12-27' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'acc', 3, '코디은 복붙으로 하는겁니다3.', '2022-12-28' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'abb', 1, '코디은 복붙으로 하는겁니다4.', '2022-12-29' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'abc', 2, '코디은 복붙으로 하는겁니다5.', '2023-01-01' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(2, 'acc', 3, '코디은 복붙으로 하는겁니다6.', '2023-01-02' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(3, 'abb', 1, '코디은 복붙으로 하는겁니다7.', '2023-01-03' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(3, 'abc', 2, '코디은 복붙으로 하는겁니다8.', '2023-01-04' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(3, 'acc', 3, '코디은 복붙으로 하는겁니다.9', '2023-01-05' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(4, 'abb', 1, '코디은 복붙으로 하는겁니다.10', '2023-01-06' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(4, 'abc', 2, '코디은 복붙으로 하는겁니다.11', '2023-01-07' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(4, 'acc', 3, '코디은 복붙으로 하는겁니다.12', '2023-01-08' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(5, 'abb', 1, '코디은 복붙으로 하는겁니다.14', '2023-01-09' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(5, 'abc', 2, '코디은 복붙으로 하는겁니다.15', '2023-01-10' , '');
INSERT INTO comment(board_id, id, teacher_id, content, date, image)  VALUES(5, 'acc', 3, '코디은 복붙으로 하는겁니다.16', '2023-01-11' , '');

-- 대댓글
INSERT INTO recomment(comment_id,content,image ) VALUES(4,'감사합니다1','');
INSERT INTO recomment(comment_id,content,image ) VALUES(5,'감사합니다2','');
INSERT INTO recomment(comment_id,content,image ) VALUES(6,'감사합니다3','');
INSERT INTO recomment(comment_id,content,image ) VALUES(7,'감사합니다4','');
INSERT INTO recomment(comment_id,content,image ) VALUES(8,'감사합니다5','');
INSERT INTO recomment(comment_id,content,image ) VALUES(9,'감사합니다6','');
INSERT INTO recomment(comment_id,content,image ) VALUES(10,'감사합니다7','');

-- 관리자
INSERT INTO admin(id,password ) VALUES('admin','1234');

-- 멘토
INSERT INTO mentor(id, kategorie_num, email, name, phone, content, career) VALUES('abb', 1, 'gasdfd@naver.com', '멘토1', '010-1111-1111', '저는멘토1입니다', '백엔드2년' );
INSERT INTO mentor(id, kategorie_num, email, name, phone, content, career) VALUES('abc', 1, 'gasdfd@naver.com', '멘토2', '010-1111-1111', '저는멘토2입니다', '백엔드3년' );
INSERT INTO mentor(id, kategorie_num, email, name, phone, content, career) VALUES('acc', 2, 'gasdfd@naver.com', '멘토3', '010-1111-1111', '저는멘토3입니다', '백엔드4년' );
INSERT INTO mentor(id, kategorie_num, email, name, phone, content, career) VALUES('add', 2, 'gasdfd@naver.com', '멘토4', '010-1111-1111', '저는멘토4입니다', '백엔드5년' );

-- 멘토링
INSERT INTO mentoring( id, title, content, rule, time, price) 
VALUES('abb',  '신입~주니어 개발자 취직, 이력서&프론트엔드 상담 및 고민, 커리어 및 로드맵 설계', '우아한형제들에서 우아한테크코스의 프론트엔드 교육을 진행하는 개발자 장현석입니다.', '학생 혹은 주니어 연차의 개발자 분들중 이끌어주는 선배/멘토 개발자가', '1회 멘토링 : 30분 ', '27,500원 ' );
INSERT INTO mentoring( id, title, content, rule, time, price) 
VALUES('abc',  '신입~주니어 개발자 취직, 이력서&프론트엔드 상담 및 고민, 커리어 및 로드맵 설계', '우아한형제들에서 우아한테크코스의 프론트엔드 교육을 진행하는 개발자 장현석입니다.', '학생 혹은 주니어 연차의 개발자 분들중 이끌어주는 선배/멘토 개발자가', '1회 멘토링 : 30분 ', '27,500원 ' );
INSERT INTO mentoring( id, title, content, rule, time, price) 
VALUES('acc',  '신입~주니어 개발자 취직, 이력서&프론트엔드 상담 및 고민, 커리어 및 로드맵 설계', '우아한형제들에서 우아한테크코스의 프론트엔드 교육을 진행하는 개발자 장현석입니다.', '학생 혹은 주니어 연차의 개발자 분들중 이끌어주는 선배/멘토 개발자가', '1회 멘토링 : 30분 ', '27,500원 ' );
INSERT INTO mentoring( id, title, content, rule, time, price) 
VALUES('add',  '신입~주니어 개발자 취직, 이력서&프론트엔드 상담 및 고민, 커리어 및 로드맵 설계', '우아한형제들에서 우아한테크코스의 프론트엔드 교육을 진행하는 개발자 장현석입니다.', '학생 혹은 주니어 연차의 개발자 분들중 이끌어주는 선배/멘토 개발자가', '1회 멘토링 : 30분 ', '27,500원 ' );


-- 강의 별점
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(1, 'abb', '강의가 너무 알차다1', 10 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(2, 'abb', '강의가 너무 알차다2', 9 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(3, 'abb', '강의가 너무 알차다3', 7 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(1, 'abc', '강의가 너무 알차다4', 9 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(2, 'abc', '강의가 너무 알차다5', 6 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(3, 'abc', '강의가 너무 알차다6', 5 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(1, 'acc', '강의가 너무 알차다7', 8 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(2, 'acc', '강의가 너무 알차다8', 8 );
INSERT INTO lecture_grade(lecture_id, id, content, score) VALUES(3, 'acc', '강의가 너무 알차다9', 9 );

-- 멘토링 별점
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(1, 'abb', '강의가 너무 알차다1', 0 );
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(2, 'abb', '강의가 너무 알차다2', 9 );
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(3, 'abb', '강의가 너무 알차다3', 7);
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(1, 'abc', '강의가 너무 알차다4', 9);
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(2, 'abc', '강의가 너무 알차다5', 6);
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(3, 'abc', '강의가 너무 알차다6', 5 );
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(1, 'acc', '강의가 너무 알차다7', 8 );
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(2, 'acc', '강의가 너무 알차다8', 8 );
INSERT INTO mentoring_grade(mentoring_id, id, content, score) VALUES(3, 'acc', '강의가 너무 알차다9', 9 );

-- 1대1 질문
INSERT INTO inquiry_board( title, content, date, email) VALUES('강의를 취소하고싶은데 어떻게 해야하나요 ?', '강의가 너무 부실합니다 ','2022-12-11','qwass@naver.com');
INSERT INTO inquiry_board( title, content, date, email) VALUES('강의 보유기간 질문', '강의는 영구소장이 불가능한가요 ?','2022-12-12','ncqwksc@naver.com');
INSERT INTO inquiry_board( title, content, date, email) VALUES('다른 계정에서 이용하고 싶어요', '어떻게하나요','2022-12-13','fjhdfv@naver.com');
INSERT INTO inquiry_board( title, content, date, email) VALUES('푸쉬 알림 취소어떻게하죠 ?', '귀찮아요 ','2022-12-14','jefgdfv@naver.com');

-- 질문 댓글 2
INSERT INTO comments(text, image ) VALUES('취소는 불가능 합니다','asdasdas');


-- 자주묻는 질문
INSERT INTO q_n_board(title, content, image) VALUES('로그인이 안될시', '카카오로그인을 이용해 보세요','');
INSERT INTO q_n_board(title, content, image) VALUES('강의가 재생이 안되요', '크롬을 이용해보세요 ','');
INSERT INTO q_n_board(title, content, image) VALUES('결제페이지가 안열려요', '모바일 환경에서는 잘안될수도있습니다','');
INSERT INTO q_n_board(title, content, image) VALUES('로그인이 안될시', '카카오로그인을 이용해 보세요','');

select * from member ;
select * from wish_list;
select * from listen_lecture;
select * from qna_board;
select * from teacher;
select * from comment;
select * from lecture;
select * from kategorie;
select * from dtail_kategorie;
select * from listener;
select * from recomment;
select * from admin;
select * from mentor;
select * from mentoring;
select * from lecture_grade;
select * from mentoring_grade;
select * from inquiry_board;
select * from comments;
select * from q_n_board;