<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
<script type="text/javascript">
	$(document).ready(function() {
		$('input, select, textarea').prop('disabled', true);
	});	
</script>
<title>Alterar Demanda</title>
</head>
<body>
		<h3>Consultar Minhas Demandas</h3>
		<hr>
		<form id="frmTarefa" role="form" method="post" action="#">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDataAbertura">Data Abertura:</label> 
						<input type="text" class="form-control input-sm" id="txtDataAbertura"
						name="tarefa.dataAbertura" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/>">
					    <input type="hidden" class="form-control" id="txtId" name="tarefa.id" value="${tarefa.id}">
						<input type="hidden" class="form-control" id="txtVerificaConteudo">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDataPrevistaEncerramento">Data Prevista de Encerramento:</label> 
						<input type="text" class="form-control input-sm" id="txtDataPrevistaEncerramento" 
						name="tarefa.dataPrevistaEncerramento" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataPrevistaEncerramento}"/>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDataEncerramento">Data de Encerramento:</label> 
						<input type="text" class="form-control input-sm" id="txtDataEncerramento" 
						name="tarefa.dataPrevistaEncerramento" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataEncerramento}"/>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtStatus">Status:</label> 
						<input type="text" class="form-control input-sm" id="txtStatus" 
						name="tarefa.status" value="${tarefa.status}">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label for="txtTitulo">Título:</label>
						<input type="text" class="form-control input-sm" id="txtTitulo" 
						name="tarefa.titulo" value="${tarefa.titulo}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="txtColaboradorCriador">Colaborador Criador:</label>
						<input type="text" class="form-control input-sm" id="txtColaboradorCriador" 
						name="tarefa.colaboradorCriador.nome" value="${tarefa.colaboradorCriador.nome}">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="slcColaborador">Colaborador Executor:</label>
						<select class="form-control input-sm" id="slcColaborador"
						name="tarefa.colaboradorExecutor.id">							
							<option value="${tarefa.colaboradorCriador.id}">${tarefa.colaboradorCriador.nome}</option>
							<c:forEach items="${listaColaborador}" var="colaborador">
								<option value="${colaborador.id}">${colaborador.nome}</option>
							</c:forEach>
						</select>
					</div>
				</div>				
				<div class="col-md-4">
					<div class="form-group">
						<label for="txtTag">Tags:</label>
						<input type="text" class="form-control input-sm" id="txtTag" 
						name="tarefa.tag" value="${tarefa.tag}">
					</div>
				</div>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<input class="form-control input-sm" id="txtColab"
							type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador}">
					</div>
			    </div>
			</div>
			</div>			
			<br>
			<div class="row">				
				<div class="col-md-12">
					<div class="form-group">
						<label for="txtDescricao">Descrição da Tarefa:</label>						
						<div class="panel panel-default">
							<div class="panel-body">
								${tarefa.descricao}							
							</div>
						</div>
					</div>					
				</div>				
				<input type="hidden" class="form-control" id="txtStatus" name="tarefa.status" value="PENDENTE">
			</div>			
			<div class="row"></div>			
			<a href="${linkTo[TarefaController].consultar}" class="btn btn-primary">
			<span class="glyphicon glyphicon-search"></span> Consultar</a>
		</form>
	<br>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

