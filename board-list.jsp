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
      th {
        background-color: lightgray;
      }
      .number{
        width: 88px;
      }
      .writer{
        width: 88px;
      }
      .title{
        width: 330px;
      }
      .e-mail{
        width: 230px;
      }
    </style>
  </head>
  <body>
    <h1> 게시글 목록 보기 </h1>
    <table border="1" align="center">
      <tr>
        <th class="number" align="center">글번호</th>
        <th class="writer" align="center">글쓴이</th>
        <th class="title" align="center">글제목</th>
        <th class="e-mail" align="center">전자우편</th>
      </tr>
    <%
    Connection conn = null;
    Statement stmt = null;
    String sql = null;
    ResultSet rs = null;

    try{
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/board_db";
      conn = DriverManager.getConnection(jdbcurl, "root","1130");
      stmt = conn.createStatement();
      sql = "select * from board_tbl order by ref asc, id desc";
      rs = stmt.executeQuery(sql);
    }
    catch(Exception e){
      out.println("DB 연동 오류입니다.: " + e.getMessage());
    }

    rs.afterLast();
    while(rs.previous()){
    %>
        <tr>
          <td align="center"><%=rs.getRow()%></td>
          <td><%=rs.getString("name")%></td>
          <td><a href="board-read.jsp?id=<%= rs.getString("id")%>"><%= rs.getString("title")%><a></td>
          <td align="center"><%= rs.getString("e_mail")%></td>
        </tr>
<%}%>
    </table>
    <p><img src="image/green_tree.gif"><a href="board-insert.jsp"> 게시글 쓰기 </a></p><br><br>
    <p><img src="image/island.gif" width="900" height="70"></p>
  </body>
</html>
