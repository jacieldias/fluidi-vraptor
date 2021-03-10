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
		$('#frmNorma').validate({
		    rules: {
		    			        
		        "norma.titulo": {
		            required: true		           	            
		        },
		        
		        "norma.setor.id": {
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
	            	required: "Este campo não pode ser vazio. Digite um título para a norma!"
	            },	
	            
	            "norma.setor.id":{
	            	required: "Este campo não pode ser vazio. Escolha um setor para a norma!"
	            },
	        }   
		    
		});
				
/* Código para as mascáras dos inputs. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#txtDataInclusao').mask('99/99/9999');	
		
/* Código para formatação das datas usando o plugin Moment.js 
---------------------------------------------------------------------------------------------------------------------*/		
		$(function(){
			
			var data = new Date();
						
			dia = data.getDate(),
			mes = data.getMonth()+1;
			ano = data.getFullYear();
						
			var dataFormatada = dia + "/" + mes + "/" + ano; 
			$('#txtDataInclusao').val(dataFormatada);
		})			
});

