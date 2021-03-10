<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/status_demanda.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery.validate.js'/>"></script>
	<title>Status da Demanda</title>
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
	
	<h3>Status Demanda</h3>
	<hr>
	<form id="frmStatusDemanda" role="form" method="post" action="${linkTo[StatusDemandaController].adiciona}">
		
		<c:forEach items="${errors}" var="erro">
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				${erro.category} - ${erro.message}<br/>
			</div>
		</c:forEach>
		
		<div class="row">
			<div class="col-md-4 form-group">
				<label for="txtDescricao">Descrição:</label>
				<input type="text" class="form-control input-sm" id="txtDescricao" 
				name="statusDemanda.descricao" value="${statusDemanda.descricao}">
			</div>
		</div>
		
		<!-- Input escondido com o id do status -->
		<input type="hidden" id="txtId" name="statusDemanda.id" value="${statusDemanda.id}">

		<button type="submit" class="btn btn-success">
			<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
		</button>
		
		<hr>
		
		<div class="row">				
			<div class="col-md-4 form-group">
				<ul class="list-group" id="listaStatus">
					<c:forEach items="${listaStatus}" var="status">
						<li class="list-group-item" value="${status.id}">
							${status.descricao}
							<div class="pull-right form-group">
								<a href="${linkTo[StatusDemandaController].alterar(status.id)}"  
								data-content="Alterar" style="padding-right: 8px">
									<span class="glyphicon glyphicon-pencil"></span>
 						        </a>
								<a href="${linkTo[StatusDemandaController].alterar(status.id)}"  
								data-content="Editar" style="padding-right: 8px">
									<span class="glyphicon glyphicon-trash"></span>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>		
		
		<!-- Input escondido com o usuario logado -->
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<input class="form-control input-sm" id="txtColab"
						type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador}">
				</div>
		    </div>
		</div>
		
	</form>
</body>
</html>