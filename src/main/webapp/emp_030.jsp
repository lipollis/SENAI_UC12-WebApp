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
                                <meta charset="UTF-8">
                                <link rel="stylesheet" type="text/css" href="estilos.css">
                                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

                                <title>Sistema de Controle de Vagas de Emprego</title>

                            </head>

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