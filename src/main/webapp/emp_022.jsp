<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="entities.Vagas" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="dao.ConectaBD" %>

<%
//int id = Integer.parseInt(request.getParameter("idvaga"));


//---- Back-End -----------------------

Vagas v = new Vagas();
v.getId();
String Sql = "select from vagas where id = " + v.getId();
v.Excluir();

try {
ConectaBD cbd = new ConectaBD();
Connection conn = cbd.Conectar();

Vagas vaga = new Vagas();

int idvaga = Integer.parseInt(request.getParameter("idvaga"));
String sql = "delete from vagas where idvaga = " + idvaga;
vaga.Excluir();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(sql);

rs.close();
st.close();
conn.close();
} // fecha try
catch(Exception e)
{
out.println("Ocorreu uma exceção - " + e.getMessage());

	
%>




<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Sistema de Controle de Vagas de Emprego</title>

<link rel="stylesheet" type="text/css" href="estilos.css">
</head>



<body>
<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3>Exclusão</h3></div>

<div>
<table>



<tr>

</tr>



<tr><th colspan=2 style="color:green">Vaga excluída com sucesso.</th></tr>
</table>
</div><br>

<% }%>


<div>
<form action="index.jsp" method="delete">
<input type="submit" value="Voltar">

</form>

</div>
</body>
</html>