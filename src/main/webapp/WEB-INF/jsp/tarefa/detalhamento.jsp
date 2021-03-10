<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/tarefa.js'/>"></script>
	<title>Detalhamento Demanda</title>
<script type="text/javascript">
	tinymce.init({
		selector :'textarea',
		translate_mode : true,
		language : "pt_BR"
	});

</script>
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
		<h3>Detalhamento Demanda</h3>
		<hr>		
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<label for="txtDtAbertura">Data Abertura:</label> 
						<input type="hidden" class="form-control" id="txtId"
						name="tarefa.id" value="${tarefa.id}">
						<p id="txtDtAbertura"><fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/></p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDtPrevEncerramento">Data Prevista Encerramento:</label> 
						<p id="txtDtPrevEncerramento"><fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataPrevistaEncerramento}"/></p>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label for="txtDataEncerramento">Data de Encerramento:</label> 
						<p id="txtDtEncerramento"><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${tarefa.dataEncerramento}"/></p>
					</div>
				</div>
				<div class="col-md-2  col-md-offset-3">
					<div class="form-group pull-right">
						<label class="pull-right" for="txtStatus">Status:</label> 
						<p id="txtStatus">${tarefa.status}</p>
						<input class="form-control input-sm" id="txtSituacaoStatus"
						type="hidden" name="tarefa.colaboradorExecutor" value="${tarefa.status}">
					</div>
				</div>
			</div>			
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">					
						<label for="txtTitulo">Título:</label>
						<p id="txtTitulo">${tarefa.titulo}</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">					
						<label for="txtColaboradorCriador">Demanda Criada por:</label>						
						<p id="txtColaboradorCriador">${tarefa.colaboradorCriador.nome}</p>
						<input class="form-control input-sm" id="txtColabCriador"
						type="hidden" name="tarefa.colaboradorCriador" value="${tarefa.colaboradorCriador.nome}">
						<input class="form-control input-sm" id="txtColabExecutor"
						type="hidden" name="tarefa.colaboradorExecutor" value="${tarefa.colaboradorExecutor.nome}">
					</div>
				</div>				
				<div class="col-md-4 col-md-offset-4">
					<div class="form-group pull-right">
						<label class="pull-right" for="txtTag">Tags:</label>
						<p id="txtTag">${tarefa.tag}</p>
					</div>
				</div>			
			</div>
			<div class="row">				
				<div class="col-md-12">
					<div class="form-group">						
						<label for="txtDescricao">Descrição da Tarefa:</label>																	
						<p id="txtDescricao">${tarefa.descricao}</p>						
					</div>
				</div>
			</div>
		<form id="frmTarefa" role="form" method="post" action="${linkTo[TarefaController].adicionaComentario()}">
			<div class="row">				
				<div class="col-md-12">
					<div class="form-group">
					<hr>
						<label for="txtComentario">Comentários:</label>						
						<textarea rows="5" class="form-control input-sm" id="txtComentario" 
						name="comentarioTarefa.comentario"></textarea>
					</div>
				</div>					
				<input class="form-control input-sm" 
							type="hidden" name="comentarioTarefa.colaborador.id" value="${usuarioLogado.colaborador.id}">
				<input class="form-control input-sm" id="txtColabLogado"
							type="hidden" name="comentarioTarefa.colaborador.id" value="${usuarioLogado.colaborador.nome}">
				<input class="form-control input-sm" id="txtColab"
							type="hidden" name="comentarioTarefa.tarefa.id" value="${tarefa.id}">							
			</div>				
			<div class="row"></div>
			<button type="submit" class="btn btn-info pull-right">
				<span class="glyphicon glyphicon-comment"></span> Enviar
			</button>
		</form>
		<br>
		<br>

	<ul class="list-group">
		<c:forEach items="${listaComentarios}" var="comentario">
			<li class="list-group-item">
				<p class="list-group-item-text">
					Data:
					<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${comentario.dataCriacao}" />
					- Colaborador: ${comentario.colaborador.nome}
					<br>
					${comentario.comentario}
			</li>
		</c:forEach>
	</ul>
			<div class="pull-right">			    	 					
				<a href="${linkTo[TarefaController].alterar(tarefa.id)}" class="btn btn-success" role="button" id="btnAlterar">
				<span class="glyphicon glyphicon-edit"></span> Alterar</a>
				<a href="${linkTo[TarefaController].iniciaTarefa(tarefa.id)}" class="btn btn-info" id="btnIniciar">
				<span class="glyphicon glyphicon-play"></span> Iniciar</a>
				<a href="${linkTo[TarefaController].finalizaTarefa(tarefa.id)}" class="btn btn-danger" role="button" id="btnEncerrar">
				<span class="glyphicon glyphicon-check"></span> Encerrar</a>			
				<a href="${linkTo[IndexController].index}" class="btn btn-primary">
				<span class="glyphicon glyphicon-remove"></span> Sair</a>				
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<input class="form-control input-sm" id="txtColab"
							type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador.id}">
					</div>
			    </div>
			</div>		
	<br>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

