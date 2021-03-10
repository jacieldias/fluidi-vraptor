<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt_BR">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">		
	<link type="text/css" rel="stylesheet" media="screem" href="<c:url value='/css/estilos_gerais.css'/>"/>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>
	<link type="text/css" rel="stylesheet" media="screen" href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"/>		
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery-2.1.4.js'/>"></script>	
	<script type="text/javascript" charset="utf8" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" charset="utf8" src="<c:url value='/js/jquery.validate.js'/>"></script>	
	<title>Auto Max Control</title>	
<style type="text/css"> 

	h3 {
		margin-top: 70px;
		text-align: center;
	}
	
	#pnl{	
		width: 45%;
		margin: auto;
	} 
	
	footer{	
		text-align: center;
	
	}
	
	hr {
		border-color: #BEBEBE;
	}

</style>	
</head>
<body>
	<div class="container">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Auto Max Control</a>
			</div>
		</div>
		<div class="container-fluid">
			<h3>Acesso ao Sistema</h3>
			<hr>
			<div id="pnl" class="panel panel-default">
				<div class="panel-body">	
					<form id="frmAcesso" role="form">
						<div class="form-group">
							<label for="txtUsuario">Usuário:</label> 
							<select class="form-control input-sm" id="sel1">
						        <option>Escolha um usuário</option>
						        <option>ESPEDITO LEAL</option>
						        <option>JACIEL DIAS</option>
						        <option>MAITÊ BARBOSA</option>
						        <option>MAYLA BARBOSA</option>
					   	   </select>					   
						</div>
						<div class="form-group">
							<label for="txtSenha">Senha:</label>
							<input type="password" class="form-control input-sm" id="txtSenha" placeholder="Digite uma senha">
						</div>

						<a href="${linkTo[IndexController].index}" class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> Acessar</a>
					</form>
				</div>	
			</div>
		</div>
		<div class="navbar navbar-fixed-bottom">
		<div class="container">
			<div class="row-fluid">
				<div class="span12">
					<footer>
					<hr>
						<p>&copy; 2015 <a target="_blank" href="http://www.viattec.com.br" title="Viattec Sistemas Ltda">Viattec - Soluções Tecnológicas em Software Ltda</a>. Todos os Direitos Reservados.</p>
					</footer>
				</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>