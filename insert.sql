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
