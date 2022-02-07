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
<!--		FORMULÁRIO																						   -->
<!-- ---------------------------------------------------------------------------------------------------       -->
<div class="titulo">
	<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
	<div align=center><h3>Inclusão</h3></div></div>

<form class="form-floating" action="emp_011.jsp" method="post">

	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="id" type="number" value="" disabled name="id" >
			<label for="id" class="col-sm-2 col-form-label">ID Vaga</label>
	</div></div>
	
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="descricao" type="text" required name="descricao"  >
			<label for="descricao" class="col-sm-2 col-form-label">Descrição</label>
	</div></div>	
	
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="req_obrigatorios" type="text" required name="req_obrigatorios"  >
			<label for="req_obrigatorios" class="col-sm-2 col-form-label">Requisitos Obrigatórios</label>
	</div></div>
		
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="req_desejaveis" type="text" name="req_desejaveis" >
			<label for="req_desejaveis" class="col-sm-2 col-form-label">Requisitos Desejáveis</label>
	</div></div>
		
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="remuneracao" type="text" required name="remuneracao"  class="mask-real" style="text-align: right">
			<label for="remuneracao" class="col-sm-2 col-form-label">Remuneração</label>
	</div></div>
		
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="beneficios" type="text" required name="beneficios"  >
			<label for="beneficios" class="col-sm-2 col-form-label">Benefícios</label>
	</div></div>
		
	<div class="form-container ">
		<div class="form-floating mb-3 ">
			<input class="form-control" id="local_trabalho" type="text" required name="local_trabalho" >
			<label for="local_trabalho" class="col-sm-2 col-form-label">Local de Trabalho</label>
	</div></div>	
	
	<div class="form-container ">
		<div class="wrap-radio">
			<div class="form-check ">
				<label class="form-check-label container-radio" for="radio-choice-1a">Vaga aberta
				<input class="form-check-input"  type="radio"name="aberta" id="radio-choice-1a" value="1"/>
				<span class="checkmark"></span></label></div>
			<div class="form-check ">
				<label class="form-check-label container-radio" for="radio-choice-2a">Vaga encerrada
				<input class="form-check-input" type="radio"name="aberta" id="radio-choice-2a" value="0"/>
				<span class="checkmark"></span></label></div>
	</div></div>

	<div class="form-container "><div class="button-container"><input type="submit" value="Enviar" class="btn btn-success "></div></div>
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