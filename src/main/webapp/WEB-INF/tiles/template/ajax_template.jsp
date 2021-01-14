<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:set var="appRoot" value="${pageContext.servletContext.contextPath}"/>

<tiles:insertAttribute name="body"/>

<script>
    "use strict" 
     var saveButtons = document.querySelectorAll(".save img");
    
     for (var e of saveButtons) {
       
        e.addEventListener("mouseover", function(e) {
          console.log("hahaha");
              this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved.png");
            });
          e.addEventListener("mouseout", function(e) {
          console.log("hahaha");
              if (this.getAttribute("save") == "notSaving") {
                    this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved-outline.png");
              } else {
                this.setAttribute("src", "<%=getServletContext().getContextPath()%>/main_resource/saved.png");
              }
          });
        e.addEventListener("click", function(e) {
          console.log("hahaha");
              if (this.getAttribute("save") == "saving") {
                this.setAttribute("save", "notSaving");
                var xhr = new XMLHttpRequest();
                var no = this.getAttribute("data-no");
                xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/save/delete?savedNo=" + no, false);
                xhr.send();
              } else {
                this.setAttribute("save", "saving");
                var xhr = new XMLHttpRequest();
                var no = this.getAttribute("data-no");
                xhr.open("GET", "<%=getServletContext().getContextPath()%>/app/save/add?saveNo=" + no, false);
                xhr.send();
              }
          });
    }
    
    </script>

  <script>
  var level2btn = document.querySelectorAll(".level-2");
  var register = document.querySelector(".register");
  var targetNo, groupNo, level;
  
  for (var e of level2btn) {
    e.onclick = function(e) {
        dataNo = e.target.getAttribute("data-no");
        var comment = comments[dataNo];
        var originContent = register.innerHTML;
        register.innerHTML = originContent + 
           "<input type='hidden' name='targetNo' value='"+ comment.targetNo +"'>";
        document.querySelector(".register input[name='level']").setAttribute("value", 2);
        document.querySelector(".register input[name='reviewNo']").setAttribute("value", ${param.reviewNo});
        document.querySelector(".register input[name='content']").setAttribute("value", "@" + comment.writer +" ");
        console.log(register.innerHTML)
      };
    } 
  </script>
