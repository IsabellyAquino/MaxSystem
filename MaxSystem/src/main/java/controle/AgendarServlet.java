package controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AgendarDAO;
import modelo.JavaBeans;


/**
 * Este servlet atua como um controlador de página da aplicação, atendendo as
 * solicitações do agenda.
 *
 */

@WebServlet("/")
public class AgendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AgendarDAO agendarDAO;

	public void init() {
		agendarDAO = new AgendarDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getServletPath();

		try {
			switch (acao) {
			
			case "/novo":
				exibirFormularioInclusao(request, response);
				break;
			case "/apartamento":
				selecionarApartamento(request, response);
				break;
			case "/inserir":
				inserirAgenda(request, response);
				break;
			case "/deletar":
				deletarAgenda(request, response);
				break;
			case "/editar":
				exibirFormularioEdicao(request, response);
				break;
			case "/atualizar":
				atualizarAgenda(request, response);
				break;
			default:
				listarAgenda(request, response);
				break;
			}
		} catch (SQLException erro) {
			throw new ServletException(erro);
		}
	}

	private void selecionarApartamento(HttpServletRequest request, HttpServletResponse response) 
		throws SQLException, IOException, ServletException {
			String apto = request.getParameter("apto");
			ArrayList<JavaBeans> list = agendarDAO.selecionarApartamento(apto);
			request.setAttribute("listaAgenda", list);
			RequestDispatcher renderizar = request.getRequestDispatcher("listagem-agenda-apt.jsp");
			renderizar.forward(request, response);
		
	}

	private void listarAgenda(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		ArrayList<JavaBeans>  list = agendarDAO.selecionarAgendas();
		request.setAttribute("listarAgenda", list);
		RequestDispatcher renderizar = request.getRequestDispatcher("listagem-agenda.jsp");
		renderizar.forward(request, response);
	}

	private void exibirFormularioInclusao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher renderizar = request.getRequestDispatcher("formulario-agenda.jsp");
		renderizar.forward(request, response);
	}

	private void exibirFormularioEdicao(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		JavaBeans selecaoAgenda = agendarDAO.selecionarAgenda(id);
		RequestDispatcher renderizar = request.getRequestDispatcher("formulario-agenda.jsp");
		request.setAttribute("agendar", selecaoAgenda);
		renderizar.forward(request, response);
	}

	private void inserirAgenda(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String apartamento = request.getParameter("apartamento");
		
		JavaBeans adicaoAgenda = new JavaBeans(date, time, apartamento);
		agendarDAO.inserirAgenda(adicaoAgenda);
		response.sendRedirect("listagem");
	}

	private void atualizarAgenda(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String apartamento = request.getParameter("apartamento");
		
		JavaBeans atualizacaoAgenda = new JavaBeans(id, date, time, apartamento);
		agendarDAO.atualizarAgenda(atualizacaoAgenda);
		response.sendRedirect("listagem");
	}

	private void deletarAgenda(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		agendarDAO.deletarAgenda(id);
		response.sendRedirect("listagem");
	}
	

}