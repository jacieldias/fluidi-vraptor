package br.com.viattec.centralinfo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.dao.SetorDao;
import br.com.viattec.centralinfo.model.Setor;

@Controller
@Path("/setor")
public class SetorController {
	
	private final Result result;
	private final SetorDao dao;
	private final Validator validator;
	
	@Inject
	public SetorController(Result result, SetorDao dao, Validator validator){
		this.result = result;
		this.dao = dao;
		this.validator = validator;
	}
	
	public SetorController(){
		this(null, null, null);
	}
	
	@Get("/formulario")
	public void formulario(){
		List<Setor> lista = dao.lista();
		result.include("listaSetor",lista);
	}
	@Post
	public void adiciona(@Valid Setor setor) {
		validator.onErrorForwardTo(this).formulario();
		dao.add(setor);
		result.include("mensagem","Setor: " + setor.getDescricao() + " cadastrado com sucesso!");
		result.redirectTo(this).formulario();
	} 
	@Get("/alterar/{id}")
	public void alterar(int id){
		Setor setorEncontrado = dao.buscaPorId(id);
		result.include("setor",setorEncontrado);
	}
	@Post
	public void atualiza(Setor setor){
		dao.update(setor);
		result.redirectTo(this).formulario();
	}
	@Get("/remove/{id},{descricao}")
	public void remove(int id, String descricao){
		dao.remove(id,descricao);
		result.include("mensagem","Setor: " + descricao + " excluído com sucesso!");
		result.redirectTo(this).formulario();
	}
	@Get("/excluir/{id},{descricao}")
	public void excluir(int id, String descricao){
		Setor setorEncontrado = dao.buscaPorId(id);
		result.include("setor", setorEncontrado);
	}
}
