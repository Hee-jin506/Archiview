insert into acv_mov(title, dir, eng_title, runtime, odt, actors, syn, nation, stat, nav_cd) values('ㄱ', 'ㄱ', 'ㄱ', 12, '2020-2-2', 'ㅁ', 'ㅁ', 'ㅁ', 1, 3);
insert into acv_pstr(mvno, ps_url, main_ps) values(1, 'a', 1);
insert into acv_stc(mvno, stc_url) values(1, 'b');
insert into acv_gnr_mov(gmno, gno, mvno) values(1, 1, 1);

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

/* 회원 샘플 */
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(1, 1, '스티븐잡스', 1, 'acv1@test.com', password('1111'), '스티븐잡스', 'https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F198%2F201601251600441211.jpg', 
'iphone 12 mini comming soon', 1, '팀쿡', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(2, 1, '팀쿡', 1, 'acv2@test.com', password('2222'), '팀쿡', 'https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F175%2F20140228114506481.jpg',
'mac mini nice product', 2, '스티븐잡스', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(3, 1, '이건목', 2, 'acv3@test.com', password('3333'), '자바171기이건목', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20110420_194%2Fmarvelplus_1303297723584KMGNN_JPEG%2Fysxv66M6TTyDp7brme.jpg&type=sc960_832',
'코딩몽키', 2, '엄진영', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(4, 1, '김찬구', 3, 'acv4@test.com', password('4444'), '포켓몬박사', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAxMjRfMjg2%2FMDAxNDg1MjQxOTI0ODc5.EABP7Ng7kZ_w4n7x1eyP1DlI6Uc7OVjvaETfaEfWzJQg.HUUdatK070encozzonfLL1KkXXb5qTsuoFbecMrS0G0g.PNG.hakte%2Fimage005.png&type=sc960_832',
'포켓몬 도감 만드실 개발자 구함', 5, '김태희', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(5, 1, '엄영진', 1, 'acv5@test.com', password('5555'), 'javaMaster', null,
'Hul과 Null의 차이', 4, '강원도', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(6, 1, '김태희', 1, 'acv6@test.com', password('6666'), '영업왕이될꺼야', null,
'이것이 기술 영업이다', 1, '도비', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(7, 1, '최희진', 1, 'acv7@test.com', password('7777'), '청축키보드', null,
'키보드는 기계식이지', 1, '쏭', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(8, 1, '류승희', 2, 'acv8@test.com', password('8888'), '타래', null,
'타래가 쵝오야', 1, '타래', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(9, 1, '이용민', 3, 'acv9@test.com', password('9999'), '스트릿패션', null,
'리셀가 80만원', 1, '캔디', 1);

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
insert into acv_stc(stcno, mvno)
values(1, 1)

insert into acv_stc(stcno, mvno, stc_url)
values(2, 1, 'https://movie-phinf.pstatic.net/20170816_237/15028507560937wWpL_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(stcno, mvno, stc_url)
values(3, 1, 'https://movie-phinf.pstatic.net/20170816_246/1502850756536szMwe_JPEG/movie_image.jpg?type=m427_320_2');

insert into acv_stc(stcno, mvno, stc_url)
values(4, 1, 'https://movie-phinf.pstatic.net/20170807_170/1502069264980Amq9T_JPEG/movie_image.jpg?type=m427_320_2');

/*포스터 샘플*/
insert into acv_pstr(psno, mvno, ps_url, main_ps)
values(1, 1, 'https://movie-phinf.pstatic.net/20170814_17/1502675963099mSfot_JPEG/movie_image.jpg?type=m665_443_2', 1);

insert into acv_pstr(psno, mvno, ps_url, main_ps)
values(2, 1, 'https://movie-phinf.pstatic.net/20161026_271/1477463580542wovM2_JPEG/movie_image.jpg?type=m665_443_2', 0);

insert into acv_gnr_mov(gmno, gno, mvno) 
values(1, 10, 1);

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

/* 리뷰 샘플*/
insert into acv_rv(rvno, stcno, mno, txt, txt_x, txt_y, tfno, txt_size, stat)
values(1, 1, 1, '전 노무현 대통령을 다시 보게 된 영화', 506, 350, 1, 11, 1);

insert into acv_rv(rvno, stcno, mno, txt, txt_x, txt_y, tfno, txt_size, stat)
values(2, 2, 7, '변호사의 현실을 알게된 값진 영화', 506, 350, 5, 11, 1);

insert into acv_rv(rvno, stcno, mno, txt, txt_x, txt_y, tfno, txt_size, stat)
values(3, 3, 8, '눈물 없이 볼 수 없는 영화', 506, 350, 8, 11, 1);
