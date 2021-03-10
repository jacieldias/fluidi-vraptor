package br.com.viattec.centralinfo.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.dao.ComentarioTarefaDao;
import br.com.viattec.centralinfo.model.ComentarioTarefa;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Controller
@Path("/comentarioTarefa")
public class ComentarioTarefaController {
	
	private final Result result;
	private final Validator validator;
	private final ComentarioTarefaDao dao;
	private final ColaboradorDao colaboradorDao;
	private final UsuarioLogado usuarioLogado;
	
	@Inject
	public ComentarioTarefaController(Result result, Validator validator, ComentarioTarefaDao dao, ColaboradorDao colaboradorDao, UsuarioLogado usuarioLogado){
		this.result = result;
		this.validator = validator;
		this.dao = dao;
		this.colaboradorDao = colaboradorDao;
		this.usuarioLogado = usuarioLogado;
	}
	
	public ComentarioTarefaController(){
		this(null,null,null,null,null);
	}
	
	@Get("/formulario")
	public void formulario(){		

	}
	@Post
	public void adiciona(@Valid ComentarioTarefa comentarioTarefa){
		validator.add(new I18nMessage("comentario", "Escreva algum comentário!"));
		validator.onErrorUsePageOf(TarefaController.class).adicionaComentario(comentarioTarefa);

		comentarioTarefa.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.add(comentarioTarefa);
		result.redirectTo(this).formulario();		
	}
}
