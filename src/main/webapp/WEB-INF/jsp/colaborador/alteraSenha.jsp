<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/colaborador.js'/>"></script>
	<title>Alterar Senha</title>
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
					<button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-ok"></span> Ok</button>
				</div>
			</div>
		</div>
	</div>
		<h3>Alterar Senha</h3>
		<hr>			
		<form id="frmColaborador" role="form" method="post" action="${linkTo[ColaboradorController].confirmaSenha}">							
				<div class="row">					
					<div class="col-md-2">
					    <div class="form-group">												
							<label for="txtSenha">Nova Senha:</label> 
							<input type="password" class="form-control input-sm" id="txtSenha" name="colaborador.senha">
						</div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">												
							<label for="txtConfirmaSenha">Confirme a senha:</label> 
							<input type="password" class="form-control input-sm" id="txtConfirmaSenha" name="colaborador.confirmaSenha">
						</div>
					</div>		
					<div class="col-md-3">
					    <div class="form-group">												
							<input type="hidden" class="form-control input-sm" id="txtId" name="colaborador.id" value="${colaborador.id}">
						</div>
					</div>	
					<div class="col-md-3">
					    <div class="form-group">												
							<input type="hidden" class="form-control input-sm" id="txtNome" name="colaborador.nome" value="${colaborador.nome}">
						</div>
					</div>	
					<div class="col-md-3">
					    <div class="form-group">												
							<input type="hidden" class="form-control input-sm" id="txtEmail" name="colaborador.email" value="${colaborador.email}">
						</div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">												
							<input type="hidden" class="form-control input-sm" id="txtLogin" name="colaborador.login" value="${colaborador.login}">
						</div>
					</div>	
					</div>
					<div class="row">					
						<div class="col-md-3">	
						    <div class="form-group">													
								<input type="hidden" class="form-control input-sm" id="txtSetor" name="colaborador.setor.id" value="${colaborador.setor.id}">
							</div>
					    </div>					
					    <div class="col-md-3">
					        <div class="form-group">						
								<input type="hidden" class="form-control input-sm" id="txtTipo" name="colaborador.tipoColaborador" value="${colaborador.tipoColaborador}">
							</div>
						</div>
					</div>													
			    		<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
		</form>		
	<br>	
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>	
</body>
</html>

