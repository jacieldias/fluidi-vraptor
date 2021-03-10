<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">	
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/aviso.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>	
	<title>Novo Aviso</title>
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
						<h4 class="modal-title">Sucesso!</h4>
					</div>
					<div class="modal-body">
							<div id="msgSucesso">
		  		                 <p id="msgVazia">${mensagem}</p> 
		  	                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> Ok</button>
					</div>
				</div>
			</div>
		</div>		
	<div class="container">
		<h3>Novo Aviso</h3>
		<hr>		  	
		<form id="formAviso" role="form" method="post" action="${linkTo[AvisoController].adiciona}">
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<label for="txtData">Data Criação:</label> <input class="form-control input-sm" id="txtData"
							type='<fmt:formatDate pattern="dd/MM/yyyy" value="${aviso.dataCriacao}"/>' name="aviso.dataCriacao" readonly>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<input class="form-control input-sm" id="txtColab"
							type="hidden" name="aviso.colaborador" value="${usuarioLogado.colaborador}">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="txtDescricao">Descrição do Aviso:</label>
						<textarea rows="10" class="form-control input-sm" id="txtDescricao"
						 name="aviso.conteudo">${aviso.conteudo}</textarea>				
					</div>
				</div>
			</div>			
			<div class="row"></div>
			<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk">
				</span> Salvar
			</button>			
		</form>				
	</div>
	<br>	
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

