package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

import dao.ConectaBD;
import entities.Vagas;

public class VagasDaoImpl implements IDao<Vagas>{
	
	// INSTANCIANDO A CONFIGURAÇÃO DE CONEXÃO COM O BANCO 
	private ConectaBD conectaBD;
	
	// CONSTRUTOR DO BANCO
	public VagasDaoImpl() {
		this.conectaBD = new ConectaBD();
	}
	
	 // METODO INCLUIR
    /* O metodo Incluir() faz a inclusao dos dados na tabela vagas a partir dos
    dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado o
    objeto de conexao cbd a partir da classe ConectaBD e transferido para a
    variavel de conexao conn pelo seu metodo Conectar(). Em seguida prepara
    o comando SQL de insercao de dados (insert) e realiza sua execucao.*/

    public Vagas Incluir(Vagas v)
    {
        try {
        	// conecta com BD
            ConectaBD cbd = new ConectaBD();
            Connection conn = cbd.Conectar();
            
            // inclusao modo objeto PreparedStatement
            String sql = "INSERT INTO vagas("
            		+ "descricao,"
            		+ "req_obrigatorios,"
            		+ "req_desejaveis,"
            		+ "remuneracao,"
            		+ "beneficios,"
            		+ "local_trabalho)"
            		+ "aberta"
                    + "VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
            
            // inclusao modo objeto PreparedStatement - continuacao
            ps.setString(1, v.getDescricao_cc());
			ps.setString(2, v.getReq_obrigatorios_cc()); 
			ps.setString(3, v.getReq_desejaveis_cc());
			ps.setString(4, v.getRemuneracao_cc());
			ps.setString(5, v.getBeneficios_cc());
			ps.setString(6, v.getLocal_trabalho_cc()); 
			ps.setString(7, v.getAberta_cc());
            ps.execute();
            ps.close();
            conn.close();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
		return v;}


    // METODO ALTERAR
    /* O metodo Alterar() faz a alteracao dos dados na tabela vagas a partir dos
    dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado
    o objeto de conexao cbd a partir da classe ConectaBD e transferido para a
    variavel de conexao conn pelo seu metodo Conectar(). Em seguida prepara o
    comando SQL de alteraao de dados (update) e realiza sua execucao.*/
    public Vagas Alterar(Vagas v)
    {
        try {
// conecta com BD
            ConectaBD cbd = new ConectaBD();
            Connection conn = cbd.Conectar();
            
            String sql = "UPDATE vagas SET "
            		+ "descricao = ?,"
                    + "req_obrigatorios = ?,"
                    + "req_desejaveis = ?,"
                    + "remuneracao = ?,"
                    + "beneficios = ?,"
                    + "local_trabalho = ? "
                    + "aberta = ?,"
                    + " WHERE id = ?";
            
            PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
            ps.setString(1, v.getDescricao_cc());
			ps.setString(2, v.getReq_obrigatorios_cc()); 
			ps.setString(3, v.getReq_desejaveis_cc());
			ps.setString(4, v.getRemuneracao_cc());
			ps.setString(5, v.getBeneficios_cc());
			ps.setString(6, v.getLocal_trabalho_cc()); 
			ps.setString(7, v.getAberta_cc());
            ps.execute();
            ps.close();
            conn.close();
            conn.close();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return v;
    }

    // METODO EXCLUIR
    /*O metodo Excluir() faz a excluao dos dados na tabela vagas a partir dos
    dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado o
    objeto de conexao cbd a partir da classe ConectaBD e transferido para a variavel
    de conexao conn pelo seu metodo Conectar(). Em seguida prepara o comando SQL
    de exclusao de dados (delete) e realiza sua execucao.*/
    
    @Override
	public void Excluir(Integer id_line)
    {
        try {
        	// conecta com BD
            ConectaBD cbd = new ConectaBD();
            Connection conn = cbd.Conectar();
            
            String sql = "DELETE FROM vagas WHERE id = " + id_line;
            
            PreparedStatement comando = (PreparedStatement)conn.prepareStatement(sql);
            comando.execute();
            comando.close();
            conn.close();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    //MÉTODO LISTAR
    @Override
    public String Listar(int aberta) {
		
		String linha="";
		try {
			ConectaBD cbd = new ConectaBD();
            Connection conn = cbd.Conectar();

			String sql = "SELECT * FROM vagas";
			
			if(aberta==1) {
				sql = sql + " WHERE aberta=1";
			}else if(aberta==0) {
				sql = sql + " WHERE aberta=0";}
			
			
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				
				long id_line = rs.getInt(1);
				String descricao_line = rs.getString(2);
				String req_obrigatorios_line = rs.getString(3);
				String req_desejaveis_line = rs.getString(4);
				String remuneracao_line = rs.getString(5);
				String beneficios_line = rs.getString(6);
				String local_trabalho_line = rs.getString(7);
				String aberta_line = rs.getString(8);
				
				
				linha = linha + 
						"<br>"+ 
						"Codigo:" + id_line + 
						"- Descricao: " + descricao_line + 
						"- Requisitos Obrigatorios:" + req_obrigatorios_line +
						"- Requisitos Desejaveis:" + req_desejaveis_line + 
						"- Remuneracao: " + remuneracao_line + 
						"- Beneficios: " + beneficios_line + 
						"- Local de Trabalho:" + local_trabalho_line +
						"- Aberta:" + aberta_line +
						" - <a href='./emp_022.jsp?id= "+id_line+" '> Excluir</a>"+
						" - <a href='./emp_021.jsp?id= "+id_line+" '> Editar</a>";
			}

		} catch (Exception e) {
			System.out.println("Erro em Listar:" + e);
		}
		
		return linha;
	}
	
	// MÉTODO BUSCAR
		@Override
		public Vagas Buscar(Integer id_line) {
			
			Vagas v=new Vagas();
			try {

				ConectaBD cbd = new ConectaBD();
	            Connection conn = cbd.Conectar();

				
				String sql = "SELECT * FROM vagas WHERE id="+id_line;
				PreparedStatement ps = conn.prepareStatement(sql);
				//ps.setInt(1, id_line);
				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {				
					v.setDescricao_cc(rs.getString(2));
					v.setReq_obrigatorios_cc(rs.getString(3)); 
					v.setReq_desejaveis_cc(rs.getString(4));
					v.setRemuneracao_cc(rs.getString(5));
					v.setBeneficios_cc(rs.getString(6));
					v.setLocal_trabalho_cc(rs.getString(7)); 
					v.setAberta_cc(rs.getString(8));
					v.setId(rs.getInt(1));

				}

			} catch (Exception e) {
				System.out.println("Erro em Listar:" + e);
			}
			
			return v;
		}

		 


		}


