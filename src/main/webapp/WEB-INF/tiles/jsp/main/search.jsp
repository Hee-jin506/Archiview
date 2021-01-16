<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="appRoot" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		
		  #movie-contents {
		   box-sizing: border-box;
		   border-radius: 10px;
		   background-color: #141517;
		   width: 650px; /* 너비 */
		   padding-left: 20px;  /* 패딩 */
		   padding-right: 20px;  /* 패딩 */
		   padding-bottom: 20px;  /* 패딩 */
		   float: left;  /* 왼쪽으로 플로팅 */
		   height: 460px;
		   overflow: hidden;
		   overflow-y: scroll;
		   -ms-overflow-style: none;
		   scrollbar-width: none;
		   margin-top: 10px;
		 }
		 
		    #movie p {
		   font: inherit;
		   font-size: x-large;
		   padding-top: 20px;
		   }
		   
		   #movie hr {
		   font-size: 100%;
		   font: inherit;
		   color: white;
		   border: 0;
		   height: 1px;
		   background-color: #626473;
		   margin-left: -10px;
		   margin-right: -10px;
		   }
		   
		   #movie-list {
		   margin-bottom: 40px;
		   }
		   
		   #movie-list img {
		   float: left;
		   margin-left: 5px;
		   margin-top: 20px;
		   }
		   
		   #movie-title {
		    padding-left: 360px;
		    font-size: x-large;
		    padding-top: 20px;
		   }
		   
		   #movie-etitle {
		    padding-left: 365px;
		    padding-top: 20px;
		    font-size: x-small;
		    padding-bottom: 20px;
		   }
		   
		   #movie-opendate {
		    padding-left: 360px;
		   }
		   
		   #movie-runtime {
		    padding-left: 450px;
		    margin-top: -26px;
		    padding-bottom: 10px;
		   }
		   
		   #movie-directors {
		    padding-left: 450px;
		    margin-top: -26px;
		    padding-bottom: 10px;
		    padding-right: 5px;
		   }
		   
		   #movie-actors {
		    padding-left: 450px;
		    margin-top: -26px;
		    padding-bottom: 20px;
		    padding-right: 5px;
		   }
		   
		   #movie-synop {
		   padding-left: 360px;
		   padding-bottom: 30px;
		   padding-right: 5px;
		   }
		   
		   #movie-link {
		    padding-left: 360px;
		   }
		   
		   #movie-text {
		    padding-left: 360px;
		    padding-top: 20px;
		    color: #626473;
		    padding-bottom: 10px;
		   }
		 
		   #member-contents {
		   box-sizing: border-box;
		   border-radius: 10px;
		   background-color: #141517;
		   width: 650px; /* 너비 */
		   padding-left: 20px;  /* 패딩 */
		   padding-right: 20px;  /* 패딩 */
		   padding-bottom: 20px;  /* 패딩 */
		   float: left;  /* 왼쪽으로 플로팅 */
		   height: 200px;
		   overflow: hidden;
		   overflow-y: scroll;
		   -ms-overflow-style: none;
		   scrollbar-width: none;
		   margin-top: 10px;
		 }
		   #member p {
		   font: inherit;
		   font-size: x-large;
		   padding-top: 20px;
		   }
		   
		   #member-list img {
		   float: left;
		   margin-left: 20px;
		   }
		   
		   #nickName {
		   padding-left: 70px;
		   }
		   
		   #intro {
		   padding-left: 70px;
		   padding-top: 10px;
		   font-size: small;
		   color: #626473;
		   }
		
		   #follow-button {
		   padding-left: 500px;
		   margin-top: -40px;
		   }
		   
		   #member hr {
		   font-size: 100%;
		   font: inherit;
		   color: white;
		   border: 0;
		   height: 1px;
		   background-color: #626473;
		   margin-left: -10px;
		   margin-right: -10px;
		   }
		
		   #movie-contents::-webkit-scrollbar {
		  display: none;
		 }
		
		  #member-contents::-webkit-scrollbar {
		  display: none;
		 }
		 
		 .p {
		  font-size: x-large;
		 }
		 
		 .hr {
		  margin-left: -100px;
		 }
		 
		
		</style>
	</head>
	<body>
		<c:if test="${fn:length(reviews) == 0}">
			<c:if test="${fn:length(members) != 0 && fn:length(movies) != 0}">
			  <div id ="member-contents">
		      <div id = "member">
		        <p>리뷰어</p>
		        <hr>
		      </div>
		      <c:forEach items="${members}" var="m">
		        <br>
		        <div id = "member-list">
		          <input type='hidden' name='no' value='{member.no}'>
		          <img class="profile" src='../../upload/${m.photo}_35x35.jpg'>
		        </div>
		        <div id = "member-list2">  
		          <div id="nickName">${m.nickName}</div>
		          <div id="intro">${m.intro}</div>
		        </div>
		        <c:if test="${m.no != loginUser.no}">
		          <c:forEach var="f" items="${follows}">
		            <c:if test="${f.followedType == 1 && f.followingMember.no == loginUser.no }">
		             <div>
		              <div id = "follow-button">
		                <button type="submit" formaction='../follow/deleteUser?followedNo=${m.no}' class="btn btn-twitter">팔로우</button> 
		              </div>
		             </div>
		            </c:if>
		            <c:if test="${f.followedType == 1 && f.followingMember.no != loginUser.no }">
		             <div>
		              <div id = "follow-button">
		                <button type="submit" formaction='../follow/addUser?followedNo=${m.no}' class="btn btn-archiview">팔로우</button> 
		              </div>
		             </div>
		            </c:if>
		          </c:forEach>
		        </c:if>
		      </c:forEach>
		        <br>
		    </div>
		    
		    <div id = "movie-contents">
		      <div id = "movie">
		        <p>영화</p>
		        <hr>
		      </div>
		      <c:forEach items="${movies}" var="mv">
					  <br>
					  <div id = "movie-list">
						  <c:if test="${fn:length(mv.posters) != 0}">
						    <div id = "movie-poster"><img src='${mv.posters[0]}'<%-- <%=movie.getPosters().get(0).toString()%> --%>></div>
						  </c:if>
						  <c:if test="${fn:length(mv.posters) == 0}">
						    <div id = "movie-poster"><img src="${appRoot}/upload/movie_image.jpg"></div>
						  </c:if>
		        
					    <div id = "movie-title">${mv.title}</div>
					    <div id = "movie-etitle">${mv.englishTitle}</div>
					    <div id  = "movie-text">상영 시간</div>
					    <div id = "movie-runtime">${mv.runtime} 분</div>
					    <div id  = "movie-text">감독</div>
					    <div id = "movie-directors">${mv.directors}</div>
					    <div id  = "movie-text">출연</div>
					    <div id = "movie-actors">${mv.actors}</div>
					    <div id = "movie-synop">${mv.synopsis}</div>
					  </div>
					    <div id = "movie-link">더보기</div>
		      </c:forEach>
				</div> 
		  </c:if>
		  <c:if test="${fn:length(members) != 0 && fn:length(movies) == 0}">
				<div id ="member-contents">
				  <div id = "member">
				    <p>리뷰어</p>
				    <hr>
				  </div>
				  <c:forEach var="m" items="${members}">
				      <br>
				    <div id = "member-list">
				      <input type='hidden' name='no' value='{member.no}'>
				      <a href="${appRoot}/app/member/profile?no=${m.no}">
				      <img class="profile" src='../../upload/${m.photo}_35x35.jpg'> 
				      </a>
				      <div id="nickName">${m.nickName}</div>
				      <div id="intro">${m.intro}</div>
				    </div>
				    <c:if test="${m.no != loginUser.no}">
				      <c:forEach var="f" items="${follows}">
				        <c:if test="${f.followedType == 1 && f.followingMember.no == loginUser.no}">
				           <div>
		                <div id = "follow-button"><button type="submit" formaction='../follow/deleteUser?followedNo=${m.no}' class="btn btn-twitter">팔로우</button> </div>
		              </div>
				        </c:if>
				        <c:if test="${f.followedType == 1 && f.followingMember.no != loginUser.no}">
				           <div>
		                <div id = "follow-button"><button type="submit" formaction='../follow/addUser?followedNo=${m.no}' class="btn btn-archiview">팔로우</button> </div>
		               </div>
				        </c:if>
				      </c:forEach>
				    </c:if>
				        <br>
				  </c:forEach>
				</div>
				<div id = "movie-contents">
				  <div id = "movie">
				    <p>영화</p>
				    <hr>
				    <p>영화가 없습니다.</p>
				  </div>
				</div> 
			</c:if>
		  <c:if test="${fn:length(members) == 0 && fn:length(movies) == 0}">
			  <div id ="member-contents">
			    <div id = "member">
			      <p>리뷰어</p>
			      <hr>
			      <p>리뷰어가 없습니다.</p>
			    </div>
			  </div>
			  <div id = "movie-contents">
			    <div id = "movie">
			      <p>영화</p>
			      <hr>
			      <p>영화가 없습니다.</p>
			    </div>
			  </div>
			</c:if>
		  <c:if test="${fn:length(members) == 0 && fn:length(movies) != 0}">
				<div id ="member-contents">
				  <div id = "member">
				    <p>리뷰어</p>
				    <hr>
				    <p>리뷰어가 없습니다.</p>
				  </div>
				</div>
		  	<div id = "movie-contents">
				  <div id = "movie">
				    <p>영화</p>
				    <hr>
				  </div>
				  <c:forEach var="mv" items="${movies}">
				    <br>
				    <div id = "movie-list">
				    <c:if test="${fn:length(mv.posters) != 0 }">
				      <div id = "movie-poster"><img src='${mv.posters[0]}'></div>
				    </c:if>
				    <c:if test="${fn:length(mv.posters) == 0 }">
				      <div id = "movie-poster"><img src="${appRoot}/upload/movie_image.jpg"></div>
				    </c:if>
			      <div id = "movie-title">${mv.title}</div>
			      <div id = "movie-etitle">${mv.englishTitle}</div>
			      <div id  = "movie-text">상영 시간</div>
			      <div id = "movie-runtime">${mv.runtime} 분</div>
			      <div id  = "movie-text">감독</div>
			      <div id = "movie-directors">${mv.directors}</div>
			      <div id  = "movie-text">출연</div>
			      <div id = "movie-actors">${mv.actors}</div>
			      <div id = "movie-synop">${mv.synopsis}</div>
			      <div id = "movie-link">더보기</div>
			    </div>
				  </c:forEach>
			  </div> 
			</c:if>
		</c:if>
	</body>
</html>