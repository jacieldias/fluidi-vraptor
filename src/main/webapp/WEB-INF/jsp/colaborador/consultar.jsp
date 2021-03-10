<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/colaborador.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/consultar_colaborador.js'/>"></script>
	<title>Consultar Colaborador</title>
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
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-ok"></span> Ok
					</button>
				</div>
			</div>
		</div>
	</div>	
		<h3>Consultar Colaborador</h3>
		<hr>		
	<br>
	<!-- Tabela Refente ao Cadastro dos Dados do Colaborador Plugin usado para formatação da tabela: DataTable 1.10.7-->	
		<table id="tbl_colaborador" class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th width="10%">Id</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Tipo</th>
					<th>Setor</th>
 					<th width="10%">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaColaborador}" var="colaborador">
					<tr>
						<td id="tdId">${colaborador.id}</td>
						<td id="tdNome">${colaborador.nome}</td>
						<td id="tdEmail">${colaborador.email}</td>
						<td id="tdTipo">${colaborador.tipoColaborador}</td>
						<td id="tdSetor">${colaborador.setor.descricao}</td>
						<td id="tdAcoes">
							<a href="${linkTo[ColaboradorController].alterar(colaborador.id)}" class="btn btn-primary btn-xs"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Alterar Colaborador">
							<span class="glyphicon glyphicon-edit"></span></a> 
							
							<!--
							<a href="${linkTo[ColaboradorController].excluir(colaborador.id, colaborador.nome)}" class="btn btn-danger btn-xs btnexcluir"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Excluir Colaborador">
							<span class="glyphicon glyphicon-trash"></span></a>
							-->
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<c:forEach items="${errors}" var="erro">
		${erro.category} - ${erro.message}<br/>
	</c:forEach>	
</body>


