<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/colaborador.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/consultar_demandas.js'/>"></script>
	<title>Consultar Demandas</title>
</head>
<body>
<!-- Modal Mensagem de Sucesso -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Atenção!</h4>
				</div>
				<div class="modal-body">
					<div id="msgSucesso">
						<p id="msgVazia">${mensagem}</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-ok"></span> Ok
					</button>
				</div>
			</div>
		</div>
	</div>	
		<h3>Consultar Demandas</h3>
		<hr>		
		  <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#minhas-demandas">Minhas Demandas</a></li>
		    <li><a data-toggle="tab" href="#demandas-delegadas">Demandas Delegadas</a></li>		   
		  </ul>

		  <div class="tab-content">
		    <div id="minhas-demandas" class="tab-pane fade in active">		   
				<!-- Tabela Refente a Consulta dos Dados das Demandas Plugin usado para formatação da tabela: DataTable 1.10.7-->	
				<%-- <input type="text" class="form-control" id="txtId" name="tarefa.id" value="${tarefa.id}"> --%>
				<br>
				<table id="tbl_consultar_minhas_demandas" class="table table-striped table-bordered table-condensed table-hover">
					<thead>					
						<tr>						
							<th>Id</th>
							<th>Data Abertura</th>
							<th>Título</th>
							<th>Status</th>
							<th>Colaborador Criador</th>
		 					<th width="5%">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listaMinhasTarefas}" var="tarefa">
							<tr>
								<td id="tdId">${tarefa.id}</td>
								<td id="tdNome"><fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/></td>								
								<td id="tdEmail">${tarefa.titulo}</td>
								<td id="tdTipo">${tarefa.status}</td>
								<td id="tdSetor">${tarefa.colaboradorCriador.nome}</td>
								<td id="tdAcoes">
									<a href="${linkTo[TarefaController].consultarMinhasDemandas(tarefa.id)}" class="btn btn-primary btn-xs"
										data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Consultar Minhas Demanda">
									<span class="glyphicon glyphicon-search"></span></a> 									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>					      
		    </div>		    
		    <div id="demandas-delegadas" class="tab-pane fade">
		    <br>
				<!-- Tabela Refente a Consulta dos Dados das Demandas Plugin usado para formatação da tabela: DataTable 1.10.7-->	
				<table id="tbl_consultar_demandas_delegadas" class="table table-striped table-bordered table-condensed table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>Título</th>
							<th>Data Abertura</th>
							<th>Data Encerramento</th>														
							<th>Colaborador Executor</th>
							<th>Status</th>							
		 					<th width="10%">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listaMinhasTarefasDelegadas}" var="tarefas">
							<tr>
								<td id="tdId">${tarefas.id}</td>								
								<td id="tdNome">${tarefas.titulo}</td>
								<td id="tdDtAbertura"><fmt:formatDate pattern="dd/MM/yyyy" value="${tarefas.dataAbertura}"/></td>
								<td id="tdDtEncerramento"><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${tarefas.dataEncerramento}"/></td>								
								<td id="tdTipo">${tarefas.colaboradorExecutor.nome}</td>
								<td id="tdEmail">${tarefas.status}</td>								
								<td id="tdAcoes">
									<a href="${linkTo[TarefaController].alterar(tarefas.id)}" class="btn btn-primary btn-xs"
										data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Alterar Demanda">
									<span class="glyphicon glyphicon-edit"></span></a> 
									<a href="${linkTo[TarefaController].excluir(tarefas.id)}" class="btn btn-danger btn-xs btnexcluir"
										data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Excluir Demanda">
									<span class="glyphicon glyphicon-trash"></span></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>						      
		    </div>		    		    		    
		  </div>	
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

