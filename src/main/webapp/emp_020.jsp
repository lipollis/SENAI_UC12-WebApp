<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>

<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>


<%
DecimalFormat df = new DecimalFormat("#,##0.00");

try {
	ConectaBD cbd = new ConectaBD();
	Connection conn = cbd.Conectar();
	String sql = "SELECT * FROM vagas WHERE aberta = 1";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next())
		{
			Integer id =rs.getInt("id");
			String descricao =rs.getString("descricao");
			String req_obrigatorios =rs.getString("req_obrigatorios");
			String req_desejaveis =rs.getString("req_desejaveis");
			String remuneracao =rs.getString("remuneracao");
			String aberta =rs.getString("aberta");
			String beneficios =rs.getString("beneficios");
			String local_trabalho =rs.getString("local_trabalho");
		
		 	rs.close(); 
	 		st.close();
		   	String Sql = "SELECT * FROM vagas";
		   	st = conn.createStatement();
		   	rs = st.executeQuery(Sql);
	
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<title>Sistema de Controle de Vagas de Emprego</title>
<link rel="stylesheet" type="text/css" href="estilos.css">

</head>


<body>
<div align=center><h1>Lista de vagas de emprego em aberto</h1></div>

<table align="center">


	<tr class="e01">
		<th>Id Vaga</th>
		<th>Descrição</th>
		<th>Req.Obrigatórios</th>
		<th>Req.Desejáveis</th>
		<th>Remuneração</th>
		<th>Aberta</th>
		<th>Benefícios</th>
		<th>Local de Trabalho</th>
		<th>Alteração</th>
		<th>Exclusão</th>
	</tr>
	
	<%
	int alt = 0;
	while(rs.next())
	{
	if(alt == 0) {%>
	
	<tr bgcolor=snow class="e01">
	
	<%alt = 1;}
	else
	{%>
	
	<tr bgcolor=ivory class="e01">
	
	<%alt = 0;}%>
	<td><%=rs.getInt("id")%></td>
	<td><%=rs.getString("descricao")%></td>
	<td><%=rs.getString("req_obrigatorios")%></td>
	<td><%=rs.getString("req_desejaveis")%></td>
	<td style="text-align: right;"><%=df.format(rs.getString("remuneracao"))%></td>
	<td><%=rs.getString("beneficios")%></td>
	<td><%=rs.getString("local_trabalho")%></td>
	<td><%=rs.getString("aberta")%></td>
	<td><a href="emp_021.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
	  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
	</svg></a></td>
	
	<td>
	<a href="emp_022.jsp" class="delete" data-confirm="Confirma a exclusão?"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
	  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
	</svg></a>
	
	</td>
	</tr>
	<%
	}
	} // fecha while
		
		
	rs.close();
	st.close();
	conn.close();
	} // fecha try
	catch(Exception e)
	{
	out.println("Ocorreu uma exceção - " + e.getMessage());
	}
	%>
	
	<tr><th colspan=10>
	<form action="index.jsp" method="get">
	<input type="submit" value="Voltar">
	
	</form>
	</th></tr>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">

//function myalert() {
//    alert("Confirma a exclusão?.\n " );
}

</script>

</body>
</html>
