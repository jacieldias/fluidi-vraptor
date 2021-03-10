/* Códigos Jquery referentes ao comportamento da view de alteração dos dados do setor.
---------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
			
	    $('#txtDescricao').change(function(){
			var valorRecebido = $('#txtDescricao').val();
			$('#txtVerificaConteudo').val(valorRecebido);
			$('#mensagem').html('Setor: ' + valorRecebido + ' alterado com sucesso!')			
		});
		
		$('#btnSalvar').click(function(){
			if($('#txtVerificaConteudo').val() == ''){

				$('#msgSucesso').hide();

				}else{
					
					$('#myModal').modal('show');					
				}	
		});

		$('#formAlterar').validate({
		    rules: {
		    	"setor.descricao": {
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
	        	"setor.descricao": {
	                required: "Este campo não pode ser vazio. Digite o nome de um setor!", 
	                
	            },
	            
	        } 
		    
		});		
	});