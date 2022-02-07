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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	
	

<title>Sistema de Controle de Vagas de Emprego</title>
</head>

<!-- ---------------------------------------------------------------------------------------------------       -->
<!--		BACKEND																							   -->
<!-- ---------------------------------------------------------------------------------------------------       -->
<%
String sql = "SELECT * FROM vagas";
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
	<div align=center><h3></h3></div></div>

<div class="table-responsive ">
	<table class="table table-hover">
	<caption class="e02"> </caption>
	<thead><tr  class="e01 table-secondary">
			<th scope="col">Id vaga</th>
			<th scope="col">Descricao</th>
			<th scope="col">Requisitos Obrigatorios</th>
			<th scope="col">Requisitos Desejaveis</th>
			<th scope="col">Remuneracao</th>
			<th scope="col">Beneficios</th>
			<th scope="col">Local de Trabalho</th>
			<th scope="col">Aberta</th>
			<th scope="col">Alterar</th>
			<th scope="col">Excluir</th>
		</tr></thead>
	
<%
int alt = 0;
while(rs.next()) {
	if(alt == 0) {%>
	<tr bgcolor=snow class="e01">
		<%alt = 1;
		}  else{%>
		  <tbody>
		<tr bgcolor=ivory class="e01">
		
			<%alt = 0;}%>
<form class="form-floating" method="post" id="formulario" action="">


      	<th scope="row" ><input class="form-control" type="hidden" name="id" id="id" value="<%=rs.getInt("id")%>"><%=rs.getInt("id") %></th>
		<td ><input class="form-control" type="hidden" name="descricao" value="<%=rs.getString("descricao")%>"><%=rs.getString("descricao")%></td>
		<td ><input class="form-control" type="hidden" name="req_obrigatorios" value="<%=rs.getString("req_obrigatorios")%>"><%=rs.getString("req_obrigatorios")%></td>
		<td ><input class="form-control" type="hidden" name="req_desejaveis" value="<%=rs.getString("req_desejaveis")%>"><%=rs.getString("req_desejaveis")%></td>
		<td ><input class="form-control" type="hidden" name="remuneracao" value="<%=df.format(rs.getFloat("remuneracao"))%>"><%=df.format(rs.getFloat("remuneracao"))%></td>
		<td ><input class="form-control" type="hidden" name="beneficios" value="<%=rs.getString("beneficios")%>"><%=rs.getString("beneficios")%></td>
		<td ><input class="form-control" type="hidden" name="local_trabalho" value="<%=rs.getString("local_trabalho")%>"><%=rs.getString("local_trabalho")%></td>
		<td ><input class="form-control" type="hidden" name="aberta" value="<%=rs.getInt("aberta")%>"><%=rs.getInt("aberta")%></td>
    	<td ><input class="form-control" type="image" src="./edit.png" 
    		value="Alterar"  formaction="emp_021.jsp" onclick="Edit()"></td>
		<td ><input class="form-control" type="image" src="./trash.png" 
			value="Excluir" formaction="emp_022.jsp" onclick="Trash()"></td>
    </tr>
</form>

<%} // fecha while
	ps.execute();
	ps.close();
	conn.close();
	}catch(Exception e) {
		out.println("Ocorreu uma exceção - " + e.getMessage());
	}
%>

</tbody>
</table></div>	

<form action="index.jsp" method="get">
	<div class="form-container "><div class="button-container">
		<input type="submit" value="Voltar" class="btn btn-warning "></div></div></form>


<script>
function Edit(){
	var choise = confirm("Confirma edição?");

	if(choise == true){
		document.getElementById("formulario").action = "emp_021.jsp";
	}else{
		event.preventDefault ();

}
	        
function Trash(){
	var choise = confirm("Confirma exclusão?");
	                  		
	if(choise == true){
		document.getElementById("formulario").action = "emp_022.jsp";
	}else{
		event.preventDefault ();
	}
}
</script>       
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