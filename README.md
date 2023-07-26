# ShallWeShare
 OTT 플랫폼 공유 파티 모집 사이트 
## 개요
+ 부산 그린 컴퓨터 아카데미 <[디지털 컨버전스] 자바(JAVA) & 스프링(Spring) 프레임워크 개발자 양성과정 23-1>
+ 팀 5조
## 개발 기간
2023.6.18 ~ 2023.7.11

## 프로젝트 설정
https://www.notion.so/5-e841d441028e4dcfb61e2b5d752b629c



## 프로젝트 구현 환경
+ Languages: <img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/>
+ Back-end: <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>  <img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=white"/>
+ Front-end: <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat-square&logo=javascript&logoColor=white"/> <img src="https://img.shields.io/badge/JSP-007396?style=flat-square&logo=JSP&logoColor=white"/> <img src="https://img.shields.io/badge/html5-E34F26?style=flat-square&logo=html5&logoColor=white"/> <img src="https://img.shields.io/badge/html5-1572B6?style=flat-square&logo=html5&logoColor=white"/>
+ API:<img src="https://img.shields.io/badge/kakao-FFCD00?style=flat-square&logo=kakao&logoColor=white"/>(로그인, 카카오페이)

## 주요 기능
- 파티 생성, 수정, 삭제
- 파티 조회, 신청, 결제/ 파티방 내 채팅
- 파티 및 유저 신고, 신고내역 조회/수정/삭제
- 파티 리뷰 작성, 수정, 삭제, 조회
- 마이페이지(회원정보수정, 내 파티보기, 신고 내역보기, 작성 가능 리뷰, 작성한 리뷰, 회원탈퇴)
- 관리자페이지(회원정보/신고내역 조회 및 검색)


## 내 역할
회원가입/로그인(카카오, 사이트 자체), 마이페이지(프로필 수정)


일반 회원과 카카오 회원을 같은 테이블에서 관리하기 위해 회원번호를 pk 값으로 설정하고,
회원 테이블에 플랫폼 컬럼을 넣어 일반 유저와 카카오 유저를 구분해서 관리했습니다.

[황윤희_포트폴리오(팀프로젝트).pdf](https://github.com/uniiiiiiiiiii/shallweshare/files/12166867/_.pdf)


**로그인 & 회원가입 페이지**

회원가입 시 아이디와 닉네임은 중복이 불가능하도록 했다. (ajax 이용)
![image](https://github.com/uniiiiiiiiiii/shallweshare/assets/136671618/3a8c9952-0661-4aa7-ab0e-6c6db5421638)
![image](https://github.com/uniiiiiiiiiii/shallweshare/assets/136671618/a753f1ac-239b-4497-9a82-72a7983311ff)



**카카오 로그인 & 추가 회원가입 페이지**

카카오 첫 로그인 시 동의하기 창을 클릭하면 동의한 정보들이 DB에 들어간다. 이때 pk 값인 회원번호가 같이 DB에 들어간다. 또한 다른 정보들을 추가로 받아야 해서 DB에 다른 정보 값이 없다면 pk 값을 가지고 추가 가입 페이지로 이동하게 된다.
![image](https://github.com/uniiiiiiiiiii/shallweshare/assets/136671618/d5868372-8bd5-4d9a-986c-cd02c7effdee)
![image](https://github.com/uniiiiiiiiiii/shallweshare/assets/136671618/01978491-4317-4fb2-8ae4-9b29554a883e)


**회원수정 & 로그아웃 & 회원탈퇴**

카카오 회원은 비밀번호 컬럼이 null이라서 회원 수정 jsp 페이지에서 플랫폼 컬럼이 일반 회원일 때만 비밀번호가 나오도록 했다. 아이디와 닉네임은 중복 불가이므로 기존의 sql 문을 약간 수정해서 사용했다. (닉네임이 입력된 닉네임이면서, 회원번호가 세션에 담긴 회원번호와 일치하지 않은 것의 개수)

또한 카카오/일반 회원의 회원 수정, 로그아웃, 회원 탈퇴 로직이 다 달라서 컨트롤러에서 플랫폼 값에 따라 분기 처리를 해주었다.
![image](https://github.com/uniiiiiiiiiii/shallweshare/assets/136671618/d632701f-4f2a-4671-a7a8-ae585de68992)

