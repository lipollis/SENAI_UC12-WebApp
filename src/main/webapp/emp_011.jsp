<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="entities.Vagas" %>
<%

String dc = request.getParameter("dsc");
String ro = request.getParameter("rob");
String rd = request.getParameter("rde");
String rex = request.getParameter("rem");

// converte string valor para float
String vx = rex;
vx = vx.replace(".","");
vx = vx.replace(",",".");
float vr = Float.parseFloat(vx);

String be = request.getParameter("ben");
String lt = request.getParameter("ltr");

//---- Back-End -----------------------
Vagas v = new Vagas();
v.setDescricao_cc(dc);
v.setReq_obrigatorios_cc(ro);
v.setReq_desejaveis_cc(rd);
v.setRemuneracao_cc(vr);
v.setBeneficios_cc(be);
v.setLocal_trabalho_cc(lt);
v.Incluir();
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
<div align=center><h3>Inclusão</h3></div>

<table>
<tr><td>Descrição</td><td style="color:blue"><%=dc%></td></tr>

<tr><td>Requisitos Obrigatórios</td><td style="color:blue"><%=ro%></td></tr>

<tr><td>Requisitos Desejáveis</td><td style="color:blue"><%=rd%></td></tr>

<tr><td>Remuneração</td><td style="color:blue"><%=rex%></td></tr>

<tr><td>Benefício</td><td style="color:blue"><%=be%></td></tr>

<tr><td>Local de Trabalho</td><td style="color:blue"><%=lt%></td></tr>

<tr><th colspan=2 style="color:green">Vaga incluída com sucesso.</th></tr>
</table>
</div><br>

<div>
<form action="index.jsp" method="get">
<input type="submit" value="Voltar">

</form>

</div>
</body>
</html>