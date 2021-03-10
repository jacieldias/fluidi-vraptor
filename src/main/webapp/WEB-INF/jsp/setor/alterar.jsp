<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>	
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/alterar_setor.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/alterar_setor.js'/>"></script>
	<title>Alterar Setor</title>
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
		  		                 <p id="mensagem"></p> 
		  	                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> Ok</button>
					</div>
				</div>
			</div>
		</div>	
	<div class="container">
		<h3>Alterar Setor</h3>
		<hr>
		<form id="formAlterar" role="form" method="post" action="${linkTo[SetorController].atualiza}">
			<div class="form-group">
				<label for="txtDescricao">Descrição:</label> 
					<input type="text" class="form-control input-sm" id="txtDescricao" name="setor.descricao" value="${setor.descricao}"> 
					<input type="hidden" class="form-control" id="txtId" name="setor.id" value="${setor.id}">
					<input type="hidden" class="form-control" id="txtVerificaConteudo">
			</div>
			<button id="btnSalvar" type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
			<a href="${linkTo[SetorController].formulario}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</a>
		</form>
	</div>
	<br>
</body>
</html>

