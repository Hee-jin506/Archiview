-- 회원
DROP TABLE IF EXISTS acv_mbr RESTRICT;

-- 영화
DROP TABLE IF EXISTS acv_mov RESTRICT;

-- 태그
DROP TABLE IF EXISTS acv_tag RESTRICT;

-- 영화 후기
DROP TABLE IF EXISTS acv_rv RESTRICT;

-- 태그_게시물
DROP TABLE IF EXISTS acv_tag_post RESTRICT;

-- 비밀번호 힌트 질문
DROP TABLE IF EXISTS acv_pw_hint_q RESTRICT;

-- 저장 이력
DROP TABLE IF EXISTS acv_save RESTRICT;

-- 영화 포스터
DROP TABLE IF EXISTS acv_pstr RESTRICT;

-- 회원 상태
DROP TABLE IF EXISTS acv_mbr_stat RESTRICT;

-- 장르
DROP TABLE IF EXISTS acv_gnr RESTRICT;

-- 영화 스틸컷
DROP TABLE IF EXISTS acv_stc RESTRICT;

-- 영화_장르
DROP TABLE IF EXISTS acv_gnr_mov RESTRICT;

-- 좋아요 이력
DROP TABLE IF EXISTS acv_like RESTRICT;

-- 팔로우 이력
DROP TABLE IF EXISTS acv_flw RESTRICT;

-- 팔로우 유형
DROP TABLE IF EXISTS acv_flw_able RESTRICT;

-- 좋아요 유형
DROP TABLE IF EXISTS acv_lk_able RESTRICT;

-- 신고 이력
DROP TABLE IF EXISTS acv_rp RESTRICT;

-- 신고 유형
DROP TABLE IF EXISTS acv_rp_able RESTRICT;

-- 댓글
DROP TABLE IF EXISTS acv_cmt RESTRICT;

-- 폰트
DROP TABLE IF EXISTS acv_txt_font RESTRICT;

-- 로그인유형
DROP TABLE IF EXISTS acv_lgn_type RESTRICT;

-- 회원
CREATE TABLE acv_mbr (
  mno       INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  auth      INTEGER     NOT NULL COMMENT '권한', -- 권한
  name      VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
  ltno      INTEGER     NOT NULL COMMENT '로그인유형번호', -- 로그인유형번호
  email     VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
  pw        VARCHAR(30) NOT NULL COMMENT '비밀번호', -- 비밀번호
  nick      VARCHAR(50) NULL     COMMENT '별명', -- 별명
  photo     MEDIUMTEXT  NULL     COMMENT '사진', -- 사진
  intro     MEDIUMTEXT  NULL     COMMENT '소개글', -- 소개글
  qno       INTEGER     NULL     COMMENT '비밀번호 힌트 질문 번호', -- 비밀번호 힌트 질문 번호
  pw_hint_a VARCHAR(50) NULL     COMMENT '비밀번호 힌트 정답', -- 비밀번호 힌트 정답
  rdt       DATETIME    NOT NULL DEFAULT now() COMMENT '회원 가입일', -- 회원 가입일
  stno      INTEGER     NULL     COMMENT '회원 상태 번호', -- 회원 상태 번호
  stat_mdt  DATETIME    NULL     DEFAULT now() COMMENT '상태 변경일' -- 상태 변경일
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
    nick ASC -- 별명
  );

-- 회원 유니크 인덱스4
CREATE UNIQUE INDEX UIX_acv_mbr4
  ON acv_mbr ( -- 회원
    email ASC -- 이메일
  );

ALTER TABLE acv_mbr
  MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 영화
CREATE TABLE acv_mov (
  mvno      INTEGER     NOT NULL COMMENT '영화 번호', -- 영화 번호
  title     VARCHAR(50) NOT NULL COMMENT '영화 제목', -- 영화 제목
  dir       VARCHAR(50) NOT NULL COMMENT '영화 감독', -- 영화 감독
  eng_title VARCHAR(50) NOT NULL COMMENT '영화 영문명', -- 영화 영문명
  runtime   INTEGER     NOT NULL COMMENT '상영시간', -- 상영시간
  odt       DATE        NOT NULL COMMENT '개봉일', -- 개봉일
  actors    MEDIUMTEXT  NOT NULL COMMENT '출연', -- 출연
  syn       MEDIUMTEXT  NOT NULL COMMENT '시놉시스', -- 시놉시스
  nation    VARCHAR(50) NOT NULL COMMENT '국가명', -- 국가명
  stat      INTEGER     NOT NULL COMMENT '상태', -- 상태
  rdt       DATETIME    NOT NULL DEFAULT now() COMMENT '등록일' -- 등록일
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

ALTER TABLE acv_mov
  MODIFY COLUMN mvno INTEGER NOT NULL AUTO_INCREMENT COMMENT '영화 번호';

-- 태그
CREATE TABLE acv_tag (
  tno   INTEGER     NOT NULL COMMENT '태그 번호', -- 태그 번호
  title VARCHAR(50) NOT NULL COMMENT '태그명', -- 태그명
  stat  INTEGER     NOT NULL COMMENT '상태', -- 상태
  rdt   DATETIME    NOT NULL DEFAULT now() COMMENT '등록일' -- 등록일
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

ALTER TABLE acv_tag
  MODIFY COLUMN tno INTEGER NOT NULL AUTO_INCREMENT COMMENT '태그 번호';

-- 영화 후기
CREATE TABLE acv_rv (
  rvno     INTEGER    NOT NULL COMMENT '영화 후기 번호', -- 영화 후기 번호
  stcno    INTEGER    NULL     COMMENT '스틸컷 번호', -- 스틸컷 번호
  mno      INTEGER    NOT NULL COMMENT '작성자 번호', -- 작성자 번호
  txt      MEDIUMTEXT NOT NULL COMMENT '후기내용', -- 후기내용
  txt_x    INTEGER    NOT NULL COMMENT '출력X좌표', -- 출력X좌표
  txt_y    INTEGER    NOT NULL COMMENT '출력Y좌표', -- 출력Y좌표
  tfno     INTEGER    NOT NULL COMMENT '폰트 번호', -- 폰트 번호
  txt_size INTEGER    NOT NULL COMMENT '글자크기', -- 글자크기
  rdt      DATE       NOT NULL DEFAULT now() COMMENT '등록일', -- 등록일
  mdt      DATETIME   NULL     COMMENT '수정일', -- 수정일
  stat     INTEGER    NOT NULL COMMENT '상태' -- 상태
)
COMMENT '영화 후기';

-- 영화 후기
ALTER TABLE acv_rv
  ADD CONSTRAINT PK_acv_rv -- 영화 후기 기본키
    PRIMARY KEY (
      rvno -- 영화 후기 번호
    );

ALTER TABLE acv_rv
  MODIFY COLUMN rvno INTEGER NOT NULL AUTO_INCREMENT COMMENT '영화 후기 번호';

-- 태그_게시물
CREATE TABLE acv_tag_post (
  tpno INTEGER NOT NULL COMMENT '태그_게시물 번호', -- 태그_게시물 번호
  rvno INTEGER NOT NULL COMMENT '영화 후기 번호', -- 영화 후기 번호
  tno  INTEGER NOT NULL COMMENT '태그 번호' -- 태그 번호
)
COMMENT '태그_게시물';

-- 태그_게시물
ALTER TABLE acv_tag_post
  ADD CONSTRAINT PK_acv_tag_post -- 태그_게시물 기본키
    PRIMARY KEY (
      tpno -- 태그_게시물 번호
    );

-- 태그_게시물 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_tag_post
  ON acv_tag_post ( -- 태그_게시물
    tno ASC,  -- 태그 번호
    rvno ASC  -- 영화 후기 번호
  );

ALTER TABLE acv_tag_post
  MODIFY COLUMN tpno INTEGER NOT NULL AUTO_INCREMENT COMMENT '태그_게시물 번호';

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

ALTER TABLE acv_pw_hint_q
  MODIFY COLUMN qno INTEGER NOT NULL AUTO_INCREMENT COMMENT '비밀번호 힌트 질문 번호';

-- 저장 이력
CREATE TABLE acv_save (
  sno  INTEGER  NOT NULL COMMENT '저장 이력 번호', -- 저장 이력 번호
  rvno INTEGER  NOT NULL COMMENT '영화 후기 번호', -- 영화 후기 번호
  mno  INTEGER  NOT NULL COMMENT '회원번호', -- 회원번호
  sdt  DATETIME NOT NULL DEFAULT now() COMMENT '저장일시' -- 저장일시
)
COMMENT '저장 이력';

-- 저장 이력
ALTER TABLE acv_save
  ADD CONSTRAINT PK_acv_save -- 저장 이력 기본키
    PRIMARY KEY (
      sno -- 저장 이력 번호
    );

-- 저장 이력 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_save
  ON acv_save ( -- 저장 이력
    mno ASC,  -- 회원번호
    rvno ASC  -- 영화 후기 번호
  );

ALTER TABLE acv_save
  MODIFY COLUMN sno INTEGER NOT NULL AUTO_INCREMENT COMMENT '저장 이력 번호';

-- 영화 포스터
CREATE TABLE acv_pstr (
  psno    INTEGER    NOT NULL COMMENT '포스터 번호', -- 포스터 번호
  mvno    INTEGER    NOT NULL COMMENT '영화 번호', -- 영화 번호
  ps_url  MEDIUMTEXT NOT NULL COMMENT '이미지 주소', -- 이미지 주소
  main_ps INTEGER    NOT NULL COMMENT '메인 포스터' -- 메인 포스터
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

ALTER TABLE acv_pstr
  MODIFY COLUMN psno INTEGER NOT NULL AUTO_INCREMENT COMMENT '포스터 번호';

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

ALTER TABLE acv_mbr_stat
  MODIFY COLUMN stno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원 상태 번호';

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

ALTER TABLE acv_gnr
  MODIFY COLUMN gno INTEGER NOT NULL AUTO_INCREMENT COMMENT '장르 번호';

-- 영화 스틸컷
CREATE TABLE acv_stc (
  stcno   INTEGER    NOT NULL COMMENT '스틸컷 번호', -- 스틸컷 번호
  mvno    INTEGER    NOT NULL COMMENT '영화 번호', -- 영화 번호
  stc_url MEDIUMTEXT NOT NULL COMMENT '이미지 주소' -- 이미지 주소
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

ALTER TABLE acv_stc
  MODIFY COLUMN stcno INTEGER NOT NULL AUTO_INCREMENT COMMENT '스틸컷 번호';

-- 영화_장르
CREATE TABLE acv_gnr_mov (
  gmno INTEGER NOT NULL COMMENT '영화_장르 번호', -- 영화_장르 번호
  gno  INTEGER NOT NULL COMMENT '장르 번호', -- 장르 번호
  mvno INTEGER NOT NULL COMMENT '영화 번호' -- 영화 번호
)
COMMENT '영화_장르';

-- 영화_장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT PK_acv_gnr_mov -- 영화_장르 기본키
    PRIMARY KEY (
      gmno -- 영화_장르 번호
    );

-- 영화_장르 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_gnr_mov
  ON acv_gnr_mov ( -- 영화_장르
    gno ASC,  -- 장르 번호
    mvno ASC  -- 영화 번호
  );

-- 좋아요 이력
CREATE TABLE acv_like (
  lno    INTEGER  NOT NULL COMMENT '좋아요 이력 번호', -- 좋아요 이력 번호
  mno    INTEGER  NOT NULL COMMENT '좋아요한 회원', -- 좋아요한 회원
  lano   INTEGER  NOT NULL COMMENT '좋아요된 대상 유형', -- 좋아요된 대상 유형
  target INTEGER  NOT NULL COMMENT '좋아요된 대상', -- 좋아요된 대상
  ldt    DATETIME NOT NULL DEFAULT now() COMMENT '좋아요 누른 일시' -- 좋아요 누른 일시
)
COMMENT '좋아요 이력';

-- 좋아요 이력
ALTER TABLE acv_like
  ADD CONSTRAINT PK_acv_like -- 좋아요 이력 기본키
    PRIMARY KEY (
      lno -- 좋아요 이력 번호
    );

-- 좋아요 이력 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_like
  ON acv_like ( -- 좋아요 이력
    mno ASC,    -- 좋아요한 회원
    target ASC, -- 좋아요된 대상
    lano ASC    -- 좋아요된 대상 유형
  );

ALTER TABLE acv_like
  MODIFY COLUMN lno INTEGER NOT NULL AUTO_INCREMENT COMMENT '좋아요 이력 번호';

-- 팔로우 이력
CREATE TABLE acv_flw (
  fno        INTEGER  NOT NULL COMMENT '팔로우 이력 번호', -- 팔로우 이력 번호
  flwing_mbr INTEGER  NOT NULL COMMENT '팔로우한 회원', -- 팔로우한 회원
  target     INTEGER  NOT NULL COMMENT '팔로우된 대상', -- 팔로우된 대상
  fdt        DATETIME NOT NULL DEFAULT now() COMMENT '팔로우한 일시', -- 팔로우한 일시
  fano       INTEGER  NOT NULL COMMENT '팔로우된 대상 유형' -- 팔로우된 대상 유형
)
COMMENT '팔로우 이력';

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT PK_acv_flw -- 팔로우 이력 기본키
    PRIMARY KEY (
      fno -- 팔로우 이력 번호
    );

-- 팔로우 이력 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_flw
  ON acv_flw ( -- 팔로우 이력
    flwing_mbr ASC, -- 팔로우한 회원
    target ASC,     -- 팔로우된 대상
    fano ASC        -- 팔로우된 대상 유형
  );

ALTER TABLE acv_flw
  MODIFY COLUMN fno INTEGER NOT NULL AUTO_INCREMENT COMMENT '팔로우 이력 번호';

-- 팔로우 유형
CREATE TABLE acv_flw_able (
  fano INTEGER     NOT NULL COMMENT '유형 번호', -- 유형 번호
  name VARCHAR(50) NOT NULL COMMENT '유형 이름' -- 유형 이름
)
COMMENT '팔로우 유형';

-- 팔로우 유형
ALTER TABLE acv_flw_able
  ADD CONSTRAINT PK_acv_flw_able -- 팔로우 유형 기본키
    PRIMARY KEY (
      fano -- 유형 번호
    );

-- 팔로우 유형 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_flw_able
  ON acv_flw_able ( -- 팔로우 유형
    name ASC -- 유형 이름
  );

ALTER TABLE acv_flw_able
  MODIFY COLUMN fano INTEGER NOT NULL AUTO_INCREMENT COMMENT '유형 번호';

-- 좋아요 유형
CREATE TABLE acv_lk_able (
  lano INTEGER     NOT NULL COMMENT '유형 번호', -- 유형 번호
  name VARCHAR(50) NOT NULL COMMENT '유형 이름' -- 유형 이름
)
COMMENT '좋아요 유형';

-- 좋아요 유형
ALTER TABLE acv_lk_able
  ADD CONSTRAINT PK_acv_lk_able -- 좋아요 유형 기본키
    PRIMARY KEY (
      lano -- 유형 번호
    );

-- 좋아요 유형 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_lk_able
  ON acv_lk_able ( -- 좋아요 유형
    name ASC -- 유형 이름
  );

ALTER TABLE acv_lk_able
  MODIFY COLUMN lano INTEGER NOT NULL AUTO_INCREMENT COMMENT '유형 번호';

-- 신고 이력
CREATE TABLE acv_rp (
  rno     INTEGER    NOT NULL COMMENT '신고 번호', -- 신고 번호
  mno     INTEGER    NOT NULL COMMENT '신고한 회원', -- 신고한 회원
  rano    INTEGER    NOT NULL COMMENT '신고된 대상 유형', -- 신고된 대상 유형
  target  INTEGER    NOT NULL COMMENT '신고된 대상번호', -- 신고된 대상번호
  rdt     DATETIME   NOT NULL DEFAULT now() COMMENT '신고한 일시', -- 신고한 일시
  content MEDIUMTEXT NULL     COMMENT '신고사유', -- 신고사유
  stat    INTEGER    NOT NULL COMMENT '처리 여부', -- 처리 여부
  pdt     DATETIME   NULL     COMMENT '처리 일시' -- 처리 일시
)
COMMENT '신고 이력';

-- 신고 이력
ALTER TABLE acv_rp
  ADD CONSTRAINT PK_acv_rp -- 신고 이력 기본키
    PRIMARY KEY (
      rno -- 신고 번호
    );

-- 신고 이력 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_rp
  ON acv_rp ( -- 신고 이력
    mno ASC,    -- 신고한 회원
    target ASC, -- 신고된 대상번호
    rano ASC    -- 신고된 대상 유형
  );

ALTER TABLE acv_rp
  MODIFY COLUMN rno INTEGER NOT NULL AUTO_INCREMENT COMMENT '신고 번호';

-- 신고 유형
CREATE TABLE acv_rp_able (
  rano INTEGER     NOT NULL COMMENT '유형 번호', -- 유형 번호
  name VARCHAR(50) NOT NULL COMMENT '유형 이름' -- 유형 이름
)
COMMENT '신고 유형';

-- 신고 유형
ALTER TABLE acv_rp_able
  ADD CONSTRAINT PK_acv_rp_able -- 신고 유형 기본키
    PRIMARY KEY (
      rano -- 유형 번호
    );

-- 신고 유형 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_rp_able
  ON acv_rp_able ( -- 신고 유형
    name ASC -- 유형 이름
  );

ALTER TABLE acv_rp_able
  MODIFY COLUMN rano INTEGER NOT NULL AUTO_INCREMENT COMMENT '유형 번호';

-- 댓글
CREATE TABLE acv_cmt (
  cno     INTEGER    NOT NULL COMMENT '댓글 번호', -- 댓글 번호
  rvno    INTEGER    NOT NULL COMMENT '영화 후기 번호', -- 영화 후기 번호
  odr     INTEGER    NOT NULL COMMENT '댓글순서', -- 댓글순서
  lvl     INTEGER    NOT NULL COMMENT '댓글단계', -- 댓글단계
  mno     INTEGER    NOT NULL COMMENT '댓글단 회원', -- 댓글단 회원
  content MEDIUMTEXT NOT NULL COMMENT '내용', -- 내용
  rdt     DATETIME   NOT NULL DEFAULT now() COMMENT '등록일', -- 등록일
  stat    INTEGER    NOT NULL COMMENT '상태', -- 상태
  mdt     DATETIME   NULL     COMMENT '수정일' -- 수정일
)
COMMENT '댓글';

-- 댓글
ALTER TABLE acv_cmt
  ADD CONSTRAINT PK_acv_cmt -- 댓글 기본키
    PRIMARY KEY (
      cno -- 댓글 번호
    );

-- 댓글 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_cmt
  ON acv_cmt ( -- 댓글
    odr ASC,  -- 댓글순서
    rvno ASC  -- 영화 후기 번호
  );

ALTER TABLE acv_cmt
  MODIFY COLUMN cno INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글 번호';

-- 폰트
CREATE TABLE acv_txt_font (
  tfno INTEGER     NOT NULL COMMENT '폰트 번호', -- 폰트 번호
  name VARCHAR(50) NOT NULL COMMENT '폰트명' -- 폰트명
)
COMMENT '폰트';

-- 폰트
ALTER TABLE acv_txt_font
  ADD CONSTRAINT PK_acv_txt_font -- 폰트 기본키
    PRIMARY KEY (
      tfno -- 폰트 번호
    );

-- 폰트 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_txt_font
  ON acv_txt_font ( -- 폰트
    name ASC -- 폰트명
  );

ALTER TABLE acv_txt_font
  MODIFY COLUMN tfno INTEGER NOT NULL AUTO_INCREMENT COMMENT '폰트 번호';

-- 로그인유형
CREATE TABLE acv_lgn_type (
  ltno INTEGER     NOT NULL COMMENT '로그인유형번호', -- 로그인유형번호
  name VARCHAR(50) NOT NULL COMMENT '유형명' -- 유형명
)
COMMENT '로그인유형';

-- 로그인유형
ALTER TABLE acv_lgn_type
  ADD CONSTRAINT PK_acv_lgn_type -- 로그인유형 기본키
    PRIMARY KEY (
      ltno -- 로그인유형번호
    );

-- 로그인유형 유니크 인덱스
CREATE UNIQUE INDEX UIX_acv_lgn_type
  ON acv_lgn_type ( -- 로그인유형
    name ASC -- 유형명
  );

ALTER TABLE acv_lgn_type
  MODIFY COLUMN ltno INTEGER NOT NULL AUTO_INCREMENT COMMENT '로그인유형번호';

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
  ADD CONSTRAINT FK_acv_lgn_type_TO_acv_mbr -- 로그인유형 -> 회원
    FOREIGN KEY (
      ltno -- 로그인유형번호
    )
    REFERENCES acv_lgn_type ( -- 로그인유형
      ltno -- 로그인유형번호
    );

-- 영화 후기
ALTER TABLE acv_rv
  ADD CONSTRAINT FK_acv_mbr_TO_acv_rv -- 회원 -> 영화 후기
    FOREIGN KEY (
      mno -- 작성자 번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 영화 후기
ALTER TABLE acv_rv
  ADD CONSTRAINT FK_acv_stc_TO_acv_rv -- 영화 스틸컷 -> 영화 후기
    FOREIGN KEY (
      stcno -- 스틸컷 번호
    )
    REFERENCES acv_stc ( -- 영화 스틸컷
      stcno -- 스틸컷 번호
    );

-- 영화 후기
ALTER TABLE acv_rv
  ADD CONSTRAINT FK_acv_txt_font_TO_acv_rv -- 폰트 -> 영화 후기
    FOREIGN KEY (
      tfno -- 폰트 번호
    )
    REFERENCES acv_txt_font ( -- 폰트
      tfno -- 폰트 번호
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
  ADD CONSTRAINT FK_acv_rv_TO_acv_tag_post -- 영화 후기 -> 태그_게시물
    FOREIGN KEY (
      rvno -- 영화 후기 번호
    )
    REFERENCES acv_rv ( -- 영화 후기
      rvno -- 영화 후기 번호
    );

-- 저장 이력
ALTER TABLE acv_save
  ADD CONSTRAINT FK_acv_mbr_TO_acv_save -- 회원 -> 저장 이력
    FOREIGN KEY (
      mno -- 회원번호
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 저장 이력
ALTER TABLE acv_save
  ADD CONSTRAINT FK_acv_rv_TO_acv_save -- 영화 후기 -> 저장 이력
    FOREIGN KEY (
      rvno -- 영화 후기 번호
    )
    REFERENCES acv_rv ( -- 영화 후기
      rvno -- 영화 후기 번호
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

-- 영화_장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT FK_acv_gnr_TO_acv_gnr_mov -- 장르 -> 영화_장르
    FOREIGN KEY (
      gno -- 장르 번호
    )
    REFERENCES acv_gnr ( -- 장르
      gno -- 장르 번호
    );

-- 영화_장르
ALTER TABLE acv_gnr_mov
  ADD CONSTRAINT FK_acv_mov_TO_acv_gnr_mov -- 영화 -> 영화_장르
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
      mno -- 좋아요한 회원
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 좋아요 이력
ALTER TABLE acv_like
  ADD CONSTRAINT FK_acv_lk_able_TO_acv_like -- 좋아요 유형 -> 좋아요 이력
    FOREIGN KEY (
      lano -- 좋아요된 대상 유형
    )
    REFERENCES acv_lk_able ( -- 좋아요 유형
      lano -- 유형 번호
    );

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT FK_acv_mbr_TO_acv_flw2 -- 회원 -> 팔로우 이력2
    FOREIGN KEY (
      flwing_mbr -- 팔로우한 회원
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 팔로우 이력
ALTER TABLE acv_flw
  ADD CONSTRAINT FK_acv_flw_able_TO_acv_flw -- 팔로우 유형 -> 팔로우 이력
    FOREIGN KEY (
      fano -- 팔로우된 대상 유형
    )
    REFERENCES acv_flw_able ( -- 팔로우 유형
      fano -- 유형 번호
    );

-- 신고 이력
ALTER TABLE acv_rp
  ADD CONSTRAINT FK_acv_rp_able_TO_acv_rp -- 신고 유형 -> 신고 이력
    FOREIGN KEY (
      rano -- 신고된 대상 유형
    )
    REFERENCES acv_rp_able ( -- 신고 유형
      rano -- 유형 번호
    );

-- 신고 이력
ALTER TABLE acv_rp
  ADD CONSTRAINT FK_acv_mbr_TO_acv_rp -- 회원 -> 신고 이력
    FOREIGN KEY (
      mno -- 신고한 회원
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 댓글
ALTER TABLE acv_cmt
  ADD CONSTRAINT FK_acv_mbr_TO_acv_cmt -- 회원 -> 댓글
    FOREIGN KEY (
      mno -- 댓글단 회원
    )
    REFERENCES acv_mbr ( -- 회원
      mno -- 회원번호
    );

-- 댓글
ALTER TABLE acv_cmt
  ADD CONSTRAINT FK_acv_rv_TO_acv_cmt -- 영화 후기 -> 댓글
    FOREIGN KEY (
      rvno -- 영화 후기 번호
    )
    REFERENCES acv_rv ( -- 영화 후기
      rvno -- 영화 후기 번호
    );