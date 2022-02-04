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
                    <link rel="stylesheet" type="text/css" href="estilos.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquerymaskmoney/3.0.2/jquery.maskMoney.min.js"></script>

                    <title>Sistema de Controle de Vagas de Emprego</title>



                    <!--Construçãoo de máscaras pelo JQUERY-->
                    <script type="text/javascript">
                        $(function() {
                            $('.mask-real').maskMoney({
                                showSymbol: true,
                                symbol: 'R$ ',
                                decimal: ',',
                                thousands: '.',
                                allowZero: true
                            }); // valor monet�rio
                        });
                    </script>
                </head>

                <!-- ---------------------------------------------------------------------------------------------------       -->
                <!--NAVBAR-->
                <!-- ---------------------------------------------------------------------------------------------------       -->
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark text-white ">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Sistema de Controle de Vagas de Emprego</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>

    </button>
                        <div class="collapse navbar-collapse" id="navbarNavDropdown">
                            <ul class="navbar-nav">

                                <li class="nav-item">
                                    <a class="nav-link" href="emp_010.jsp">Cadastrar</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="emp_020.jsp">Alteração/Exclusão</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Listar vagas</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item" href="emp_030.jsp" name="lista" value="1">Lista de vagas abertas</a></li>
                                        <li><a class="dropdown-item" href="emp_030.jsp" name="lista" value="2">Lista de vagas encerradas</a></li>
                                        <li><a class="dropdown-item" href="emp_030.jsp" name="lista" value="">Lista geral de vagas</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="https://github.com/lipollis">
							Login <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" 
							fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16"> 
  						<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
				</svg></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <body>
                    <%
VagasDaoImpl vdi = new VagasDaoImpl();
Vagas v = null;
int id = 0;

try{
	id = Integer.parseInt(request.getParameter("id"));
	v = vdi.Buscar(id);
	if(v.getId()<0 || v == null){
		response.sendRedirect("./emp_020.jsp");
	}
} catch(Exception e){}

//id = Integer.parseInt(request.getParameter("id"));
String descricao = request.getParameter("descricao");
String req_obrigatorios = request.getParameter("req_obrigatorios");
String req_desejaveis = request.getParameter("req_desejaveis");
String remuneracao = request.getParameter("remuneracao");
String beneficios = request.getParameter("beneficios");
String local_trabalho = request.getParameter("local_trabalho");
String aberta = request.getParameter("aberta");

try{
	String gravar=request.getParameter("descricao");	
	if(gravar!=null || gravar.equals("")==false){
		v = new Vagas();
		v.setDescricao(request.getParameter("descricao"));
		v.setReq_obrigatorios(request.getParameter("req_obrigatorios"));
		v.setReq_desejaveis(request.getParameter("req_desejaveis"));
		v.setRemuneracao(request.getParameter("remuneracao"));
		v.setBeneficios(request.getParameter("beneficios"));
		v.setLocal_trabalho(request.getParameter("local_trabalho"));
		v.setAberta(request.getParameter("aberta"));
		v.setId(id);
		
		vdi.Alterar(v);
		response.sendRedirect("./emp_020.jsp");
	}
	}catch(Exception e){	
		out.println("Erro em Editar JSP");	}
	finally{ }
%>


                        <div align=center>
                            <h1>Sistema de Controle de Vagas de Emprego</h1>
                        </div>
                        <div align=center>
                            <h3>Alteração</h3>
                        </div>
                        <br>
                        <div>

                            <form action="emp_021-1.jsp" method="post">

                                <table align="center">
                                    <!-- ---------------------------------------------------------------------------------------------------       -->
                                    <!-- -- FORMULARIO --      -->
                                    <!-- ---------------------------------------------------------------------------------------------------       -->
                                    <tr>
                                        <td>Id vaga</td>
                                        <td><input type="text" name="id" required maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>Descrição</td>
                                        <td><input type="text" name="descricao" required maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>Requisitos Obrigatórios</td>
                                        <td><input type="text" name="req_obrigatorios" required maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>Requisitos Desejáveis</td>
                                        <td><input type="text" name="req_desejaveis" maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>Remuneração</td>
                                        <td><input type="text" name="remuneracao" required class="mask-real" size=8 style="text-align: right"></td>
                                    </tr>

                                    <tr>
                                        <td>Benefícios</td>
                                        <td><input type="text" name="beneficios" required maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>Local de Trabalho</td>
                                        <td><input type="text" name="local_trabalho" required maxlength=45></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <td>
                                                <fieldset data-role="controlgroup" id="radio-1">
                                                    <legend></legend>
                                                    <input name="aberta_line" id="radio-choice-1a" value="1" type="radio" />
                                                    <label for="radio-choice-1a">Vaga aberta</label>
                                                    <input name="aberta_line" id="radio-choice-1b" value="0" type="radio" />
                                                    <label for="radio-choice-1b">Vaga encerrada</label>
                                                </fieldset>
                                            </td>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan=2>&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <th colspan=2><input type="submit" value="Enviar"></th>
                                    </tr>
                                </table>

                            </form>



                        </div>
                </body>

                </html>