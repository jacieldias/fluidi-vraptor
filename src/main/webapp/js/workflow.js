$(document).ready(function() {
	
		if($('#msgVazia').is(':empty')){				
			$('#msgSucesso').hide();
		}else{
			$('#myModal').modal('show');
		} 
});