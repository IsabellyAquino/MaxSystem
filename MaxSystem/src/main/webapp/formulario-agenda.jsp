<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Gerenciamento de Agendamento</title>
		<link rel="stylesheet"
		      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		      crossorigin="anonymous">
        
       
	</head>
	
	<body>
		<header>
			<nav class="navbar navbar-dark bg-dark navbar-expand-md">
				<div>
					<a href="" class="navbar-brand">Gerenciamento de agendamentos</a>
				</div>
				
				<ul class="navbar-nav">
					<li>
						<a href="<%=request.getContextPath()%>/listagem-agendar"
	                       class="nav-link">Listagem de agendamento</a>
                     </li>
				</ul>
			</nav>
		</header>
		
		<br>
		
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body">
					<c:if test="${agendar != null}">
						<form action="atualizar" method="post">
					</c:if>
					
					<c:if test="${agendar == null}">
						<form action="inserir" method="post">
					</c:if>
					
					<caption>
						<h2>
							<c:if test="${agendar != null}">
		            			Editar agendamento
		            			<hr>
							</c:if>
							
							<c:if test="${agendar == null}">
		            			Novo agendamento  
		            			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
								  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
								  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
								</svg> 
	            				<hr>
							</c:if>
						</h2>
					</caption>
					
					<c:if test="${agendar != null}">
						<input type="hidden" name="id" value="<c:out value='${agendar.id}' />" />
					</c:if>
					
					<fieldset> 
						<table>
							<tr>
								<th>Data</th>
								<td>
									<input type="date" name="date" required="required" placeholder="data">
								</td>
							</tr>
							
							<tr>
								<th>Horário</th>
								<td>
									<input type="time" name="time" required="required" placeholder="horário">
								</td>
							</tr>
						</table>
					</fieldset>
					
					<br>
					
					<fieldset class="form-group">
						<label>Apartamento</label> 
						<input 
							type="text" 
							value="<c:out value='${agendar.apartamento}' />" 
							class="form-control" 
							name="apartamento" 
							required="required"
							placeholder="Informe o apartamento">
					</fieldset>
					
					<br>
			
					<div class="row g-2">
						<div class="col">
							<c:if test="${agendar == null}">
								<button type="reset" class="btn btn-secondary btn-md btn-me-2">Limpar formulário</button>
							</c:if>
							
							<button type="submit" class="btn btn-primary btn-md">Salvar</button>
						</div>
						
						<div class="col" style="display: flex;flex-direction: row-reverse;">
							<a href="<%=request.getContextPath()%>/listagem-agendar" class="btn btn-outline-primary btn-md">Voltar</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>