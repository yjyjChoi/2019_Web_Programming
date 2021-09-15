<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="UTF-8" %>
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
      .writer, .e-mail, .title, .content {
        width: 300px;
      }
    </style>
  </head>
  <body>
    <form align="center" action="board-insert_db.jsp" method="post">
      <h1> 게시글 내용 </h1>
      <table align="center">
      <%
      String id, title;
      Connection conn = null;
      Statement stmt = null;
      String sql = null;
      ResultSet rs = null;

      try {
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
        id = request.getParameter("id");
        conn = DriverManager.getConnection(jdbcurl, "root","1130");
        stmt = conn.createStatement();
        sql = "select * from board_tbl where id=" + id;
        rs = stmt.executeQuery(sql);
      }
      catch(Exception e) {
        out.println("DB 연동 오류입니다.: " + e.getMessage());
      }

      while (rs.next()) {
        title = rs.getString("title");
      %>
      <tr>
        <td><img src="image/ball.gif"> 글 쓴 이 : </td><td class="writer">
        <%=rs.getString("name")%></td>
      </tr>
      <tr>
        <td><img src="image/ball.gif"> 메일주소 : </td><td class="e-mail">
        <%=rs.getString("e_mail")%></td>
      </tr>
      <tr>
        <td><img src="image/ball.gif"> 글 제 목 : </td><td class="title">
        <%=title%></td>
      </tr>
      <tr>
        <td><img src="image/ball.gif"> 글 내 용 : </td><td class="content">
        <%=rs.getString("content")%></td>
      </tr>
  </table>
  <br><br>
      <img src="image/green_tree.gif"><a href="board-insert.jsp?ref=<%=rs.getString("ref")%>&flag=y"> 답글 쓰기 </a>
      <img src="image/green_tree.gif"><a href="board-modify-pwd.jsp?id=<%=rs.getString("id")%>"> 게시글 수정 </a>
      <img src="image/green_tree.gif"><a href="board-delete-pwd.jsp?id=<%=rs.getString("id")%>"> 게시글 삭제 </a>
      <img src="image/green_tree.gif"><a href="board-list.jsp"> 게시글 목록 보기 </a>
    </form>
  <%}%>
  </body>
</html>
