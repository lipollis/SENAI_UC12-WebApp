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
                        <meta charset="UTF-8">
                        <link rel="stylesheet" type="text/css" href="estilos.css">
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

                        <title>Sistema de Controle de Vagas de Emprego</title>
                    </head>





                    <body>

                        <!-- ---------------------------------------------------------------------------------------------------       -->
                        <!--NAVBAR-->
                        <!-- ---------------------------------------------------------------------------------------------------       -->

                        <section class="btn-group btn-group-vertical gap-3 d-flex ">
                            <div class="position-relative btn btn-dark ">
                                <div class="position-relative top-0 start-50 translate-middle-x justify-content-evenly align-items-center">
                                    <ul class="btn-group gap-3">
                                        <li class="nav-item">
                                            <a class="nav-link" href="emp_010.jsp">Cadastrar</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="emp_020.jsp">Alteração/Exclusão</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Listar vagas</a>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                <li><a class="dropdown-item" href="emp_030.jsp?lista=1" name="lista" value="1">Lista de vagas abertas</a></li>
                                                <li><a class="dropdown-item" href="emp_030.jsp?lista=0" name="lista" value="0">Lista de vagas encerradas</a></li>
                                                <li><a class="dropdown-item" href="emp_030.jsp" name="lista" value="">Lista geral de vagas</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                        </section>

                        <div class="espaco">
                        </div>

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
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                    </body>

                    </html>