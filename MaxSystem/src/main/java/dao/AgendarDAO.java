package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import modelo.JavaBeans;
/**
 *
 * Esta classe DAO permite operações de inserção, leitura, atualização e
 * exclusão na tabela de 'agenda' do banco de dados.
 *
 */

public class AgendarDAO {
	// URL de conexão do banco de dados 'sa6' do SGBD MySQL
	private String jdbcURL = "jdbc:mysql://localhost/sa6?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
	// Nome de usuário 'root' para acesso ao banco de dados do SGBD MySQL
	private String jdbcNomeUser = "isa";
	// Senha do usuário 'root' para acesso ao banco de dados do SGBD MySQL
	private String jdbcSenha = "isa123456";

	private static final String INSERIR_AGENDA = "INSERT INTO agendar" + " (date, time, apartamento) VALUES "
			+ " ( ?, ?, ? );";
	private static final String SELECIONAR_AGENDA = "SELECT * FROM agendar WHERE id = ?;";
	private static final String SELECIONAR_APARTAMENTO = "SELECT * FROM agendar WHERE apartamento = ?;";
	private static final String SELECIONAR_AGENDAS = "SELECT * FROM agendar ORDER BY date;";
	private static final String DELETAR_AGENDA = "DELETE FROM agendar WHERE id = ?;";
	private static final String ATUALIZAR_AGENDA = "UPDATE agendar SET date = ?, time = ?, apartamento = ?  WHERE id = ?;";

	public AgendarDAO() {
	}

	protected Connection getConnection() {
		Connection conexao = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexao = DriverManager.getConnection(jdbcURL, jdbcNomeUser, jdbcSenha);
		} catch (SQLException erro) {
			erro.printStackTrace();
		} catch (ClassNotFoundException erro) {
			erro.printStackTrace();
		}
		return conexao;
	}

	public void inserirAgenda(JavaBeans agendar) throws SQLException {
		// Fecha automaticamente a conexão após o uso
		try (Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(INSERIR_AGENDA)) {
			// O id da agenda é omitido do comando, pois foi definido na tabela como
			// autoincremento

			pst.setString(1, agendar.getDate());
			pst.setString(2, agendar.getTime());
			pst.setString(3, agendar.getApartamento());
			
			System.out.println(pst);
			pst.executeUpdate();
		} catch (SQLException erro) {
			printSQLException(erro);
		}
	}

	public JavaBeans selecionarAgenda(int id) {
		JavaBeans agendar = null;
		// Etapa 1: estabelece a conexão
		try (Connection conexao = getConnection();
			// Etapa 2: cria o comando da instrução usando o objeto da conexão
			PreparedStatement pst = conexao.prepareStatement(SELECIONAR_AGENDA);) {
			pst.setInt(1, id);
			System.out.println(pst);
			// Etapa 3: executa ou atualiza a query
			ResultSet resultado = pst.executeQuery();
			// Etapa 4: processa o objeto ResultSet
			while (resultado.next()) {
				String date = resultado.getString("date");
				String time = resultado.getString("time");
				String apartamento = resultado.getString("apartamento");
				
				agendar = new JavaBeans(id, date, time, apartamento);
			}
		} catch (SQLException erro) {
			printSQLException(erro);
		}
		return agendar;
		
	}
		
		public ArrayList<JavaBeans> selecionarApartamento(String apartamento) {
			ArrayList<JavaBeans>  agendar = new ArrayList<>();
			// Etapa 1: estabelece a conexão
			try (Connection conexao = getConnection();
				// Etapa 2: cria o comando da instrução usando o objeto da conexão
				PreparedStatement pst = conexao.prepareStatement(SELECIONAR_APARTAMENTO);) {
				pst.setString(1, apartamento);
				System.out.println(pst);
				// Etapa 3: executa ou atualiza a query
				ResultSet resultado = pst.executeQuery();
				// Etapa 4: processa o objeto ResultSet
				while (resultado.next()) {
					int id = resultado.getInt("id");
					String date = resultado.getString("date");
					String time = resultado.getString("time");
					
					
					agendar.add(new JavaBeans(id, date, time, apartamento));
				}
			} catch (SQLException erro) {
				printSQLException(erro);
			}
			return agendar;
	}

	public ArrayList<JavaBeans> selecionarAgendas() {
		ArrayList<JavaBeans>  agendar = new ArrayList<>();
		// Código boilerplate
		// Etapa 1: estabelece a conexão
		try (Connection conexao = getConnection();
			// Etapa 2: cria o comando da instrução usando o objeto da conexão
			PreparedStatement pst = conexao.prepareStatement(SELECIONAR_AGENDAS);) {
			System.out.println(pst);
			// Etapa 3: executa ou atualiza a query
			ResultSet resultado = pst.executeQuery();
			// Etapa 4: processa o objeto ResultSet
			while (resultado.next()) {
				int id = resultado.getInt("id");
				String date = resultado.getString("date");
				String time = resultado.getString("time");
				String apartamento = resultado.getString("apartamento");
				
				agendar.add(new JavaBeans(id, date, time, apartamento));
			}
		} catch (SQLException erro) {
			printSQLException(erro);
		}
		return agendar;
	}

	public boolean deletarAgenda(int id) throws SQLException {
		boolean registroDeletado;
		try (Connection conexao = getConnection();
			PreparedStatement pst = conexao.prepareStatement(DELETAR_AGENDA);) {
			pst.setInt(1, id);
			System.out.println(pst);
			registroDeletado = pst.executeUpdate() > 0;
		}
		return registroDeletado;
	}

	public boolean atualizarAgenda(JavaBeans agendar) throws SQLException {
		boolean registroAtualizado;
		try (Connection connection = getConnection();
			PreparedStatement pst = connection.prepareStatement(ATUALIZAR_AGENDA);) {
			pst.setString(1, agendar.getDate());
			pst.setString(2, agendar.getTime());
			pst.setString(3, agendar.getApartamento());
			pst.setInt(4, agendar.getId());
			registroAtualizado = pst.executeUpdate() > 0;
		}
		return registroAtualizado;
	}

	private void printSQLException(SQLException erro) {
		for (Throwable e : erro) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("Estado do SQL: " + ((SQLException) e).getSQLState());
				System.err.println("Código de erro: " + ((SQLException) e).getErrorCode());
				System.err.println("Mensagem: " + e.getMessage());
				Throwable causa = erro.getCause();
				while (causa != null) {
					System.out.println("Causa: " + causa);
					causa = causa.getCause();
				}
			}
		}
	}
}