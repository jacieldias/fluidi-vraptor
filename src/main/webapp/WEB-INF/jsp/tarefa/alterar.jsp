<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datepicker/css/bootstrap-datepicker3.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/js/bootstrap-datepicker.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/locales/bootstrap-datepicker.pt-BR.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/alterar_demanda.js'/>"></script>
	<title>Alterar Demanda</title>
	<script type="text/javascript">
	tinymce.init({
		selector :'textarea',
		translate_mode : true,
		language : "pt_BR"
	});

 	window.onload = function(){
		document.getElementById('slcSeguidores').style.display = "none";
	}
 
	function selecionaSeguidor(){
		var selectColab = document.getElementById("slcSeguidor");
		var textoSelecionado = selectColab.options[selectColab.selectedIndex].text;
		var idSelecionado = selectColab.options[selectColab.selectedIndex].value;  
		var selectResp = document.getElementById("slcSeguidores");
		for(i=0;i<selectResp.options.length;i++){
			if(selectResp.options[i].value == idSelecionado){
				if(selectResp.options[i].selected == true){
					alert("O colaborador já é um seguidor dessa demanda!");
				    return;				
				}else{
					selectResp.options[i].selected = true;	
					addItemLista(textoSelecionado,idSelecionado);
				}	
			}
		}
	}

	function deselecionaSeguidor(id){
		var selectResp = document.getElementById("slcSeguidores")
		for (var i=0; i < selectResp.length; i++){
		if (selectResp.options[i].value == id )
			selectResp.options[i].selected = false;
		}	
	}
	

	function addItemLista(nome,id) {
		  var ul = document.getElementById("listaSeguidores");
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


	function removeItemLista(id){
		var lista = document.getElementById("listaSeguidores");
		var itens = lista.getElementsByTagName("li");
		var idItem;
		for(i=0;i <= itens.length;i++){
			idItem = itens[i].getAttribute("id"); 
			if(idItem == id){
				lista.removeChild(itens[i]);
				deselecionaSeguidor(id);
			}
		}
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
						<p id="mensagem"></p>
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
	
	<h3>Alterar Demanda</h3>
	<hr>
	<form id="frmTarefa" role="form" method="post" action="${linkTo[TarefaController].atualiza }">

		<c:forEach items="${errors}" var="erro">
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				${erro.category} - ${erro.message}<br/>
			</div>
		</c:forEach>
		
	
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtDataAbertura">Data Abertura:</label> 
					<input type="text" class="form-control input-sm" id="txtDataAbertura" readonly
					name="tarefa.dataAbertura" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/>">
				    <input type="hidden" class="form-control" id="txtId" name="tarefa.id" value="${tarefa.id}">
					<input type="hidden" class="form-control" id="txtVerificaConteudo">
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtDataPrevistaEncerramento">Data Prevista de Encerramento:</label>
					<div class="input-group date" data-provide="datepicker-inline" data-date-language="pt-BR"> 
						<input type="text" class="form-control input-sm" id="txtDataPrevistaEncerramento" readonly
							name="tarefa.dataPrevistaEncerramento" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataPrevistaEncerramento}"/>">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
					</div>
				</div>
			</div>				

			<div class="col-md-3">
				<div class="form-group">
					<label for="txtStatus">Status:</label>
					<br>
					<span class="label label-danger">${tarefa.status}</span> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="form-group">
					<label for="txtTitulo">Título:</label>
					<input type="text" class="form-control input-sm" id="txtTitulo" 
					name="tarefa.titulo" value="${tarefa.titulo}">
				</div>
			</div>				
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label for="slcColaborador">Responsável:</label>
					<select class="form-control input-sm" id="slcColaborador"
					name="tarefa.colaboradorExecutor.id">							
						<option value="${tarefa.colaboradorExecutor.id}">${tarefa.colaboradorExecutor.nome}</option>
						<c:forEach items="${listaColaborador}" var="colaborador">
							<option value="${colaborador.id}">${colaborador.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="form-group">
					<label for="slcGestor">Gestor:</label>
					<select class="form-control input-sm" id="slcGestor"
						name="tarefa.colaboradorGestor.id">
						<option value="${tarefa.colaboradorGestor.id}">${tarefa.colaboradorGestor.nome}</option>
						<c:forEach items="${listaGestor}" var="gestor">
							<option value="${gestor.id}">${gestor.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label for="slcSeguidor">Seguidores:</label>
					<div class="input-group">
						<select class="form-control input-sm" id="slcSeguidor">
							<option></option>
							<c:forEach items="${listaColaborador}" var="colaborador">
								<option value="${colaborador.id}">${colaborador.nome}</option>
							</c:forEach>
						</select>
						<span class="input-group-btn">
							<a href="javascript:selecionaSeguidor();" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-plus"></span>
							</a> 								
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<div id="selectResponsaveis">
			<select class="form-control input-sm" id="slcSeguidores"
					name="tarefa.seguidores.id" multiple="true">
				<c:forEach items="${listaColaborador}" var="colaborador">
					<option value="${colaborador.id}">${colaborador.nome}</option>
				</c:forEach>
			</select>
		</div>
			
		<!-- Lista de seguidores montada dinamicamente -->
		<div class="row">				
			<div class="col-md-4">
				<div class="form-group">
					<ul class="list-group" id="listaSeguidores">
						<c:forEach items="${listaSeguidor}" var="seguidor">
							<li class="list-group-item" id="${seguidor.id}">
								${seguidor.nome}
								<div class="btn-group btn-group-xs center-block pull-right">
									<button id="btnRemove" type="button" class="close" aria-label="Close"
									value="${seguidor.id}" onClick="removeItemLista(this.value)"><span aria-hidden="true">&times;</span>
									</button>
								</div>
							</li>		
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
		<script type="text/javascript">
			//Função usada para percorrer a lista de seguidores que já estão associados a demanda que está sendo alterada
			//E para cada <li> percorrida chama a função carregaSeguidoresDaDemanda(id), passando o id do seguidor para que possa
			//ser selecionado no <select> que fica invisivel na página. 
			$(document).ready(function (){
				var ulSeguidores = document.getElementById("listaSeguidores");
				var items = ulSeguidores.getElementsByTagName("li");
				for(i=0;i<items.length;i++){
					carregaSeguidoresDaDemanda(items[i].getAttribute("id"));
				}
			});

			function carregaSeguidoresDaDemanda(id){
				var selectResp = document.getElementById("slcSeguidores");
				for(j=0;j<selectResp.options.length;j++){
					if(selectResp.options[j].value == id){
						selectResp.options[j].selected = true;
					}
				}	
			}
		</script>	
		
		<!-- Input escondido com o usuario logado -->
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<input class="form-control input-sm" id="txtColab"
						type="hidden" name="tarefa.colaboradorCriador" value="${usuarioLogado.colaborador}">
				</div>
		    </div>
		</div>

		<div class="row">				
			<div class="col-md-8">
				<div class="form-group">
					<label for="txtDescricao">Descrição da Tarefa:</label>
					<textarea rows="10" class="form-control input-sm" id="txtDescricao" 
					name="tarefa.descricao">${tarefa.descricao}</textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-8">
				<div class="form-group">
					<label for="txtTag">Tags:</label>
					<input type="text" class="form-control input-sm" id="txtTag" 
					name="tarefa.tag" value="${tarefa.tag}">
				</div>
			</div>
		</div>	
					
		<div class="row"></div>
		<button id="btnSalvar" type="submit" class="btn btn-success">
			<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
		</button>
		<a href="${linkTo[TarefaController].consultar}" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-remove">
		</span> Cancelar</a>			
	</form>
</body>
</html>

