/* Código para definir o comportamento da mensagem e das validações quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
$(document).ready(function() {
	
	$('#txtTitulo').change(function(){
		var valorRecebido = $('#txtTitulo').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Norma: ' + valorRecebido + ' alterada com sucesso!')			
	});
	$('#slcSetor').change(function(){
		var valorRecebido = $('#slcSetor option:selected').text();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Setor: ' + valorRecebido + ' alterado com sucesso!')			
	});
	$('#txtDescricao').change(function(){
		var valorRecebido = $('#txtDescricao').text();
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
			
/* Código para a validação do input. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#frmAlterarNorma').validate({
		    rules: {
		    			        
		        "norma.titulo": {
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
		    	
	            "norma.titulo":{
	            	required: "Este campo não pode ser vazio. Digite um título para a norma alterada!"
	            },		            
	        }  		    
		});	
		
});

