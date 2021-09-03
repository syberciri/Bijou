<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>

<%
		List<One2oneDto> list = (List<One2oneDto>)request.getAttribute("list");
		System.out.println( "list count:" + list.size() );
		String list_page = (String)request.getAttribute("page");
		System.out.println( "list_page:" + list_page );
		String page1_active = "";
		String page2_active = "";
		String page3_active = "";
		if(list_page.equals("1")) 
			page1_active = "active";
		if(list_page.equals("2")) 
			page2_active = "active";
		if(list_page.equals("3")) 
			page3_active = "active";
	%>


<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/one2one.css">


	<div class="container">
       
        <div class="title">
            <h1 style="color: grey;">1:1 문의 </h1>
        </div>
        <div class="search_bar">
            <input type="text"><input type="button" value="검색" id="search" name="search">
        </div>
   
    <br>
    
        <div class="qa">
        <table>
          <tr>
              <th>번호</th>
              <th>카테고리</th>
              <th>문의상품</th>
              <th>문의자</th>
              <th>문의제목</th>
              <th>문의일자</th>
          </tr>
          <c:forEach var="dto" items="${ list }">
	          <tr>
	            <td>${ dto.one2one_idx }</td>
	            <td>${ dto.one2one_category }</td>
	            <td><a href="">${ dto.one2one_img }</a></td>
	            <td><a href="">${ dto.one2one_name }</a></td>
	            <td><a href="one2one_view?one2one_idx=${dto.one2one_idx}"> ${ dto.one2one_title } </a></td>
	            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.one2one_date}"/></td>
	            
	          </tr>
          </c:forEach>
        </table>
        <br>
        
       <div class="page_number">
       <div>
	<nav aria-label="...">
	  	<ul class="pagination" id="list">
		    <li class="page-item disabled">
		      	<span class="page-link"> &lt;&lt; </span>
		    </li>
		    <li class="page-item <%= page1_active %>">
		    	<a class="page-link"  href="list?page=1">1</a>
		    </li>
		    <li class="page-item <%= page2_active %>">
		      	<a class="page-link" href="list?page=2">2</a>
		    </li>
		    <li class="page-item <%= page3_active %>">
		    	<a class="page-link" href="list?page=3">3</a>
		    </li>
		    <li class="page-item">
		      	<a class="page-link" href="#"> &gt;&gt; </a>
		    </li>
	  	</ul>
	</nav>
	</div>
      </div>
      
    </div>	
    
    </body>
</html>