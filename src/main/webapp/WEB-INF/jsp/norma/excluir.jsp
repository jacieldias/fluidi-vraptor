<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>Excluir Norma</title>
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
		  		                 <p id="msgVaziaExcluir">Deseja realmente excluir a norma: ${norma.titulo}?</p> 
		  	                </div>
					</div>
					<div class="modal-footer">
							<input type="hidden" class="form-control input-sm" id="txtDescricao" name="norma.titulo" value="${norma.titulo}"> 
					        <input type="hidden" class="form-control" id="txtId" name="norma.id" value="${norma.id}">
					        <input type="hidden" class="form-control" id="txtVerificaConteudo">
															
			               	<a href="${linkTo[NormaController].remove(norma.id, norma.titulo)}" class="btn btn-danger"><span class="glyphicon glyphicon glyphicon-ok"></span> Excluir</a>
			                <a href="${linkTo[NormaController].consultar}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</a>
			        </div>
				</div>
			</div>
		</div>			
</body>
</html>
