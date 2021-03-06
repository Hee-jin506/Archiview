/* 장르 샘플 */
insert into acv_gnr(gno, title) values(1, '드라마');
insert into acv_gnr(gno, title) values(2, '판타지');
insert into acv_gnr(gno, title) values(3, '서부');
insert into acv_gnr(gno, title) values(4, '공포');
insert into acv_gnr(gno, title) values(5, '로맨스');
insert into acv_gnr(gno, title) values(6, '모험');
insert into acv_gnr(gno, title) values(7, '스릴러');
insert into acv_gnr(gno, title) values(8, '느와르');
insert into acv_gnr(gno, title) values(9, '컬트');
insert into acv_gnr(gno, title) values(10, '다큐멘터리');
insert into acv_gnr(gno, title) values(11, '코미디');
insert into acv_gnr(gno, title) values(12, '가족');
insert into acv_gnr(gno, title) values(13, '미스터리');
insert into acv_gnr(gno, title) values(14, '전쟁');
insert into acv_gnr(gno, title) values(15, '애니메이션');
insert into acv_gnr(gno, title) values(16, '범죄');
insert into acv_gnr(gno, title) values(17, '뮤지컬');
insert into acv_gnr(gno, title) values(18, 'SF');
insert into acv_gnr(gno, title) values(19, '액션');
insert into acv_gnr(gno, title) values(20, '무협');
insert into acv_gnr(gno, title) values(21, '에로');
insert into acv_gnr(gno, title) values(22, '서스펜스');
insert into acv_gnr(gno, title) values(23, '서사');
insert into acv_gnr(gno, title) values(24, '블랙코미디');
insert into acv_gnr(gno, title) values(25, '실험');

/* 폰트 샘플 */
insert into acv_txt_font(tfno, name) values(1, '지마켓 산스');
insert into acv_txt_font(tfno, name) values(2, '검은 고딕');
insert into acv_txt_font(tfno, name) values(3, '레코체');
insert into acv_txt_font(tfno, name) values(4, '쿠키런체');
insert into acv_txt_font(tfno, name) values(5, '안동엄마까투리체');
insert into acv_txt_font(tfno, name) values(6, '안동월영교체');
insert into acv_txt_font(tfno, name) values(7, '월인석보체');
insert into acv_txt_font(tfno, name) values(8, '간이벽온방체');
insert into acv_txt_font(tfno, name) values(9, '윤고래체');
insert into acv_txt_font(tfno, name) values(10, '김남윤체');
insert into acv_txt_font(tfno, name) values(11, '밝은체');
insert into acv_txt_font(tfno, name) values(12, '연성체');
insert into acv_txt_font(tfno, name) values(13, '제주한라산체');
insert into acv_txt_font(tfno, name) values(14, 'Pangram Sans');
insert into acv_txt_font(tfno, name) values(15, 'Alliance Font Family');
insert into acv_txt_font(tfno, name) values(16, 'Calibre');
insert into acv_txt_font(tfno, name) values(17, 'Manrope');

/* 로그인 유형 샘플 */
insert into acv_lgn_type(ltno, name) values(1, '일반');
insert into acv_lgn_type(ltno, name) values(2, '구글');
insert into acv_lgn_type(ltno, name) values(3, '카카오');

/* 비밀번호 힌트 질문 유형 샘플 */
insert into acv_pw_hint_q(qno, qtn) values(1, '내가 키우는 애완 동물의 이름은?');
insert into acv_pw_hint_q(qno, qtn) values(2, '가장 기억에 남는 선생님의 성함은?');
insert into acv_pw_hint_q(qno, qtn) values(3, '어머니의 고향은?');
insert into acv_pw_hint_q(qno, qtn) values(4, '아버지의 고향은?');
insert into acv_pw_hint_q(qno, qtn) values(5, '가장 친한 친구의 이름은?');

/* 좋아요 유형 샘플 */
insert into acv_lk_able(lano, name) value(1, '후기');
insert into acv_lk_able(lano, name) value(2, '댓글');

/* 회원 상태 샘플 */
insert into acv_mbr_stat(stno, title) value(1, '활동중');
insert into acv_mbr_stat(stno, title) value(2, '정지');
insert into acv_mbr_stat(stno, title) value(3, '탈퇴');

/* 팔로우 유형 샘플 */
insert into acv_flw_able(fano, name) value(1, '회원');
insert into acv_flw_able(fano, name) value(2, '태그');

/* 신고 유형 샘플 */
insert into acv_rp_able(rano, name) value(1, '회원');
insert into acv_rp_able(rano, name) value(2, '후기');
insert into acv_rp_able(rano, name) value(3, '댓글');
insert into acv_rp_able(rano, name) value(4, '태그');

/* 태그 샘플 */
insert into acv_tag(tno, title, stat)  value(1, '명작', 1);
insert into acv_tag(tno, title, stat)  value(2, '죽기 전에 봐야할 영화', 1);
insert into acv_tag(tno, title, stat)  value(3, '인생작', 1);
insert into acv_tag(tno, title, stat)  value(4, '힐링 영화', 1);
insert into acv_tag(tno, title, stat)  value(5, '킬링타임', 1);
insert into acv_tag(tno, title, stat)  value(6, 'B급 감성', 1);
insert into acv_tag(tno, title, stat)  value(7, '노잼', 1);
insert into acv_tag(tno, title, stat)  value(8, '스토리 너무 뻔함', 1);
insert into acv_tag(tno, title, stat)  value(9, '경이롭다', 1);
insert into acv_tag(tno, title, stat)  value(10, '미쳤다', 1);
insert into acv_tag(tno, title, stat)  value(11, '스포일러 있음', 1);
insert into acv_tag(tno, title, stat)  value(12, '비트모비스', 1);

/* 회원 샘플 */
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(1, 1, '스티븐잡스', 1, 'acv1@test.com', password('1111'), '스티븐잡스', '9d75dbe5-92fc-4c62-a0ed-116178f0f32a', 
'iphone 12 mini comming soon', 1, '팀쿡', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(2, 1, '팀쿡', 1, 'acv2@test.com', password('2222'), '팀쿡', 'de4978dd-45e9-4de5-b3ed-0db57671e37b',
'mac mini nice product', 2, '스티븐잡스', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(3, 1, '이건목', 2, 'acv3@test.com', password('3333'), '자바171기이건목', 'b302ea4f-c024-4dea-a81a-ca9925835294',
'코딩몽키', 2, '엄진영', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(4, 1, '김찬구', 3, 'acv4@test.com', password('4444'), '포켓몬박사', '5dcc75cc-5d23-48c6-b4f3-3cbf6475296c',
'포켓몬 도감 만드실 개발자 구함', 5, '김태희', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(5, 1, '엄영진', 1, 'acv5@test.com', password('5555'), 'javaMaster', 'c006dc41-f6b7-455b-9299-b07b4a65fce4',
'Hul과 Null의 차이', 4, '강원도', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(6, 1, '김태희', 1, 'acv6@test.com', password('6666'), '영업왕이될꺼야', '0ffece29-0d63-448d-ba8a-8c450f0d3f0d',
'이것이 기술 영업이다', 1, '도비', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(7, 1, '최희진', 1, 'acv7@test.com', password('7777'), '청축키보드', 'b544b804-fb66-4834-bc16-1a5dc0a3657d',
'키보드는 기계식이지', 1, '쏭', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(8, 1, '류승희', 2, 'acv8@test.com', password('8888'), '타래', '0ffece29-0d63-448d-ba8a-8c450f0d3f0d',
'타래가 쵝오야', 1, '타래', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(9, 1, '이용민', 3, 'acv9@test.com', password('9999'), '스트릿패션', 'fabfbea9-1a38-4c3e-83c2-de0a47cb7524',
'리셀가 80만원', 1, '캔디', 1);

/* 팔로우 이력 샘플*/
insert into acv_flw(fno, flwing_mbr, target, fano) 
values(1, 2, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(2, 3, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(3, 4, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(4, 5, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(5, 6, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(6, 7, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(7, 8, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano) 
values(8, 9, 1, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(9, 3, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(10, 4, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(11, 5, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(12, 6, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(13, 7, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(14, 8, 2, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(15, 4, 3, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(16, 5, 3, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(17, 6, 3, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(18, 6, 3, 2);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(19, 1, 9, 1);

insert into acv_flw(fno, flwing_mbr, target, fano)
values(20, 1, 8, 1);

insert into acv_flw(flwing_mbr, target, fano) 
values(1, 3, 2);
insert into acv_flw(flwing_mbr, target, fano) 
values(1, 4, 2);

/*영화 샘플*/
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(1, '무현, 두 도시 이야기', '전인환', 'Moo-hyun, Tale of Two Cities', 124, '2016-10-26', 
'노무현,김원명,김하연,백승영,조덕희', 
'2000년 부산 그리고 2016년 여수
다른 시대, 같은 꿈을 향한 노무현과 백무현의 도전
미처 말하지 못했던 그들의 이야기를 최종판으로 만난다!
김원명 작가는 사회 곳곳에서 일어나는 부조리한 현상에 고민하던 중, 어린 시절 아버지의 동지인 노무현과의 만남을 떠올린다. 
어느덧 그가 우리 곁을 홀연히 떠난 지 일곱 번째 오월을 맞아 원명은 무현과 인연이 있는 사람들을 찾아 나선다.
2000년 부산 총선에 출마한 노무현은 지역주의 해소와 권위주의 타파에 열정을 쏟지만 현실은 녹록치 않고 
2016년 여수 총선에 출마한 백무현은 다른 당의 유력후보에 맞서 최선을 다하지만 또 다른 지역주의 벽에 부딪히는데…
더 나은 세상을 향한 그들의 치열했던 도전을 미공개 영상으로 만난다!', 
'한국', 1, 152183);


/*스틸컷 샘플*/
insert into acv_stc(mvno)
values(1);

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170816_237/15028507560937wWpL_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170816_246/1502850756536szMwe_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_170/1502069264980Amq9T_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_298/1502069265264lPHv3_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_196/1502069265369T7hcS_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_31/15020692655762aL9i_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_268/150206926577953hp4_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(mvno, stc_url)
values(1, 'https://movie-phinf.pstatic.net/20170807_193/15020692659935l53K_JPEG/movie_image.jpg?type=m427_320_2');

/*포스터 샘플*/
insert into acv_pstr(psno, mvno, ps_url, main_ps)
values(1, 1, 'https://movie-phinf.pstatic.net/20170814_17/1502675963099mSfot_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(psno, mvno, ps_url, main_ps)
values(2, 1, 'https://movie-phinf.pstatic.net/20161026_271/1477463580542wovM2_JPEG/movie_image.jpg?type=m665_443_2', 0);


/*영화 샘플*/
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(2, '순종', '김동민,이주훈', 'Obedience', 88, '2016-11-17', 
'김영화,김은혜,한성국,최강희,최수종',
'우간다 내전으로 상처받은 사람들이 모여 사는 딩기디 마을.
반군에게 부모가 잔인하게 살해당하는 모습을 목격했던 아이들은 트라우마로 심한 발작을 일으키는데...
이들을 사랑으로 보살피는 김은혜 선교사. 
하지만 김 선교사는 살아생전 가족들을 가난의 굴레에 던져놓은 채, 
딩기디 마을 사람들을 보살폈던 아버지에 대한 원망을 지우지 못한다.
한편, 중동 테러단체 IS의 주민학살 등 온갖 만행에 견디다 못해
레바논으로 탈출한 알리는 세상과의 문을 닫고 헤어진 엄마를 그리워하며 힘겨운 하루하루를 지샌다. 
상처받은 난민친구들과 함께 모여 살던 알리는 한국의 김영화 선교사를 만나고, 변화를 겪기 시작하는데...
과연 이들의 상처는 치유될 것인가!', 
'한국', 1, 154347);

/*스틸컷 샘플*/
insert into acv_stc(mvno)
values(2);

insert into acv_stc(mvno, stc_url)
values(2, 'https://movie-phinf.pstatic.net/20161005_293/1475628867935FG8GR_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(2, 'https://movie-phinf.pstatic.net/20161012_48/14762359440663t467_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(2, 'https://movie-phinf.pstatic.net/20161012_58/14762359442496JxCB_JPEG/movie_image.jpg?type=m665_443_2');

/*포스터 샘플*/
insert into acv_pstr(mvno, ps_url, main_ps)
values(2, 'https://movie-phinf.pstatic.net/20161024_276/1477272601802XgGy1_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(mvno, ps_url, main_ps)
values(2, 'https://movie-phinf.pstatic.net/20161014_145/1476432490724174nM_JPEG/movie_image.jpg?type=m665_443_2', 0);

/*영화 샘플*/
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(3, '연애담', '이현주', 'Our Love Story', 99, '2016-11-17', 
'이상희,류아벨,박근록,임성미,김종수', 
'더할 나위 없이 따뜻했던 우리의 연애담을 들려드립니다.
미술을 공부하는 윤주(이상희). 졸업 전시를 준비하던 중 자꾸 눈길이 가는 한 사람을 만나게 된다. 
살짝 마주친 눈빛에서 느껴진 따뜻함에 윤주는 점점 마음이 이끌리기 시작한다.  
아르바이트를 하며 꿈을 찾아가는 지수(류선영). 추운 겨울 어느 날, 나를 따뜻하게 바라봐주는 한 사람을 만나게 된다.
얼마 후, 그 사람을 다시 만난 지수는  그 사람에게 마음을 이어나가려 손을 내밀어 본다.  
두 사람의 마음이 이어진 가장 행복하고 따뜻했던 이 순간은 정말 영원할 수 있을까…',
'한국', 1, 149481);

/*포스터 샘플*/
insert into acv_pstr(mvno, ps_url, main_ps)
values(3, 'https://movie-phinf.pstatic.net/20161028_162/1477618609681NUghJ_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(mvno, ps_url, main_ps)
values(3, 'https://movie-phinf.pstatic.net/20161024_152/1477284828563SyUai_JPEG/movie_image.jpg?type=m665_443_2', 0);


/* 영화 장르 샘플*/
insert into acv_gnr_mov(gmno, gno, mvno) 
values(1, 10, 1);

insert into acv_gnr_mov(gmno, gno, mvno) 
values(2, 1, 2);

insert into acv_gnr_mov(gmno, gno, mvno) 
values(3, 10, 2);

insert into acv_gnr_mov(gno, mvno) 
values(1, 3);

insert into acv_gnr_mov(gno, mvno) 
values(5, 3);

/*영화 샘플*/
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(4, '형', '권수경', 'MY ANNOYING BROTHER', 110, '2016-11-23', 
'조정석,디오,박신혜,김강현,지대한', 
'“살다 보니까 니가 내 인생에 도움이 되는 날이 온다?” 
뻔뻔한 사기꾼, 동생 핑계로 가석방의 기회를 물었다!
유도 국가대표 고두영(도경수)은 경기 도중 불의의 사고를 당하게 되고 
이 소식을 들은 사기전과 10범의 형 고두식(조정석)은 눈물의 석방 사기극을 펼친다! 
“형은 개뿔, 제발 내 인생에서 꺼져!”  형이 돌아오고 인생이 더 깜깜해졌다!   
하루 아침에 앞이 깜깜해진 동생을 핑계로 1년간 보호자 자격으로 가석방 된 두식! 
15년동안 단 한번도 연락이 없던 뻔뻔한 형이 집으로 돌아오고  보호자 노릇은커녕 ‘두영’의 삶을 더 엉망진창으로 만드는데…. 
남보다 못한 형제의 예측불허 동거가 시작된다!', 
'한국', 1, 142803);

/*스틸컷 샘플*/
insert into acv_stc(mvno)
values(3);

insert into acv_stc(mvno, stc_url)
values(3, 'https://movie-phinf.pstatic.net/20161024_208/1477276440225QuosM_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(3, 'https://movie-phinf.pstatic.net/20161024_105/1477276440617SoOFq_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(3, 'https://movie-phinf.pstatic.net/20161024_265/1477276440726EDpbS_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno)
values(4);

insert into acv_stc(mvno, stc_url)
values(4, 'https://movie-phinf.pstatic.net/20161020_136/14769419489932Nqtl_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(4, 'https://movie-phinf.pstatic.net/20161020_220/1476941949335BE550_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(4, 'https://movie-phinf.pstatic.net/20161024_162/1477288349850Cn1w2_JPEG/movie_image.jpg?type=m665_443_2');


/*포스터 샘플*/
insert into acv_pstr(mvno, ps_url, main_ps)
values(4, 'https://movie-phinf.pstatic.net/20161123_110/1479885421852lTvQa_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(mvno, ps_url, main_ps)
values(4, 'https://movie-phinf.pstatic.net/20161111_74/1478853017963NqT1U_JPEG/movie_image.jpg?type=m665_443_2', 0);

/* 영화 장르 샘플*/
insert into acv_gnr_mov(gno, mvno) 
values(1, 4);

insert into acv_gnr_mov(gno, mvno) 
values(11, 4);

/*영화 샘플*/
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(5, '나의 살던 고향은', '류종헌', 'OGURYEO', 95, '2016-11-24', 
'김용옥', 
'고구려는 도올!시간을 초월한 숨결이 생생히 살아있던 고구려,  
바람 불고 추웠던 만주벌판에서 느껴본 발해, 
나이 칠십에야 처음 찾아왔다고 한탄했던  우리 모두의 뿌리를 찾아 떠나는 뜨거운 여정!   
도올 선생님과 함께 떠나는 황홀한 시간여행!  지금, 출발합니다!', 
'한국', 1, 155541);

insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(6, '도굴', '박정배', 'Collectors, 2020', 114, '2020-11-04',
'이제훈,조우진,신혜선', 
'“고물인 줄 알았는데 보물이었다?!”
땅 파서 장사하는 도굴꾼들이 온다!
흙 맛만 봐도 보물을 찾아내는 타고난 천재 도굴꾼 강동구(이제훈).
 자칭 한국의 "인디아나 존스"로 불리는 고분벽화 도굴 전문가 존스 박사(조우진), 
전설의 삽질 달인 삽다리(임원희)를 만나 환상(?)의 팀플레이를 자랑하며 위험천만하고도 짜릿한 도굴의 판을 키운다.
 한편, 그의 재능을 알아본 고미술계 엘리트 큐레이터 윤실장(신혜선)은
 강동구에게 매력적이면서도 위험한 거래를 제안하는데...!
 황영사 금동불상, 고구려 고분벽화 그리고 서울 강남 한복판 선릉까지!
 팔수록 판이 커지는 도굴의 세계!
 급이 다른 삽질이 시작된다!', 
 '한국', 1, 193194);
 
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(7,'어벤져스:엔드게임', '안소니 루소', 'Avengers:Endgame,2019', 181, '2019-04-24',
'로버트 다우니 주니어,크리스 에반스,크리스 헴스워스,마크 러팔로,스칼렛 조핸슨,제레미 레너', 
'인피니티 워 이후 절반만 살아남은 지구
 마지막 희망이 된 어벤져스
 먼저 떠난 그들을 위해 모든 것을 걸었다!
 위대한 어벤져스
 운명을 바꿀 최후의 전쟁이 펼쳐진다!',
 '미국', 1, 136900);
 
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(8, '겨울왕국 2', '크리스 벅,제니퍼 리', 'Frozen 2, 2019', 103, '2019-11-21',
'크리스틴 벨,이디나 멘젤', 
'내 마법의 힘은 어디서 왔을까?
나를 부르는 저 목소리는 누구지?
어느 날 부턴가 의문의 목소리가 엘사를 부르고, 평화로운 아렌델 왕국을 위협한다.
트롤은 모든 것은 과거에서 시작되었음을 알려주며 엘사의 힘의 비밀과 진실을 찾아 떠나야한다고 조언한다.
위험에 빠진 아렌델 왕국을 구해야만 하는 엘사와 안나는 숨겨진 과거의 진실을 찾아
크리스토프, 올라프 그리고 스벤과 함께 위험천만한 놀라운 모험을 떠나게 된다.
자신의 힘을 두려워했던 엘사는 이제 이 모험을 헤쳐나가기에 자신의 힘이 충분하다고 믿어야만 하는데…
두려움을 깨고 새로운 운명을 만나다!', 
'미국', 1, 136873);
 
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(9, '아바타', '제임스 카메론', 'Avatar, 2009', 162, '2009-12-17',
'샘 워싱턴,조 샐다나,시고니 위버',
'지구 에너지 고갈 문제를 해결하기 위해
판도라 행성으로 향한 인류는 원주민 ‘나비족’과 대립하게 된다.
이 과정에서, 전직 해병대원 제이크 설리(샘 워싱턴)가
‘아바타’ 프로그램을 통해 ‘나비족’의 중심부에 투입되는데…
피할 수 없는 전쟁! 이 모든 운명을 손에 쥔 제이크!
그 누구도 넘보지 못한 역대급 세계가 열린다!
아바타: 인간과 ‘나비족’의 DNA를 결합해 만들어졌으며
링크룸을 통해 인간의 의식으로 원격 조종할 수 있는 새로운 생명체', 
'미국', 1, 62266);
 
insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(10, '괴물', '봉준호', 'The Host, 2006', 119, '2006-07-27',
'송강호,변희봉,박해일,배두나,고아성,오달수',
'한강, 가족, 그리고... (괴물) 가족의 사투가 시작된다 한강에 괴물이 나타났다
햇살 가득한 평화로운 한강 둔치 아버지(변희봉)가 운영하는 한강 매점, 늘어지게 낮잠 자던 강두(송강호)는 잠결에 들리는 ‘아빠’라는 소리에 벌떡 일어난다.
올해 중학생이 된 딸 현서(고아성)가 잔뜩 화가 나있다. 
꺼내놓기도 창피한 오래된 핸드폰과, 학부모 참관 수업에 술 냄새 풍기며 온 삼촌(박해일)때문이다. 
강두는 고민 끝에 비밀리에 모아 온 동전이 가득 담긴 컵라면 그릇을 꺼내 보인다. 
그러나 현서는 시큰둥할 뿐, 막 시작된 고모(배두나)의 전국체전 양궁경기에 몰두해 버린다.
그곳에서 괴물이 나타났다. 한강 둔치로 오징어 배달을 나간 강두, 우연히 웅성웅성 모여있는 사람들 속에서 특이한 광경을 목격하게 된다. 
생전 보도 못한 무언가가 한강다리에 매달려 움직이는 것이다. 
사람들은 마냥 신기해하며 핸드폰, 디카로 정신 없이 찍어댄다. 
그러나 그것도 잠시… 정체를 알 수 없는 괴물은 둔치 위로 올라와 사람들을 거침없이 깔아뭉개고, 무차별로 물어뜯기 시작한다. 
순식간에 아수라장으로 돌변하는 한강변. 강두도 뒤늦게 딸 현서를 데리고 정신 없이 도망가지만, 
비명을 지르며 흩어지는 사람들 속에서, 꼭 잡았던 현서의 손을 놓치고 만다. 
그 순간 괴물은 기다렸다는 듯이 현서를 낚아채 유유히 한강으로 사라진다.
어딘가에 있을 현서를 반드시 찾아야 한다. 갑작스런 괴물의 출현으로 한강은 모두 폐쇄되고, 도시 전체는 마비된다. 
하루아침에 집과 생계, 그리고 가장 소중한 현서까지 모든 것을 잃게 된 강두 가족… 돈도 없고 빽도 없는 그들은 아무도 도와주지 않지만, 
위험구역으로 선포된 한강 어딘가에 있을 현서를 찾아 나선다.', 
'한국', 1, 39841);

insert into acv_mov(mvno, title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values(11, '더 플랜', '최진성', 'The Host, 2006', 102, '2017-04-20',
'김어준,김재광,헨리 E. 브래디,필립 B. 스타크,데이비드 D. 딜',
'당신의 손을 떠난 한 표는 과연 어디로 갔을까?
2012년 대선이 남긴 ‘숫자’ 속 미스터리를 밝혀라!지난 18대 대선을 되짚어보자.  
전국 13,500여 개 투표소의 투표함들은 251개의 개표소로 이동됐고,  1,300 여대의 ‘전자 개표기’에 의해 분류됐다. 
그렇게 분류된 데이터를 위원장이 공표하고, 이후 전국에 방송된다.  그런데 이상한 일이 일어났다. 
전국 251개의 모든 개표소에서 같은 패턴을 가지고 등장하는 ‘어떤 숫자’를 발견한 것. 
과학자, 수학자, 통계학자, 국내외 해커들이 모두 뭉쳐  이 수상한 숫자의 비밀을 파헤치기 시작했다.  
추적 결과, 그들은 소름 끼치도록 놀랍고 충격적인 사실을 발견하는데…',
'한국', 1, 162471);

insert into acv_mov(title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values('인터스텔라', '크리스토퍼 놀란', 'Interstellar, 2014', 169, '2014-11-06 ',
'매튜 매커너히,앤 해서웨이,마이클 케인,제시카 차스테인,케이시 애플렉',
'“우린 답을 찾을 거야, 늘 그랬듯이”
세계 각국의 정부와 경제가 완전히 붕괴된 미래가 다가온다.
지난 20세기에 범한 잘못이 전 세계적인 식량 부족을 불러왔고, NASA도 해체되었다.
이때 시공간에 불가사의한 틈이 열리고, 이를 탐험해 인류를 구해야 할 남은 자들에게 지워진다.
사랑하는 가족들을 뒤로 한 채 인류라는 더 큰 가족을 위해, 그들은 이제 희망을 찾아 우주로 간다.
그리고 우린 답을 찾을 것이다. 늘 그랬듯이…',
'미국,영국', 1, 45290);

insert into acv_mov(title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values('인터스텔라: 우주 전쟁', '마를린 맥코헨', 'Interstellar Wars, 2015', 83, '2016-06-09 ',
'마를린 맥코헨,브라이언 랠리',
'어느 날 달 이면에서 발생한 웜홀을 통해 지구 상공에 거대 UFO가 등장한다.
 UFO가 발사한 빛을 맞은 사람들은 좀비처럼 변하는 이상 증세를 보이며 서로를 공격하게 된다.
 무자비한 살육의 현장을 이대로 지켜만 볼 수 없단 것을 깨달은 정부에서는 미 공군 특수 부대를 출격, 
거대 UFO와 맞서는 인류 최후의 전쟁이 시작된다.',
'미국', 1, 149545);

insert into acv_mov(title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) 
values('인터스텔라 5555', '마츠모토 레이지,타케노우치 카즈히사', 'Interstella 5555, 2003', 97, '2003-01-01',
'마를린 맥코헨,브라이언 랠리',
'대사가 전혀 없는 락 뮤직 애니메이션. 
악의 무리에 의해 납치되어 온 다른 은하계의 4명은 지구에서 최고의 밴드가 된다. 
다프 펑크의 음악과 레이지 마츠모토의 디자인이 만나 만들어진 뮤지컬 애니메이션.',
'일본', 1, 37618);

/* 포스터 샘플 */
insert into acv_pstr(mvno, ps_url, main_ps)
values(12, 'https://movie-phinf.pstatic.net/20160106_138/1452044846608eaFcJ_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(mvno, ps_url, main_ps)
values(12, 'https://movie-phinf.pstatic.net/20141021_288/1413854090045j0hQc_JPEG/movie_image.jpg?type=m665_443_2', 0);

insert into acv_pstr(mvno, ps_url, main_ps)
values(13, 'https://movie-phinf.pstatic.net/20160530_58/146459304576821oqi_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(mvno, ps_url, main_ps)
values(14, 'https://movie-phinf.pstatic.net/20111222_145/1324484030109JsAGX_JPEG/movie_image.jpg?type=m665_443_2', 1);
/* 스틸컷 샘플 */

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150204_283/14230153651826EYoJ_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150203_267/1422954366520nmAor_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150204_214/1423015367349YxGqW_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150204_229/1423015363653TL7dP_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150204_114/1423015776120wimFt_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150204_195/1423015361772wlnW8_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20141112_121/14157769076189OLFt_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150203_54/1422954366878dz9PT_JPEG/movie_image.jpg?type=m665_443_2');

insert into acv_stc(mvno, stc_url)
values(12, 'https://movie-phinf.pstatic.net/20150203_32/142295436722802MHL_JPEG/movie_image.jpg?type=m665_443_2');


/* 리뷰 샘플*/
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(22, 1, "It's not possible. No, it's necessary.", 50, 50, 1, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(23, 1, '우린 답을 찾을 것이다, 늘 그랬듯이', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(24, 1, 'STAY', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(29, 1, 'Docking', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(26, 1, '머피의 법칙', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(27, 1, '제발 아이맥스 재개봉좀', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(28, 1, '재개봉 했었어 12월 중순에', 50, 50, 8, 11);
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(29, 1, '몰랐음 ㅠㅠㅠ', 50, 50, 8, 11);
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(30, 1, '아니 알아도 코로나땜에 어떻게 감?', 506, 350, 8, 11);
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(28, 1, '제발 재개봉 한번만 더 해주세요 ㅠㅠ', 50, 50, 8, 11);
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(22, 1, 'Hey dad. You son of a bitch', 50, 50, 8, 11);
insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(23, 1, "It's not possible. No, it's necessary.", 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(28, 7, '가르강튀아 가고싶다', 50, 50, 5, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(30, 8, '눈물 없이 볼 수 없는 영화', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(29, 7, '아.. 또 보고싶다', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(24, 2, 'We will find a way. We always have.', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(26, 4, '진짜 미쳤음', 506, 350, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(23, 7, '제발 재개봉 한번만', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(24, 2, '영화관에서 못본게 천추의 한이다', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(22, 3, 'Hey dad. You son of a bitch', 50, 50, 8, 11);

insert into acv_rv(stcno, mno, txt, txt_x, txt_y, tfno, txt_size)
values(27, 4, "It's not possible. No, it's necessary.", 50, 50, 8, 11);

/* 좋아요 이력 샘플 */
insert into acv_like(lno, mno, lano, target) values(1, 2, 1, 1);

insert into acv_like(lno, mno, lano, target) values(2, 3, 1, 1);

insert into acv_like(lno, mno, lano, target) values(3, 4, 1, 1);

insert into acv_like(lno, mno, lano, target) values(4, 5, 1, 1);

insert into acv_like(lno, mno, lano, target) values(5, 6, 1, 1);

insert into acv_like(lno, mno, lano, target) values(6, 7, 1, 1);

insert into acv_like(lno, mno, lano, target) values(7, 8, 2, 1);

insert into acv_like(lno, mno, lano, target) values(8, 3, 1, 2);

insert into acv_like(lno, mno, lano, target) values(9, 4, 1, 2);

insert into acv_like(lno, mno, lano, target) values(10, 5, 1, 2);

insert into acv_like(lno, mno, lano, target) values(11, 1, 1, 3);

insert into acv_like(lno, mno, lano, target) values(12, 2, 1, 3);

insert into acv_like(mno, lano, target) values(2, 2, 4);
insert into acv_like(mno, lano, target) values(2, 2, 3);
insert into acv_like(mno, lano, target) values(2, 2, 6);
insert into acv_like(mno, lano, target) values(2, 2, 7);
insert into acv_like(mno, lano, target) values(2, 2, 8);
insert into acv_like(mno, lano, target) values(2, 2, 13);
insert into acv_like(mno, lano, target) values(2, 2, 14);

/* 태그-게시물 샘플*/
insert into acv_tag_post(rvno, tno) value(1, 1);
insert into acv_tag_post(rvno, tno) value(1, 2);
insert into acv_tag_post(rvno, tno) value(1, 3);
insert into acv_tag_post(rvno, tno) value(2, 1);
insert into acv_tag_post(rvno, tno) value(2, 2);
insert into acv_tag_post(rvno, tno) value(3, 1);
insert into acv_tag_post(rvno, tno) value(3, 4);
insert into acv_tag_post(rvno, tno) value(3, 5);
insert into acv_tag_post(rvno, tno) value(3, 6);

insert into acv_tag_post(rvno, tno) value(14, 1);
insert into acv_tag_post(rvno, tno) value(14, 2);
insert into acv_tag_post(rvno, tno) value(14, 3);
insert into acv_tag_post(rvno, tno) value(14, 4);
insert into acv_tag_post(rvno, tno) value(14, 5);


/* 신고 사유 샘플*/
insert into acv_rp_why(rwno, title)
values(1, '음란성/선정성');

insert into acv_rp_why(rwno, title)
values(2, '폭력성');

insert into acv_rp_why(rwno, title)
values(3, '혐오/인신공격');

insert into acv_rp_why(rwno, title)
values(4, '광고성/스팸');

insert into acv_rp_why(rwno, title)
values(5, '개인정보 노출');

insert into acv_rp_why(rwno, title)
values(6, '도배');

/* 신고 사유 샘플*/
insert into acv_rp_stat(rsno, title)
values(1, '신고대기');

insert into acv_rp_stat(rsno, title)
values(2, '반려');

insert into acv_rp_stat(rsno, title)
values(3, '처리완료');

/* 신고 등록 샘플 */
insert into acv_rp(rno,mno,rano,target,rwno,rsno,content,pdt) 
values(1, 1, 3, 9, 5, 1, '처리대기', null);

insert into acv_rp(rno,mno,rano,target,rwno,rsno,content,pdt) 
values(2, 2, 2, 8, 2, 2,'허위신고', '2020-12-04');

insert into acv_rp(rno,mno,rano,target,rwno,rsno,content,pdt) 
values(3, 3, 1, 7, 3, 3,'처리완료, 신고 대상 회원 3일 정지', '2020-12-04 11:11:11');

insert into acv_rp(rno,mno,rano,target,rwno,rsno) 
values(4, 4, 1, 6, 6, 1);

insert into acv_rp(rno,mno,rano,target,rwno,rsno) 
values(5, 2, 3, 1, 3, 1);

insert into acv_rp(rno,mno,rano,target,rwno,rsno) 
values(6, 3, 3, 2, 6, 2);

insert into acv_rp(rno,mno,rano,target,rwno,rsno) 
values(7, 5, 4, 4, 4, 3);


/* 댓글 샘플 */
/* 리뷰1 */

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(1, 1, 1, 1, 1, 'test1');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(2, 1, 2, 1, 2, 'test2');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(3, 1, 1, 2, 2, 're:test1');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(4, 1, 1, 2, 4, 're:test1');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(5, 1, 2, 2, 4, 're:test2');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(6, 1, 2, 2, 5, 're:test2');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(7, 1, 7, 1, 4, 'test3');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(8, 1, 2, 2, 8, 're:test2');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(9, 1, 1, 2, 6, 're:test1');

insert into acv_cmt(cno,rvno,gno,lvl,mno,content) 
values(10, 1, 7, 2, 5, 're:test3');

/* 저장 샘플  */

insert into acv_save(mno,rvno) values(1,1);
insert into acv_save(mno,rvno) values(1,2);
insert into acv_save(mno,rvno) values(1,3);
insert into acv_save(mno,rvno) values(1,4);
insert into acv_save(mno,rvno) values(1,5);
insert into acv_save(mno,rvno) values(1,6);
insert into acv_save(mno,rvno) values(1,13);
insert into acv_save(mno,rvno) values(1,14);

insert into acv_save(mno,rvno) values(2,1);
insert into acv_save(mno,rvno) values(2,3);
insert into acv_save(mno,rvno) values(2,6);

insert into acv_save(mno,rvno) values(3,1);
insert into acv_save(mno,rvno) values(3,3);

insert into acv_save(mno,rvno) values(4,1);
insert into acv_save(mno,rvno) values(4,2);
insert into acv_save(mno,rvno) values(4,7);
insert into acv_save(mno,rvno) values(4,8);

