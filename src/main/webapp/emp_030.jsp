<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
        <%@ page import="java.text.DecimalFormat"%>

            <%@ page import="entities.Vagas" %>
                <%@ page import="dao.VagasDaoImpl" %>
                    <%@ page import="dao.ConectaBD" %>


                        <%
DecimalFormat df = new DecimalFormat("#,##0.00");

VagasDaoImpl vdi = new VagasDaoImpl();
try{
	int lista = Integer.parseInt(request.getParameter("lista"));
	if (lista == 0){
		// vaga encerrada
		out.println(vdi.Listar(0));
	} else if (lista == 1){
		// vaga aberta
		out.println(vdi.Listar(1));
	} else{
		out.println(vdi.Listar(2));
	}
} catch(Exception e){
	out.println(vdi.Listar(2));
}

try {
	ConectaBD cbd = new ConectaBD();
	Connection conn = cbd.Conectar();
	String sql = "SELECT * FROM vagas WHERE aberta = 1";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next())
		{
			Integer id =rs.getInt("id");
			String descricao =rs.getString("descricao");
			String req_obrigatorios =rs.getString("req_obrigatorios");
			String req_desejaveis =rs.getString("req_desejaveis");
			String remuneracao =rs.getString("remuneracao");
			String beneficios =rs.getString("beneficios");
			String local_trabalho =rs.getString("local_trabalho");
			String aberta =rs.getString("aberta");
		
		 	rs.close(); 
	 		st.close();
		   	String Sql = "SELECT * FROM vagas";
		   	st = conn.createStatement();
		   	rs = st.executeQuery(Sql);
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
                                <div align=center>
                                    <h1>Lista de vagas de emprego em aberto</h1>
                                </div>

                                <!-- ---------------------------------------------------------------------------------------------------       -->
                                <!-- -- FORMULARIO --      -->
                                <!-- ---------------------------------------------------------------------------------------------------       -->
                                <table align="center">
                                    <tr class="e01">
                                        <th>Id Vaga</th>
                                        <th>Descrição</th>
                                        <th>Req.Obrigatórios</th>
                                        <th>Req.Desejáveis</th>
                                        <th>Remuneração</th>
                                        <th>Benefícios</th>
                                        <th>Local de Trabalho</th>
                                        <th>Aberta</th>
                                    </tr>

                                    <%
int alt = 0;
while(rs.next())
{
if(alt == 0) {%>

                                        <tr bgcolor=snow class="e01">

                                            <%alt = 1;}
	else
	{%>

                                                <tr bgcolor=ivory class="e01">
                                                    <%alt = 0;}%>
                                                        <td>
                                                            <%=rs.getInt("id")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("descricao")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("req_obrigatorios")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("req_desejaveis")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("remuneracao") %>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("beneficios")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("local_trabalho")%>
                                                        </td>
                                                        <td>
                                                            <%=rs.getString("aberta")%>
                                                        </td>
                                                </tr>
                                                <%
}
} // fecha while
	rs.close();
	st.close();
	conn.close();
}catch(Exception e){
	out.println("Ocorreu uma exceção - " + e.getMessage());
	}
%>

                                                    <tr>
                                                        <th colspan=10>

                                                            <tr>
                                                                <th colspan=10>
                                                                    <form action="index.jsp" method="get">
                                                                        <input type="submit" value="Voltar">
                                                                    </form>
                                                                </th>
                                                            </tr>
                                </table>

                                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
                                    //function myalert() {
                                    //    alert("Confirma a exclusão?.\n " );
                                    }
                                </script>

                            </body>

                            </html>