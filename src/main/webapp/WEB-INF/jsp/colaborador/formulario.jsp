<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/colaborador.js'/>"></script>
	<title>Novo Colaborador</title>
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
						<p id="opcoesModal">O que deseja fazer:</p>
					</div>
				</div>
				<div class="modal-footer">					
					<a href="${linkTo[ColaboradorController].consultar}" class="btn btn-info">
						<span class="glyphicon glyphicon-search"></span> Consultar
					</a>
					<button type="button" class="btn btn-success" data-dismiss="modal">
						<span class="glyphicon glyphicon-plus"></span> Cadastrar
					</button>
					<a href="${linkTo[IndexController].index}" class="btn btn-primary">
						<span class="glyphicon glyphicon-remove"></span> Sair
					</a>					
				</div>
			</div>
		</div>
	</div>
		<h3>Novo Colaborador</h3>
		<hr>			
		<form id="frmColaborador" role="form" method="post" action="${linkTo[ColaboradorController].adiciona}">							
				<div class="row">					
					<div class="col-md-3">
					    <div class="form-group">												
							<label for="txtNome">Nome:</label> 
							<input type="text" class="form-control input-sm" id="txtNome" name="colaborador.nome" value="${colaborador.nome}">
						</div>
					</div>	
					<div class="col-md-3">
					    <div class="form-group">												
							<label for="txtEmail">Email:</label> 
							<input type="text" class="form-control input-sm" id="txtEmail" name="colaborador.email" value="${colaborador.email}">
						</div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">												
							<label for="txtLogin">Login:</label> 
							<input type="text" class="form-control input-sm" id="txtLogin" name="colaborador.login" value="${colaborador.login}">
						</div>
					</div>	
					<div class="col-md-2">
					    <div class="form-group">												
							<label for="txtSenha">Senha:</label> 
							<input type="password" class="form-control input-sm" id="txtSenha" name="colaborador.senha" value="${colaborador.senha}">
						</div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">												
							<label for="txtConfirmaSenha">Confirme a senha:</label> 
							<input type="password" class="form-control input-sm" id="txtConfirmaSenha" name="colaborador.confirmaSenha" value="${colaborador.confirmaSenha}">
						</div>
					</div>		
					</div>
					<div class="row">					
						<div class="col-md-3">	
						    <div class="form-group">													
								<label for="slcSetor">Setor:</label> 
								<select class="form-control input-sm" id="slcSetor" name="colaborador.setor.id">
									<option></option>
									<c:forEach items="${listaSetor}" var="setor">
										<option value="${setor.id}">${setor.descricao}</option>
									</c:forEach>
								</select>
							</div>
					    </div>					
					    <div class="col-md-3">
					        <div class="form-group">						
								<label for="slcTipo">Tipo:</label> 
								<select class="form-control input-sm" id="slcTipo" name="colaborador.tipoColaborador">
										<option value=""></option>
										<option value="Interno">Interno</option>
										<option value="Externo">Externo</option>
								</select>
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

