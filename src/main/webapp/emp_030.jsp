<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

 
<%@ page import="java.sql.*"%>
<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>
<%@ page import="java.text.DecimalFormat"%>


<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="estilos.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>Sistema de Controle de Vagas de Emprego</title>
</head>

<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		BACKEND-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<%

int l = Integer.parseInt(request.getParameter("lista"));
String sql;
String titulo;
	if(l == 1){
		sql = "SELECT * FROM vagas WHERE aberta = 1";
		titulo = "Lista de vagas de emprego em aberto";
	} else if(l == 0){
		sql = "SELECT * FROM vagas WHERE aberta = 0";
		titulo = "Lista de vagas de emprego encerradas";
	} else if(l == 2){
		sql = "SELECT * FROM vagas";
		titulo = "Lista geral de vagas de emprego";
	} else{
		sql = "SELECT * FROM vagas";
		titulo = "Lista geral de vagas de emprego";
	}

try {
	// CONEXAO COM O BANCO DE DADOS
	ConectaBD cbd = new ConectaBD();
	Connection conn = cbd.Conectar();
	
	PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	DecimalFormat df = new DecimalFormat("#,##0.00");
%>


<body>
<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		NAVBAR-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<a href="./index.jsp"> Home </a>
<a href="./emp_010.jsp"> Criar cadastro</a>
<a href="./emp_020.jsp"> Alteração e exclusão</a>


<a href="./emp_030.jsp?lista=0"> Listar Fechadas</a>
<a href="./emp_030.jsp?lista=1"> Listar Abertas</a>
<a href="./emp_030.jsp"> Listar Todas</a>


<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		FORMULÁRIO-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3></h3></div>

<div class=" ">
	<caption class="e02"> <%=titulo%> </caption>
	<table class=" ">
		<tr>
			<th>Id vaga</th>
			<th>Descricao</th>
			<th>Requisitos Obrigatorios</th>
			<th>Requisitos Desejaveis</th>
			<th>Remuneracao</th>
			<th>Beneficios</th>
			<th>Local de Trabalho</th>
			<th>Aberta</th>
		</tr>
	
	</table>	
<%
int alt = 0;
while(rs.next()) {
	if(alt == 0) {%>
	
<tr bgcolor=snow class="e01">

		<%alt = 1;
		}  else{%>
		
<tr bgcolor=ivory class="e01">
			<%alt = 0;}%>
	<td><%=rs.getInt("id")%></td>
	<td><%=rs.getString("descricao")%></td>
	<td><%=rs.getString("req_obrigatorios")%></td>
	<td><%=rs.getString("req_desejaveis")%></td>
	<td style="text-align: right;"><%=df.format(rs.getFloat("remuneracao"))%></td>
	<td><%=rs.getString("beneficios")%></td>
	<td><%=rs.getString("local_trabalho")%></td>
	<td><%=rs.getInt("aberta")%></td>
</tr>
<%
	} // fecha while
	ps.execute();
	ps.close();
	conn.close();
	}catch(Exception e) {
		out.println("Ocorreu uma exceção - " + e.getMessage());
	}
%>

<tr><th colspan=10>
<form action="index.jsp" method="get">
<input type="submit" value="Voltar">

    
    <!--Construçãoo de máscaras pelo JQUERY-->
	<script type="text/javascript"> 
 		$(function() {
 		$('.mask-real').maskMoney({showSymbol:true,symbol:'R$ ', 
 		decimal:',', thousands:'.', allowZero:true}); // valor monet�rio
 		});
	</script>
	<!-- JQUERY + BOOTSTRAP -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquerymaskmoney/3.0.2/jquery.maskMoney.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>