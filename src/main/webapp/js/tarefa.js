/* Códigos Jquery referentes ao comportamento da view do cadastro das tarefas.
---------------------------------------------------------------------------------------------------------------------*/

/* Código para definir o comportamento da mensagem quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
$(document).ready(function() {
	
		if($('#msgVazia').is(':empty')){				
			$('#msgSucesso').hide();
		}else{
			$('#myModal').modal('show');
		} 
			
/* Código para a validação do input. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#frmTarefa').validate({
		    rules: {
		    	"tarefa.dataAbertura": {		           
		    		required: true		            
		        },
		        "tarefa.dataPrevistaEncerramento": {		           
		        	required: true,
		        },
		        "tarefa.titulo": {
		            required: true		           	            
		        },
		        "tarefa.colaboradorExecutor.id": {
		            required: true		           	            
		        },		        		        
		    },

		    highlight: function(element) {
		        $(element).closest('.form-group').addClass('has-error');
		    },
		    unhighlight: function(element) {
		        $(element).closest('.form-group').removeClass('has-error');
		    },
		    errorElement: 'span',
		    errorClass: 'help-block',
		    errorPlacement: function(error, element) {
		        if(element.parent('.input-group').length) {
		            error.insertAfter(element.parent());
		        } else {
		            error.insertAfter(element);
		        }
		    },

		    messages: {
	        	"tarefa.dataAbertura": {
	                required: "Este campo não pode ser vazio. Digite uma data!"	                
	            },
	            "tarefa.dataPrevistaEncerramento": {
	                required: "Este campo não pode ser vazio. Digite uma data!",	                	
	            },
	            "tarefa.titulo":{
	            	required: "Este campo não pode ser vazio. Digite um título para a demanda!"
	            },
	            "tarefa.colaboradorExecutor.id":{
	            	required: "Este campo não pode ser vazio. Escolha um colaborador!"
	            },	            
	        }   
		});
				
/* Código para as mascáras dos inputs. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#txtDataAbertura').mask('99/99/9999');
		$('#txtDataEncerramento').mask('99/99/9999');			
/*  
---------------------------------------------------------------------------------------------------------------------*/		
		var comparaLogado = $('#txtColabLogado').val();
		var comparaCriador = $('#txtColabCriador').val();
		var comparaExecutor = $('#txtColabExecutor').val();		
		var status = $('#txtSituacaoStatus').val();
		
		if(comparaLogado == comparaCriador && comparaLogado == comparaExecutor && status == 'FINALIZADA'){
			
			$('#btnEncerrar').attr('disabled', 'disabled');
			$('#btnIniciar').attr('disabled', 'disabled');			
			$('#btnAlterar').removeAttr('disabled');
		}else		
			if(comparaLogado == comparaCriador && comparaLogado == comparaExecutor && status == 'EM ANDAMENTO'){
				
				$('#btnIniciar').removeAttr('disabled');
				$('#btnIniciar').attr('disabled', 'disabled');
		}else		
			if(comparaLogado == comparaCriador && comparaLogado == comparaExecutor && status == 'PENDENTE'){
				
				$('#btnEncerrar').removeAttr('disabled');		
				$('#btnIniciar').removeAttr('disabled');
		}else
			if(comparaLogado == comparaCriador && comparaLogado != comparaExecutor && status == 'FINALIZADA'){
				
				$('#btnEncerrar').attr('disabled', 'disabled');
				$('#btnIniciar').attr('disabled', 'disabled');					
				$('#btnAlterar').removeAttr('disabled');
		}else
			if(comparaLogado == comparaCriador && comparaLogado != comparaExecutor && status != 'FINALIZADA'){
			
			$('#btnEncerrar').attr('disabled', 'disabled');				
			$('#btnIniciar').attr('disabled', 'disabled');
			$('#btnAlterar').removeAttr('disabled');
		}else
			if(comparaLogado != comparaCriador && comparaLogado == comparaExecutor && status == 'FINALIZADA'){
				
				$('#btnEncerrar').attr('disabled', 'disabled');
				$('#btnIniciar').attr('disabled', 'disabled');					
				$('#btnAlterar').attr('disabled', 'disabled');
		}else
			if(comparaLogado != comparaCriador && comparaLogado == comparaExecutor && status != 'FINALIZADA'){
				
				$('#btnEncerrar').removeAttr('disabled');					
				$('#btnAlterar').attr('disabled', 'disabled');
		}else
			if(comparaLogado != comparaCriador && comparaLogado != comparaExecutor && status == 'FINALIZADA'){
				
				$('#btnEncerrar').attr('disabled', 'disabled');
				$('#btnIniciar').attr('disabled', 'disabled');				
				$('#btnAlterar').attr('disabled', 'disabled');
		}else
			if(comparaLogado != comparaCriador && comparaLogado != comparaExecutor && status != 'FINALIZADA'){
				
				$('#btnEncerrar').attr('disabled', 'disabled');					
				$('#btnAlterar').attr('disabled', 'disabled');
		}				
				
/*  
---------------------------------------------------------------------------------------------------------------------*/		
		
		$(function(){
			
			var data = new Date();
						
			dia = data.getDate(),
			mes = data.getMonth()+1;
			ano = data.getFullYear();
						
			var dataFormatada = dia + "/" + mes + "/" + ano; 
			$('#txtDataAbertura').val(dataFormatada);
		})
				
});


