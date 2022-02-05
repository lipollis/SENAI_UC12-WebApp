<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>

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
DecimalFormat df = new DecimalFormat("#,##0.00");

Integer id_html = Integer.parseInt(request.getParameter("id"));
String descricao_html = request.getParameter("descricao");
String req_obrigatorios_html = request.getParameter("req_obrigatorios");
String req_desejaveis_html = request.getParameter("req_desejaveis");

// CONVERSÃO DE STRING PARA FLOAT
String remuneracao_html = request.getParameter("remuneracao");
String vx = remuneracao_html;
vx = vx.replace(".","");
vx = vx.replace(",",".");
float remuneracao_html_conv = Float.parseFloat(vx);

String beneficios_html = request.getParameter("beneficios");
String local_trabalho_html = request.getParameter("local_trabalho");
int aberta_html = Integer.parseInt(request.getParameter("aberta"));

VagasDaoImpl vdi = new VagasDaoImpl();
Vagas v = null;
int id = 0;

try{
	id = Integer.parseInt(request.getParameter("id"));
	v = vdi.Search(id);
	if(v.getId_java()<0 || v==null){
		response.sendRedirect("./emp_020.jsp");
	}} catch(Exception e){}
	
try{
	String gravar=request.getParameter("descricao");	
	if(gravar!=null || gravar.equals("")==false)
	{
		v = new Vagas();
		v.setDescricao_java(descricao_html);
		v.setReq_obrigatorios_java(req_obrigatorios_html);
		v.setReq_desejaveis_java(req_desejaveis_html);
		v.setRemuneracao_java(remuneracao_html_conv);
		v.setBeneficios_java(beneficios_html);
		v.setLocal_trabalho_java(local_trabalho_html);
		v.setAberta_java(aberta_html);
		v.setId_java(id_html);
 
		vdi.Update(v);
		//response.sendRedirect("./emp_020.jsp");
		}
	} catch(Exception e){ out.println("Erro em atualizar JSP"); }
	finally{ }
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
<div align=center><h3>Alteração</h3></div>

<form action="index.jsp" method="get">
	<div class=" "><span disabled name="id" > </span></div>
	<div class=" "><span name="descricao"  > <%=descricao_html%> </span></div>
	<div class=" "><span name="req_obrigatorios"  > <%=req_obrigatorios_html%> </span></div>
	<div class=" "><span name="req_desejaveis" > <%=req_desejaveis_html%> </span></div>
	<div class=" "><span name="remuneracao"  class="mask-real" size=8 style="text-align: right"> <%=remuneracao_html%> </span></div>
	<div class=" "><span name="beneficios"  > <%=beneficios_html%> </span></div>
	<div class=" "><span name="local_trabalho" > <%=local_trabalho_html%> </span></div>
	<div class=" "><span name="aberta" id="radio-choice-1a" value="1"  /> <%=aberta_html%> </span></div>
	
	<div class=" "><input type="submit" value="Voltar" class=" "></div>
</form>
	


    
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