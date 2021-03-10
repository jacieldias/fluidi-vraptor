package br.com.viattec.centralinfo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.viattec.centralinfo.dao.StatusDemandaDao;
import br.com.viattec.centralinfo.model.StatusDemanda;

@Controller
@Path("/statusDemanda")
public class StatusDemandaController {
	
	private StatusDemandaDao dao;
	private Result result;
	
	@Inject
	public StatusDemandaController(StatusDemandaDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	public StatusDemandaController(){
		this(null, null);
	}
	
	@Get("/formulario")
	public void formulario(){
		List<StatusDemanda> listaStatus = dao.lista();
		result.include("listaStatus",listaStatus);
	}
	
	@Post
	public void adiciona(@Valid StatusDemanda statusDemanda){
		dao.salvar(statusDemanda);
		result.include("mensagem","Status salvo com sucesso!");
		result.redirectTo(this).formulario();
	}
	
	@Get("/alterar/{id}")
	public void alterar(Long id){
		StatusDemanda status = dao.buscaPorId(id);
		result.include(status);
		result.of(this).formulario();
	}
}
