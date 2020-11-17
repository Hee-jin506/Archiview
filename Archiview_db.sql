-- 회원
DROP TABLE IF EXISTS acv_mbr RESTRICT;

-- 영화
DROP TABLE IF EXISTS acv_mov RESTRICT;

-- 태그
DROP TABLE IF EXISTS acv_tag RESTRICT;

-- 게시물
DROP TABLE IF EXISTS acv_post RESTRICT;

-- 태그_게시물
DROP TABLE IF EXISTS acv_tag_post RESTRICT;

-- 비밀번호 힌트 질문
DROP TABLE IF EXISTS acv_pw_hint_q RESTRICT;

-- 저장한 회원 게시물
DROP TABLE IF EXISTS acv_save RESTRICT;

-- 영화 포스터
DROP TABLE IF EXISTS acv_pstr RESTRICT;

-- 회원 상태
DROP TABLE IF EXISTS acv_mbr_stat RESTRICT;

-- 장르
DROP TABLE IF EXISTS acv_gnr RESTRICT;

-- 국가
DROP TABLE IF EXISTS acv_ctr RESTRICT;

-- 영화 스틸컷
DROP TABLE IF EXISTS acv_stc RESTRICT;

-- 영화 장르
DROP TABLE IF EXISTS acv_gnr_mov RESTRICT;

-- 좋아요 이력
DROP TABLE IF EXISTS acv_like RESTRICT;

-- 팔로우 이력
DROP TABLE IF EXISTS acv_flw RESTRICT;

-- 관리자
DROP TABLE IF EXISTS acv_mg RESTRICT;

-- 사용자
DROP TABLE IF EXISTS acv_user RESTRICT;

-- 회원
CREATE TABLE acv_mbr (
  mno       INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  photo     VARCHAR(255) NULL     COMMENT '사진', -- 사진
  intro     VARCHAR(255) NULL     COMMENT '소개글', -- 소개글
  pw_hint_a VARCHAR(50)  NOT NULL COMMENT '비밀번호 힌트 정답', -- 비밀번호 힌트 정답
  rdt       DATE         NOT NULL DEFAULT now() COMMENT '회원 가입일', -- 회원 가입일
  qno       INTEGER      NOT NULL COMMENT '비밀번호 힌트 질문 번호', -- 비밀번호 힌트 질문 번호
  stno      INTEGER      NOT NULL COMMENT '회원 상태 번호', -- 회원 상태 번호
  name      VARCHAR(50)  NOT NULL COMMENT '이름' -- 이름
)
COMMENT '회원';

-- 회원
ALTER TABLE acv_mbr
  ADD CONSTRAINT PK_acv_mbr -- 회원 기본키
    PRIMARY KEY (
      mno -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_mbr
  ON acv_mbr ( -- 회원
    name ASC -- 이름
  );

-- 영화
CREATE TABLE acv_mov (
  mvno      INTEGER      NOT NULL COMMENT '영화 번호', -- 영화 번호
  title     VARCHAR(50)  NOT NULL COMMENT '영화 제목', -- 영화 제목
  dir       VARCHAR(50)  NULL     COMMENT '영화 감독', -- 영화 감독
  eng_title VARCHAR(50)  NULL     COMMENT '영화 영문명', -- 영화 영문명
  runtime   INTEGER      NULL     COMMENT '상영시간', -- 상영시간
  pdt       INTEGER      NULL     COMMENT '제작연도', -- 제작연도
  odt       DATE         NULL     COMMENT '개봉일', -- 개봉일
  actors    VARCHAR(255) NULL     COMMENT '출연', -- 출연
  syn       VARCHAR(255) NULL     COMMENT '시놉시스', -- 시놉시스
  stat      INTEGER      NOT NULL COMMENT '상태', -- 상태
  rdt       DATE         NULL     DEFAULT now() COMMENT '등록일', -- 등록일
  cno       INTEGER      NULL     COMMENT '국가 번호' -- 국가 번호
)
COMMENT '영화';

-- 영화
ALTER TABLE acv_mov
  ADD CONSTRAINT PK_acv_mov -- 영화 기본키
    PRIMARY KEY (
      mvno -- 영화 번호
    );

-- 영화 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_mov
  ON acv_mov ( -- 영화
    title ASC -- 영화 제목
  );

-- 영화 인덱스
CREATE INDEX IX_acv_mov
  ON acv_mov( -- 영화
    eng_title ASC -- 영화 영문명
  );

-- 영화 인덱스2
CREATE INDEX IX_acv_mov2
  ON acv_mov( -- 영화
    dir ASC -- 영화 감독
  );

-- 태그
CREATE TABLE acv_tag (
  tno   INTEGER     NOT NULL COMMENT '태그 번호', -- 태그 번호
  title VARCHAR(50) NOT NULL COMMENT '태그명', -- 태그명
  stat  INTEGER     NOT NULL COMMENT '상태', -- 상태
  rdt   DATE        NOT NULL DEFAULT now() COMMENT '등록일' -- 등록일
)
COMMENT '태그';

-- 태그
ALTER TABLE acv_tag
  ADD CONSTRAINT PK_acv_tag -- 태그 기본키
    PRIMARY KEY (
      tno -- 태그 번호
    );

-- 태그 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_tag
  ON acv_tag ( -- 태그
    title ASC -- 태그명
  );

-- 게시물
CREATE TABLE acv_post (
  pno   INTEGER      NOT NULL COMMENT '게시물 번호', -- 게시물 번호
  text  VARCHAR(255) NOT NULL COMMENT '텍스트', -- 텍스트
  rdt   DATE         NOT NULL DEFAULT now() COMMENT '등록일', -- 등록일
  stat  INTEGER      NOT NULL COMMENT '상태', -- 상태
  mvno  INTEGER      NOT NULL COMMENT '영화 번호', -- 영화 번호
  stcno INTEGER      NULL     COMMENT '스틸컷 번호', -- 스틸컷 번호
  mno   INTEGER      NOT NULL COMMENT '작성자 회원 번호' -- 작성자 회원 번호
)
COMMENT '게시물';

-- 게시물
ALTER TABLE acv_post
  ADD CONSTRAINT PK_acv_post -- 게시물 기본키
    PRIMARY KEY (
      pno -- 게시물 번호
    );

-- 태그_게시물
CREATE TABLE acv_tag_post (
  tno INTEGER NOT NULL COMMENT '태그 번호', -- 태그 번호
  pno INTEGER NOT NULL COMMENT '게시물 번호' -- 게시물 번호
)
COMMENT '태그_게시물';

-- 태그_게시물
ALTER TABLE acv_tag_post
  ADD CONSTRAINT PK_acv_tag_post -- 태그_게시물 기본키
    PRIMARY KEY (
      tno, -- 태그 번호
      pno  -- 게시물 번호
    );

-- 비밀번호 힌트 질문
CREATE TABLE acv_pw_hint_q (
  qno INTEGER     NOT NULL COMMENT '비밀번호 힌트 질문 번호', -- 비밀번호 힌트 질문 번호
  qtn VARCHAR(50) NOT NULL COMMENT '비밀번호 힌트 질문 내용' -- 비밀번호 힌트 질문 내용
)
COMMENT '비밀번호 힌트 질문';

-- 비밀번호 힌트 질문
ALTER TABLE acv_pw_hint_q
  ADD CONSTRAINT PK_acv_pw_hint_q -- 비밀번호 힌트 질문 기본키
    PRIMARY KEY (
      qno -- 비밀번호 힌트 질문 번호
    );

-- 비밀번호 힌트 질문 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_pw_hint_q
  ON acv_pw_hint_q ( -- 비밀번호 힌트 질문
    qtn ASC -- 비밀번호 힌트 질문 내용
  );

-- 저장한 회원 게시물
CREATE TABLE acv_save (
  pno INTEGER NOT NULL COMMENT '게시물 번호', -- 게시물 번호
  mno INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '저장한 회원 게시물';

-- 저장한 회원 게시물
ALTER TABLE acv_save
  ADD CONSTRAINT PK_acv_save -- 저장한 회원 게시물 기본키
    PRIMARY KEY (
      pno, -- 게시물 번호
      mno  -- 회원번호
    );

-- 영화 포스터
CREATE TABLE acv_pstr (
  psno   INTEGER      NOT NULL COMMENT '포스터 번호', -- 포스터 번호
  ps_url VARCHAR(255) NOT NULL COMMENT '이미지 주소', -- 이미지 주소
  mvno   INTEGER      NOT NULL COMMENT '영화 번호' -- 영화 번호
)
COMMENT '영화 포스터';

-- 영화 포스터
ALTER TABLE acv_pstr
  ADD CONSTRAINT PK_acv_pstr -- 영화 포스터 기본키
    PRIMARY KEY (
      psno -- 포스터 번호
    );

-- 영화 포스터 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_pstr
  ON acv_pstr ( -- 영화 포스터
    ps_url ASC -- 이미지 주소
  );

-- 회원 상태
CREATE TABLE acv_mbr_stat (
  stno  INTEGER     NOT NULL COMMENT '회원 상태 번호', -- 회원 상태 번호
  title VARCHAR(50) NOT NULL COMMENT '회원 상태 이름' -- 회원 상태 이름
)
COMMENT '회원 상태';

-- 회원 상태
ALTER TABLE acv_mbr_stat
  ADD CONSTRAINT PK_acv_mbr_stat -- 회원 상태 기본키
    PRIMARY KEY (
      stno -- 회원 상태 번호
    );

-- 회원 상태 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_mbr_stat
  ON acv_mbr_stat ( -- 회원 상태
    title ASC -- 회원 상태 이름
  );

-- 장르
CREATE TABLE acv_gnr (
  gno   INTEGER     NOT NULL COMMENT '장르 번호', -- 장르 번호
  title VARCHAR(50) NOT NULL COMMENT '장르명' -- 장르명
)
COMMENT '장르';

-- 장르
ALTER TABLE acv_gnr
  ADD CONSTRAINT PK_acv_gnr -- 장르 기본키
    PRIMARY KEY (
      gno -- 장르 번호
    );

-- 장르 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_gnr
  ON acv_gnr ( -- 장르
    title ASC -- 장르명
  );

-- 국가
CREATE TABLE acv_ctr (
  cno  INTEGER     NOT NULL COMMENT '국가 번호', -- 국가 번호
  name VARCHAR(50) NOT NULL COMMENT '국가명' -- 국가명
)
COMMENT '국가';

-- 국가
ALTER TABLE acv_ctr
  ADD CONSTRAINT PK_acv_ctr -- 국가 기본키
    PRIMARY KEY (
      cno -- 국가 번호
    );

-- 국가 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_ctr
  ON acv_ctr ( -- 국가
    name ASC -- 국가명
  );

-- 영화 스틸컷
CREATE TABLE acv_stc (
  stcno   INTEGER      NOT NULL COMMENT '스틸컷 번호', -- 스틸컷 번호
  stc_url VARCHAR(255) NOT NULL COMMENT '이미지 주소', -- 이미지 주소
  mvno    INTEGER      NOT NULL COMMENT '영화 번호' -- 영화 번호
)
COMMENT '영화 스틸컷';

-- 영화 스틸컷
ALTER TABLE acv_stc
  ADD CONSTRAINT PK_acv_stc -- 영화 스틸컷 기본키
    PRIMARY KEY (
      stcno -- 스틸컷 번호
    );

-- 영화 스틸컷 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_stc
  ON acv_stc ( -- 영화 스틸컷
    stc_url ASC -- 이미지 주소
  );

-- 영화 장르
CREATE TABLE acv_gnr_mov (
  gno  INTEGER NOT NULL COMMENT '장르 번호', -- 장르 번호
  mvno INTEGER NOT NULL COMMENT '영화 번호' -- 영화 번호
)
COMMENT '영화 장르';

-- 영화 장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT PK_acv_gnr_mov -- 영화 장르 기본키
    PRIMARY KEY (
      gno,  -- 장르 번호
      mvno  -- 영화 번호
    );

-- 좋아요 이력
CREATE TABLE acv_like (
  pno INTEGER NOT NULL COMMENT '좋아요한 게시물 번호', -- 좋아요한 게시물 번호
  mno INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  ldt DATE    NOT NULL DEFAULT now() COMMENT '좋아요 누른 일시' -- 좋아요 누른 일시
)
COMMENT '좋아요 이력';

-- 좋아요 이력
ALTER TABLE acv_like
  ADD CONSTRAINT PK_acv_like -- 좋아요 이력 기본키
    PRIMARY KEY (
      pno, -- 좋아요한 게시물 번호
      mno  -- 회원번호
    );

-- 팔로우 이력
CREATE TABLE acv_flw (
  flwed_mbr  INTEGER NOT NULL COMMENT '팔로우된 회원번호', -- 팔로우된 회원번호
  flwing_mbr INTEGER NOT NULL COMMENT '팔로우한 회원번호', -- 팔로우한 회원번호
  fdt        DATE    NOT NULL DEFAULT now() COMMENT '팔로우한 일시' -- 팔로우한 일시
)
COMMENT '팔로우 이력';

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT PK_acv_flw -- 팔로우 이력 기본키
    PRIMARY KEY (
      flwed_mbr,  -- 팔로우된 회원번호
      flwing_mbr  -- 팔로우한 회원번호
    );

-- 관리자
CREATE TABLE acv_mg (
  mgno INTEGER     NOT NULL COMMENT '관리자 번호', -- 관리자 번호
  name VARCHAR(50) NOT NULL COMMENT '실명' -- 실명
)
COMMENT '관리자';

-- 관리자
ALTER TABLE acv_mg
  ADD CONSTRAINT PK_acv_mg -- 관리자 기본키
    PRIMARY KEY (
      mgno -- 관리자 번호
    );

-- 관리자 인덱스
CREATE INDEX IX_acv_mg
  ON acv_mg( -- 관리자
    name ASC -- 실명
  );

-- 사용자
CREATE TABLE acv_user (
  uno   INTEGER     NOT NULL COMMENT '사용자 번호', -- 사용자 번호
  email VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
  pw    VARCHAR(30) NOT NULL COMMENT '비밀번호' -- 비밀번호
)
COMMENT '사용자';

-- 사용자
ALTER TABLE acv_user
  ADD CONSTRAINT PK_acv_user -- 사용자 기본키
    PRIMARY KEY (
      uno -- 사용자 번호
    );

-- 사용자 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_user
  ON acv_user ( -- 사용자
    email ASC -- 이메일
  );

-- 회원
ALTER TABLE acv_mbr
  ADD CONSTRAINT FK_acv_pw_hint_q_TO_acv_mbr -- 비밀번호 힌트 질문 -> 회원
    FOREIGN KEY (
      qno -- 비밀번호 힌트 질문 번호
    )
    REFERENCES acv_pw_hint_q ( -- 비밀번호 힌트 질문
      qno -- 비밀번호 힌트 질문 번호
    );

-- 회원
ALTER TABLE acv_mbr
  ADD CONSTRAINT FK_acv_mbr_stat_TO_acv_mbr -- 회원 상태 -> 회원
    FOREIGN KEY (
      stno -- 회원 상태 번호
    )
    REFERENCES acv_mbr_stat ( -- 회원 상태
      stno -- 회원 상태 번호
    );

-- 회원
ALTER TABLE acv_mbr
  ADD CONSTRAINT FK_acv_user_TO_acv_mbr -- 사용자 -> 회원
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES acv_user ( -- 사용자
      uno -- 사용자 번호
    );

-- 영화
ALTER TABLE acv_mov
  ADD CONSTRAINT FK_acv_ctr_TO_acv_mov -- 국가 -> 영화
    FOREIGN KEY (
      cno -- 국가 번호
    )
    REFERENCES acv_ctr ( -- 국가
      cno -- 국가 번호
    );

-- 게시물
ALTER TABLE acv_post
  ADD CONSTRAINT FK_acv_mbr_TO_acv_post -- 회원 -> 게시물
    FOREIGN KEY (
      mno -- 작성자 회원 번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 게시물
ALTER TABLE acv_post
  ADD CONSTRAINT FK_acv_mov_TO_acv_post -- 영화 -> 게시물
    FOREIGN KEY (
      mvno -- 영화 번호
    )
    REFERENCES acv_mov ( -- 영화
      mvno -- 영화 번호
    );

-- 게시물
ALTER TABLE acv_post
  ADD CONSTRAINT FK_acv_stc_TO_acv_post -- 영화 스틸컷 -> 게시물
    FOREIGN KEY (
      stcno -- 스틸컷 번호
    )
    REFERENCES acv_stc ( -- 영화 스틸컷
      stcno -- 스틸컷 번호
    );

-- 태그_게시물
ALTER TABLE acv_tag_post
  ADD CONSTRAINT FK_acv_tag_TO_acv_tag_post -- 태그 -> 태그_게시물
    FOREIGN KEY (
      tno -- 태그 번호
    )
    REFERENCES acv_tag ( -- 태그
      tno -- 태그 번호
    );

-- 태그_게시물
ALTER TABLE acv_tag_post
  ADD CONSTRAINT FK_acv_post_TO_acv_tag_post -- 게시물 -> 태그_게시물
    FOREIGN KEY (
      pno -- 게시물 번호
    )
    REFERENCES acv_post ( -- 게시물
      pno -- 게시물 번호
    );

-- 저장한 회원 게시물
ALTER TABLE acv_save
  ADD CONSTRAINT FK_acv_mbr_TO_acv_save -- 회원 -> 저장한 회원 게시물
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 저장한 회원 게시물
ALTER TABLE acv_save
  ADD CONSTRAINT FK_acv_post_TO_acv_save -- 게시물 -> 저장한 회원 게시물
    FOREIGN KEY (
      pno -- 게시물 번호
    )
    REFERENCES acv_post ( -- 게시물
      pno -- 게시물 번호
    );

-- 영화 포스터
ALTER TABLE acv_pstr
  ADD CONSTRAINT FK_acv_mov_TO_acv_pstr -- 영화 -> 영화 포스터
    FOREIGN KEY (
      mvno -- 영화 번호
    )
    REFERENCES acv_mov ( -- 영화
      mvno -- 영화 번호
    );

-- 영화 스틸컷
ALTER TABLE acv_stc
  ADD CONSTRAINT FK_acv_mov_TO_acv_stc -- 영화 -> 영화 스틸컷
    FOREIGN KEY (
      mvno -- 영화 번호
    )
    REFERENCES acv_mov ( -- 영화
      mvno -- 영화 번호
    );

-- 영화 장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT FK_acv_gnr_TO_acv_gnr_mov -- 장르 -> 영화 장르
    FOREIGN KEY (
      gno -- 장르 번호
    )
    REFERENCES acv_gnr ( -- 장르
      gno -- 장르 번호
    );

-- 영화 장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT FK_acv_mov_TO_acv_gnr_mov -- 영화 -> 영화 장르
    FOREIGN KEY (
      mvno -- 영화 번호
    )
    REFERENCES acv_mov ( -- 영화
      mvno -- 영화 번호
    );

-- 좋아요 이력
ALTER TABLE acv_like
  ADD CONSTRAINT FK_acv_mbr_TO_acv_like -- 회원 -> 좋아요 이력
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 좋아요 이력
ALTER TABLE acv_like
  ADD CONSTRAINT FK_acv_post_TO_acv_like -- 게시물 -> 좋아요 이력
    FOREIGN KEY (
      pno -- 좋아요한 게시물 번호
    )
    REFERENCES acv_post ( -- 게시물
      pno -- 게시물 번호
    );

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT FK_acv_mbr_TO_acv_flw -- 회원 -> 팔로우 이력
    FOREIGN KEY (
      flwed_mbr -- 팔로우된 회원번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT FK_acv_mbr_TO_acv_flw2 -- 회원 -> 팔로우 이력2
    FOREIGN KEY (
      flwing_mbr -- 팔로우한 회원번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 관리자
ALTER TABLE acv_mg
  ADD CONSTRAINT FK_acv_user_TO_acv_mg -- 사용자 -> 관리자
    FOREIGN KEY (
      mgno -- 관리자 번호
    )
    REFERENCES acv_user ( -- 사용자
      uno -- 사용자 번호
    );