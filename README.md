# SharetheVision

###### (최신순DESC, 마크다운 )              
- - -      
   
   

## pom.xml   
+ _
  + commons-dbcp - Lib for  Connection pool
  + mybatis - Lib for  Mybatis 
  + mybatis-spring - Lib for  Mybatis in Spring
  + spring-jdbc - Lib for  jdbc in Spring
  + ojdbc6 - Lib for oracle
  + spring-security-core - Lib for  security in Spring
  + spring-security-web - Lib for  security in Spring
  + spring-security-config - Lib for  security in Spring
  + commons-fileupload - Lib for  fileupload
  + commons-io - Lib for  JDK에서 제공하는 클래스 이용
  + json-simple - Lib for JSON 
  + gson - Lib for GSON
  + xercesImpl - Lib for 한글 파싱
  + mail - Lib for 인증메일
  + spring-context-support - Lib for 인증메일   


## DB
+ DB.sql 최종본 수정   
+ DB2.sql 수정용 추가 

## mapper
+ board-mapper 추가
+ calender-mapper 추가   

## mybatis.config
+ alias 추가 (게시판 type)
+ alias 추가 (캘린더 type)   

## src > firstmain
+ Controller
+ model
  - Service - CalendarService, 
  - ServiceImpl - CalendarServiceImpl , 
  - DAO - CalendarDAO, 
  - vo - Calendar, Todo,

## webapp > resources
+ vendor 폴더 추가 ( 캘린더관련 css, js)   

+ <src/main/firstmain> 
+ controller, model(dao,service,vo) 추가   

## style.CSS
+ container margin-bottom 추가
+ 알림메세지 오른쪽 짤림현상 수정 (padding 0)
+ .bg-c-white 추가
+ .text-c-white 추가     

## views > common   
+ common.jsp : CSS link, .js srcipt 분리 
+ sideMenu.jsp : 사이드바 분리
+ topMenu.jsp : 상단바 분리   
+ errorPage.jsp 

## views > home.jsp
+ @include 
  - <jsp:include page="/WEB-INF/views/common/common.jsp" />
  - <jsp:include page="/WEB-INF/views/common/topMenu.jsp" />     
  - <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />
  
  

