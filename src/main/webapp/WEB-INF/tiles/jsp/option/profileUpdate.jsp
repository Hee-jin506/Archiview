<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필변경</title>
</head>
<body>
<form action='<%=getServletContext().getContextPath()%>/app/member/updatePhoto' method='post' enctype='multipart/form-data'>");
  <input type='hidden' name='no' value='${member.no}'><br>
  <a href='<%=getServletContext().getContextPath()%>/upload/${member.photo}'>\n<img src='<%=getServletContext().getContextPath()%>/upload/${member.photo}_50x50.jpg'></a>\n",
  <input type='file' name='photo'>
  <button>변경</button>
  </form>
  <br>

<form action='<%=getServletContext().getContextPath()%>/app/member/update' method='post'>
<input type='hidden' name='no' value='${member.no}'><br>
이메일 <p>${member.email}</p>
닉네임 <input type='text' name='nickName' value='${member.nickName}'><br>
소개 <textarea name='intro'>${member.intro}</textarea><br>
<button>변경</button>
</form>
</body>
</html>