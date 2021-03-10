package br.com.viattec.centralinfo.controller;

import java.util.List;

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
import br.com.viattec.centralinfo.dao.SetorDao;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.Setor;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Controller
@Path("/colaborador")
public class ColaboradorController {
	
	private final Result result;
	private final ColaboradorDao dao;
	private final SetorDao setorDao;
	private final Validator validator;
	private final UsuarioLogado usuarioLogado;
	
	@Inject
	public ColaboradorController(Result result, ColaboradorDao dao, SetorDao setorDao, Validator validator, UsuarioLogado usuarioLogado){
		this.result = result;
		this.dao = dao;
		this.setorDao = setorDao;
		this.validator = validator;
		this.usuarioLogado = usuarioLogado;
	}
	
	public ColaboradorController(){
		this(null,null,null,null,null);
	}
	
	@Get("/formulario")
	public void formulario(){
		List<Colaborador> listaColaborador = dao.lista();
		List<Setor> listaSetor = setorDao.lista();
		result.include("listaColaborador",listaColaborador);
		result.include("listaSetor",listaSetor);
	}
	
	@Post
	public void adiciona(@Valid Colaborador colaborador){
		if(dao.existeLogin(colaborador) != null){
			validator.add(new I18nMessage("Login Invalido", "Login indisponível!"));
			validator.onErrorForwardTo(this).formulario();
		}
		dao.add(colaborador);
		result.include("mensagem","Colaborador: " + colaborador.getNome() + " cadastrado com sucesso!");
		result.redirectTo(this).formulario();
	}
	
	@Get("/alterar/{id}")
	public void alterar(Long id) {
		Colaborador colaboradorEncontrado = dao.buscaPorId(id);
		List<Setor> listaSetor = setorDao.lista();
		result.include("colaborador",colaboradorEncontrado);
		result.include("listaSetor",listaSetor);
	}
	
	@Post
	public void atualiza(Colaborador colaborador) {
		dao.update(colaborador);
		result.redirectTo(this).consultar();
	}

	@Get("/remove/{id},{nome}")
	public void remove(Long id, String nome){
		dao.remove(id, nome);
		result.include("mensagem","Colaborador: " + nome + " excluído com sucesso! ");
		result.redirectTo(this).formulario();
	}
	
	@Get("/excluir/{id},{nome}")
	public void excluir(Long id, String nome){
		Colaborador colaborador = dao.buscaPorId(id);
		result.include("colaborador", colaborador);	
	}
	
	@Get("/consultar")
	public void consultar(){
		List<Colaborador> listaColaborador = dao.lista();
		List<Setor> listaSetor = setorDao.lista();
		result.include("listaColaborador",listaColaborador);
		result.include("listaSetor",listaSetor);		
	}
	
	@Get("/alteraSenha/{id}")
	public void alteraSenha(Long id){
		Colaborador colaborador = dao.buscaPorId(id);
		if(colaborador.getId() != usuarioLogado.getColaborador().getId()){
			
		}
		result.include("colaborador",colaborador);
	}
	@Post
	public void confirmaSenha(@Valid Colaborador colaborador){
		dao.alteraSenha(colaborador);
		result.redirectTo(IndexController.class).index();
	}	
}
