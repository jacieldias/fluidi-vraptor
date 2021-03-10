/* Código para definir o comportamento da mensagem e das validações quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
$(document).ready(function() {
	
	$('#btnSalvar').click(function(){		
				
		$('#myModal').modal('show');
		$('#mensagem').html('Aviso alterado com sucesso!')
				
	});
			
/* Código para a validação do input. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#frmAlterarAviso').validate({
		    rules: {
		    			        
		        "aviso.conteudo": {
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
		    	
	            "aviso.conteudo":{
	            	required: "Este campo não pode ser vazio. Digite uma descrição para o aviso!"
	            },		            
	        }  		    
		});	
		
});

