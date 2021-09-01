<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>Welcome SV Company!</title> 
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- 아이콘 -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- 구글 폰트-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- 프레임워크 -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- 아이콘2 -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- 폰트2 -->
    <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
    <!-- 공통css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!-- jquery-->
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    
    <!--버튼 alert css-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <jsp:include page="/WEB-INF/views/common/common.jsp"/>
    
    <style>
@import url("https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500;600;700&display=swap");
:root {
--body-bg-color: #e4e6f5;
--border-color: #e5e4e9;
--theme-bg-color: #fff;
--body-color: #1b1f31;
--main-color: #7a7e9d;
--main-light-color: #a1a4b9;
--title-color: #979dc3;
--body-font: "Jost", sans-serif;
--button-bg-color: #eaeefc;
--button-color: #4d76fd;
--unselected-mail: #f1f2f7;
--calendar-border-color: #cbcfe0;
--main-container-bg: #f0f0f7;
}

* {
outline: none;
box-sizing: border-box;
}

html {
box-sizing: border-box;
-webkit-font-smoothing: antialiased;
}

body {
font-family: var(--body-font);
background-color: var(--body-bg-color);
color: var(--body-color);
font-size: 15px;
background-color: white;
}

img {
max-width: 100%;
}

.container {
background-color: var(--theme-bg-color);
display: flex;
max-width: 1600px;
height: 100vh;
overflow: hidden;
margin: 0 auto;
}

.user-profile-area {
width: 360px;
border-right: 1px solid var(--border-color);
display: flex;
flex-direction: column;
flex-shrink: 0;
overflow: auto;

}

.task-manager {
font-size: 18px;
color: black;
font-weight: 800;
text-align: center;
height: 70px;
letter-spacing: 0.7px;
line-height: 70px;
position: sticky;
top: 0;
z-index: 3;
text-transform: uppercase;
background-color: var(--theme-bg-color);
border-bottom: 1px solid var(--border-color);
}

.user-photo {
width: 70px;
height: 70px;
border-radius: 50%;
object-fit: cover;
}

.user-name {
font-weight: 600;
margin: 0 auto;
display:inline;
width:100px;

}

.user-mail {
color: var(--main-light-color);
font-size: 12px;
font-weight: 600;
}

.user-dept{
color: var(--main-light-color);
font-size: 12px;
font-weight: 600;
}

.user-class{
font-weight: 600;
margin: 0 auto;
display:inline;
width:100px;
color:blue;
font-weight: 1000;

}



.user-profile {
display: flex;
flex-direction: column;
text-align: center;
align-items: center;
}

.side-wrapper {
padding: 25px 40px;
border-bottom: 1px solid var(--border-color);
}
.side-wrapper:last-child {
border-bottom: none;
}

.user-notification {
display: flex;
justify-content: center;
align-items: center;
margin-top: 25px;
}
.user-notification svg {
width: 36px;
padding: 10px;
flex-shrink: 0;
border-radius: 50%;
overflow: visible;
background-color: var(--button-bg-color);
color: var(--button-color);
}

.notify {
position: relative;
}
.notify:not(:last-child) {
margin-right: 25px;
}
.notify.alert {
position: relative;
}
.notify.alert:before {
content: "2";
font-size: 9px;
font-weight: 700;
position: absolute;
background-color: #ff537b;
width: 14px;
height: 14px;
border-radius: 50%;
top: -3px;
display: flex;
justify-content: center;
align-items: center;
right: 0px;
color: #fff;
}
.notify.alert:last-child:before {
content: "5";
}

.progress {
margin-top: 5px;
border-radius: 4px;
background-color: #e7e7ef;
height: 8px;
overflow: hidden;
}
.progress-bar {
background-color: green;
border-radius: 4px;
width: 35%;
height: 100%;
animation: progressAnimation 6s;
transition: 0.3s linear both;
transition-property: width, background-color;
}
.progress-status {
margin-top: 30px;
text-align: right;
color: var(--main-color);
font-size: 10px;
font-weight: 600;
}

@keyframes progressAnimation {
0% {
width: 5%;
background-color: #a2b6f5;
}
100% {
width: 35%;
}
}
.task-status {
margin-top: 20px;
display: flex;
align-items: center;
justify-content: space-between;
}
.task-stat {
text-align: center;
}
.task-number {
font-size: 17px;
font-weight: 700;
margin-bottom: 10px;
}
.task-condition {
font-size: 12px;
color: var(--main-color);
font-weight: 700;
}
.task-tasks {
margin-top: 4px;
font-size: 10px;
font-weight: 600;
color: var(--main-light-color);
}

.project-title {
text-transform: uppercase;
font-weight: 700;
margin-bottom: 18px;
}
.project-department {
position: relative;
vertical-align: middle;
padding: 0 30px;
color: var(--main-color);
font-size: 13px;
font-weight: 600;
margin-top: 14px;
}
.project-department:before {
position: absolute;
content: "";
width: 8px;
height: 8px;
border-radius: 50%;
top: 10;
left: 0;
}
.project-department:nth-child(1):before {
border: 3px solid #b36dfb;
}
.project-department:nth-child(2):before {
border: 3px solid #625be8;
}
.project-department:nth-child(3):before {
border: 3px solid #fec267;
}
.project-department:nth-child(4):before {
border: 3px solid #fc6679;
}

.members {
width: 36px;
height: 36px;
object-fit: cover;
border-radius: 50%;
}

.team-member {
display: flex;
justify-content: space-between;
}

.main-area {
display: flex;
flex-direction: column;
flex-grow: 1;
overflow: hidden;
}

.header {
height: 70px;
width: 100%;
border-bottom: 1px solid var(--border-color);
}

.search-bar {
height: 70px;
position: relative;
}
.search-bar input {
height: 100%;
width: 100%;
display: block;
background-color: transparent;
border: none;
color: var(--body-color);
padding: 0 35px;
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23a1a4b9' stroke-width='3' stroke-linecap='round' stroke-linejoin='round' class='feather feather-search'%3e%3ccircle cx='11' cy='11' r='8'/%3e%3cpath d='M21 21l-4.35-4.35'/%3e%3c/svg%3e");
background-repeat: no-repeat;
background-size: 18px;
background-position: 0 50%;
font-family: var(--body-font);
font-weight: 600;
font-size: 14px;
}
.search-bar input::placeholder {
color: var(--main-light-color);
}

.header {
display: flex;
align-items: center;
justify-content: space-between;
padding: 0 20px 0 30px;
}

.inbox-calendar {
margin-right: 200px;
}

.color-menu {
flex-shrink: 0;
}

.msg {
padding: 30px;
background-color: var(--unselected-mail);
border-bottom: 1px solid var(--border-color);
display: flex;
align-items: center;
transition: 0.4s ease;
}
.msg-title {
font-weight: 600;
font-size: 14px;
}
.msg-date {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
}


.msg-date2 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;

}

.msg-startday {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
}
.msg-endday {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
}

.msg-startdate {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
}
.msg-sender {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
}

.msg-sender2 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
}

.msg-sender3 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
}

.msg-approve {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;

}

.msg-approve2 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;

}

.msg-approve3 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
}

.msg-doctype {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;

}

.msg-doctype2 {
font-size: 11px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
}

.msg-apvname{

color: black;
margin-top: 5px;
float:left;
font-size: 13px;
font-weight: 600;
}

.msg-apvclass{

font-size: 13px;
color: black;
font-weight: 600;
margin-top: 5px;
float:left;
}

.msg-apvmsg {

font-size: 13px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;
color:green;
}

.msg-apvmsg2 {

font-size: 15px;
color: var(--main-light-color);
font-weight: bold;
margin-top: 5px;
float:left;
color:blue;
}

.assign-date{
font-size: 13px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;


}

.assign-date2{
font-size: 13px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;


}


.msg-canclename{

color: black;
margin-top: 5px;
float:left;
font-size: 13px;
font-weight: 600;
}

.msg-cancleclass{

font-size: 13px;
color: black;
font-weight: 600;
margin-top: 5px;
float:left;
}

.msg-canclemsg {

font-size: 13px;
color: var(--main-light-color);
font-weight: bold;
margin-top: 5px;
float:left;
color:rgb(238, 41, 41);
}

.cancle-date{
font-size: 13px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;


}


.msg-returnname{
float:left;
color: black;
margin-top: 5px;
font-size: 13px;
font-weight: 600;
}

.msg-returnclass{

font-size: 13px;
color: black;
font-weight: 600;
margin-top: 5px;
float:left;
}

.msg-returnmsg {

font-size: 13px;
color: var(--main-light-color);
font-weight: bold;
margin-top: 5px;
float:left;
color:rgb(139, 151, 32);
}

.return-date{
font-size: 13px;
color: var(--main-light-color);
font-weight: 600;
margin-top: 5px;
float:left;


}

.selected-bg {
background-color: var(--theme-bg-color);

}

.msg-department {
display: flex;
justify-content: space-between;
text-transform: uppercase;
position: sticky;
top: 0;
left: 0;
z-index: 3;
font-weight: 700;
letter-spacing: 0.8px;
background-color: var(--theme-bg-color);
border-left: 4px solid #4d76fd;
}
.msg-department svg {
width: 12px;
}

.inbox {
overflow: auto;
}
.inbox-container {
border-right: 1px solid var(--border-color);
width: 430px;
display: flex;
flex-direction: column;
overflow: auto;
flex-shrink: 0;
}

.main-container {
display: flex;
flex-grow: 1;
overflow: hidden;
background-color: var(--main-container-bg);
}

.mail-members {
width: 40px;
height: 40px;
margin-left: auto;
}

.mail-choice {
display: none;
}
.mail-choice2 {
display: none;
}
.mail-choice3 {
display: none;
}
.mail-choice + label:before {
content: "";
display: flex;
width: 35px;
height: 35px;
margin-right: 15px;
border-radius: 50%;
transition: 0.3s;
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23a1a4b9' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
background-repeat: no-repeat;
background-position: center;

}

.mail-choice:checked + label:before {
border-color: green;
background-color:green;
border-color: var(--button-color);
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
}

.mail-choice2 + label:before {
content: "";
display: flex;
width: 35px;
height: 35px;
margin-right: 15px;
border-radius: 50%;
transition: 0.3s;
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23a1a4b9' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
background-repeat: no-repeat;
background-position: center;

}

.mail-choice2:checked + label:before {
border-color: rgb(219, 19, 19);
background-color:rgb(219, 19, 19);
border-color: var(--button-color);
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
}

.mail-choice3 + label:before {
content: "";
display: flex;
width: 35px;
height: 35px;
margin-right: 15px;
border-radius: 50%;
transition: 0.3s;
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23a1a4b9' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
background-repeat: no-repeat;
background-position: center;

}

.mail-choice3:checked + label:before {
border-color: rgb(231, 241, 86);
background-color:rgb(231, 241, 86);
border-color: var(--button-color);
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='20' height='28' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
}


.mail-choice:checked .msg {
background-color: red;
}

.add-task {
position: sticky;
flex-shrink: 0;
bottom: 0;
left: 0;
height: 80px;
margin-top: auto;
border-top: 1px solid var(--border-color);
display: flex;
align-items: center;
background-color: var(--theme-bg-color);
animation: slideUp 0.45s 0.4s both;
}
.add-button {
position: sticky;
bottom: 10px;
background-color: var(--button-color);
border: 0;
margin: auto;
padding: 10px 30px;
color: #fff;
font-size: 12px;
font-weight: 600;
border-radius: 20px;
flex-shrink: 0;
z-index: 1;
cursor: pointer;
}

.mail-detail {
display: flex;
animation: slideX 0.6s both;
flex-direction: column;
overflow: auto;
background-color: var(--theme-bg-color);
}
.mail-detail-profile {
display: flex;
align-items: center;
}
.mail-detail-header {
border-bottom: 1px solid var(--border-color);
padding: 16px 30px;
display: flex;
align-items: center;
justify-content: space-between;
}
.mail-detail-name {
font-size: 14px;
font-weight: 600;
margin-left: 10px;
white-space: nowrap;
}

@keyframes slideX {
0% {
opacity: 0;
transform: translateX(200px);
}
}
.inbox-detail {
width: 44px;
height: 44px;
}

.mail-icons {
flex-shrink: 0;
}
.mail-icons svg {
width: 42px;
height: 42px;
padding: 13px;
flex-shrink: 0;
margin-left: 10px;
border-radius: 50%;
overflow: visible;
background-color: var(--button-bg-color);
color: var(--button-color);
}
.mail-icons svg:first-child {
margin-left: 0;
}

.mail-contents {
padding: 30px;
}
.mail-contents-subject {
display: flex;
align-items: center;
}
.mail-contents-title {
font-weight: 700;
font-size: 17px;
margin-left: 5px;
}

.mail {
padding-left: 55px;
font-size: 14px;
color: var(--main-light-color);
}
.mail-time {
font-weight: 600;
display: flex;
align-items: center;
font-size: 13px;
}
.mail-time svg {
width: 12px;
margin-right: 8px;
}
.mail-inside {
padding: 20px 0 30px;
border-bottom: 1px solid var(--border-color);
color: var(--main-color);
line-height: 1.8em;
}
.mail-checklist {
padding: 20px 0;
display: flex;
align-items: center;
border-bottom: 1px solid var(--border-color);
margin-left:52px;
}
.mail-checklist .mail-choice + label:before {
width: 20px;
height: 20px;
flex-shrink: 0;
margin-right: 12px;
background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='14' height='18' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='4' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpath d='M20 6L9 17l-5-5'/%3e%3c/svg%3e");
}
.mail-checklist label {
display: flex;
align-items: center;
color: var(--button-color);
font-weight: 600;
font-size: 13px;
}
.mail-checklist-date {
margin-left: 16px;
font-size: 13px;
}

.assignee {
font-size: 13px;
margin-bottom: 10px;
}
.assignee :last-child {
margin-bottom: 0;
}

.mail-assign {
padding: 20px 0;
border-bottom: 1px solid var(--border-color);
}

.mail-doc {
display: flex;
align-items: center;
padding: 30px 0;
flex-shrink: 0;
justify-content: space-between;
margin-left:26px;
margin-top:10px;
}
.mail-doc-name {
color: var(--body-color);
font-weight: 600;
font-size: 15px;
margin-bottom: 3px;
}
.mail-doc-date {
font-size: 13px;
}
.mail-doc-wrapper {
display: flex;
align-items: center;
}
.mail-doc-wrapper svg {
margin-right: 15px;
background-color: var(--button-bg-color);
color: var(--button-color);
width: 50px;
padding: 9px;
border-radius: 4px;
}
.mail-doc-icons {
margin-right: 8px;
cursor: pointer;
}

.mail-textarea {
display: flex;
background-color: var(--unselected-mail);
padding: 30px 0;
border-top: 1px solid var(--border-color);
position: sticky;
bottom: 0;
justify-content: space-between;
margin-top: auto;
left: 0;
overflow: hidden;
height: 80px;
flex-shrink: 0;

}
.mail-textarea input {
border: none;
background-color: transparent;
font-size: 15px;
width: 100%;
padding: 0 30px;
color: var(--main-color);
}
.mail-textarea input::placeholder {
color: var(--main-light-color);
}

.textarea-icons {
display: flex;
align-items: center;
cursor: pointer;

}

.attach {
padding: 30px;
border-right: 1px solid var(--border-color);
border-left: 1px solid var(--border-color);
}
.attach svg {
color: var(--main-color);
}

.send {
padding: 30px;
background-color: var(--button-color);
}
.send svg {
color: var(--theme-bg-color);
}

.inbox-calendar-checkbox {
position: relative;
width: 100%;
height: 100%;
padding: 0;
margin: 0;
opacity: 0;
z-index: 3;
cursor: pointer;
}

.toggle-page {
overflow: hidden;
z-index: 2;
}

.inbox-calendar {
position: relative;
width: 220px;
border-radius: 20px;
height: 36px;
display: flex;
align-items: center;
overflow: hidden;
flex-shrink: 0;
}

.layer {
position: absolute;
top: 0;
right: 0;
bottom: 0;
left: 0;
width: 100%;
background-color: var(--unselected-mail);
transition: 0.3s ease all;
z-index: 1;
}

.toggle-page:before,
.toggle-page:after,
.toggle-page span {
position: absolute;
top: 4px;
width: 100px;
height: 10px;
font-size: 12px;
font-weight: bold;
text-align: center;
line-height: 1;
padding: 9px 4px;
border-radius: 20px;
transition: 0.3s ease all;
}

.toggle-page:before {
content: "";
left: 4px;
background-color: var(--button-color);
}

.toggle-page span {
color: var(--theme-bg-color);
z-index: 1;
left: 6px;
}

.toggle-page:after {
content: "Calendar";
right: 4px;
color: var(--main-light-color);
}

.inbox-calendar-checkbox:checked + .toggle-page span {
color: var(--main-light-color);
}

.inbox-calendar-checkbox:checked + .toggle-page:before {
left: 109px;
}

.inbox-calendar-checkbox:checked + .toggle-page:after {
color: var(--theme-bg-color);
}

.calendar {
display: grid;
width: 100%;
grid-template-columns: repeat(7, minmax(195px, 1fr));
grid-template-rows: 57px;
grid-auto-rows: 120px;
overflow: auto;
}
.calendar-wrapper {
width: 100%;
margin: auto;
margin-top: 0;
overflow: auto;
border-radius: 10px;
background: #fff;
max-width: 975px;
border: 1px solid var(--calendar-border-color);
}

.days {
font-size: 12px;
font-weight: 700;
color: var(--main-color);
text-align: center;
line-height: 60px;
}
.days:not(:nth-of-type(7n + 7)) {
border-right: 1px solid var(--calendar-border-color);
}

.day {
padding: 15px;
overflow: hidden;
font-weight: 700;
font-size: 13px;
border-right: 1px solid var(--calendar-border-color);
border-top: 1px solid var(--calendar-border-color);
}
.day:nth-of-type(7n + 7) {
border-right: 0;
}
.day.not-work {
color: var(--main-color);
}
.day.project-market {
background-color: #f5eafd;
border-left: 3px solid #b86df7;
transition: 0.2s ease;
cursor: pointer;
display: flex;
flex-direction: column;
}
.day.project-market:hover {
transform: scale(1.3);
border: 0;
border-radius: 4px;
background-image: linear-gradient(to top, #6625dc, #7739e3, #874cea, #965df1, #a46ef8);
color: #fff;
font-size: 15px;
}
.day.project-market:hover .project-detail {
color: #fff;
font-size: 9px;
}
.day.project-market:hover .project-detail:before {
top: 2px;
}
.day.project-market:hover .hover-title {
display: block;
font-size: 8px;
padding-left: 18px;
margin-top: 5px 0 3px;
}
.day.project-market:hover .popup-check {
display: block;
width: 12px;
margin-left: auto;
margin-top: 6px;
}
.day.project-design {
background-color: #eeeffd;
border-left: 3px solid #736eeb;
}
.day.project-develop {
background-color: #fef6e8;
border-left: 3px solid #ffc263;
}
.day.project-finance {
background-color: #fee9ec;
border-left: 3px solid #ff647a;
transition: 0.2s ease;
cursor: pointer;
}
.day.project-finance:hover {
background-image: linear-gradient(to top, #f7224b, #fa3d5d, #fd526e, #fe637e, #ff748e);
transform: scale(1.3);
border: 0;
border-radius: 4px;
color: #fff;
font-size: 15px;
}
.day.project-finance:hover .popup-check {
display: block;
width: 12px;
margin-left: auto;
margin-top: 10px;
}
.day.project-finance:hover .project-detail {
color: #fff;
font-size: 9px;
}
.day.project-finance:hover .project-detail:before {
top: 2px;
background-color: #ce283e;
}
.day.project-finance:hover .hover-title {
display: block;
font-size: 8px;
padding-left: 18px;
margin-top: 5px;
}

.hover-title {
display: none;
color: #fff;
}

.popup-check {
display: none;
}

.hide {
display: none;
}

.project-detail {
color: #783cae;
font-size: 10px;
position: relative;
margin-top: 5px;
padding-left: 20px;
line-height: 1.4em;
}
.project-detail + .project-detail {
margin-top: 5px;
}
.project-detail:before {
content: "";
position: absolute;
width: 6px;
height: 6px;
border-radius: 50%;
background-color: #b86df7;
top: 4px;
left: 10px;
}
.project-detail.design {
color: #4844c1;
}
.project-detail.design:before {
background-color: #6f69ea;
}
.project-detail.develop {
color: #de9d3a;
}
.project-detail.develop:before {
background-color: #ffc263;
}
.project-detail.finance {
color: #e85b6f;
}
.project-detail.finance:before {
background-color: #fd667a;
}

.week-month {
display: flex;
height: 30px;
}

.button {
border: 1px solid var(--button-color);
border-radius: 25px 0 0 25px;
color: var(--button-color);
padding: 8px 16px;
font-weight: 600;
font-family: var(--body-font);
font-size: 12px;
flex-shrink: 0;
cursor: pointer;
background-color: transparent;
}
.button.active {
background-color: var(--button-color);
color: var(--theme-bg-color);
}

.button-month {
border-radius: 0 25px 25px 0;
margin-left: -2px;
}

.calender-tab {
display: flex;
align-items: center;
justify-content: space-between;
max-width: 975px;
margin: 0 auto;
width: 100%;
padding-bottom: 30px;
}

.current-month {
position: relative;
padding: 0 10px;
font-weight: 600;
}
.current-year {
font-size: 12px;
color: var(--main-color);
font-weight: 600;
margin-top: 5px;
}

.month-change {
display: flex;
flex-direction: column;
align-items: center;
}

.button-weekends,
.button-task {
border-radius: 25px;
}

.button-task {
margin-left: 15px;
}

.button-weekends {
border-color: var(--main-light-color);
color: var(--main-light-color);
}

.calendar-container {
flex-direction: column;
width: 100%;
padding: 30px 50px;
overflow: auto;
display: none;
}
.calendar-container.calendar-show {
display: flex;
}

.color-menu {
flex-shrink: 0;
border-radius: 50%;
position: relative;
overflow: hidden;
width: 32px;
height: 32px;
}
.color-menu svg {
position: absolute;
z-index: 8;
width: 17px;
top: 7px;
right: 8px;
fill: #fff;
pointer-events: none;
}

.colorpicker {
border: none;
border-radius: 50%;
width: 50px;
height: 55px;
top: -8px;
right: -8px;
position: absolute;
cursor: pointer;
}

@media screen and (max-width: 1270px) {
.mail-icons svg:not(:first-child) {
display: none;
}
}
@media screen and (max-width: 1160px) {
.inbox-container {
width: 370px;
}

.user-profile-area {
width: 320px;
}
}
@media screen and (max-width: 1070px) {
.inbox-container {
display: none;
}

.mail-detail-header .mail-icons svg {
display: inline-block;
}
}
@media screen and (max-width: 960px) {
.inbox-calendar {
margin-right: 100px;
}
}
@media screen and (max-width: 870px) {
.user-profile-area {
display: none;
}
}
@media screen and (max-width: 530px) {
.search-bar {
display: none;
}

.mail-textarea {
padding: 0;
height: 60px;
}

.button-weekends {
display: none;
}
}
@media screen and (max-width: 485px) {
.mail-icons svg:not(:first-child) {
display: none;
}

.inbox-calendar {
margin-right: 0;
}

.calendar-container {
padding: 30px 20px;
}
}
@media screen and (max-width: 370px) {
.mail-doc-icons,
.mail-checklist-date {
display: none;
}
}
.anim-y {
animation: slideUp 0.6s both;
}

.anim-y:nth-child(2) {
animation-delay: 0.28s;
}

.anim-y:nth-child(3) {
animation-delay: 0.42s;
}

.anim-y:nth-child(4) {
animation-delay: 0.56s;
}

.anim-y:nth-child(5) {
animation-delay: 0.7s;
}

.anim-y:nth-child(6) {
animation-delay: 0.84s;
}

.anim-y:nth-child(7) {
animation-delay: 0.98s;
}

.anim-y:nth-child(8) {
animation-delay: 1.12s;
}

.anim-y:nth-child(9) {
animation-delay: 1.26s;
}

.anim-y:nth-child(10) {
animation-delay: 1.4s;
}

@keyframes slideUp {
0% {
transform: translateY(76px) scale(0.92);
opacity: 0;
}
}
@import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap");
.button {
font-family: "Nunito", sans-serif;
margin-bottom: 16px;
margin-right: 8px;
margin-left: 8px;
cursor: pointer;
border: none;
border-radius: 4px;
padding: 8px 12px;
transition: all 0.15s ease-out;
}

.button--primary {
background-color: #13a699;
color: #FFF;
}
.button--primary:hover {
background: #18d4c3;
}

.button--secondary {
background-color: #e71010;
color: #FFF;
}
.button--secondary:hover {
background: #ff0000;
}

.button--cancel {
background-color: #fcef39;
color: black;
}
.button--cancel:hover {
background: rgb(238, 255, 2);
}



.button1 {
text-decoration: none;
background-color: rgb(20, 72, 168);
color: #FFFFFF;
padding: 15px 90px;
margin: 5px;
font-size: 15px;
font-family: Arial;  
border-radius: 25px;
transition: 0.5s;  

}

.button1:hover {
transition: 0.3s;
color: black;
font-weight: bold;
background-color: rgb(88, 137, 230);
padding: 20px 100px;
}



.wrap { padding: 15px; }
h1 { font-size: 28px; }
h4,
modal-title { font-size: 18px; font-weight: bold; }

.no-borders { border: 0px; }
.body-message { font-size: 18px; }
.centered { text-align: center; }
.btn-primary { background-color: #2086c1; border-color: transparent; outline: none; border-radius: 12px; font-size: 15px; padding: 10px 25px; }
.btn-primary:hover { background-color: #2086c1; border-color: transparent; }
.btn-primary:focus { outline: none; }

#writebtn{
text-align: center;
border-radius: 12px;


}
.modal-content{
width:100%; 
width:600px;
height:900px;
margin-left:-270px;
margin-top:-10px;
background-color:#15172b;
border-radius: 12px;
overflow:hidden;  
box-shadow: 10px 10px 10px 10px rgba(0, 0, 0, 0.3); 


}

.submit {
background-color: rgb(19, 118, 247);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: #eee;
font-weight:bold;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:380px;
width: 35%;
}

.submit2 {
background-color: rgb(252, 255, 61);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: rgb(0, 0, 0);
font-weight:bold;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:380px;
width: 35%;
}

.submit3 {
background-color: rgb(38, 190, 33);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: rgb(255, 255, 255);
font-weight:bold;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:380px;
width: 35%;
}

.submit4 {
background-color: rgb(136, 42, 190);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: rgb(255, 255, 255);
font-weight:bold;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:380px;
width: 35%;
}
.submit5{ 

background-color: rgb(255, 255, 255);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: rgb(2, 2, 2);
font-weight:bold;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:380px;
width: 35%;

}
.submit:hover{
background-color:rgb(6, 81, 243);
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;

}
.submit2:hover{
background-color:rgb(188, 206, 30);
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;

}

.submit3:hover{
background-color:rgb(25, 173, 57);
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;

}


.submit3:hover{
background-color:rgb(104, 19, 143);
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;

}
.apwcancle {
background-color: rgb(245, 23, 7);
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: #eee;
cursor: pointer;
font-size: 18px;
height: 50px;
margin-top: 0px;
outline: 0;
text-align: center;
margin-right:80px;
width: 35%;
font-weight:bold;
}


.apwcancle:hover{
background-color: rgb(255, 0, 0);
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;

}
#closebtn{
color:white;
}

.clock {
width: 360px;
height: 70px;
margin-right:80px;
color: #eee;
font-family: sans-serif;
font-size: 36px;
font-weight: 600;



}
.date {
width: 100%;
text-align: center;
font-size: 1.5rem;
}
.date, .hr, .min, .sec, .colon {
color: var(--text);
text-shadow: 0 0 10px var(--shadow-1), 0 0 15px var(--shadow-2), 0 0 20px var(--shadow-2);

}
.hr, .min, .sec, .colon {
width: 20%;
float: left;
text-align: center;
font-size: 2rem;
}
/**
* Tabs
*/

.tabs {
display: flex;
flex-wrap: wrap;

}

.tabs label {
order: 1;
display: inline;
padding: 1rem 2rem;
margin-right: 0.2rem;
cursor: pointer;
font-weight: bold;
transition: background ease 0.8s;
background-color: #303245;
border-radius: 12px;
border: 0;
box-sizing: border-box;
color: #eee;
font-size: 18px;
height: 100%;
outline: 0;
padding: 4px 20px 0;

}

.tabs .tab {
order: 99;
flex-grow: 1;
width: 100%;
display: none;
padding: 1rem;
background: #303245(10, 80, 230);
color:white;
}

.tabs input[type=radio] {
display: none;
}

.tabs input[type=radio]:checked + label {
background: rgb(110, 69, 206);
}

.tabs input[type=radio]:checked + label + .tab {
display: block;
}

@media (max-width: 45em) {
.tabs .tab,
.tabs label {
order: initial;
}

.tabs label {
width: 100%;
margin-right: 0;
margin-top: 0.2rem;
}
}

.agreeer,.referrer,.approver{
float:left;
display:inline;
}
#aptitle,#apcomment,.apfile{
float:left;
font-weight: bold;
}
.form-styling {
width: 450px;
height: 25px;
padding-left: 15px;
border: none;
border-radius: 20px;
background-color: #303245;
color:white;
overflow:hidden;

}
.form-styling3 {
width: 200px;
height: 25px;
padding-left: 15px;
border: none;
border-radius: 20px;
background-color: #303245;
color:white;
overflow:hidden;

}

.form-styling5{

width: 400px;
height: 200px;
padding-left: 15px;
border: none;
border-radius: 20px;
background: rgba(255,255,255,.2);
color:white;
overflow:hidden;
}
.apside{
margin-top:20px;
}

.apside input{
font-weight: bold;
}

/**
* Generic Styling
*/

#apvname1 , #apvnt1 ,#apvname2 , #apvnt2{
float:left;
}

#apwstart,#apw1,#apw2,#apw3{
float:left;

}

#apw1,#apw2,#apw3{
font-weight: bold;
-webkit-text-stroke: 0.9px blue;

}

.apc1,.apc2,.apc3{
float:left;

}

#wlwjd,#wpahr,#zhapsxm,#rlgks,#wlwjd2{
font-size:20px;
font-weight: bold;
}



.controls,#rlgks,.controls3{
float:left;

}

.controls input,.controls2 input{
height:35x;
border-color:#303245;
background-color: #303245;
border-radius: 12px;
color:white;
font-size:15px;
text-align: center;

}
.controls4 textarea {
resize: none;
height: 150px;
width:450px;
background-color: #303245;
border-radius: 12px;
border: 0;
color:white;
}


.file-upload .file-upload-select {
display: block;
color: rgb(226, 224, 224);
cursor: pointer;
text-align: left;
background: #303245;
overflow: hidden;
position: relative;
border-radius: 12px;
height:33px;
font-size: 13px;
width: 370px;

}
.file-upload .file-upload-select .file-select-button {
background:green;
color:white;
padding: 10px;
display: inline-block;
}
.file-upload .file-upload-select .file-select-name {
display: inline-block;
padding: 10px;
}
.file-upload .file-upload-select:hover .file-select-button {
background: #16db58;
color: #ffffff;
transition: all 0.5s ease-in-out;
-moz-transition: all 0.5s ease-in-out;
-webkit-transition: all 0.5s ease-in-out;
-o-transition: all 0.5s ease-in-out;
}
.file-upload .file-upload-select input[type="file"] {
display: none;
}


button {
font-size: inherit;
border: none;
background: #09d;
color: white;
padding: 10px 20px;
}
    
    </style>
</head>

<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

       <!--  topMenu  -->
	    <jsp:include page="../common/topMenu.jsp" />           
	    <!--  sideMenu    -->        
	    <jsp:include page="../common/sideMenu.jsp" />

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <div class="pcoded-content">
                            <div class="main-body">                               
                                    <div class="container">
                                        <div class="user-profile-area">
                                         <div class="task-manager">Sv Company</div>
                                          <div class="side-wrapper">
                                           <div class="user-profile">
                                            <img src="https://images.unsplash.com/flagged/photo-1574282893982-ff1675ba4900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80" alt="" class="user-photo">
                                            <br>
                                           <!--결재 대쉬보드 프로필 시작-->


                                           <!--결재 대쉬보드 로그인세션 계급-->
                                           <div class="user-information">
                                            <div class="user-class">사원</div>
                                           <!--결재 대쉬보드 로그인세션 이름-->
                                            <div class="user-name">강정환</div>
                                           </div>
                                           <!--결재 대쉬보드 로그인세션 부서-->
                                           <div class="user-dept">인사부</div>
                                           <!--결재 대쉬보드 로그인세션 이메일-->
                                           <div class="user-mail">k0102065@gmail.com</div>
                                          </div>
                                          
                                          <!--결재 대쉬보드 프로필 끝-->
                                         
                                          <div class="progress-status">7/17</div>
                                          <div class="progress">
                                           <div class="progress-bar"></div>
                                          </div>
                                          <div class="task-status">
                                           <div class="task-stat">
                                            <div class="task-number">5</div>
                                            <div class="task-condition">진행</div>
                                            <div class="task-tasks">ad</div>
                                           </div>
                                           <div class="task-stat">
                                            <div class="task-number">7</div>
                                            <div class="task-condition">완료</div>
                                            <div class="task-tasks">com</div>
                                           </div>
                                           <div class="task-stat">
                                            <div class="task-number">2</div>
                                            <div class="task-condition">반려</div>
                                            <div class="task-tasks">return</div>
                                           </div>
                                           <div class="task-stat">
                                            <div class="task-number">3</div>
                                            <div class="task-condition">미결재</div>
                                            <div class="task-tasks">none</div>
                                           </div>
                                           <div class="task-stat">
                                            <div class="task-number">17</div>
                                            <div class="task-condition">전체</div>
                                            <div class="task-tasks">all</div>
                                           </div>
                                          </div>
                                         </div>
                                         <div class="side-wrapper">
                                          <div class="project-title">진행중인 프로젝트</div>
                                          <div class="project-name">
                                           <div class="project-department">프로젝트 목록1</div>
                                           <div class="project-department">프로젝트 목록2</div>
                                           <div class="project-department">프로젝트 목록3</div>
                                           <div class="project-department">프로젝트 목록4</div>
                                          </div>
                                         </div>
                                         <div class="side-wrapper">
                                          <div class="project-title">TEAM</div>
                                          <div class="team-member">
                                           <img src="https://images.unsplash.com/flagged/photo-1574282893982-ff1675ba4900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80" alt="" class="members">
                                           <img src="https://assets.codepen.io/3364143/Screen+Shot+2020-08-01+at+12.24.16.png" alt="" class="members">
                                           <img src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60" alt="" class="members">
                                           <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&auto=format&fit=crop&w=998&q=80" alt="" class="members">
                                           <img src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80" alt="" class="members">
                                           </div>
                                          <br>

                                          <!--대쉬보드 결재작성 버튼 시작-->
                                          <div class="wrap" id="writebtn">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-new">
                                              결재 작성
                                            </button>
                                          </div>
                                           
                                          <div class="modal fade bs-example-modal-new" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                            
                                            <div class="modal-dialog">
                                              
                                              <!-- 모달 창 시작 -->
                                              <div class="modal-content">
                                                
                                                <!-- 모달 창 헤더 -->
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closebtn"><span aria-hidden="true">&times;</span></button>
                                                   <!--모달 창 시계 시작-->
                                                    <div class='clock'>
                                                      <div class='date'></div>
                                                      <div class='hr'></div>
                                                      <div class='colon'>:</div>
                                                      <div class='min'></div>
                                                      <div class='colon'>:</div>
                                                      <div class='sec'></div>
                                                    </div>
                                                     <!--모달 창 시계 끝-->
                                                </div>
                                                <!--헤더 끝-->
                                              
                                                <!-- 모달 창 내용 -->  
                                                <div class="modal-body">
                                                  <div class="body-message">
                                                    <div class="tabs">
                                                      <!--결재폼 1 : 기안서 폼 시작 -->
                                                      <input type="radio" name="tabs" id="tabone" checked="checked" value="기안서">
                                                      <label for="tabone">기안서</label>
                                                      <div class="tab">
                                                        <form name="apform1" action="값을 보낼 주소" method="post">
                                                        <!--결재 관련 이름 시작-->
                                                       <div id="apwstart">🔍기안자는&nbsp;</div><div id="apw1" name="apd1">부서&nbsp;</div><div id="apw2" name="apn1">이름&nbsp;</div><div id="apw3" name="apc1">직급&nbsp;</div><div>님&nbsp;입니다.</div>
                                                        <br>
                                                        <div id="wlwjd">👩‍💼👨‍💼결재선 지정</div>
                                                        <br>
                                                        <div class="agreeer">🔵합의자:</div><input class="form-styling" type="text" name="agreeer" placeholder="합의자를 지정하세요." required/>
                                                        <div class="referrer">🟣참조자:</div><input class="form-styling" type="text" name="referrer" placeholder="참조자를 지정하세요." required/>
                                                        <div class="approver">🟢결재자:</div><input class="form-styling3" type="text" name="approver" placeholder="결재자를 지정하세요." required/>
                                                        <br>
                                                        <div class="apside">
                                                          <div id="wlwjd2">📜기안서 작성</div>
                                                          <br>
                                                        <div id="aptitle" name="apt1">제목:</div><input class="form-styling" type="text" name="apt1" placeholder="결재 제목" required/>
                                                        
                                                        <br>
                                                       
                                                      </div>
                                                      <br>         

                                                      <!--기안서 날짜 시작-->
                                                      <div id="rlgks">📆기한:</div>
                                                        <div class="controls">
                                                          <input type="date" id="arrive" class="floatLabel" name="arrive1" value="<?php echo date('Y-m-d'); ?>" required>
                                                         <i class="fa fa-calendar"></i>
                                                        </div>      
                                                        <div class="controls3">~</div>
                                                        <div class="controls2">
                                                          <input type="date" id="depart" class="floatLabel" name="depart1" value="<?php echo date('Y-m-d'); ?>" required/>
                                                          <i class="fa fa-calendar"></i>
                                                        </div>      
                                                      <!--기안서 날짜 끝-->

                                                      <br>

                                                      <!--기안서 코멘트 시작-->
                                                      <div id="apcomment" >❗코멘트:</div>
                                                      <div class="controls4">
                                                        <textarea name="comments1" class="floatLabel" id="comments" required></textarea>
                                                      </div>
                                                      <br>
                                                      <br>
                                                       <!--기안서 코멘트 끝-->   

                                                       <!--기안서 파일첨부 시작-->
                                                      <div class="apfile">📎파일첨부:</div>
                                                      <div class="file-upload">
                                                        <div class="file-upload-select">
                                                          <div class="file-select-button" >Add File</div>
                                                          <div class="file-select-name">결재 상신시 양식에 맞는 문서 필수 첨부</div> 
                                                          <input type="file" name="file-upload-input" id="file-upload-input" >
                                                        </div>
                                                      </div>
                                                      <br>
                                                      <!--기안서 파일첨부 끝-->

                                                      <!--기안서 상신 버튼 시작-->
                                                      <div class="modal-footer">
                                                          <button type="text" class="submit" id="aps1">기안서 상신</button>
                                                          <button type="text" class="apwcancle"  data-dismiss="modal" aria-label="Close" >취소</button>
                                                      </div>
                                                      <!--기안서 상신 버튼 끝-->
                                                    </div>
                                                  </form>

                                                    <!--결재폼1 : 기안서 끝-->
                                                      

                                                      <!--결재폼2 : 세금계산서 시작-->
                                                      <input type="radio" name="tabs" id="tabtwo" value="세금계산서">
                                                      <label for="tabtwo">세금계산서</label>
                                                      <div class="tab">
                                                        <form name="apform2" action="값을 보낼 주소" method="post">
                                                        <!--결재 관련 이름 시작--> <!--로그인세션 부서,이름,직급 보낸 후 뿌려주기 -->
                                                       <div id="apwstart">🧾기안자는&nbsp;</div><div id="apw1" name="apd2">부서&nbsp;</div><div id="apw2" name="apn2" >이름&nbsp;</div><div id="apw3" name="apc2">직급&nbsp;</div><div>님&nbsp;입니다.</div>
                                                        <br>
                                                        <div id="wlwjd">👨‍💻결재선 지정</div>
                                                        <br>
                                                        <div class="agreeer">📘합의자:</div><input class="form-styling" type="text" name="agreeer2" placeholder="합의자를 지정하세요." required/>
                                                        <div class="referrer">📕참조자:</div><input class="form-styling" type="text" name="referrer2" placeholder="참조자를 지정하세요." required />
                                                        <div class="approver">📗결재자:</div><input class="form-styling3" type="text" name="approver3" placeholder="결재자를 지정하세요." required/>
                                                        <br>
                                                        <div class="apside">
                                                          <div id="wlwjd2">💰세금계산서 작성</div>
                                                          <br>
                                                        <div id="aptitle" name="apt2">제목:</div><input class="form-styling" type="text" name="apt2" placeholder="결재 제목" required/>
                                                        
                                                        <br>
                                                       
                                                      </div>
                                                      <br>         

                                                      <!--세금계산서 날짜 시작-->
                                                      <div id="rlgks">📆기한:</div>
                                                        <div class="controls">
                                                          <input type="date" id="arrive2" class="floatLabel" name="arrive2" value="<?php echo date('Y-m-d'); ?>" required>
                                                         <i class="fa fa-calendar"></i>
                                                        </div>      
                                                        <div class="controls3">~</div>
                                                        <div class="controls2">
                                                          <input type="date" id="depart2" class="floatLabel" name="depart2" value="<?php echo date('Y-m-d'); ?>" required/>
                                                          <i class="fa fa-calendar"></i>
                                                        </div>      
                                                      <!--세금계산서 날짜 끝-->

                                                      <br>

                                                      <!--세금계산서 코멘트 시작-->
                                                      <div id="apcomment">📋코멘트:</div>
                                                      <div class="controls4">
                                                        <textarea name="comments2" class="floatLabel" id="comments" required></textarea>
                                                      </div>
                                                      <br>
                                                      <br>
                                                       <!--세금계산서 코멘트 끝-->   

                                                       <!--세금계산서 파일첨부 시작-->
                                                      <div class="apfile">📎파일첨부:</div>
                                                      <div class="file-upload">
                                                        <div class="file-upload-select">
                                                          <div class="file-select-button" >Add File</div>
                                                          <div class="file-select-name">결재 상신시 양식에 맞는 문서 필수 첨부</div> 
                                                          <input type="file" name="file-upload-input2" id="file-upload-input">
                                                        </div>
                                                      </div>
                                                      <br>
                                                      <!--세금계산서 파일첨부 끝-->

                                                      <!--세금계산서 상신 버튼 시작-->
                                                      <div class="modal-footer">
                                                          <button type="text" class="submit2" id="aps2">세금계산서 상신</button>
                                                          <button type="text" class="apwcancle"  data-dismiss="modal" aria-label="Close">취소</button>
                                                      </div>
                                                      <!--세금계산서 상신 버튼 끝-->
                                                    </div>
                                                  </form>
                                                    <!--세금계산서 폼 끝-->
                                                      

                                                    <!-- 결재폼3: 보고서 폼 시작 -->
                                                      <input type="radio" name="tabs" id="tabthree" value="보고서">
                                                      <label for="tabthree">보고서</label>
                                                      <div class="tab">
                                                        <form name="apform3" action="값을 보낼 주소" method="post">
                                                        <!--결재 관련 이름 시작-->
                                                       <div id="apwstart">📁기안자는&nbsp;</div><div id="apw1" name="apd3">부서&nbsp;</div><div id="apw2" name="apn3">이름&nbsp;</div><div id="apw3" name="apc3">직급&nbsp;</div><div>님&nbsp;입니다.</div>
                                                        <br>
                                                        <div id="wlwjd">👨‍🏫결재선 지정</div>
                                                        <br>
                                                        <div class="agreeer">👩‍🏫합의자:</div><input class="form-styling" type="text" name="agreeer3" placeholder="합의자를 지정하세요." required/>
                                                        <div class="referrer">👨‍🏫참조자:</div><input class="form-styling" type="text" name="referrer3" placeholder="참조자를 지정하세요." required/>
                                                        <div class="approver">👨‍⚖️결재자:</div><input class="form-styling3" type="text" name="approver3" placeholder="결재자를 지정하세요." required/>
                                                        <br>
                                                        <div class="apside">
                                                          <div id="wlwjd2">📈보고서 작성</div>
                                                          <br>
                                                        <div id="aptitle" name="apt3">제목:</div><input class="form-styling" type="text" name="apt3" placeholder="결재 제목" required/>
                                                        
                                                        <br>
                                                       
                                                      </div>
                                                      <br>         

                                                      <!--보고서 날짜 시작-->
                                                      <div id="rlgks">📆기한:</div>
                                                        <div class="controls">
                                                          <input type="date" id="arrive" class="floatLabel" name="arrive3" value="<?php echo date('Y-m-d'); ?>" required >
                                                         <i class="fa fa-calendar"></i>
                                                        </div>      
                                                        <div class="controls3">~</div>
                                                        <div class="controls2">
                                                          <input type="date" id="depart" class="floatLabel" name="depart3" value="<?php echo date('Y-m-d'); ?>" required/>
                                                          <i class="fa fa-calendar"></i>
                                                        </div>      
                                                      <!--보고서 날짜 끝-->

                                                      <br>

                                                      <!--보고서 코멘트 시작-->
                                                      <div id="apcomment">✍코멘트:</div>
                                                      <div class="controls4">
                                                        <textarea name="comments3" class="floatLabel" id="comments" required></textarea>
                                                      </div>
                                                      <br>
                                                      <br>
                                                       <!--보고서 코멘트 끝-->   

                                                       <!--보고서 파일첨부 시작-->
                                                      <div class="apfile">📎파일첨부:</div>
                                                      <div class="file-upload">
                                                        <div class="file-upload-select">
                                                          <div class="file-select-button" >Add File</div>
                                                          <div class="file-select-name">결재 상신시 양식에 맞는 문서 필수 첨부</div> 
                                                          <input type="file" name="file-upload-input3" id="file-upload-input">
                                                        </div>
                                                      </div>
                                                      <br>
                                                      <!--보고서 파일첨부 끝-->

                                                      <!--보고서 상신 버튼 시작-->
                                                      <div class="modal-footer">
                                                          <button type="text" class="submit3" id="aps3">보고서 상신</button>
                                                          <button type="text" class="apwcancle"  data-dismiss="modal" aria-label="Close" >취소</button>
                                                      </div>
                                                      <!--보고서 상신 버튼 끝-->
                                                    </div>
                                                  </form>
                                                    <!--결재폼 3: 보고서 폼 끝-->

                                                      
                                                    <!--결재폼4: 품의서 시작-->
                                                      <input type="radio" name="tabs" id="tabfour">
                                                      <label for="tabfour">품의서</label>
                                                      <div class="tab">
                                                        <form name="apform4" action="값을 보낼 주소" method="post">
                                                         <!--결재 관련 이름 시작-->
                                                       <div id="apwstart">📦기안자는&nbsp;</div><div id="apw1" name="apd4">부서&nbsp;</div><div id="apw2" name="apn4">이름&nbsp;</div><div id="apw3" name="apc4">직급&nbsp;</div><div>님&nbsp;입니다.</div>
                                                       <br>
                                                       <div id="wlwjd">💵결재선 지정</div>
                                                       <br>
                                                       <div class="agreeer">👨합의자:</div><input class="form-styling" type="text" name="agreeer4" placeholder="합의자를 지정하세요." required/>
                                                       <div class="referrer">🧑참조자:</div><input class="form-styling" type="text" name="referrer4" placeholder="참조자를 지정하세요." required/>
                                                       <div class="approver">👩결재자:</div><input class="form-styling3" type="text" name="approver4" placeholder="결재자를 지정하세요." required/>
                                                       <br>
                                                       <div class="apside">
                                                         <div id="wlwjd2">품의서 작성</div>
                                                         <br>
                                                       <div id="aptitle" name="apt4">제목:</div><input class="form-styling" type="text" name="apt4" placeholder="결재 제목" required/>
                                                       
                                                       <br>
                                                      
                                                     </div>
                                                     <br>         

                                                     <!--품의서 날짜 시작-->
                                                     <div id="rlgks">📆기한:</div>
                                                       <div class="controls">
                                                         <input type="date" id="arrive" class="floatLabel" name="arrive4" value="<?php echo date('Y-m-d'); ?>" required>
                                                        <i class="fa fa-calendar"></i>
                                                       </div>      
                                                       <div class="controls3">~</div>
                                                       <div class="controls2">
                                                         <input type="date" id="depart" class="floatLabel" name="depart4" value="<?php echo date('Y-m-d'); ?>" required/>
                                                         <i class="fa fa-calendar"></i>
                                                       </div>      
                                                     <!--품의서 날짜 끝-->

                                                     <br>

                                                     <!--품의서 코멘트 시작-->
                                                     <div id="apcomment">👨‍🏫코멘트:</div>
                                                     <div class="controls4">
                                                       <textarea name="comments4" class="floatLabel" id="comments" required></textarea>
                                                     </div>
                                                     <br>
                                                     <br>
                                                      <!--품의서 코멘트 끝-->   

                                                      <!--품의서 파일첨부 시작-->
                                                     <div class="apfile">📎파일첨부:</div>
                                                     <div class="file-upload">
                                                       <div class="file-upload-select">
                                                         <div class="file-select-button" >Add File</div>
                                                         <div class="file-select-name">결재 상신시 양식에 맞는 문서 필수 첨부</div> 
                                                         <input type="file" name="file-upload-input4" id="file-upload-input">
                                                       </div>
                                                     </div>
                                                     <br>
                                                     <!--품의서 파일첨부 끝-->

                                                     <!--품의서 상신 버튼 시작-->
                                                     <div class="modal-footer">
                                                         <button type="text" class="submit4" id="aps4">품의서 상신</button>
                                                         <button type="text" class="apwcancle"  data-dismiss="modal" aria-label="Close" >취소</button>
                                                     </div>
                                                     <!--품의서 상신 버튼 끝-->
                                                      </div>
                                                    </form>
                                                      <!--결재폼4: 품의서 끝-->

                                                      
                                                      <!--결재폼5: 계획서 시작-->
                                                      <input type="radio" name="tabs" id="tabfive">
                                                      <label for="tabfive">계획서</label>
                                                      <div class="tab">
                                                        <form name="apform5" action="값을 보낼 주소" method="post">
                                                        <!--결재 관련 이름 시작-->
                                                        <div id="apwstart">🧾기안자는&nbsp;</div><div id="apw1" name="apd5">부서&nbsp;</div><div id="apw2" name="apn5">이름&nbsp;</div><div id="apw3" name="apc5">직급&nbsp;</div><div>님&nbsp;입니다.</div>
                                                        <br>
                                                        <div id="wlwjd">🙆‍♂️결재선 지정</div>
                                                        <br>
                                                        <div class="agreeer">🕵️‍♂️합의자:</div><input class="form-styling" type="text" name="agreeer5" placeholder="합의자를 지정하세요." required/>
                                                        <div class="referrer">🕵️‍♂️참조자:</div><input class="form-styling" type="text" name="referrer5" placeholder="참조자를 지정하세요." required/>
                                                        <div class="approver">🕵️‍♂️결재자:</div><input class="form-styling3" type="text" name="approver5" placeholder="결재자를 지정하세요." required/>
                                                        <br>
                                                        <div class="apside">
                                                          <div id="wlwjd2">계획서 작성</div>
                                                          <br>
                                                        <div id="aptitle" name="apt5">제목:</div><input class="form-styling" type="text" name="apt5" placeholder="결재 제목" required/>
                                                        
                                                        <br>
                                                       
                                                      </div>
                                                      <br>         

                                                      <!--계획서 날짜 시작-->
                                                      <div id="rlgks">📆기한:</div>
                                                        <div class="controls">
                                                          <input type="date" id="arrive" class="floatLabel" name="arrive5" value="<?php echo date('Y-m-d'); ?>" required>
                                                         <i class="fa fa-calendar"></i>
                                                        </div>      
                                                        <div class="controls3">~</div>
                                                        <div class="controls2">
                                                          <input type="date" id="depart" class="floatLabel" name="depart5" value="<?php echo date('Y-m-d'); ?>" required/>
                                                          <i class="fa fa-calendar"></i>
                                                        </div>      
                                                      <!--계획서 날짜 끝-->

                                                      <br>

                                                      <!--계획서 코멘트 시작-->
                                                      <div id="apcomment">📒코멘트:</div>
                                                      <div class="controls4">
                                                        <textarea name="comments5" class="floatLabel" id="comments" required></textarea>
                                                      </div>
                                                      <br>
                                                      <br>
                                                       <!--계획서 코멘트 끝-->   

                                                       <!--계획서 파일첨부 시작-->
                                                      <div class="apfile">📎파일첨부:</div>
                                                      <div class="file-upload">
                                                        <div class="file-upload-select">
                                                          <div class="file-select-button" >Add File</div>
                                                          <div class="file-select-name">결재 상신시 양식에 맞는 문서 필수 첨부</div> 
                                                          <input type="file" name="file-upload-input5" id="file-upload-input">
                                                        </div>
                                                      </div>
                                                      <br>
                                                      <!--계획서 파일첨부 끝-->

                                                      <!--계획서 상신 버튼 시작-->
                                                      <div class="modal-footer">
                                                          <button type="text" class="submit5" id="aps5">계획서 상신</button>
                                                          <button type="text" class="apwcancle"  data-dismiss="modal" aria-label="Close" >취소</button>
                                                      </div>
                                                      <!--계획서 상신 버튼 끝-->
                                                      </div>
                                                    </form>
                                                      <!--결재폼5: 계획서 끝-->
                                                    </div>
                                                  </div>
                                                </div>                                        
                                                <!--모달 footer -->                                       
                                              </div>
                                              <!-- 모달 창 컨텐츠 끝 -->
                                            </div>
                                          </div>
                                           <!--대쉬보드 결재작성 버튼 끝-->                                    
                                         </div>              
                                        </div>
                                        <div class="main-area">
                                         <div class="header">
                                          <div class="search-bar">
                                           <input type="text" placeholder="Search...">
                                          </div>
                                         </div>
                                         <div class="main-container">
                                          <div class="inbox-container">
                                           <div class="inbox">
                                            <div class="msg msg-department anim-y">
                                             전체
                                             <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 492 492">
                                              <path d="M484.13 124.99l-16.11-16.23a26.72 26.72 0 00-19.04-7.86c-7.2 0-13.96 2.79-19.03 7.86L246.1 292.6 62.06 108.55c-5.07-5.06-11.82-7.85-19.03-7.85s-13.97 2.79-19.04 7.85L7.87 124.68a26.94 26.94 0 000 38.06l219.14 219.93c5.06 5.06 11.81 8.63 19.08 8.63h.09c7.2 0 13.96-3.57 19.02-8.63l218.93-219.33A27.18 27.18 0 00492 144.1c0-7.2-2.8-14.06-7.87-19.12z"></path>
                                             </svg>
                                             
                                            </div>

                                            <!--테스트 결재리스트 1 시작-->
                                            <div class="msg selected-bg anim-y">
                                             <input type="checkbox" name="msg" id="mail1" class="mail-choice" checked>
                                             <label for="mail1"></label>
                                             <div class="msg-content">
                                              <a href=""><div class="msg-title">휴가 건의 (휴가원 문서 첨부)</div></a>
                                              <!--결재 목록 기한-->
                                              <div class="msg-date">기한:</div>
                                              <div class="msg-startday">&nbsp;2021.08.20&nbsp;</div>
                                              <div class="msg-date2">~</div>
                                              <div class="msg-endday">&nbsp;2021.09.15</div>
                                               <!--결재 목록 기안자-->
                                              <div class="msg-sender">기안자:</div>
                                              <div class="msg-sender2">&nbsp;강정환</div>
                                              <div class="msg-sender3">&nbsp;사원</div>
                                               <!--결재 목록 결재권자--> 
                                              <div class="msg-approve">결재권자:</div>
                                              <div class="msg-approve2">&nbsp;아무개</div>
                                              <div class="msg-approve3">&nbsp;사장</div>
                                              <!--결재 목록 문서종류-->
                                              <div class="msg-doctype">문서종류:</div>
                                              <div class="msg-doctype2">&nbsp;기안서</div>
                                             </div>
                                             <img src="https://assets.codepen.io/3364143/Screen+Shot+2020-08-01+at+12.24.16.png" alt="" class="members mail-members">
                                            </div>
                                            <!--테스트 결재리스트 1 끝-->

                                               <!--테스트 결재리스트 1 시작-->
                                               <div class="msg selected-bg anim-y">
                                                <input type="checkbox" name="msg" id="mail1" class="mail-choice2" checked>
                                                <label for="mail1"></label>
                                                <div class="msg-content">
                                                 <a href=""><div class="msg-title">휴가 건의 (휴가원 문서 첨부)</div></a>
                                                 <!--결재 목록 기한-->
                                                 <div class="msg-date">기한:</div>
                                                 <div class="msg-startday">&nbsp;2021.08.20&nbsp;</div>
                                                 <div class="msg-date2">~</div>
                                                 <div class="msg-endday">&nbsp;2021.09.15</div>
                                                  <!--결재 목록 기안자-->
                                                 <div class="msg-sender">기안자:</div>
                                                 <div class="msg-sender2">&nbsp;강정환</div>
                                                 <div class="msg-sender3">&nbsp;사원</div>
                                                  <!--결재 목록 결재권자--> 
                                                 <div class="msg-approve">결재권자:</div>
                                                 <div class="msg-approve2">&nbsp;아무개</div>
                                                 <div class="msg-approve3">&nbsp;사장</div>
                                                 <!--결재 목록 문서종류-->
                                                 <div class="msg-doctype">문서종류:</div>
                                                 <div class="msg-doctype2">&nbsp;세금 계산서</div>
                                                </div>
                                                <img src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=800&amp;q=60" alt="" class="members mail-members">
                                               </div>
                                               <!--테스트 결재리스트 1 끝-->

                                                 <!--테스트 결재리스트 1 시작-->
                                            <div class="msg selected-bg anim-y">
                                              <input type="checkbox" name="msg" id="mail1" class="mail-choice3" checked>
                                              <label for="mail1"></label>
                                              <div class="msg-content">
                                               <a href=""><div class="msg-title">휴가 건의 (휴가원 문서 첨부)</div></a>
                                               <!--결재 목록 기한-->
                                               <div class="msg-date">기한:</div>
                                               <div class="msg-startday">&nbsp;2021.08.20&nbsp;</div>
                                               <div class="msg-date2">~</div>
                                               <div class="msg-endday">&nbsp;2021.09.15</div>
                                                <!--결재 목록 기안자-->
                                               <div class="msg-sender">기안자:</div>
                                               <div class="msg-sender2">&nbsp;강정환</div>
                                               <div class="msg-sender3">&nbsp;사원</div>
                                                <!--결재 목록 결재권자--> 
                                               <div class="msg-approve">결재권자:</div>
                                               <div class="msg-approve2">&nbsp;아무개</div>
                                               <div class="msg-approve3">&nbsp;사장</div>
                                               <!--결재 목록 문서종류-->
                                               <div class="msg-doctype">문서종류:</div>
                                               <div class="msg-doctype2">&nbsp;계획서</div>
                                              </div>
                                              <img src="https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=934&amp;q=80" alt="" class="members mail-members">
                                             </div>
                                             <!--테스트 결재리스트 1 끝-->
                                           </div>                                
                                          </div>
                                          <div class="mail-detail">
                                           <div class="mail-detail-header">
                                            <div class="mail-detail-profile">
                                             <img src="https://images.unsplash.com/flagged/photo-1574282893982-ff1675ba4900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80" alt="" class="members inbox-detail" />
                                          <div class="mail-detail-name">
                                             <div class="apc1">기안자:&nbsp;</div>
                                             <div class="apc2">강정환&nbsp;</div>
                                             <div class="apc3">사원</div>    
                                          </div>
                                            </div>
                                            <div class="mail-icons">         
                                              <button class="button button--primary" value="alert"  id="apv_approve">승인</button>
                                              <button class="button button--secondary" value="alert" id="apv_refuse">거절</button>
                                              <button class="button button--cancel" value="alert" id="apv_cancle">반려</button>                                     
                                            </div>
                                           </div>                      
                                           <div class="mail-contents">
                                            <div class="mail-contents-subject">
                                             <input type="checkbox" name="msg" id="mail20" class="mail-choice" checked>
                                             <label for="mail20"></label>
                                             <div class="mail-contents-title">결재 제목</div>
                                            </div>
                                            <div class="wrapper">
                                              
                                              <div class="mail">
                                                <div class="mail-time">
                                                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
                                                    <circle cx="12" cy="12" r="10" />
                                                    <path d="M12 6v6l4 2" /></svg>
                                              12 Mar, 2019
                                            </div>
                                            
                                            
                                            <div class="assignee">
                                            <div class="aprf1">참조자:</div><div></div>
                                            <div class="af">합의자:</div><div></div>
                                            <div class="af">결재권자:</div><div></div>
                                            </div>
                                            
                                            <div class="mail-inside">결재 내용 결재 내용 결재 내용 결재 내용 결재 내용 결재 내용결재 내용결재 내용결재 내용결재 내용결재 내용</div>
                                            
                                            <div class="mail-assign">
                                              <!--결재 대쉬보드 상세보기 진행로그 결재승인-->
                                              <div class="assignee">
                                                <div class="msg-apvname">&nbsp;아무개</div>
                                                <div class="msg-apvclass">&nbsp;사장</div>
                                                  <div class="msg-apvmsg">&nbsp;승인 되었습니다.</div>
                                                    <span class="assign-date">&nbsp;&nbsp;- 2021.06.50</span>
                                                   </div>
                                                   <br>
                                               <!--결재 대쉬보드 상세보기 진행로그 합의거절-->    
                                              <div class="assignee">
                                                <div class="msg-canclename">&nbsp;홍길동</div>
                                                <div class="msg-cancleclass">&nbsp;부장</div>
                                                <div class="msg-canclemsg">&nbsp;합의 거절 되었습니다.</div>
                                                  <span class="cancle-date">&nbsp;&nbsp;- 2021.04.20</span>
                                              </div>
                                              <br>
                                               <!--결재 대쉬보드 상세보기 진행로그 반려-->  
                                             <div class="assignee">
                                              <div class="msg-returnname">&nbsp;강정환</div>
                                              <div class="msg-returnclass">&nbsp;팀장</div>
                                              <div class="msg-returnmsg">&nbsp;반려 되었습니다.</div>
                                                <span class="return-date">&nbsp;&nbsp;- 2021.01.20</span>
                                            </div>
                                            <br>
                                             </div>    
                                           </div>
                                           <!--결재 대쉬보드 상세보기 결재승인 메세지-->
                                             <div class="mail-checklist">
                                              <div class="msg-apvmsg2">&nbsp;결재 완료.</div>
                                              <span class="assign-date">&nbsp;&nbsp;- 2021.06.50</span>
                                             </div>
                                             
                                             <!--결재 대쉬보드 상세보기 첨부파일 문서-->
                                             <div class="mail-doc">
                                              <div class="mail-doc-wrapper">
                                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text">
                                                <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z" />
                                                <path d="M14 2v6h6M16 13H8M16 17H8M10 9H8" /></svg>
                                                
                                               <div class="mail-doc-detail" id="apdetailfile">
                                                <div class="mail-doc-name">강정환 사원 휴가원 제출.docx</div>
                                                <div class="mail-doc-date">추가됨 17 May, 2020</div>
                                               </div>
                                              </div>
                                              <div class="mail-doc-icons">
                                               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download-cloud">
                                                <path d="M8 17l4 4 4-4M12 12v9" />
                                                <path d="M20.88 18.09A5 5 0 0018 9h-1.26A8 8 0 103 16.29" /></svg>
                                              </div>
                                             </div>
                                            </div>
                                           </div>
                                           <div class="mail-textarea">
                                            <input type="text" placeholder="Comment">
                                            <div class="textarea-icons">
                                             <div class="attach">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip">
                                               <path d="M21.44 11.05l-9.19 9.19a6 6 0 01-8.49-8.49l9.19-9.19a4 4 0 015.66 5.66l-9.2 9.19a2 2 0 01-2.83-2.83l8.49-8.48" /></svg>
                                             </div>
                                             <div class="send">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send">
                                               <path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z" /></svg>
                                             </div>
                                            </div>
                                           </div>
                                          </div>
                                         </div>
                                        </div>
                                       </div>
                                </div>
                            </div>
                            <div id="styleSelector">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="fixed-button">
	<a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
	  <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
	</a>
</div>

<!--결재 처리 버튼 스크립트 시작-->
<script>
  $().ready(function () {
            $("#apv_approve").click(function () {
                Swal.fire({
                    title: '결재를 승인 하시겠습니까?',
                    icon: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#13a699',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '승인',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '결재 승인 완료되었습니다.',
                            '',
                            'success'
                        )
                    }
                })
            });
        });

        $().ready(function () {
            $("#apv_refuse").click(function () {
                Swal.fire({
                    title: '합의를 거절 하시겠습니까?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d61c1c',
                    cancelButtonColor: '#000000',
                    confirmButtonText: '거절',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '합의 거절 되었습니다.',
                            '',
                            'error'
                        )
                    }
                })
            });
        });

        $().ready(function () {
            $("#apv_cancle").click(function () {
                Swal.fire({
                    title: '결재를 반려하시겠습니까?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#f08b11',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '반려',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '결재가 반려되었습니다.',
                            '',
                            'warning'
                        )
                    }
                })
            });
        });
  </script>
<!-- 결재 처리 버튼 스크립트 끝-->


<!--파일첨부 스크립트 시작-->
<script>
let fileInput = document.getElementById("file-upload-input");
let fileSelect = document.getElementsByClassName("file-upload-select")[0];
fileSelect.onclick = function() {
	fileInput.click();
}
fileInput.onchange = function() {
	let filename = fileInput.files[0].name;
	let selectName = document.getElementsByClassName("file-select-name")[0];
	selectName.innerText = filename;
}
</script>
<!--파일첨부 스크립트 끝-->

<!--시계 스크립트 시작-->
<script>
  // execute function clock()
clock();

// execute function clock() every 1 second
// 1000 milliseconds = 1 second
setInterval( clock, 1000 );

function clock() {
  
  // a crete date object
  var d = new Date();
  
  // get year
  var year = d.getFullYear().toString().padStart(2, '0');
  
  // get month - from 0 to 11
  var month = ( d.getMonth() + 1 ).toString().padStart(2, '0');
  
  // get day of the month - from 1 to 31
  var day = d.getDate().toString().padStart(2, '0');
  
  // get day of the week - from 0 to 6
  // get name of the weekday, 0 = Sunday, 1 = Monday, 2 = Tuesday, ...
  switch ( d.getDay() ) {
    case 1: 
      var weekDay = '(월)'; break;
    case 2: 
      var weekDay = '(화)'; break;
    case 3: 
      var weekDay = '(수)'; break;
    case 4: 
      var weekDay = '(목)'; break;
    case 5: 
      var weekDay = '(금)'; break;
    case 6: 
      var weekDay = '(토)'; break;
    case 0: 
      var weekDay = '(일)'; break;
  }
  
  // add leading zero
  var hr = d.getHours().toString().padStart(2, '0');
  var min = d.getMinutes().toString().padStart(2, '0');
  var sec = d.getSeconds().toString().padStart(2, '0');
  
  // set content of date
  document.querySelector('.date').innerHTML = year + '-' + month + '-' + day + ' ' + weekDay;
  
  // set content of hour
  document.querySelector('.hr').innerHTML = hr + '시';
  
  // set content of minute
  document.querySelector('.min').innerHTML = min + '분';
  
  // set content of second
  document.querySelector('.sec').innerHTML = sec + '초';
}
  </script>
  <!--시계 스크립트 끝-->
<script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script>
<!-- classie js -->
<script type="text/javascript" src="assets/js/classie/classie.js"></script>
<!-- Morris Chart js -->
<script src="assets/js/raphael/raphael.min.js"></script>
<script src="assets/js/morris.js/morris.js"></script>
<!-- Custom js -->
<script src="assets/pages/chart/morris/morris-custom-chart.js"></script>
<script type="text/javascript" src="assets/js/script.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
</body>
</html>