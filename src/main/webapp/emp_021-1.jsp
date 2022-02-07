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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	

<title>Sistema de Controle de Vagas de Emprego</title>
</head>

<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		BACKEND																							   -->
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
id_html = 0;

try{
	id_html = Integer.parseInt(request.getParameter("id"));
	v = vdi.Search(id_html);
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
<!--		NAVBAR																							   -->
<!-- ---------------------------------------------------------------------------------------------------       -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand btn btn-dark" href="">AppRH</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item btn btn-dark">
          <a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
        </li>
        <li class="nav-item btn btn-dark">
          <a class="nav-link" href="./emp_010.jsp">Cadastro</a>
        </li>
        <li class="nav-item btn btn-dark">
          <a class="nav-link" href="./emp_020.jsp">Alteração/Exclusão</a>
        </li>
        <li class="nav-item dropdown btn btn-dark">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Painel
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="./emp_030.jsp?lista=0">Listar Fechadas</a></li>
            <li><a class="dropdown-item" href="./emp_030.jsp?lista=1">Listar Abertas</a></li>
            <li><a class="dropdown-item" href="./emp_030.jsp?lista=2">Listar Todas</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="btn btn-dark">
    <a class="nav-link " href="https://github.com/lipollis">Login 
    	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" 
    		fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16"> 
  			<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
		</svg></a>
  </div>
</nav>


<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		FORMULÁRIO-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3>Alteração</h3></div>

<form action="index.jsp" method="get">
	<div class=" "><span disabled name="id" > <%=id_html%> </span></div>
	<div class=" "><span name="descricao"  > <%=descricao_html%> </span></div>
	<div class=" "><span name="req_obrigatorios"  > <%=req_obrigatorios_html%> </span></div>
	<div class=" "><span name="req_desejaveis" > <%=req_desejaveis_html%> </span></div>
	<div class=" "><span name="remuneracao"  class="mask-real" size=8 style="text-align: right"> <%=remuneracao_html%> </span></div>
	<div class=" "><span name="beneficios"  > <%=beneficios_html%> </span></div>
	<div class=" "><span name="local_trabalho" > <%=local_trabalho_html%> </span></div>
	<div class=" "><span name="aberta" id="radio-choice-1a" value="1"  /> <%=aberta_html%> </span></div>
	
	<div class=" "><input type="submit" value="Voltar" class=" "></div>
</form>
	

<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		JQUERY																							   -->
<!-- ---------------------------------------------------------------------------------------------------       -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquerymaskmoney/3.0.2/jquery.maskMoney.min.js"></script>
	
	<script type="text/javascript">
	 $(function() {
	 $('.mask-real').maskMoney({showSymbol:true,symbol:'R$ ',
	 decimal:',', thousands:'.', allowZero:true}); // valor monet�rio
	 });
	</script>
    
<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		BOOTSTRAP																						   -->
<!-- ---------------------------------------------------------------------------------------------------       -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" 
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" 
		crossorigin="anonymous"></script>
</body>


</html>