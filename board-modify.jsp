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
    <%
    String passwd, id;
    String sql = null;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    passwd =  request.getParameter("passwd");
    System.out.println("passwd");
    id = request.getParameter("id");

    try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
      conn = DriverManager.getConnection(jdbcurl, "root","1130");
      stmt = conn.createStatement();
      sql = "select * from board_tbl where id=" + id;
      rs = stmt.executeQuery(sql);
    }
    catch(Exception e) {
      out.println("DB 연동 오류입니다.: " + e.getMessage());
    }

    while (rs.next()) {
      if(rs.getString("passwd").equals(passwd)) {
    %>
    <h1> 게시글 수정 </h1>
    <form align="center" action="board-modify-db.jsp?id=<%=id%>" method="post">
      <table align="center">
        <tr>
          <td><img src="image/ball.gif"> 글 쓴 이 : </td><td><input type="text" name="writer" class="writer"
          value='<%=rs.getString("name")%>'></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 메일주소 : </td><td><input type="text" name="e-mail" class="e-mail"
          value='<%=rs.getString("e_mail")%>'></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 글 제 목 : </td><td><input type="text" name="title" class="title"
          value='<%=rs.getString("title")%>'></td>
        </tr>
        <tr>
          <td><img src="image/ball.gif"> 글 내 용 : </td><td><textarea name="content" class="content">
          <%=rs.getString("content")%></textarea></td>
        </tr>
      </table>
    <br><br>
    <input type="submit" value="등록하기">
    <input type="reset" value="다시쓰기">
  </form>
  <br>
  <img src="image/green_tree.gif"><a href="board-list.jsp"> 취소 </a>
  <%
  } else {
  %>
    <h1> 잘못 입력된 패스워드입니다. </h1>
    <br><br>
      <img src="image/green_tree.gif"><a href="board-read.jsp?id=<%=id%>"> 뒤로 </a>
  <% }
  } %>
  </body>
</html>
