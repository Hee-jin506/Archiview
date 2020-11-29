# 👩‍💻Archiview 프로젝트 진행 일지👨‍💻 

### 🎯 회원 가입 기능

- 테스트 방법: 

### 🎯 SNS 로그인, 회원 가입 기능

- 테스트 방법: http://localhost:9999/Archiview/auth/login 접속 -> SNS 로그인 버튼 클릭 -> SNS 로그아웃 버튼 클릭
- 진행 상황: 구글 카카오 둘다 OAuth2.0 클라이언트 아이디 발급받았고, /auth/login에 소스코드 복붙함. 
- 해결할 문제
  - 회원가입 : SNS 계정 정보로 로그인한 사용자를 DB에 회원으로 등록해야함.
    => 구글, 카카오 로그인 api 둘다 OAuth2.0 기반임. OAuth2.0과 토큰에대해서 공부해야될것같음. DB에 토큰 컬럼을 추가?
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

- 테스트 방법:

### 🎯 회원 변경 기능

- 테스트 방법:

### 🎯 회원 삭제 기능

- 테스트 방법:

### 🎯 영화 조회 기능

- 테스트 방법:
- 진행 상황:

### 🎯 후기 등록 기능

- 테스트 방법: localhost:9999/Archiview/write/search.html 접속 -> '무현' 검색 -> 포스터 선택 -> 스틸컷 선택 
- 진행 상황 : ReviewEditServlet 편집 중
- 해결할 문제
  - 태그 작성 기능 구현 방법 : 태그를 작성하는 도중에 기존에 있는 태그를 검색하고 선택하는 기능이 구현되어야한다.
  - 스틸컷을 선택 후 다음 버튼을 누르도록 변경 : 현재는 이미지를 누르면 바로 다음 페이지로 넘어가나, 이미지를 누른 후에 버튼을 눌러야만 다음 페이지로 넘어갈수있도록 변경해야 한다.
