<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
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
    String sql = null;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String passwd, writer, email, title, content;
    id =  request.getParameter("id");
    passwd = request.getParameter("passwd");
    writer = request.getParameter("writer");
    email = request.getParameter("e-mail");
    title = request.getParameter("title");
    content = request.getParameter("content");

    try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
      conn = DriverManager.getConnection(jdbcurl, "root","1130");
      stmt = conn.createStatement();
      sql = "update board_tbl set name=" + "'" + writer + "'," + "e_mail=" +
      "'" + email + "'," + "title=" + "'" + title + "'," + "content=" + "'" + content + "'" + "where id=" + id;
      stmt.executeUpdate(sql);
    }
    catch(Exception e) {
      out.println("DB 연동 오류입니다.: " + e.getMessage());
    }
    %>
    <h1> 게시글이 수정 되었습니다. </h1>
    <img src="image/red_tree.gif"><a href="board-read.jsp?id=<%=id%>"> 작성한 글 확인 </a>
    <img src="image/green_tree.gif"><a href="board-list.jsp"> 게시글 목록 보기 </a>
  </body>
</html>
