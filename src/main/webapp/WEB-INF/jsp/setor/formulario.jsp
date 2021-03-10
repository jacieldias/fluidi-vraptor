<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/setor.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/setor.js'/>"></script>
	<title>Setor</title>
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
		<h3>Novo Setor</h3>
		<hr>		  	
		<form id="formSetor" role="form" method="post" action="${linkTo[SetorController].adiciona}">
			<div class="form-group">				

				<label for="txtDescricao">Descrição:</label> 
				<input type="text" 	class="form-control input-sm" id="txtDescricao" name="setor.descricao" value="${setor.descricao}">
			</div>	
			<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
		</form>				
	</div>
	<br>
	<!-- Tabela Refente ao Cadastro dos Dados do Setor Plugin usado para formatação da tabela: DataTable 1.10.7-->
	
	<div class="container">
		<table id="tbl_setor"
			class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th width="10%">Id</th>
					<th>Descrição</th>
					<th width="10%">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaSetor}" var="setor">
					<tr>
						<td id="tdId">${setor.id}</td>
						<td id="tdDescricao">${setor.descricao}</td>
						<td id="tdAcoes">
							<a href="${linkTo[SetorController].alterar(setor.id)}" class="btn btn-primary btn-xs"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Alterar Setor">
							<span class="glyphicon glyphicon-edit"></span></a> 
							
							<!--
							<a href="${linkTo[SetorController].excluir(setor.id, setor.descricao)}" class="btn btn-danger btn-xs btnexcluir"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Excluir Setor">
							<span class="glyphicon glyphicon-trash"></span></a>
							-->
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>	
</body>
</html>

