<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datepicker/css/bootstrap-datepicker3.css'/>">
	<script type="text/javascript" charset="utf8" src="<c:url value='/tinymce/tinymce.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/js/bootstrap-datepicker.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datepicker/locales/bootstrap-datepicker.pt-BR.min.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/tarefa.js'/>"></script>
	<title>Nova Demanda</title>
<script type="text/javascript">
	tinymce.init({
		selector :'textarea',
		translate_mode : true,
		language : "pt_BR",
		menubar: false,
		toolbar:'undo redo bold italic underline alignleft aligncenter alignright alignjustify bullist numlist outdent indent code copy paste cut'
	});

	window.onload = function(){
		document.getElementById('slcSeguidores').style.display = "none";
	}
/*
	//Essas duas functions servem para adicionar e remover um option dinamicamente em uma tag select com javascript 

	function addItemSelect(){
		var selectColab = document.getElementById("slcColaborador");
		var textoSelecionado = selectColab.options[selectColab.selectedIndex].text;
		var idSelecionado = selectColab.options[selectColab.selectedIndex].value;  

    	var colaborador = document.getElementById(idSelecionado);
	    if(colaborador != null){
		   alert("O colaborador já é responsável pela demanda");
		   return;
	    }else{
			var select = document.getElementById("slcSeguidores");
			var option = document.createElement("option");
			option.text = textoSelecionado;
			option.value = idSelecionado;
			select.add(option);
			addItemLista(textoSelecionado,idSelecionado);
	    }
	}

	function removeItemSelect(id){
		var selectResp = document.getElementById("slcSeguidores")
		for (var i=0; i < selectResp.length; i++){
		if (selectResp.options[i].value == id )
			selectResp.remove(i);
		}	
	}
*/

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

	<h3>Nova Demanda</h3>
	<hr>
	<form id="frmTarefa" role="form" method="post" enctype="multipart/form-data" action="${linkTo[TarefaController].adiciona}">
		
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
					name="tarefa.dataAbertura" value="${tarefa.dataAbertura}">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtDataEncerramento">Data Prevista de Encerramento:</label>
					<div class="input-group date" data-provide="datepicker-inline" data-date-language="pt-BR"> 
						<input type="text" class="form-control input-sm" id="txtDataEncerramento" 
						name="tarefa.dataPrevistaEncerramento" value="${tarefa.dataPrevistaEncerramento}" readonly>
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</div>
					</div>
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
						<option></option>
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
						<option></option>
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
					name="tarefa.seguidores.id" multiple>
				<c:forEach items="${listaColaborador}" var="colaborador">
					<option value="${colaborador.id}">${colaborador.nome}</option>
				</c:forEach>
			</select>
		</div>
			
		<!-- Lista de seguidores montada dinamicamente -->
		<div class="row">				
			<div class="col-md-4">
				<div class="form-group">
					<ul class="list-group" id="listaSeguidores"></ul>
				</div>
			</div>
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

		<div class="row">				
			<div class="col-md-8">
				<div class="form-group">
					<label for="txtDescricao">Descrição da Tarefa:</label>
					<textarea rows="10" class="form-control input-sm" id="txtDescricao" 
					name="tarefa.descricao">${tarefa.descricao}</textarea>
				</div>
			</div>				
			<input type="hidden" class="form-control" id="txtStatus" name="tarefa.status" value="PENDENTE">
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
		
		<div class="row">
			<div class="form-group col-md-4">
				<input type="file" name="files" multiple>
			</div>
		</div>
		
		<div class="row"></div>
		<button type="submit" class="btn btn-success">
			<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
		</button>
	</form>
	<br>
</body>
</html>

