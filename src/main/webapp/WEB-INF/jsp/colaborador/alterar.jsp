<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/alterar_colaborador.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/alterar_colaborador.js'/>"></script>
	<title>Alterar Colaborador</title>
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
		<h3>Alterar Colaborador</h3>
		<hr>
		<form id="frm_altera_colaborador" role="form" method="post" action="${linkTo[ColaboradorController].atualiza}">						
				<div class="row">				
					<div class="col-md-4">
						<div class="form-group">					
							<label for="txtNome">Nome:</label> 
							<input type="text" 	class="form-control input-sm" id="txtNome" name="colaborador.nome" value="${colaborador.nome}">
							<input type="hidden" class="form-control" id="txtId" name="colaborador.id" value="${colaborador.id}">
							<input type="hidden" class="form-control" id="txtVerificaConteudo">
						</div>
					</div>	
					<div class="col-md-4">
						<div class="form-group">					
							<label for="txtEmail">Email:</label> 
							<input type="text" class="form-control input-sm" id="txtEmail" name="colaborador.email" value="${colaborador.email}">
						</div>
					</div>	
					<div class="col-md-4">
						<div class="form-group">					
							<label for="txtLogin">Login:</label> 
							<input type="text" 	class="form-control input-sm" id="txtLogin" name="colaborador.login" value="${colaborador.login}" readonly="readonly">
						</div>
					</div>	
					<div class="col-md-4">
						<div class="form-group">					
							<label for="txtSenha">Senha:</label> 
							<input type="password" 	class="form-control input-sm" id="txtSenha" name="colaborador.senha" value="${colaborador.senha}" readonly="readonly">
						</div>
					</div>	
					<div class="col-md-4">
						<div class="form-group">					
							<label for="txtConfirmaSenha">Confirmação Senha:</label> 
							<input type="password" 	class="form-control input-sm" id="txtConfirmaSenha" name="colaborador.confirmaSenha" value="${colaborador.confirmaSenha}" readonly="readonly">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">						
							<label for="slcSetor">Setor:</label> 
							<select class="form-control input-sm" id="slcSetor" name="colaborador.setor.id">
								<option value="${colaborador.setor.id}">${colaborador.setor.descricao}</option>								
								<c:forEach items="${listaSetor}" var="setor">
									<option value="${setor.id}">${setor.descricao}</option>
								</c:forEach>								
							</select>
						</div>
					</div>						
				   <div class="col-md-4">
				        <div class="form-group">						
							<label for="slcTipo">Tipo:</label> 
							<select class="form-control input-sm" id="slcTipo" name="colaborador.tipoColaborador">
									<option value="Interno">Interno</option>
									<option value="Externo">Externo</option>
							</select>
						</div>
					</div>									
			</div>	
			<button id="btnSalvar" type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
			<a href="${linkTo[ColaboradorController].consultar}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove"></span> Cancelar</a>
		</form>	
	</div>
	<br>
</body>
</html>

