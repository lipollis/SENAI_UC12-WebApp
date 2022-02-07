package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

import dao.ConectaBD;
import entities.Vagas;

public class VagasDaoImpl implements IDao<Vagas> {
	// INSTANCIANDO A CONFIGURAAOO DE CONEXAO COM O BANCO
	private ConectaBD conectaBD;

	// CONSTRUTOR DO BANCO
	public VagasDaoImpl() {
		this.conectaBD = new ConectaBD();
	}
	
	
	/*
	 * O metodo Incluir() faz a inclusao dos dados na tabela vagas a partir dos
	 * dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado o
	 * objeto de conexao cbd a partir da classe ConectaBD e transferido para a
	 * variavel de conexao conn pelo seu metodo Conectar(). Em seguida prepara
	 * o comando SQL de insercao de dados (insert) e realiza sua execucao.
	 */
	@Override
	public Vagas Create(Vagas v) {
		try {
			// CONEXAO COM O BANCO DE DADOS
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();

			// INCLUS�O DO OBJETO EM PreparedStatement
			String sql = "INSERT INTO vagas("
							+ "descricao,"
							+ "req_obrigatorios,"
							+ "req_desejaveis,"
							+ "remuneracao,"
							+ "beneficios,"
							+ "local_trabalho,"
							+ "aberta)"
							+ "VALUES(?,?,?,?,?,?,?)";

			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ps.setString(1, v.getDescricao_java());
			ps.setString(2, v.getReq_obrigatorios_java());
			ps.setString(3, v.getReq_desejaveis_java());
			ps.setDouble(4, v.getRemuneracao_java());
			ps.setString(5, v.getBeneficios_java());
			ps.setString(6, v.getLocal_trabalho_java());
			ps.setInt(7, v.getAberta_java());
			ps.execute();
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Erro ao Inserir :" + e);
		}
		
		return v;
	}

	@Override
	public String Read(int aberta_java) {
		Vagas v = new Vagas();
		String linha = "";
	
		try {
			// CONEXAO COM O BANCO DE DADOS
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();
			
			// VERIFICA SE A VAGA EST� COM STATUS ABERTA OU ENCERRADA
			String sql = "SELECT * FROM vagas";
			if (aberta_java == 1) {
				sql = sql + " WHERE aberta=1";
			} else if (aberta_java == 0) {
				sql = sql + " WHERE aberta=0";
			}

			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				int id = rs.getInt("id");
				String descricao_line = rs.getString("descricao");
				String req_obrigatorios_line = rs.getString("descricao");
				String req_desejaveis_line = rs.getString("req_desejaveis");
				Double remuneracao_line = (double) rs.getFloat("remuneracao");
				String beneficios_line = rs.getString("beneficios");
				String local_trabalho_line = rs.getString("local_tabalho");
				int aberta_line = rs.getInt("aberta");
				
				linha = linha + 
						"<br>"+ 
						"Id vaga:" + id + 
						"- Descricao: " + descricao_line + 
						"- Requisitos Obrigatorios:" + req_obrigatorios_line +
						"- Requisitos Desejaveis:" + req_desejaveis_line + 
						"- Remuneracao: " + remuneracao_line + 
						"- Beneficios: " + beneficios_line + 
						"- Local de Trabalho:" + local_trabalho_line +
						"- Aberta:" + aberta_line+
						" - <a href='./emp_021.jsp?id="+id+"'><button>Editar</button></a>"+
						" - <a href='./emp_022.jsp?id="+id+"'><button>Excluir</button></a>";
						
		}
		}catch (Exception e) {
			System.out.println("Erro ao buscar :" + e);
		}
		return linha;
	}

	/*
	 * O metodo Alterar() faz a alteracao dos dados na tabela vagas a partir dos
	 * dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado
	 * o objeto de conexao cbd a partir da classe ConectaBD e transferido para a
	 * variavel de conexao conn pelo seu metodo Conectar(). Em seguida prepara o
	 * comando SQL de alteraao de dados (update) e realiza sua execucao.
	 */
	@Override
	public void Update(Vagas v) {
		try {
			// CONEXAO COM O BANCO DE DADOS
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();
			
			String sql = "UPDATE vagas SET "
					+ "descricao = ?,"
					+ "req_obrigatorios = ?,"
					+ "req_desejaveis = ?,"
					+ "remuneracao = ?,"
					+ "beneficios = ?,"
					+ "local_trabalho = ?, "
					+ "aberta = ?,"
					+ " WHERE id = ?;";
			
			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ps.setString(1, v.getDescricao_java());
			ps.setString(2, v.getReq_obrigatorios_java());
			ps.setString(3, v.getReq_desejaveis_java());
			ps.setDouble(4, v.getRemuneracao_java());
			ps.setString(5, v.getBeneficios_java());
			ps.setString(6, v.getLocal_trabalho_java());
			ps.setInt(7, v.getAberta_java());
			ps.setInt(8, v.getId_java());
			
			ps.execute();
			ps.close();
			conn.close();
		}catch (Exception e) {
			System.out.println("Erro ao atualizar :" + e);
		}
		
	}

	/*
	 * O metodo Excluir() faz a excluao dos dados na tabela vagas a partir dos
	 * dados tratados e transferidos pelo objeto da aplicacao. Para tanto e criado o
	 * objeto de conexao cbd a partir da classe ConectaBD e transferido para a
	 * variavel de conexao conn pelo seu metodo Conectar(). Em seguida prepara 
	 * o comando SQL de exclusao de dados (delete) e realiza sua execucao.
	 */
	@Override
	public void Delete(int id) {
		try {
			// CONEXAO COM O BANCO DE DADOS
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();
			
			String sql = "DELETE FROM vagas WHERE id= "+id;
			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ps.execute();
			ps.close();
			conn.close();
		}catch (Exception e) {
			System.out.println("Erro ao excluir :" + e);
		}

		
	}

	@Override
	public Vagas Search(int id) {
		Vagas v = new Vagas();
		String linha = "";
		try {
			ConectaBD cbd = new ConectaBD();
			Connection conn = cbd.Conectar();

			String sql = "SELECT * FROM vagas WHERE id=" +id;
			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
		}catch (Exception e) {
			System.out.println("Erro ao buscar :" + e);
		}
		return v;
	}
}
