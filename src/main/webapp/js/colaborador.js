/* Códigos Jquery referentes ao comportamento da view de cadastro dos colaboradores.
---------------------------------------------------------------------------------------------------------------------*/
$(document).ready(function() {

/* Código para definir o comportamento da mensagem quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
		
			if($('#msgVazia').is(':empty')){ 
				
			    $('#msgSucesso').hide();
		    }else{
			    $('#myModal').modal('show');
		    } 
	
/* Código para a validação do input. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#frmColaborador').validate({
		    rules: {
		    	"colaborador.nome": {
		            required: true		           	            
		        },
		        "colaborador.login": {
		            required: true		           	            
		        },
		        "colaborador.senha": {
		            required: true		           	            
		        },
		        "colaborador.confirmaSenha": {
		            required: true,
		            equalTo: '#txtSenha'
		        },
		        "colaborador.setor.id": {
		            required: true		           	            
		        },
		        "colaborador.tipoColaborador": {
		            required: true		           	            
		        }		        
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
	        	"colaborador.nome": {
	                required: "Este campo não pode ser vazio. Digite o nome do colaborador!"                 
	            },
	            "colaborador.login": {
	                required: "Este campo não pode ser vazio. Informe o login!"	                
	            },
	            "colaborador.senha": {
	                required: "Este campo não pode ser vazio. Informe uma senha!"	                
	            },
	            "colaborador.confirmaSenha": {
	                required: "Este campo não pode ser vazio. Repita a senha!",
	                equalTo: "As senhas precisam ser iguais!"
	            },
	            "colaborador.setor.id": {
	                required: "Este campo não pode ser vazio. Informe o setor do colaborador!"	                
	            },               
	            "colaborador.tipoColaborador": {
	                required: "Este campo não pode ser vazio. Informe o tipo do colaborador!"	                
	            }               
	        }		    
		});		
});
 