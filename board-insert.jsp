<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
  <head>
    <meta charset="UTF-8">
    <title> 게시판 </title>
    <style>
      body {
        text-align: center;
      }
      .writer{
        width: 170px;
      }
      .e-mail{
        width: 300px;
      }
      .title{
        width: 360px;
      }
      .content{
        width: 500px;
        height: 60px;
      }
    </style>
  </head>
  <body>
    <form align="center" action="board-insert_db.jsp" method="post">
      <h1> 게 시 판 </h1>
      <table align="center">
        <tr>
          <td><img src="image/ball.gif"> 글 쓴 이 : </td><td><input type="text" name="writer" class="writer"></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 메일주소 : </td><td><input type="text" name="e-mail" class="e-mail"></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 글 제 목 : </td><td><input type="text" name="title" class="title"></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 글 내 용 : </td><td><textarea name="content" class="content"></textarea></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 패스워드 : </td><td><input type="password" name="passwd"></td>
        </tr>
      </table>
      <br><br>
      <input type="submit" value="등록하기">   <input type="reset" value="다시쓰기">
      <br><br>
      <img src="image/green_tree.gif"><a href="board-list.jsp"> 게시글 목록 보기 </a>
      <input type="hidden" name="flag" value="<%=request.getParameter("flag")%>">
      <input type="hidden" name="ref" value="<%=request.getParameter("ref")%>">
    </form>
    <p><img src="image/island.gif" width="900" height="70"></p>
  </body>
</html>
