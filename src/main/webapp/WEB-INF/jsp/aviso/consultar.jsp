<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/colaborador.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/consultar_aviso.js'/>"></script>
	<title>Consultar Avisos</title>
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
		<h3>Consultar Avisos</h3>
		<hr>	
	<br>
		<table id="tbl_avisos" 
			class="table table-striped table-bordered table-condensed table-hover">
			<thead>
				<tr>
					<th>Id</th>
					<th>Data Criação</th>
					<th>Descrição</th>					
 					<th width="10%">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaAviso}" var="aviso">
					<tr>
						<td id="tdId">${aviso.id}</td>
						<td id="tdDataCriacao"><fmt:formatDate pattern="dd/MM/yyyy" value="${aviso.dataCriacao}"/></td>
						<td id="tdDescricao">${aviso.conteudo}</td>							
						<td id="tdAcoes">
							<a href="${linkTo[AvisoController].alterar(aviso.id)}" class="btn btn-primary btn-xs"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Alterar Aviso">
							<span class="glyphicon glyphicon-edit"></span></a> 
							
							<!--
							<a href="${linkTo[AvisoController].excluir(aviso.id)}" class="btn btn-danger btn-xs btnexcluir"
								data-toggle="popover" data-trigger="hover" data-placement="top" data-content="Excluir Aviso">
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
</html>

