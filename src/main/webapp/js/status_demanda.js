$(document).ready(function() {
	
		if($('#msgVazia').is(':empty')){				
			$('#msgSucesso').hide();
		}else{
			$('#myModal').modal('show');
		} 
		
		$('#frmStatusDemanda').validate({
			rules: {
				"statusDemanda.descricao": {		           
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
				"statusDemanda.descricao": {
					required: "Este campo não pode ser vazio. Digite uma descrição!"	                
				}
			}   
		});
});
