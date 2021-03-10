package br.com.viattec.centralinfo.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.dao.CanalDao;
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.model.Canal;
import br.com.viattec.centralinfo.model.Colaborador;

@Controller
@Path("/canal")
public class CanalController {
	
	private final Result result;
	private final Validator validator;
	private final CanalDao dao;
	private final ColaboradorDao colaboradorDao;
	
	public CanalController(){
		this(null,null,null,null);
	}
	
	@Inject
	public CanalController(Result result, Validator validator, CanalDao dao, ColaboradorDao colaboradorDao){
		this.result = result;
		this.validator = validator;
		this.dao = dao;
		this.colaboradorDao = colaboradorDao;
	}
	
	@Get("/novo")
	public void novo(){		
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		result.include("listaColaborador",listaColaborador);
	}
	
	@Post
	public void adiciona(Canal canal){
		validator.add(new I18nMessage("Data", "Data de encerramento não pode ser menor que a de abertura!"));
		validator.onErrorRedirectTo(CanalController.class).novo();
		dao.add(canal);
		result.include("mensagem","Canal criado!");
		result.redirectTo(this).novo();		
	}

}
