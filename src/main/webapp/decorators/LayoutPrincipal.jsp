<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="pt_BR">
<head>
	<meta charset="UTF-8">
	
	<title><decorator:title default="Auto Max Control"/></title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"/>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/bootstrap/css/bootstrap-submenu.min.css'/>"/>
	<!-- Materialize Design -->
	<!-- <link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/materialize/css/materialize.min.css'/>"/> -->
	
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery-2.1.4.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/bootstrap/js/bootstrap-submenu.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery.validate.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery.mask.min.js'/>"></script>
	<!-- Materialize Design -->
	<!-- <script type="text/javascript" charset="utf8" src="<c:url value='/materialize/js/materialize.min.js'/>"></script> -->	
	
<style type="text/css" media="all">
 
  		#heading {
			background: #191919;
			padding: 6px;
		}

		.panel-title a:hover,
		.panel-title a:focus, h4 > span,
		.navbar-nav a > span, .navbar-header > a,
		#titulo-navbar {
		   color: #0080c0;
		}

		.panel-title {
		 color:#FFF;

		}

		@media (min-width: 768px) {
		  .sidebar {
		    position: fixed;
		    top: 5px;
		    bottom: 0;
		    left: 0;
		    z-index: 1000;		   
		    padding: 10px;
		    overflow-x: hidden;
		    overflow-y: auto; 
		    background-color: #f5f5f5;
		    border-right: 1px solid #eee;
		  }
		}
		
		#sidebar {
			background-color: #191919;
			padding: 5px;
		}

		#sidebar a:hover, a:focus {
			color: #FFF;
			text-decoration: none;
		}

		#sidebar.nav > li > a,
		#sidebar.nav > li > a:link {
			background-color: #191919;
			color: #FFF;
		}

		#sidebar.nav > li > a:hover,
		#sidebar.nav > li > a:focus {
			background-color: #373737;
		}

		#sidebar.nav-pills > li.active > a,
		#sidebar.nav-pills > li.active > a:hover,
		#sidebar.nav-pills > li.active > a:focus {
			color: #FFF;
			background-color: #C72A25;
		}
		
		#footer{
				margin-top: 20px;		 
		}
		 
		#txtFooter{
		    text-align: center;
		}
		#titulo-navbar{
			margin-top: -5px;
		} 		
   
</style>	

<script type="text/javascript">
	
		$(function() {
			$('.dropdown-toggle').dropdown();
			$('.dropdown-submenu > a').submenupicker();	
		});
    
</script>
	<decorator:head></decorator:head>
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a id="titulo-navbar" class="navbar-brand" href="#"><img src="<c:url value='/images/fluidi18.png'/>" class="img-responsive" alt="logo" width="80" height="30"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${linkTo[ColaboradorController].alteraSenha(usuarioLogado.colaborador.id)}"><span class="glyphicon glyphicon-lock"></span> Alterar Senha</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${usuarioLogado.colaborador.nome}</a></li>
					<li><a href="${linkTo[LoginController].logout}"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
			    </ul>
			    </div>
			</div> 
	  </div>
	  <div class="container-fluid">
		  <div class="row">		
			<div class="col-md-2 sidebar">
				  <div class="panel-group" id="accordion">
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-inbox"></span>
						  <a href="${linkTo[IndexController].index}">  InBox</a>		 
						</h4>
					  </div>
					</div>
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-home"></span>
						  <a href="${linkTo[SetorController].formulario}">  Setores</a>		 
						</h4>
					  </div>					  
					</div>			
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-list-alt"></span>
						  <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Demandas</a>
						  <span class="glyphicon glyphicon-menu-down pull-right"></span>						  
						</h4>
					  </div>
					  <div id="collapse1" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="sidebar" class="nav nav-pills nav-stacked" style="max-width: 200px;">
								<li><a href="${linkTo[TarefaController].formulario}"><span class="glyphicon glyphicon-plus"></span>  Nova</a></li>
								<li><a href="${linkTo[TarefaController].consultar}"><span class="glyphicon glyphicon-search"></span>  Consultar</a></li>		
							</ul>		
						</div>
					  </div>
					</div>
					
					<!-- 
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-duplicate"></span>
						  <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Normas</a>
						  <span class="glyphicon glyphicon-menu-down pull-right"></span>		  
					   </h4>
					  </div>
					  <div id="collapse2" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="sidebar" class="nav nav-pills nav-stacked" style="max-width: 200px;">
								<li><a href="${linkTo[NormaController].formulario}"><span class="glyphicon glyphicon-plus"></span>  Nova</a></li>
								<li><a href="${linkTo[NormaController].consultar}"><span class="glyphicon glyphicon-search"></span>  Consultar</a></li>					
							</ul>				
						</div>
					  </div>
					</div>
					 -->
								
					<!-- 
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-volume-up"></span>
						  <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">  Avisos</a>
						  <span class="glyphicon glyphicon-menu-down pull-right"></span>		 
						</h4>
					  </div>
					  <div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="sidebar" class="nav nav-pills nav-stacked" style="max-width: 200px;">
								<li><a href="${linkTo[AvisoController].formulario}"><span class="glyphicon glyphicon-plus"></span>  Novo</a></li>
								<li><a href="${linkTo[AvisoController].consultar}"><span class="glyphicon glyphicon-search"></span>  Consultar</a></li>								
							</ul>	
						</div>
					  </div>
					</div>	
					 -->
					 				
					<div id="heading" class="panel panel-default">
					  <div id="heading" class="panel-heading">
						<h4 class="panel-title">
						  <span class="glyphicon glyphicon-user"></span>
						  <a data-toggle="collapse" data-parent="#accordion" href="#collapseColaboradores">  Colaboradores</a>
						  <span class="glyphicon glyphicon-menu-down pull-right"></span>		 
						</h4>
					  </div>
					  <div id="collapseColaboradores" class="panel-collapse collapse">
						<div class="panel-body">
							<ul id="sidebar" class="nav nav-pills nav-stacked" style="max-width: 200px;">
								<li><a href="${linkTo[ColaboradorController].formulario}"><span class="glyphicon glyphicon-plus"></span>  Novo</a></li>
								<li><a href="${linkTo[ColaboradorController].consultar}"><span class="glyphicon glyphicon-search"></span>  Consultar</a></li>								
							</ul>	
						</div>
					  </div>
					</div>					
				  </div> 
				</div>			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">			    
			      <decorator:body/>	
			<hr> 
			<footer id="footer">					
				<p id="txtFooter">&copy; 2015 <a target="_blank" href="http://www.viattec.com.br" title="Viattec Sistemas Ltda">Viattec - Soluções Tecnológicas em Software Ltda</a>. Todos os Direitos Reservados.</p>
			</footer>     	     
		    </div>		   		
		</div>		
  </div> 	
</body>
</html>
