/* Códigos Jquery referentes ao comportamento da view de cadastro dos colaboradores.
---------------------------------------------------------------------------------------------------------------------*/

/*Formata o DataTable com os dados dos colaboradores.
---------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
	
	table = $('#tbl_colaborador').DataTable(
			{
			"aoColumnDefs": [
				               {"sWidth": "30%", "aTargets": [1]},
				               {"orderable" : false, "targets" : 5}
				             ],
			 "lengthMenu" : [10, 15, 25],
			 "paging" : true,
			 "ordering" : true,
			 "info" : true,
			 "scrollX" : true,
			 
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
 