<%@ page language="java" contentType="text/html, charset=UTF-8" 
pageEncoding="UTF-8" %>

    <%@ page import="entities.Vagas" %>
        <%@ page import="dao.VagasDaoImpl" %>
            <%@ page import="dao.ConectaBD" %>

                <%
//int id = Integer.parseInt(request.getParameter("id"));
String descricao = request.getParameter("descricao");
String req_obrigatorios = request.getParameter("req_obrigatorios");
String req_desejaveis = request.getParameter("req_desejaveis");
String remuneracao = request.getParameter("remuneracao");
/*
// converte string valor para float
String vx = rex;
vx = vx.replace(".","");
vx = vx.replace(",",".");
float vr = Float.parseFloat(vx);
*/
String beneficios = request.getParameter("beneficios");
String local_trabalho = request.getParameter("local_trabalho");
String aberta = request.getParameter("aberta");

//---- Back-End -----------------------

try{
	
	String gravar= request.getParameter("descricao");	
	if(gravar!=null || gravar.equals("")==false)
	{
		Vagas v = new Vagas();
		v.setDescricao(descricao);
		v.setReq_obrigatorios(req_obrigatorios);
		v.setReq_desejaveis(req_desejaveis);
		v.setRemuneracao(remuneracao);
		v.setBeneficios(beneficios);
		v.setLocal_trabalho(local_trabalho);
		v.setAberta(aberta);

		VagasDaoImpl vdi = new VagasDaoImpl();
		vdi.Incluir(v);
	}
	}catch(Exception e){		}
	finally{ }

%>


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
                        <!-- ---------------------------------------------------------------------------------------------------       -->
                        <!-- -- FORMULARIO --      -->
                        <!-- ---------------------------------------------------------------------------------------------------       -->
                        <div align=center>
                            <h1>Sistema de Controle de Vagas de Emprego</h1>
                        </div>
                        <div align=center>
                            <h3>Inclusão</h3>
                        </div>

                        <table align="center">
                            <tr>
                                <td>Id vaga</td>
                                <td style="color:blue"></td>
                            </tr>

                            <tr>
                                <td>Descrição</td>
                                <td style="color:blue">
                                    <%=descricao%>
                                </td>
                            </tr>

                            <tr>
                                <td>Requisitos Obrigatórios</td>
                                <td style="color:blue">
                                    <%=req_obrigatorios%>
                                </td>
                            </tr>

                            <tr>
                                <td>Requisitos Desejáveis</td>
                                <td style="color:blue">
                                    <%=req_desejaveis%>
                                </td>
                            </tr>

                            <tr>
                                <td>Remuneração</td>
                                <td style="color:blue">
                                    <%=remuneracao%>
                                </td>
                            </tr>

                            <tr>
                                <td>Benefício</td>
                                <td style="color:blue">
                                    <%=beneficios%>
                                </td>
                            </tr>

                            <tr>
                                <td>Local de Trabalho</td>
                                <td style="color:blue">
                                    <%=local_trabalho%>
                                </td>
                            </tr>

                            <tr>
                                <td>Status vaga</td>
                                <td style="color:blue">
                                    <%=aberta%>
                                </td>
                            </tr>

                            <tr>
                                <th colspan=2 style="color:green">Vaga incluída com sucesso.</th>
                            </tr>
                        </table>
                        <br>

                        <div>
                            <form action="index.jsp" method="get">
                                <input type="submit" value="Voltar">

                            </form>

                        </div>
                    </body>

                    </html>