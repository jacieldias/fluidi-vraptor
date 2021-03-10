/* Códigos Jquery referentes ao comportamento da view do Inbox.
---------------------------------------------------------------------------------------------------------------------*/

/*Formata o DataTable com os dados das demandas.
---------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
	
	table = $('#tbl_demandas').DataTable(
			{
			 "lengthMenu" : [10, 15, 25],
			 "paging" : true,
			 "ordering" : true,
			 "info" : true,
			 "scrollX" : true,
			 
			 "columnDefs" : [
			     {"orderable" : false, "targets" : 5}             
			 ],			 
			 
			 "language" :
			 {
				"url" : "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese-Brasil.json"
			 }
		});
		
/* Código usado para emitir as mensagens nos botões de alterar, excluir e consultar.js 
		---------------------------------------------------------------------------------------------------------------------*/
			
		$('[data-toggle="popover"]').popover();			

/*  
---------------------------------------------------------------------------------------------------------------------*/		
						
		$('.btn-group > button').each(function(index, value){			
			var buscaItem = $(this).val();
			
			if(buscaItem == 'FINALIZADA'){
				$(this).removeClass('btn btn-default dropdown-toggle').addClass('btn btn-success dropdown-toggle');				
			}else
			if(buscaItem == 'PENDENTE'){
				$(this).removeClass('btn btn-default dropdown-toggle').addClass('btn btn-danger dropdown-toggle');				
			}else{
				$(this).removeClass('btn btn-default dropdown-toggle').addClass('btn btn-info dropdown-toggle');				
			}			
		});	
		
		$('button').click(function(){			
			var desabilita = $(this).val();
			
		$('.nos[id=opcao-iniciar-demanda]').each(function(i){					
			if(desabilita == 'FINALIZADA'){	
				$(this).hide();
			}							
		});
		
		$('.nos[id=opcao-finalizar-demanda]').each(function(i){			
			if(desabilita == 'FINALIZADA'){			
				$(this).hide();
			}else{				
				$(this).show();
			}							
		});
		
		$('.nos[id=opcao-iniciar-demanda]').each(function(i){			
			if(desabilita == 'EM ANDAMENTO'){			
				$(this).hide();
			}							
		});
		
		$('.nos[id=opcao-iniciar-demanda]').each(function(i){			
			if(desabilita == 'PENDENTE'){		
				$(this).show();
			}							
		});
	});		
});