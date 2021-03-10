
/*Formata o DataTable com os dados das normas.
---------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
	
	table = $('#tbl_avisos').DataTable(
			{
			 "lengthMenu" : [10, 15, 25],
			 "paging" : true,
			 "ordering" : true,
			 "info" : true,
			 "scrollX" : false,
			 			 
			 
			 "columnDefs" : [
			     {"orderable" : false, "targets" : 3}             
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
		
/* Código usado para emitir as mensagens nos botões de alterar, excluir e consultar.js 
		---------------------------------------------------------------------------------------------------------------------*/
			
		$('[data-toggle="popover"]').popover();		
		
});
 