<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/estilos_gerais.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/css/index.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/dataTables.bootstrap.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/fixedColumns.bootstrap.css'/>">
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/datatables/media/css/jquery.dataTables_themeroller.css'/>">
	<!-- <script type="text/javascript" charset="utf8" src="<c:url value='/datadables/media/js/jquery.js'/>"></script> -->
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/jquery.dataTables.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/datatables/media/js/dataTables.bootstrap.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/index.js'/>"></script>
	<title>InBox</title>
<style type="text/css">

	#demanda-formatada {	
		font-style: italic;
	} 

</style>	
</head>
<body>	
	<h3>InBox</h3>
	<hr>
	
	<!-- 
	<div class="panel panel-primary">
		<div class="panel-heading">Avisos Recentes</div>		 		 
		<ul>
			<c:forEach items="${listaMeusAvisos}" var="aviso">
				<li id="aviso-formatado">${aviso.conteudo}</li>
			</c:forEach>			
		</ul>		
	</div>
	 -->
	 
	<!-- Teste de componentes do Materialize - Chips e Nav 
	<div class="chip">
    	Jane Doe
    	<i class="material-icons">close</i>
  	</div>

	<div class="chip">
    	Tag
    	<i class="material-icons">close</i>
  	</div>

	<ul class="nav nav-pills nav-justified">
		<li role="presentation" class="active"><a href="#">Tarefas</a></li>
		<li role="presentation"><a href="#">Publicações</a></li>
		<li role="presentation"><a href="#">Eventos</a></li>
		<li role="presentation"><a href="#">Atividade</a></li>
	</ul>
	-->

	<br>  		    
        <div class="panel panel-primary"> 
        <div class="panel-heading">Minhas Demandas</div>       
		<ul id="teste" class="list-group">
		  <c:forEach items="${listaMinhasTarefas}" var="tarefa">		  
		    <li id="lista-demandas" class="list-group-item">		
						   		
 			   		<div class="btn-group btn-group-xs pull-right" role="group">
						<div class="btn-group">
							<button id="btnTeste" type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" value="${tarefa.status}">${tarefa.status} <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li class="nos" id="opcao-detalhes"><a href="${linkTo[TarefaController].detalhamento(tarefa.id)}">Detalhes</a></li>
								<li class="nos" id="opcao-iniciar-demanda"><a href="${linkTo[TarefaController].iniciaTarefa(tarefa.id)}">Iniciar Demanda</a></li>
								<li class="nos" id="opcao-finalizar-demanda"><a href="${linkTo[TarefaController].finalizaTarefa(tarefa.id)}">Finalizar Demanda</a></li>
								<li class="nos" id="opcao-fazer-comentario"><a href="${linkTo[TarefaController].comentario(tarefa.id)}">Fazer Comentário</a></li>
							</ul>
						</div>
					</div>
 			   <input type="hidden" value="${tarefa.id}">
			   <p class="list-group-item-text"><b>${tarefa.titulo}</b></p>
			   <p id="demanda-formatada" class="list-group-item-text">Data Abertura: <fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/> -
			   Data Prevista Encerramento: <fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataPrevistaEncerramento}"/> -
			   Colaborador Criador: ${tarefa.colaboradorCriador.nome}			   
		    </li>		    	  	
		  </c:forEach>   
		</ul>
		</div>
        <br>                
        <div class="panel panel-primary"> 
        <div class="panel-heading">Demandadas por: ${usuarioLogado.colaborador.nome}</div>       
		<ul class="list-group">
		  <c:forEach items="${listaMinhasTarefasDelegadas}" var="tarefa">		  
		    <li id="lista-demandas" class="list-group-item">   
 			   <div class="btn-group btn-group-xs pull-right" role="group">
						<div class="btn-group">
							<button id="btnTeste" type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" value="${tarefa.status}">${tarefa.status} <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li class="nos" id="opcao-detalhes"><a href="${linkTo[TarefaController].detalhamento(tarefa.id)}">Detalhes</a></li>								
								<li class="nos" id="opcao-fazer-comentario"><a href="${linkTo[TarefaController].comentario(tarefa.id)}">Fazer Comentário</a></li>
							</ul>
						</div>
				</div>   
 			   <input type="hidden" value="${tarefa.id}">
			   <p class="list-group-item-text"><b>${tarefa.titulo}</b></p>
			   <p id="demanda-formatada" class="list-group-item-text">Data Abertura: <fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataAbertura}"/> -
			   Data Prevista Encerramento: <fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataPrevistaEncerramento}"/> -
			   Colaborador Executor: ${tarefa.colaboradorExecutor.nome}
			   </p>
		    </li>	    	  	
		  </c:forEach>   
		</ul>
		</div>
        <br>	
        
      	<!-- Teste de componentes do Materialize - Cards
        <div class="row">
        <div class="col s12 m12">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p>I am a very simple card. I am good at containing small bits of information.
              I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
      </div>
      -->
</body>
</html>
