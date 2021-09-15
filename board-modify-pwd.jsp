<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
  <head>
    <meta charset="UTF-8">
    <title> 게시글 수정 </title>
    <style>
      body {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <%
    String id;
    id = request.getParameter("id");
    %>
    <h1> 패스워드를 입력하시오 </h1>
    <br><br>
      <form action="board-modify.jsp?id=<%=id%>" method="post">
        <img src="image/ball.gif"> 패스워드 : <input type="passwd" name="passwd"><br>
          <br><br>
          <input type="submit" value="수정하기">  <input type="reset" value="다시쓰기">
      </form>
      <br>
      <img src="image/green_tree.gif"><a href="board-read.jsp?id=<%=id%>"> 수정 취소 </a>
  </body>
</html>
