<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>

<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>


<%
DecimalFormat df = new DecimalFormat("#,##0.00");

VagasDaoImpl vdi = new VagasDaoImpl();
try{
	int lista = Integer.parseInt(request.getParameter("lista"));
	if (lista == 0){
		// vaga encerrada
		out.println(vdi.Listar(0));
	} else if (lista == 1){
		// vaga aberta
		out.println(vdi.Listar(1));
	} else{
		out.println(vdi.Listar(2));
	}
} catch(Exception e){
	out.println(vdi.Listar(2));
}

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
			String beneficios =rs.getString("beneficios");
			String local_trabalho =rs.getString("local_trabalho");
			String aberta =rs.getString("aberta");
		
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
	</tr>
<%
}
} // fecha while
	rs.close();
	st.close();
	conn.close();
}catch(Exception e){
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
