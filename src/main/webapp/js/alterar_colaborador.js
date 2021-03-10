$(document).ready(function() {
	
	$('#txtNome').change(function(){
		var valorRecebido = $('#txtNome').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Nome do colaborador: ' + valorRecebido + ' alterado com sucesso!')			
	});
	
	$('#txtEmail').change(function(){
		var valorRecebido = $('#txtEmail').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Email do colaborador: ' + valorRecebido + ' alterado com sucesso!')			
	});
	
	$('#txtLogin').change(function(){
		var valorRecebido = $('#txtLogin').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Login do colaborador: ' + valorRecebido + ' alterado com sucesso!')			
	});
	
	$('#txtSenha').change(function(){
		var valorRecebido = $('#txtSenha').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Senha do colaborador: ' + valorRecebido + ' alterada com sucesso!')			
	});
	
	$('#txtConfirmaSenha').change(function(){
		var valorRecebido = $('#txtConfirmaSenha').val();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Confirmação da senha do colaborador: ' + valorRecebido + ' alterada com sucesso!')			
	});	
			
	$('#slcSetor').change(function(){
		var valorRecebido = $('#slcSetor option:selected').text();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Setor do colaborador: ' + valorRecebido + ' alterado com sucesso!')			
	});	
	
	$('#slcTipo').change(function(){
		var valorRecebido = $('#slcTipo option:selected').text();
		$('#txtVerificaConteudo').val(valorRecebido);
		$('#mensagem').html('Tipo do colaborador: ' + valorRecebido + ' alterado com sucesso!')			
	});	
			

	$('#btnSalvar').click(function(){
		if($('#txtVerificaConteudo').val() == ''){

			$('#msgSucesso').hide();

			}else{
				
				$('#myModal').modal('show');
			}			
	});	

	$('#frm_altera_colaborador').validate({
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
	            equalTo: "#txtSenha"
	        },
	        "colaborador.setor.id": {
	            required: true		           	            
	        },
	        "colaborador.tipo": {
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
                required: "Este campo não pode ser vazio. Repita a senha!"	                
            },
            "colaborador.setor.id": {
                required: "Este campo não pode ser vazio. Informe o setor do colaborador!"	                
            },               
            "colaborador.tipo": {
                required: "Este campo não pode ser vazio. Informe o tipo do colaborador!"	                
            }               
        }, 		    
	});				
});