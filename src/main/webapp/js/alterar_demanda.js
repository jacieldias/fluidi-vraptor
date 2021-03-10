/* Códigos Jquery referentes ao comportamento da view do cadastro das tarefas.
---------------------------------------------------------------------------------------------------------------------*/

/* Código para definir o comportamento da mensagem quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
$(document).ready(function() {		
	
		$('#txtDataAbertura').change(function(){
			var valorRecebido = $('#txtDataAbertura').val();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Data de inclusão: ' + valorRecebido + ' alterada com sucesso!')			
		});
		
		$('#txtDataEncerramento').change(function(){
			var valorRecebido = $('#txtDataEncerramento').val();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Data Encerramento: ' + valorRecebido + ' alterada com sucesso!')			
		});
		
		$('#txtTitulo').change(function(){
			var valorRecebido = $('#txtTitulo').val();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Título: ' + valorRecebido + ' alterado com sucesso!')			
		});
		
		$('#slcColaborador').change(function(){
			var valorRecebido = $('#slcColaborador option:selected').text();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Colaborador: ' + valorRecebido + ' alterado com sucesso!')			
		});
		
		$('#txtTag').change(function(){
			var valorRecebido = $('#txtTag').val();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Tag: ' + valorRecebido + ' alterada com sucesso!')			
		});
		
		$('#btnSalvar').click(function(){
			if($('#txtVerificaConteudo').val() == ''){
	
				$('#msgSucesso').hide();
	
				}else{
					
					$('#myModal').modal('show');
				}			
		 });
		
/* Código para as mascáras dos inputs. 
---------------------------------------------------------------------------------------------------------------------*/
				$('#txtDataAbertura').mask('99/99/9999');
				$('#txtDataPrevistaEncerramento').mask('99/99/9999');		
					
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
	            	required: "Este campo não pode ser vazio. Digite um título para a tarefa!"
	            },
	            "tarefa.colaboradorExecutor.id":{
	            	required: "Este campo não pode ser vazio. Escolha um colaborador!"
	            },	            
	        }   
		    
		});		
});


