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



<body>
<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		NAVBAR-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<a href="./index.jsp"> Home </a>
<a href="./emp_010.jsp"> Criar cadastro</a>
<a href="./emp_020.jsp"> Alteração e exclusão</a>


<a href="./emp_030.jsp?lista=0"> Listar Fechadas</a>
<a href="./emp_030.jsp?lista=1"> Listar Abertas</a>
<a href="./emp_030.jsp?lista=2"> Listar Todas</a>


<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		FORMULÁRIO-->
<!-- ---------------------------------------------------------------------------------------------------       -->
<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3>Inclusão</h3></div>

<form action="emp_011.jsp" method="post">
	<div class=" "><input type="number" value="" disabled name="id" ></div>
	<div class=" "><input type="text" maxlength=45 required name="descricao"  ></div>
	<div class=" "><input type="text" maxlength=45 required name="req_obrigatorios"  ></div>
	<div class=" "><input type="text" maxlength=45 name="req_desejaveis" > </div>
	<div class=" "><input type="text" maxlength=45 required name="remuneracao"  class="mask-real" size=8 style="text-align: right"> </div>
	<div class=" "><input type="text" maxlength=45 required name="beneficios"  > </div>
	<div class=" "><input type="text" maxlength=45 required name="local_trabalho" > </div>
	<div class=" "><input type="radio"name="aberta" id="radio-choice-1a" value="1"  /> </div>
	<div class=" "><input type="radio"name="aberta" id="radio-choice-1a" value="0"  /> </div>
	<div class=" "><input type="submit" value="Enviar" class=" "></div>
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