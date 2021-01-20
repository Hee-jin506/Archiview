<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />
 <c:if test="${empty member.saved}">
   <div id = "profile_bottom_null">
        <img alt="saved-null" src="${appRoot}/profile_resource/saved-null.png">
        <div style="margin-top:15px">
        다시 보고 싶은 리뷰를 저장하세요. <br>
        리뷰를 저장해도 다른 사람에게 알림이 전송되지 않으며, <br>
        저장된 리뷰는 회원님만 볼 수 있습니다. <br>
        </div>
   </div>
 </c:if>
 
 <c:if test="${!empty member.saved}">
<c:forEach items="${member.saved}" var="rv"> 
    <c:choose>
      <c:when test="${empty rv.stcUrl}">
        <div class='profile_stillcut'>
          <img class='profile_bottom_review stillcut' data-no='${rv.no}' src="${appRoot}/main_resource/null.png">
          
          <div class='reviewText_box'>
            <div class='reviewText' style='top:${rv.textY}%; left:${rv.textX}%; '>
             <p>${rv.text}</p>
            </div>
          </div>
          <div class='tags'>
            <c:forEach items="${rv.tags}" var="t">
              <c:if test="${t.title != null }">
                <a class='tag' href='${appRoot}/app/main/search?keyword=%23${t.title}'>
                  #${t.title}
                </a>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </c:when>
      <c:otherwise>
       <div class='profile_stillcut'>
         <img class='profile_bottom_review stillcut' data-no='${rv.no}'  src='${rv.stcUrl}' s>
        <div class='reviewText_box'>
          <div class='profile_stillcut_reviewText' style='top:${rv.textY}%; left:${rv.textX}%;' >
           <p style="font-size: 10px;  font-weight: bold;">${rv.text}</p>
          </div>
        </div>
    
        <div class='profile_stillcut_tags' >
          <c:forEach items="${rv.tags}" var="t">
            <c:if test="${t.title != null }">
              <a class='tag' href='${appRoot}/app/main/search?keyword=%23${t.title}'>
                <p style="font-size: 10px;  font-weight: bold;">#${t.title}</p>
              </a>
            </c:if>
          </c:forEach>
        </div>
       </div>
      </c:otherwise>
    </c:choose>
</c:forEach>
</c:if>
<span class='add-one'></span>



