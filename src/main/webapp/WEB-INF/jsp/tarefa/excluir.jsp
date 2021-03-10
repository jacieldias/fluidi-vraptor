<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>Excluir Demanda</title>
<script type="text/javascript">

	$(document).ready(function() {
	
		$('#myModalExcluir').modal('show');
	
	});	
</script>
</head>
<body>
	     <!-- Modal Mensagem Remove -->
      <div id="myModalExcluir" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal" >&times;</button> -->
						<h4 class="modal-title">Atenção!</h4>
					</div>
					<div class="modal-body">
							<div id="msgSucesso">
		  		                 <p id="msgVaziaExcluir">Deseja realmente excluir esta demanda: ${tarefa.titulo}?</p> 
		  	                </div>
					</div>
					<div class="modal-footer">
							<input type="hidden" class="form-control input-sm" id="txtDescricao" name="colaborador.nome" value="${colaborador.nome}"> 
					        <input type="hidden" class="form-control" id="txtId" name="colaborador.id" value="${colaborador.id}">
					        <input type="hidden" class="form-control" id="txtVerificaConteudo">
															
			               	<a href="${linkTo[TarefaController].remove(tarefa.id)}" class="btn btn-danger"><span class="glyphicon glyphicon glyphicon-ok"></span> Excluir</a>
			                <a href="${linkTo[TarefaController].consultar}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</a>
			        </div>
				</div>
			</div>
		</div>			
</body>
</html>
