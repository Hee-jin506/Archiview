<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

      <form id='report-form' action='../report/reportUser' method='post' style="text-align: center;">
        <input type="hidden" id="reportTarget" name='reportedNo' value="${report.reportedNo}"><br>

        <div class="col-sm-20">
          <select class="form-select" aria-label="Default select example" id="reportedType" name='reportedType'>
            <option value='1'>회원</option>
          </select>
        </div><br>

        <div class="col-sm-20">
          <select class="form-select" aria-label="Default select example" id="reportWhy" name='why'>
            <option selected>신고 사유를 선택해주세요.</option>
            <option value='1'>음란성/선정성</option>
            <option value='2'>폭력성</option>
            <option value='3'>혐오/인신공격</option>
            <option value='4'>광고성/스팸</option>
            <option value='5'>개인정보 노출</option>
            <option value='6'>도배</option>
          </select>
        </div><br>
        
          <button type="submit" id="next" class="btn btn-secondary btn-sm" style="
          margin-top: 15px;
          display: inline-block;">신고</button>
        </form>

      <script type="text/javascript">
        $("#report-form").submit(function (e) {
        	 alert('신고처리되었습니다.');
        });
      </script>