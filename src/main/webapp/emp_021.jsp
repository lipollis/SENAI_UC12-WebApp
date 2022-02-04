<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="entities.Vagas" %>
<%@ page import="dao.VagasDaoImpl" %>
<%@ page import="dao.ConectaBD" %>

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
<%
VagasDaoImpl vdi = new VagasDaoImpl();
Vagas v = null;
int id = 0;

try{
	id = Integer.parseInt(request.getParameter("id_line"));
	v = vdi.Buscar(id);
	if(v.getId()<0 || v == null){
		response.sendRedirect("./emp_020.jsp");
	}
} catch(Exception e){}

try{
	String gravar=request.getParameter("descricao_line");	
	if(gravar!=null || gravar.equals("")==false){
		v = new Vagas();
		v.setDescricao(request.getParameter("descricao_line"));
		v.setReq_obrigatorios(request.getParameter("req_obrigatorios_line"));
		v.setReq_desejaveis(request.getParameter("req_desejaveis_line"));
		v.setRemuneracao(request.getParameter("remuneracao_line"));
		v.setBeneficios(request.getParameter("beneficios_line"));
		v.setLocal_trabalho(request.getParameter("local_trabalho_line"));
		v.setAberta(request.getParameter("aberta_line"));
		v.setId(id);
		
		vdi.Alterar(v);
		response.sendRedirect("./emp_020.jsp");
	}
	}catch(Exception e){	
		out.println("Erro em Editar JSP");	}
	finally{ }
%>


<div align=center><h1>Sistema de Controle de Vagas de Emprego</h1></div>
<div align=center><h3>Alteração</h3></div>
<br>
<div>

<form action="emp_021-1.jsp" method="post">

<table align="center">
	<tr><td>Id vaga</td>
		<td><input type="text" name="id_line" required maxlength=45></td></tr>
	
	<tr><td>Descrição</td>
		<td><input type="text" name="descricao_line" required maxlength=45></td></tr>
	
	<tr><td>Requisitos Obrigatórios</td>
		<td><input type="text" name="req_obrigatorios_line" required maxlength=45></td></tr>
	
	<tr><td>Requisitos Desejáveis</td>
		<td><input type="text" name="req_desejaveis_line" maxlength=45></td></tr>
	
	<tr><td>Remuneração</td>
		<td><input type="text" name="remuneracao_line" required class="mask-real" size=8
	style="text-align: right"></td></tr>
	
	<tr><td>Benefícios</td>
		<td><input type="text" name="beneficios_line" required maxlength=45></td></tr>
	
	<tr><td>Local de Trabalho</td>
		<td><input type="text" name="local_trabalho_line" required maxlength=45></td></tr>
	
		<tr><td>
			<td><fieldset data-role="controlgroup" id="radio-1" >
				<legend></legend>
				<input name="aberta_line" id="radio-choice-1a" value="1" type="radio"/>
				<label for="radio-choice-1a">Vaga aberta</label>
				<input name="aberta_line" id="radio-choice-1b" value="0" type="radio"/>
				<label for="radio-choice-1b">Vaga encerrada</label>
			</fieldset></td>
		</td></tr>
	
	<tr><td colspan=2>&nbsp;</td></tr>
	
	<tr><th colspan=2><input type="submit" value="Enviar"></th></tr>
</table>

</form>

<script>
	document.getElementsByName("id_line")[0].value="<%=v.getId()%>";
	document.getElementsByName("descricao_line")[0].value="<%=v.getDescricao()%>";
	document.getElementsByName("req_obrigatorios_line")[0].value="<%=v.getReq_obrigatorios()%>";
	document.getElementsByName("req_desejaveis_line")[0].value="<%=v.getReq_desejaveis()%>";
	document.getElementsByName("remuneracao_line")[0].value="<%=v.getRemuneracao()%>";
	document.getElementsByName("beneficios_line")[0].value="<%=v.getBeneficios() %>";
	document.getElementsByName("local_trabalho_line")[0].value="<%=v.getLocal_trabalho()%>";
	document.getElementsByName("aberta_line")[0].value="<%=v.getAberta()%>";
</script>

</div>
</body>
</html>