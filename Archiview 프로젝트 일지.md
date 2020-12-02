# 👩‍💻Archiview 프로젝트 진행 일지👨‍💻 

### 🎯 회원 가입 기능

- 테스트 방법: 

### 🎯 SNS 로그인, 회원 가입 기능

- 테스트 방법: http://localhost:9999/Archiview/auth/login.html 접속 -> SNS 로그인 버튼 클릭 -> SNS 로그아웃 버튼 클릭
- 진행 상황: 구글 카카오 둘다 OAuth2.0 클라이언트 아이디 발급받았고, /auth/login에 소스코드 복붙함. 
- 해결할 문제
  - 회원가입 : SNS 계정 정보로 로그인한 사용자를 DB에 회원으로 등록해야함.
    => 구글, 카카오 로그인 api 둘다 OAuth2.0 기반임 => OAuth2.0과 토큰에대해서 공부해야될것같음 => DB에 토큰 컬럼을 추가?
  - 회원탈퇴 : SNS 계정 정보로 로그인한 사용자를 DB에서 삭제해야함.
  - 카카오 로그아웃 : 자바스크립트 몰라서 어떻게하는지 잘 모르겠음.
  - 로그아웃 : 버튼 하나로 일반 로그인, SNS 로그인 모두 로그아웃되게 해야함.
- 참고한 사이트
  - 구글
    - api 문서: https://developers.google.com/identity/sign-in/web/sign-in
    - 개발자 도구에서 토큰값 확인: https://shlee0882.tistory.com/58
    - 로그아웃 코드: https://ming9mon.tistory.com/146
    - 그냥 참고함: https://www.daleseo.com/google-oauth/
  - 카카오
    - api 문서: https://developers.kakao.com/docs/latest/ko/kakaologin/common
    - 로그인 코드 : https://kimsg.tistory.com/9
    - 그냥 참고함: https://webruden.tistory.com/272

### 🎯 회원 조회 기능

- 테스트 방법: http://localhost:9999/Archiview/member/list 접속 -> DB에 저장된 회원 리스트 출력

### 🎯 회원 상세보기 기능

- 테스트 방법: http://localhost:9999/Archiview/member/list 접속 -> 확인이 필요한 회원의 이름 클릭

  - 현재 photo는 png 파일을 jpg로 변환하여 저장하는 경우, 투명부분이 까맣게 변하는 문제가 있다.

  - ```
      out.printf("<a href='../upload/%s'>\n<img src='../upload/%1$s_150x150'></a><br>\n",
              member.getPhoto());
    ```

  - 회원 PhotoUpdate 설정 완료

### 🎯 회원 변경 기능

- 테스트 방법: http://localhost:9999/Archiview/member/list 접속 -> 변경 필요한 회원의 이름 클릭 -> 이메일/닉네임/소개 수정 후 변경 가능

  - 회원 번호를 찾지 못하는 null 에러 수정 - `MemberDetailServlet` 에서 `member.getNo() `를 받지않아서 생긴 오류

  - 회원 NickName 필드를 찾지 못하는 에러 수정 

    - MemberMapper.xml update문 수정

      ```
         <update id="update" parameterType="member">
          update acv_mbr
            <set>
      	      <if test="nick != null">nick = #{nickName},</if>
      	      <if test="intro != null">intro = #{intro},</if>
      	      <if test="photo != null">photo = #{photo}</if>
            </set>
          where mno = #{no}
        </update>
        
        -> 변경 후
        
        <update id="update" parameterType="member">
          update acv_mbr
            <set>
      	      <if test="nickName != null">nick = #{nickName},</if>
      	      <if test="intro != null">intro = #{intro},</if>
      	      <if test="photo != null">photo = #{photo}</if>
            </set>
          where mno = #{no}
        </update>
      ```

### 🎯 회원 삭제 기능

- 테스트 방법: http://localhost:9999/Archiview/member/list 접속 -> 삭제가 필요한 회원의 이름 클릭 -> 하단 삭제 버튼 클릭 후 삭제 가능

### 🎯 영화 조회 기능

- 테스트 방법:
- 진행 상황:

### 🎯 후기 등록 기능

- 테스트 방법: localhost:9999/Archiview/write/search.html 접속 -> '무현' 검색 -> 포스터 선택 -> 스틸컷 선택 
- 진행 상황 : ReviewEditServlet 편집 중
- 해결할 문제
  - 태그 작성 기능 구현 방법 : 태그를 작성하는 도중에 기존에 있는 태그를 검색하고 선택하는 기능이 구현되어야한다.
  - 스틸컷을 선택 후 다음 버튼을 누르도록 변경 : 현재는 이미지를 누르면 바로 다음 페이지로 넘어가나, 이미지를 누른 후에 버튼을 눌러야만 다음 페이지로 넘어갈수있도록 변경해야 한다.
  - 스틸컷 주소를 그대로 get요청으로 넘기지 않고, 스틸컷의 번호를 get요청으로 넘긴다.



### 🎯 태그 조회 기능

- 테스트 방법: http://localhost:9999/Archiview/tag/list 접속 
- 진행 상황 : TagListServlet 편집 중
- 해결할 문제
  - 아직 게시물 수 출력 안함 : 태그 작성한 리뷰 샘플 있어야함
  - 선택 검색 기능 추가
  - 상태로 검색하는거 문제 해결해야함
  - 등록일 날짜별로 검색
  - 일일태그 수, 누적태그 수 출력
  - 항목별 정렬
  - 새로고침 버튼
  - 페이지
- 추가 문제
  - TagUpdateServlet 추가 : 관리자가 실수로 태그를 비활성화했을때 다시 복원할수있게해야함
  - 등록일 기간으로 검색?
  - 번호 범위로 검색?
  - 상세 검색 ui 변경?
  - 상세 검색 리셋 버튼?

### 🎯 태그 상세 조회 기능

- 테스트 방법: http://localhost:9999/Archiview/tag/list 접속 -> 태그명 클릭 
- 진행 상황 : TagDetailServlet 편집 중
- 해결할 문제
  - 조회, 상세조회 

### 🎯 태그 삭제 기능

- 테스트 방법: http://localhost:9999/Archiview/tag/list 접속 -> 태그명 클릭 -> 삭제 링크 클릭
- 진행 상황 : TagDeleteServlet 편집 중
- 해결할 문제

### 🎯 태그 선택 삭제 기능
- 테스트 방법: http://localhost:9999/Archiview/tag/list 접속 -> 태그 선택 -> 삭제 링크 클릭
- 진행 상황 : TagMultipleDeleteServlet 편집 중
- 해결할 문제
