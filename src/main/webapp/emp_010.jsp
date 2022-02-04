<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="UTF-8">

<title>Sistema de Controle de Vagas de Emprego</title>

<link rel="stylesheet" type="text/css" href="estilos.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquerymaskmoney/3.0.2/jquery.maskMoney.min.js"></script>



<!--Construçãoo de máscaras pelo JQUERY-->
<script type="text/javascript">
 $(function() {
 $('.mask-real').maskMoney({showSymbol:true,symbol:'R$ ',
 decimal:',', thousands:'.', allowZero:true}); // valor monet�rio
 });
</script>
</head>



<body>
<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3>Inclusão</h3></div>
<br>
<div>

<form action="emp_011.jsp" method="post">

	<table align="center">
		<tr><td>ID</td>
			<td><input type="number" name="id" value="" disabled ></td></tr>
			
			
		<tr><td>Descrição</td>
			<td><input type="text" name="descricao" required maxlength=45></td></tr>
		
		<tr><td>Requisitos Obrigatórios</td>
			<td><input type="text" name="req_obrigatorios" required maxlength=45></td></tr>
		
		<tr><td>Requisitos Desejáveis</td>
			<td><input type="text" name="req_desejaveis" maxlength=45></td></tr>
		
		<tr><td>Remuneração</td>
			<td><input type="text" name="remuneracao" required class="mask-real" size=8
		style="text-align: right"></td></tr>
		
		<tr><td>Benefícios</td>
			<td><input type="text" name="beneficios" required maxlength=45></td></tr>
		
		<tr><td>Local de Trabalho</td>
			<td><input type="text" name="local_trabalho" required maxlength=45></td></tr>
		
		<tr><td>
			<td><fieldset data-role="controlgroup" id="radio-1" >
				<legend></legend>
				<input name="aberta" id="radio-choice-1a" value="1" type="radio"/>
				<label for="radio-choice-1a">Vaga aberta</label>
				<input name="aberta" id="radio-choice-1b" value="0" type="radio"/>
				<label for="radio-choice-1b">Vaga encerrada</label>
			</fieldset></td>
		</td></tr>
		
		<tr><td colspan=2>&nbsp;</td></tr>
		
		<tr><th colspan=2><input type="submit" value="Enviar"></th></tr>
	</table>

</form>

</div>
</body>
</html>