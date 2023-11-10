<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.JavaBeans"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Gerenciamento de agendamento apt</title>
		<link rel="stylesheet"
		      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
		      crossorigin="anonymous">
		      

	</head>
	<body>
		<header>
			<nav class="navbar navbar-dark bg-dark navbar-expand-md">
				<div>
					<a href="" class="navbar-brand">Gerenciamento de agendamento</a>
				</div>
				
				<ul class="navbar-nav">
					<li>
						<a href="<%=request.getContextPath()%>/listagem-agendar"
	                       class="nav-link">Início agendamentos</a>
                    </li>
				</ul>
			</nav>
		</header>
		
		<br>
		
		<div class="container">
			<h3>Meus agendamentos  
				<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" color = "gray" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
				  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
				  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
				</svg>
			</h3>
			
			<hr>
			<br>
			
			<div class="div1 divpad">
				<h3>Agendamentos por apartamento</h3>
				
				<form action="apartamento" method="post" id="formulario">
					 <div class="row" style="flex-direction: row-reverse;">
					 	<div class="col-md-6 mb-3">
							<fieldset class="form-group">
			              		<div class="input-group">
					               <input 
					               		class="form-control" 
				  						type="text" 
					                	placeholder="Buscar por apartamento" 
					                	aria-label="Buscar por apartamento"
					                	aria-describedby="search-button"				                	
					                	autofocus="true"
					                	name="apto"
					                	id="datatable-search-input">
								      
							      		<span class="input-group-append">
							         		<button type="submit" class="btn btn-outline-secondary"  id="search-input">
								               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					                		     <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
											   </svg>
									   		</button>
							         	</span>
			        				</div>
			              		</fieldset>
		            		</div>
						</div>
					</form>
		
				<table class="table table-hover table-sm shadow">
					<thead>
						<tr>
							<th style="width: 140px;" scope="col">Ações</th>
							<th scope="col">ID </th>
							<th scope="col">Data</th>
							<th scope="col">Hora</th>
							<th scope="col">Apartamento</th>
						</tr>
					</thead>
					
					<tbody class="align-middle">
						<c:forEach var="agenda" items="${listaAgenda}">
							<tr>
								<td>
									<a href="editar?id=<c:out value='${agenda.id}' />"
		                                class="btn btn-outline-primary btn-sm" style="border: none;">
		                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
										  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
										  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"></path>
										</svg>
	                                </a>
									
									<a href="deletar?id=<c:out value='${agenda.id}' />"
		                                class="btn btn-outline-danger btn-sm" style="border: none;">
		                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
										  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path>
										</svg>
		                            </a>
								</td>
								<td><c:out value="${agenda.id}" /></td>
								<td><c:out value="${agenda.date}" /></td>
								<td><c:out value="${agenda.time}" /></td>
								<td><c:out value="${agenda.apartamento}" /></td>
							</tr>
								
						</c:forEach>
						
						<c:if test="${listaAgenda.size() < 1}">
							<tr>
								<td colspan="5" style="text-align:center"><p class="mt-2">Nenhum apartamento encontrado!</p></td>
							</tr>
						</c:if>
						
					</tbody>
				</table>
			</div>
			
			<div class="col" style="display: flex;flex-direction: row-reverse;">
				<a href="<%=request.getContextPath()%>/listagem-agendar" class="btn btn-outline-primary btn-md">Voltar</a>
			</div>
		</div>
	</body>
</html>