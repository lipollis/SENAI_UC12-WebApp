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
                                <li><a class="dropdown-item" href="emp_030.jsp?lista=1" name="lista" value="1">Lista de vagas abertas</a></li>
                                <li><a class="dropdown-item" href="emp_030.jsp?lista=0" name="lista" value="0">Lista de vagas encerradas</a></li>
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


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



    </body>

    </html>