/* 장르 샘플 */
insert into acv_gnr(gno, title) values(1, '드라마');
insert into acv_gnr(gno, title) values(2, '판타지');
insert into acv_gnr(gno, title) values(3, '서부');
insert into acv_gnr(gno, title) values(4, '공포');
insert into acv_gnr(gno, title) values(5, '멜로/로맨스');
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
insert into acv_gnr(gno, title) values(26, '공연실황');

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
<<<<<<< HEAD
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(1, 1, '스티븐잡스', 1, 'acv1@test.com', '1111', '스티븐잡스', 'https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F198%2F201601251600441211.jpg', 
'iphone 12 mini comming soon', 1, '팀쿡', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(2, 1, '팀쿡', 1, 'acv2@test.com', '2222', '팀쿡', 'https://search.pstatic.net/common?type=a&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F175%2F20140228114506481.jpg',
'mac mini nice product', 2, '스티븐잡스', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(3, 1, '이건목', 2, 'acv3@test.com', '3333', '자바171기이건목', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20110420_194%2Fmarvelplus_1303297723584KMGNN_JPEG%2Fysxv66M6TTyDp7brme.jpg&type=sc960_832',
'코딩몽키', 2, '엄진영', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(4, 1, '김찬구', 3, 'acv4@test.com', '4444', '포켓몬박사', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAxMjRfMjg2%2FMDAxNDg1MjQxOTI0ODc5.EABP7Ng7kZ_w4n7x1eyP1DlI6Uc7OVjvaETfaEfWzJQg.HUUdatK070encozzonfLL1KkXXb5qTsuoFbecMrS0G0g.PNG.hakte%2Fimage005.png&type=sc960_832',
'포켓몬 도감 만드실 개발자 구함', 5, '김태희', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(5, 1, '엄영진', 1, 'acv5@test.com', '5555', 'javaMaster', null,
'Hul과 Null의 차이', 4, '강원도', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(6, 1, '김태희', 1, 'acv6@test.com', '6666', '영업왕이될꺼야', null,
'이것이 기술 영업이다', 1, '도비', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(7, 1, '최희진', 1, 'acv7@test.com', '7777', '청축키보드', null,
'키보드는 기계식이지', 1, '쏭', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(8, 1, '류승희', 2, 'acv8@test.com', '8888', '타래', null,
'타래가 쵝오야', 1, '타래', 1);
insert into acv_mbr(mno, auth, name, ltno, email, pw, nick, photo, intro, qno, pw_hint_a, stno) 
values(9, 1, '이용민', 3, 'acv9@test.com', '9999', '스트릿패션', null,
'리셀가 80만원', 1, '캔디', 1);
=======
>>>>>>> a7260f620b2295459006e9e1ef1c04e41ab725a1
