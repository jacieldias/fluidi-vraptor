<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/workflow.js'/>"></script>
	<title>Workflow</title>
	<script type="text/javascript">
		function addItemSelect(){
			var inputDescricao = document.getElementById("txtDescricaoEtapa");
			var descricao = inputDescricao.value;
	
			var select = document.getElementById("slcEtapas");
			var option = document.createElement("option");
			option.text = descricao;
			//option.value = idSelecionado;
			select.add(option);
			addItemLista(descricao,1);
			inputDescricao.value = "";
			inputDescricao.focus();
		}
	
		function removeItemSelect(id){
			var selectResp = document.getElementById("slcSeguidores")
			for (var i=0; i < selectResp.length; i++){
			if (selectResp.options[i].value == id )
				selectResp.remove(i);
			}	
		}

		function addItemLista(nome,id) {
			  var ul = document.getElementById("listaEtapas");
			  var li = document.createElement("li");
			  li.appendChild(document.createTextNode(nome));
			  li.setAttribute("class","list-group-item");
			  li.setAttribute("id",id); 
			  li.value = id;
			  li.innerHTML += "<div class='btn-group btn-group-xs center-block pull-right'>"+
							  "<button id='btnRemove' type='button' class='close' aria-label='Close'"+
							  "value="+id+" onClick='removeItemLista(this.value)'><span aria-hidden='true'>&times;</span>"+
							  "</button>"+
							  "</div>";
			  ul.appendChild(li);
		}
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

	<h3>Workflow</h3>
	<hr>
	<form id="frmWorkflow" role="form" method="post" action="${linkTo[TarefaController].adiciona}">
		
		<c:forEach items="${errors}" var="erro">
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				${erro.category} - ${erro.message}<br/>
			</div>
		</c:forEach>
		
		
		<div class="row">
			<div class="col-md-8">
				<div class="form-group">
					<label for="txtWorkflow">Nome:</label>
					<input type="text" class="form-control input-sm" id="txtWorkflow" 
					name="workflow.nome" value="${workflow.nome}">
				</div>
			</div>
		</div>
		
		<hr>

		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label for="txtDescricaoEtapa">Descrição:</label>
					<div class="input-group">
						<input type="text" class="form-control input-sm" id="txtDescricaoEtapa">
						<span class="input-group-btn">
							<a href="javascript:addItemSelect();" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-plus"></span>
							</a> 								
						</span>						
					</div>
				</div>
			</div>
		</div>
										
		<!-- Lista de etapas montada dinamicamente -->
		<div class="row">				
			<div class="col-md-4">
				<div class="form-group">
					<ul class="list-group" id="listaEtapas"></ul>
				</div>
			</div>
		</div>		
		
		<!-- Select usado para preencher a lista de etapas no objeto Workflow  -->
		<div id="selectResponsaveis">
			<select class="form-control input-sm" id="slcEtapas"
					name="workflow.etapas.id" multiple>
			</select>
		</div>
		
		<!-- Input escondido com o usuario logado -->
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<input class="form-control input-sm" id="txtColab"
						type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador}">
				</div>
		    </div>
		</div>
		
		<button type="submit" class="btn btn-success">
			<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
		</button>
	</form>
</body>
</html>