<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/alterar_aviso.js'/>"></script>
	<title>Alterar Aviso</title>
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
		  		                 <p id="mensagem"></p> 
		  	                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> Ok</button>
					</div>
				</div>
			</div>
		</div>		
		<h3>Alterar Aviso</h3>
		<hr>
		<form id="frmAlterarAviso" role="form" method="post" action="${linkTo[AvisoController].atualiza}">
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<label for="txtDataInclusao">Data Inclusão:</label> 
						<input class="form-control input-sm" id="txtDataInclusao" readonly
						  value='<fmt:formatDate pattern="dd/MM/yyyy" value="${aviso.dataCriacao}"/>' name="aviso.dataCriacao">
						<input type="hidden" class="form-control" id="txtId" name="aviso.id" value="${aviso.id}">
						<input type="hidden" class="form-control" id="txtVerificaConteudo">
					</div>
				</div>						
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
						<label for="txtDescricao">Descrição da Norma:</label>
						<textarea rows="10" class="form-control input-sm" id="txtDescricao" 
						name="aviso.conteudo">${aviso.conteudo}</textarea>
					</div>
				</div>
			</div>			
			<div class="row"></div>
			<button id="btnSalvar" type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
			<a href="${linkTo[AvisoController].consultar}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</a>
		</form>
	<br>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>		
</body>
</html>

