<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/one2one_view.css">

			  <div class="communitySection2 container text-center">
      
      <div class="NoticeContent">
        <table>
          <tr>
            <th>제목</th>
            <td>${dto.one2one_title}</td>
          </tr>
          <tr>
            <th>문의자</th>
            <td>${dto.one2one_name}</td>
          </tr>
          <tr>
            <th>작성일</th>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.one2one_date}"/></td>
          </tr>
          <tr>
           <th>문의내용</th>
            <td>${dto.one2one_content}</td>
           
          </tr>
        </table>
       
        <br><br><br>
         <div class="pointer">
               <h6><i><u>Reply</u></i></h6> 
            </div>
       <br>
        
        <form action="reply.do" method="post">
        <input type="hidden" name="one2one_reply_idx" value="${dto.one2one_idx}" />
        <table>
        <tr>
        	<th>작성자</th>
        	<td><input type="text" id="one2one_reply_name" name="one2one_reply_name" value="bijou관리자"></td>
        </tr>
          <tr>
            <th>답변제목</th>
            <td><input type="text" id="one2one_reply_title" name="one2one_reply_title"></td>
          </tr>
          <tr>
            <th>답변내용</th>
            <td><textarea id="one2one_reply_content" name="one2one_reply_content"></textarea></td>
          </tr>
        </table>
        
        <br>
        
        <div class="buttons">
        	<div>
        	<button type="submit" name="reply_confirm" id="reply_confirm">답변완료</button>
     		</div>
        	 </form>
        	<div>
        	<input type="button" id="to_list" name="to_list" onClick="location.href='one2one'" value="목록으로">
     	 </div>
        </div>
       
        <p>답변이 입력됬는지 확인하려 만듦</p>
     <c:forEach var="reply_dto" items="${ list }">
     	답변번호:${ reply_dto.one2one_reply_idx } <br />
		답변자:${ reply_dto.one2one_reply_name } <br />
		답변제목:${ reply_dto.one2one_reply_title } <br />
		답변내용:${ reply_dto.one2one_reply_content } <br />
		답변날짜:${ reply_dto.one2one_reply_date } <br />
	 </c:forEach>  
	 
      </div>
    </div>
    
    

    </body>
</html>