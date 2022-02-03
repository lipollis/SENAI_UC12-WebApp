<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="dao.ConectaBD"%>


<%
// esse l não vem de lugar algum
//int l = Integer.parseInt(request.getParameter("lista"));
DecimalFormat df = new DecimalFormat("#,##0.00");
String sql;
String titulo;
/* if (l == 1) {
	sql = "select * from vagas where aberta = 1";
	titulo = "Lista de vagas de emprego em aberto";
} else {
	if (l == 2) {
		sql = "select * from vagas where aberta = 0";
		titulo = "Lista de vagas de emprego encerradas";
	} else {
		sql = "select * from vagas";
		titulo = "Lista geral de vagas de emprego";
	}
} 
*/

// tirei de dentro do if
sql = "select * from vagas where aberta = 1";
titulo = "Lista de vagas de emprego em aberto";


try {
	ConectaBD cbd = new ConectaBD();
	Connection conn = cbd.Conectar();
	sql = "select * from vagas where aberta = 1";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);

	if (rs.next()) {
		Integer id = rs.getInt("id");
		String descricao = rs.getString("descricao");
		String req_obrigatorios = rs.getString("req_obrigatorios");
		String req_desejaveis = rs.getString("req_desejaveis");
		Float remuneracao = rs.getFloat("remuneracao");
		Integer aberta = rs.getInt("aberta");
		String beneficios = rs.getString("beneficios");
		String local_trabalho = rs.getString("local_trabalho");

		rs.close();
		st.close();
		String Sql = "select * from vagas";
		st = conn.createStatement();
		rs = st.executeQuery(Sql);
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Sistema de Controle de Vagas de Emprego</title>
<link rel="stylesheet" type="text/css" href="estilos.css">

</head>


<body>

	<table>
		<caption class="e02"><%=titulo%></caption>

		<tr class="e01">
			<th>Id Vaga</th>
			<th>Descrição</th>
			<th>Req.Obrigatórios</th>
			<th>Req.Desejáveis</th>
			<th>Remuneração</th>
			<th>Aberta</th>
			<th>Benefícios</th>
			<th>Local de Trabalho</th>
		</tr>

		<%
		int alt = 0;
		while (rs.next()) {
			if (alt == 0) {
		%>

		<tr bgcolor=snow class="e01">

			<%
			alt = 1;
			} else {
			%>
		
		<tr bgcolor=ivory class="e01">

			<%
			alt = 0;
			}
			%>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("descricao")%></td>
			<td><%=rs.getString("req_obrigatorios")%></td>
			<td><%=rs.getString("req_desejaveis")%></td>
			<td style="text-align: right;"><%=df.format(rs.getFloat("remuneracao"))%></td>
			<td><%=rs.getInt("aberta")%></td>
			<td><%=rs.getString("beneficios")%></td>
			<td><%=rs.getString("local_trabalho")%></td>
		</tr>
		<%
		}
		} // fecha while
		rs.close();
		st.close();
		conn.close();
		} // fecha try
		catch (Exception e) {
		out.println("Ocorreu uma exceção - " + e.getMessage());
		}
		%>

		<tr>
			<th colspan=10>
				<form action="index.jsp" method="get">
					<input type="submit" value="Voltar">

				</form>
			</th>
		</tr>
	</table>
</body>
</html>