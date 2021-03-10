<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datepicker/css/bootstrap-datepicker3.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/js/bootstrap-datepicker.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/locales/bootstrap-datepicker.pt-BR.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/tarefa.js'/>"></script>
	<title>Nova Demanda</title>
<script type="text/javascript">
	tinymce.init({
		selector :'textarea',
		translate_mode : true,
		language : "pt_BR",
		menubar: false,
		toolbar:'undo redo bold italic underline alignleft aligncenter alignright alignjustify bullist numlist outdent indent code copy paste cut'
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
		<h3>Novo Canal</h3>
		<hr>
		<form id="frmTarefa" role="form" method="post" action="${linkTo[TarefaController].adiciona}">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDataAbertura">Data Abertura:</label> 
						<input type="text" class="form-control input-sm" id="txtDataAbertura" readonly
						name="tarefa.dataAbertura" value="${tarefa.dataAbertura}">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="txtDataEncerramento">Data Prevista de Encerramento:</label>
							<div class="input-group date" data-provide="datepicker-inline" data-date-language="pt-BR"> 
								<input type="text" class="form-control input-sm" id="txtDataEncerramento" 
								name="tarefa.dataPrevistaEncerramento" value="${tarefa.dataPrevistaEncerramento}" readonly>
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</div>
							</div>
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
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="slcColaborador">Colaborador Executor:</label>
						<select class="form-control input-sm" id="slcColaborador"
						name="tarefa.colaboradorExecutor.id">
							<option></option>
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
			<div class="row">				
				<div class="col-md-8">
					<div class="form-group">
						<label for="txtDescricao">Descrição da Tarefa:</label>
						<textarea rows="10" class="form-control input-sm" id="txtDescricao" 
						name="tarefa.descricao">${tarefa.descricao}</textarea>
					</div>
				</div>				
				<input type="hidden" class="form-control" id="txtStatus" name="tarefa.status" value="PENDENTE">
			</div>			
			<div class="row"></div>
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
			</button>
		</form>
	<br>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

