<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
  <head>
    <meta charset="UTF-8">
    <title> 게시글 삭제 </title>
    <style>
      body {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <%
    String passwd, id;
    String sql = null;
    String sql2 = null;
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    ResultSet rs = null;
    passwd = request.getParameter("passwd");
    System.out.println("passwd");
    id =  request.getParameter("id");
    try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
      conn = DriverManager.getConnection(jdbcurl,"root","1130");
      stmt = conn.createStatement();
      sql = "select * from board_tbl where id=" + id;
      rs = stmt.executeQuery(sql);
    }
    catch(Exception e) {
      out.println("DB 연동 오류입니다.: " + e.getMessage());
    }

    while (rs.next()) {
      if (rs.getString("passwd").equals(passwd)) {
        stmt2 = conn.createStatement();
        sql2 = "delete from board_tbl where  id=" + id;
        stmt2.executeUpdate(sql2);
    %>

    <h1> 삭제되었습니다. </h1>
    <img src="image/green_tree.gif"><a href="board-list.jsp"> 게시글 목록 보기 </a>

    <%
    } else {
    %>
    <h1> 잘못 입력 된 패스워드입니다. </h1>
    <br><br>
      <img src="image/green_tree.gif"><a href="board-read.jsp?id=<%=id%>"> 뒤로 </a>
    <% }
    } %>
  </body>
</html>
