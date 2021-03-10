/* Códigos Jquery referentes ao comportamento da view de cadastro de setores.
---------------------------------------------------------------------------------------------------------------------*/

/*Formata o DataTable com os dados dos setores.
---------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
	
	table = $('#tbl_setor').DataTable(
			{
			 "lengthMenu" : false,
			 "paging" : false,
			 "ordering" : true,
			 "info" : true,
			 "scrollY" : "205px",
			 "scrollCollapse" : true,
			 "columnDefs" : [
					 {"orderable" : false, "targets" : 2}             
			 ],
			 
			 
			 "language" :
			 {
				"url" : "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese-Brasil.json"
			 }
		});
		
/* Código para definir o comportamento da mensagem quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
		
			if($('#msgVazia').is(':empty')){ 
			
			    $('#msgSucesso').hide();
		    }else{
			    $('#myModal').modal('show');
		    } 
					
/* Código para fechar a mensagem quando o usuário clicar no input. 
---------------------------------------------------------------------------------------------------------------------*/
		
		/*$('#txtDescricao').focus(function(){
			$('#msgSucesso').hide();
		});*/
		
		
/* Código para a confirmação da ação caso o usuário clique no botão de excluir. 
---------------------------------------------------------------------------------------------------------------------*/		

		/*$('.btnexcluir').click(function (e){
		    if (confirm("Tem certeza que deseja excluir esta montadora?")) { 		    	
		  		window.location.href = "remove?id="; 
		  		
		    } else {
		        alert('Operação cancelada!');
		        e.preventDefault();
		    }		   
			
		});*/
		
/* Time da mensagem caso o usuário não clique no input ou no botão de fechar. 
---------------------------------------------------------------------------------------------------------------------*/		

		/*setTimeout("$('#msgSucesso').hide();",4000);*/

/* Código para a validação do input. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#formSetor').validate({
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
	                required: "Este campo não pode ser vazio. Digite o nome do setor!" 
	                
	            },
	            
	        } 
		    
		});  
		
/* Código usado para emitir as mensagens nos botões de alterar, excluir 
		---------------------------------------------------------------------------------------------------------------------*/
				
		$('[data-toggle="popover"]').popover();
		
	});