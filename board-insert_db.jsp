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
    </style>
  </head>
  <body>
    <%
    String sql = null;
    String sql2 = null;
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rs = null;
    String myId, passwd, writer, email, title, content, ref;
    int myNewId;

    try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
      conn = DriverManager.getConnection(jdbcurl, "root","1130");
      stmt = conn.createStatement();
      stmt2 = conn.createStatement();
      sql = "select max(id) from board_tbl";
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        myId = rs.getString("max(id)");
        myNewId = Integer.parseInt(myId) + 1;
        passwd = request.getParameter("passwd");
        writer = request.getParameter("writer");
        email = request.getParameter("e-mail");
        title = request.getParameter("title");
        content = request.getParameter("content");
        if (request.getParameter("flag").equals("y")) {
          ref = request.getParameter("ref");
          title = "--->" + title;
        } else {
          ref = String.valueOf(myNewId);
        }
        sql2 = "insert into board_tbl values(" + myNewId + ",'" + writer + "'," + "'" + email + "'," + "'" + title + "'," + "'" +
        content + "'," + "'" + passwd + "'," + ref + ");";
        stmt2.executeUpdate(sql2);
      }
    }
    catch(Exception e) {
      out.println("DB 연동 오류입니다.: " + e.getMessage());
    }
    %>
    <h1> 작성한 글이 등록 되었습니다. </h1>
    <img src="image/green_tree.gif"><a href="board-list.jsp"> 게시글 목록 보기 </a>
  </body>
</html>
