<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아카이뷰</title>
  <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${appRoot}/css/reset.css">
  <link rel="stylesheet" href="${appRoot}/css/header.css">
  <link rel="stylesheet" href="${appRoot}/css/sidebar.css">
  <link rel="stylesheet" href="${appRoot}/css/footer.css">
  <link rel="stylesheet" href="${appRoot}/css/bootstrap/dist/css/custom.css">
  <link rel="stylesheet" href="${appRoot}/css/main.css">
  <link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
  <link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
  <link rel="stylesheet" href="${appRoot}/css/profile.css">
  <link rel="stylesheet" href="${appRoot}/css/detailForUser.css">
  <style>
  
  #container {
      width:920px;
      margin:0 auto;
      margin-top: 75px;
    }
    
    #profile_contents {
    margin-top: 10px;
    
    }

#body {
  xposition: absolute;
  xleft: 230px;
  xtop: 70px;
  box-sizing: content-box;
  xwidth: 700px;
  height: 700px;
  padding: 0px;
  overflow: hidden;
  overflow-y: scroll;
  -ms-overflow-style: none;
  scrollbar-width: none;
}

#body::-webkit-scrollbar {
  display: none;
}

#reveiwDetail img[data-bs-dismiss="modal"] {
  width: 20px;
  position: absolute;
  top: -25px;
  right: 0px;
}
    
  </style>
  <script src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
  <script src="${appRoot}/node_modules/jquery/dist/jquery.js"></script>
  <script src="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.js" type="text/javascript"></script>

</head>
  <body>

	  <!-- <div id="headerLine"></div> -->
	  <div id="container">
	  <tiles:insertAttribute name="header"/>
		  <tiles:insertAttribute name="sidebar"/>
		  <div id="body">
		  <tiles:insertAttribute name="body"/>
	  </div>
	  <tiles:insertAttribute name="footer"/>

	  </div>
	  
	 <div class="modal fade" id="reveiwDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog">
   <div class="modal-content">
      <div class="modal-body">
        <!-- 모달 화면 -->
      </div>
        <img src='<%=getServletContext().getContextPath()%>/main_resource/x.png' data-bs-dismiss="modal">
        </div>
  </div>
</div>
	  
<script>
"use strict" 
var count = 1;
var body = document.querySelector("#body");
body.onscroll = function(e) {
    console.log(body.scrollTop)
    if(body.scrollTop >= 1850) {
        count++;
        console.log("스크롤 끝 감지") 
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/Archiview/app/ajax/review/moreFeed?pageNo=" + count, false);
        xhr.send();
        var originContent = body.innerHTML;
        body.innerHTML = originContent + xhr.responseText;
        var cards = document.querySelectorAll(".stillcut");
        for (var card of cards) {
        	  console.log(card.getAttribute("data-no"))
        	  card.onclick = function(card) {
        	    console.log("클릭")
        	    console.log(this.getAttribute("data-no"));
        	    reviewNo=this.getAttribute("data-no");
        	    myModal.show();
        	  };
        	}
    }
}; 


var cards = document.querySelectorAll(".stillcut");
var myModal = new bootstrap.Modal(document.getElementById('reveiwDetail'), {});
var exampleModal = document.querySelector("#reveiwDetail");
var exampleModalBody = exampleModal.querySelector(".modal-body");
var reviewNo;

exampleModal.addEventListener('show.bs.modal', function (event) {
  console.log("show.bs.modal")
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/Archiview/app/ajax/review/detailForUser?reviewNo=" + reviewNo, false);
  xhr.send();
  exampleModalBody.innerHTML = xhr.responseText;
});

exampleModal.addEventListener('shown.bs.modal', function (event) {
  console.log("shown.bs.modal")
});

exampleModal.addEventListener('hidden.bs.modal', function (event) {
  console.log("hidden.bs.modal")
});

for (var e of cards) {
  console.log(e.getAttribute("data-no"))
  e.onclick = function(e) {
    console.log("클릭")
    console.log(this.getAttribute("data-no"));
    reviewNo=this.getAttribute("data-no");
    myModal.show();
  };
}
document.addEventListener('load', function (event) {
	console.log("${param.reviewNo}" != "");
  if ("${param.reviewNo}" != "") {
	  console.log("실행!")
	  reviewNo = "${param.reviewNo}";
	  myModal.show();
  }
});

</script>
  </body>
</html>
