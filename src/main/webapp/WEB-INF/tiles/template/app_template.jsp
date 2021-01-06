<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아카이뷰</title>
<link href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.theme.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${appRoot}/css/reset.css">
<link rel="stylesheet" href="${appRoot}/css/header.css">
<link rel="stylesheet" href="${appRoot}/css/sidebar.css">
<link rel="stylesheet" href="${appRoot}/css/footer.css">
<link rel="stylesheet"
	href="${appRoot}/css/bootstrap/dist/css/custom.css">
<link rel="stylesheet" href="${appRoot}/css/main.css">
<link rel="stylesheet" href="${appRoot}/css/mainFeed.css">
<link rel="stylesheet" href="${appRoot}/css/newsfeed.css">
<link rel="stylesheet" href="${appRoot}/css/profile.css">
<link rel="stylesheet" href="${appRoot}/css/detailForUser.css">
<style>
#container {
	width: 920px;
	margin: 0 auto;
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
<script
	src="${appRoot}/node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
<script src="${appRoot}/node_modules/jquery/dist/jquery.js"></script>
<script src="${appRoot}/node_modules/jquery-ui-dist/jquery-ui.js"
	type="text/javascript"></script>

</head>
<body>

	<!-- <div id="headerLine"></div> -->
	<div id="container">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="sidebar" />
		<div id="body">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />

	</div>

	<div class="modal fade" id="reveiwDetail" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<!-- 모달 화면 -->
				</div>
				<img
					src='<%=getServletContext().getContextPath()%>/main_resource/x.png'
					data-bs-dismiss="modal">
			</div>
		</div>
		<script>
"use strict" 
var count = 1;
var body = document.querySelector("#body");
var likeButtons = document.querySelectorAll(".like img");
var moreButtons = document.querySelectorAll('.more');
var menuContents = document.querySelectorAll('.dropdown-content1');
var cards = document.querySelectorAll(".stillcut");
var ReviewDetailModal = new bootstrap.Modal(document.getElementById('reveiwDetail'), {});
var reviewDetail = document.querySelector("#reveiwDetail");
var detailBody = reviewDetail.querySelector(".modal-body");
var reviewNo;

body.onscroll = function(e) {
    if(body.scrollTop >= 1850) {
        count++;
        console.log("스크롤 끝 감지") 
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/Archiview/app/ajax/review/moreFeed?pageNo=" + count, false);
        xhr.send();
        var originContent = body.innerHTML;
        body.innerHTML = originContent + xhr.responseText;
        var cards = document.querySelectorAll(".stillcut");
        var likeButtons = document.querySelectorAll(".like img");
        var moreButtons = document.querySelectorAll(".more");
        var menuContents = document.querySelectorAll('.dropdown-content1');
        for (var e of cards) {
        	  e.onclick = function(e) {
        		  console.log("click");
        	    reviewNo=this.getAttribute("data-no");
        	    ReviewDetailModal.show();
        	  };
        	}
        for (var e of likeButtons) {
        	  e.addEventListener("mouseover", function(e) {
        	        this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png"); 
        	      });
        	  e.addEventListener("mouseout", function(e) {
        		  if (this.getAttribute("like") == "notLiking") {
                    this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like.png");
        		  } else {
        			  console.log("변하면 안돼!")
        			  this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png")
        		  }
          });
        	    e.addEventListener("click", function(e) {
        	          if (this.getAttribute("like") == "liking") {
        	            this.setAttribute("like", "notLiking");
        	            var pops = document.querySelectorAll(".pop");
        	            for (var pop of pops) {
        	              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
        	            	  console.log(pop.innerText.split("개")[0]); 
        	                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) - 1) + "개"
        	              }
        	            }
        	            var xhr = new XMLHttpRequest();
        	            var no = this.getAttribute("data-no");
        	            xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/like/dislikeReview?likedNo=" + no, false);
        	            xhr.send();
        	          } else {
        	            this.setAttribute("like", "liking");
        	            var pops = document.querySelectorAll(".pop");
        	            for (var pop of pops) {
        	              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
        	            	  console.log(pop.innerText.split("개")[0]); 
        	                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) + 1) + "개"
        	              }
        	            }
        	            var xhr = new XMLHttpRequest();
        	            var no = this.getAttribute("data-no");
        	            xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=" + no, false);
        	            xhr.send();
        	          }
        	      });
        	}
        for (var element of moreButtons) {
        	element.addEventListener("click", function(e) {
        	    var no = this.getAttribute("data-no");
        	    console.log(no);
        	  for (var menu of menuContents) {
        	      if (menu.getAttribute("data-no") == no) {
        	    console.log(menu.getAttribute("data-no"), this.getAttribute("data-no")); 
        	           if(menu.style.display===""){
        	             menu.style.display="block";
        	             } else {
        	               menu.style.display="";
        	             }
        	        
        	      }
        	    }
        	});
        	}
    }
}; 


for (var e of likeButtons) {
	  e.addEventListener("mouseover", function(e) {
	        this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");  // undefined
	      });
      e.addEventListener("mouseout", function(e) {
          if (this.getAttribute("like") == "notLiking") {
                this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like.png");
          } else {
            this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/like2.png");
          }
      });
    e.addEventListener("click", function(e) {
          if (this.getAttribute("like") == "liking") {
            this.setAttribute("like", "notLiking");
            var pops = document.querySelectorAll(".pop");
            for (var pop of pops) {
            	if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
            		console.log(pop.innerText.split("개")[0]); 
            		pop.innerText = String(parseInt(pop.innerText.split("개")[0]) - 1) + "개"
            	}
            }
            var xhr = new XMLHttpRequest();
            var no = this.getAttribute("data-no");
            xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/like/dislikeReview?likedNo=" + no, false);
            xhr.send();
          } else {
            this.setAttribute("like", "liking");
            var pops = document.querySelectorAll(".pop");
            for (var pop of pops) {
              if (pop.getAttribute("data-no") == this.getAttribute("data-no")) {
            	  console.log(pop.innerText.split("개")[0]); 
                pop.innerText = String(parseInt(pop.innerText.split("개")[0]) + 1) + "개"
              }
            }
            var xhr = new XMLHttpRequest();
            var no = this.getAttribute("data-no");
            xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/like/likeReview?likedNo=" + no, false);
            xhr.send();
          }
      });
      }
for (var element of moreButtons) {
element.addEventListener("click", function(e) {
    var no = this.getAttribute("data-no");
  for (var menu of menuContents) {
      if (menu.getAttribute("data-no") == no) {
           if(menu.style.display===""){
             menu.style.display="block";
             } else {
               menu.style.display="";
             }
        
      }
    }
});
}


reviewDetail.addEventListener('show.bs.modal', function (event) {
console.log("show.bs.modal")
var xhr = new XMLHttpRequest();
xhr.open("GET", "/Archiview/app/ajax/review/detailForUser?reviewNo=" + reviewNo, false);
xhr.send();
detailBody.innerHTML = xhr.responseText;
});

reviewDetail.addEventListener('shown.bs.modal', function (event) {
console.log("shown.bs.modal")
});

reviewDetail.addEventListener('hidden.bs.modal', function (event) {
console.log("hidden.bs.modal")
});

for (var e of cards) {
e.onclick = function(e) {
console.log("클릭")
console.log(this.getAttribute("data-no"));
reviewNo=this.getAttribute("data-no");
ReviewDetailModal.show();
};
}
document.addEventListener('load', function (event) {
console.log("${param.reviewNo}" != "");
if ("${param.reviewNo}" != "") {
console.log("실행!")
reviewNo = "${param.reviewNo}";
ReviewDetailModal.show();
}
});

</script>
</body>
</html>
