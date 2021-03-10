<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/tarefa.js'/>"></script>
	<title>Comentários</title>
<script type="text/javascript">
$(document).ready(function() {
	tinymce.init({
		selector :'textarea',
		translate_mode : true,
		language : "pt_BR"
	});

	$('#myModal').modal('show');
	
});	
</script>
</head>
<body>
<!-- Modal Comentários -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Comentário</h4>
				</div>
					<div class="modal-body">						
						<div class="row">
							<div class="col-md-8">
								<div class="form-group">					
									<label for="txtColaboradorExecutor">Título da Demanda: ${tarefa.titulo}</label>	
									<input class="form-control input-sm" id="txtColabCriador"
									type="hidden" name="tarefa.colaboradorCriador" value="${tarefa.colaboradorCriador.nome}">
									<input class="form-control input-sm" id="txtColabExecutor"
									type="hidden" name="tarefa.colaboradorExecutor" value="${tarefa.colaboradorExecutor.nome}">
								</div>
							</div>	
						</div>			
					<form id="frmTarefa" role="form" method="post" action="${linkTo[TarefaController].adicionaComentario()}">
						<div class="row">				
							<div class="col-md-12">
								<div class="form-group">					
									<label for="txtComentario">Descrição do Comentários:</label>						
									<textarea rows="5" class="form-control input-sm" id="txtComentario" 
									name="comentarioTarefa.comentario"></textarea>
								</div>
							</div>					
							<input class="form-control input-sm" id="txtColabLogado"
							type="hidden" name="comentarioTarefa.colaborador.id" value="${usuarioLogado.colaborador.id}">
							<input class="form-control input-sm" id="txtColab"
							type="hidden" name="comentarioTarefa.tarefa.id" value="${tarefa.id}">							
						</div>		
						<div class="pull-right">	
							<button type="submit" class="btn btn-info">
								<span class="glyphicon glyphicon-comment"></span> Enviar
							</button>
							<a href="${linkTo[IndexController].index}" class="btn btn-primary">
							<span class="glyphicon glyphicon-remove"></span> Sair</a>			
						</div>					
					</form>
					<div class="row">
						<div class="col-md-2">
						   <div class="form-group">
							  <input class="form-control input-sm" id="txtColab"
							  type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador.id}">
						   </div>
						</div>
					</div>	
				<c:forEach items="${errors}" var="erro">
					${erro.category} - ${erro.message}<br/>
				</c:forEach>	
			 </div>	 		
 			 <div class="modal-footer">
 				<div class="pull-left">	 				
					Enviar Comentário Para: ${tarefa.colaboradorExecutor.nome}
				</div>					
 		     </div>
	       </div>
		</div>
	</div>	
</body>


