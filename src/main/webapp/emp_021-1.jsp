<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>
<%

int id = Integer.parseInt(request.getParameter("id_line"));
String dc = request.getParameter("descricao_line");
String ro = request.getParameter("req_obrigatorios_line");
String rd = request.getParameter("req_desejaveis_line");
String rex = request.getParameter("remuneracao_line");
/*
// converte string valor para float
String vx = rex;
vx = vx.replace(".","");
vx = vx.replace(",",".");
float vr = Float.parseFloat(vx);
*/
String be = request.getParameter("beneficios_line");
String lt = request.getParameter("local_trabalho_line");
String ab = request.getParameter("aberta_line");

//---- Back-End -----------------------

try{
	
	String gravar= request.getParameter("descricao");	
	if(gravar!=null || gravar.equals("")==false)
	{
		Vagas v = new Vagas();
		v.setDescricao(dc);
		v.setReq_obrigatorios(ro);
		v.setReq_desejaveis(rd);
		v.setRemuneracao(rex);
		v.setBeneficios(be);
		v.setLocal_trabalho(lt);
		v.setAberta(ab);

		VagasDaoImpl vdi = new VagasDaoImpl();
		vdi.Incluir(v);
	}
	}catch(Exception e){		}
	finally{ }

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
	<div align=center><h3>Alteração</h3></div>

	<table align="center">
		<tr><td>Id vaga</td><td style="color:blue"><%=id%></td></tr>
		
		<tr><td>Descrição</td><td style="color:blue"><%=dc%></td></tr>
		
		<tr><td>Requisitos Obrigatórios</td><td style="color:blue"><%=ro%></td></tr>
		
		<tr><td>Requisitos Desejáveis</td><td style="color:blue"><%=rd%></td></tr>
		
		<tr><td>Remuneração</td><td style="color:blue"><%=rex%></td></tr>
		
		<tr><td>Benefício</td><td style="color:blue"><%=be%></td></tr>
		
		<tr><td>Local de Trabalho</td><td style="color:blue"><%=lt%></td></tr>
		
		<tr><td>Status vaga</td><td style="color:blue"><%=ab%></td></tr>
		
		<tr><th colspan=2 style="color:green">Vaga alterada com sucesso.</th></tr>
	</table>
</div><br>

<div>
<form action="index.jsp" method="get">
<input type="submit" value="Voltar">

</form>

</div>
</body>
</html>