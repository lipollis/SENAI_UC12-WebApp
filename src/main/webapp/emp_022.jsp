<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>

<%

int id = 0;
try{
	id = Integer.parseInt(request.getParameter("id_line"));
	VagasDaoImpl vdi = new VagasDaoImpl();
	vdi.Excluir(id);
} catch(Exception e){ }

//response.sendRedirect("./emp_020.jsp");
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
<table align="center">

<tr><th colspan=2 style="color:green">Vaga <% request.getParameter("id_line"); %> excluída com sucesso.</th></tr>
</table>
</div><br>

<div>
<form action="index.jsp" method="delete">
<input type="submit" value="Voltar">

</form>

</div>
</body>
</html>