/* Código para definir o comportamento da mensagem quando a view for chamada. 
---------------------------------------------------------------------------------------------------------------------*/		
$(document).ready(function() {
	
		if($('#msgVazia').is(':empty')){				
			$('#msgSucesso').hide();
		}else{
			$('#myModal').modal('show');
		} 
				
/* Código para as mascáras dos inputs. 
---------------------------------------------------------------------------------------------------------------------*/
		$('#txtData').mask('99/99/9999');	
		
/* Código para formatação das datas usando o plugin Moment.js 
---------------------------------------------------------------------------------------------------------------------*/		
			
		$(function(){
			
			var data = new Date();
						
			dia = data.getDate(),
			mes = data.getMonth()+1;
			ano = data.getFullYear();
						
			var dataFormatada = dia + "/" + mes + "/" + ano; 
			$('#txtData').val(dataFormatada);
		    })		
		
});

