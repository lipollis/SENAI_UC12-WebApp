<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

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


        <div>
            <div align=center>
                <h1>Sistema de Controle de Vagas de Emprego</h1>
            </div>
            <div align=center>
                <h3>Inclusão</h3>
            </div>
            <br>
            <div>

                <form action="emp_011.jsp" method="post">


                    <!-- ---------------------------------------------------------------------------------------------------       -->
                    <!-- -- FORMULARIO --      -->
                    <!-- ---------------------------------------------------------------------------------------------------       -->
                    <table align="center">
                        <tr>
                            <td>ID</td>
                            <td><input type="number" name="id" value="" disabled></td>
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
                                        <input name="aberta" id="radio-choice-1a" value="1" type="radio" />
                                        <label for="radio-choice-1a">Vaga aberta</label>
                                        <input name="aberta" id="radio-choice-1b" value="0" type="radio" />
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

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>

    </html>