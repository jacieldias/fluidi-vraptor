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
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.dao.NormaDao;
import br.com.viattec.centralinfo.dao.SetorDao;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.Norma;
import br.com.viattec.centralinfo.model.Setor;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Controller
@Path("/norma")
public class NormaController {
	
	private final Result result;
	private final NormaDao dao;
	private final SetorDao setorDao;
	private final ColaboradorDao colaboradorDao;
	private final Validator validator;
	private final UsuarioLogado usuarioLogado;
	
	
	
	@Inject
	public NormaController(Result result, NormaDao dao, SetorDao setorDao, ColaboradorDao colaboradorDao, Validator validator, UsuarioLogado usuarioLogado){
		this.result = result;
		this.dao = dao;
		this.setorDao = setorDao;
		this.colaboradorDao = colaboradorDao;
		this.validator = validator;
		this.usuarioLogado = usuarioLogado;			
	}
	
	public NormaController(){
		this(null,null,null,null,null,null);
	}
	
	@Get("/formulario")
	public void formulario(){
		List<Norma> listaNorma = dao.lista();
		List<Setor> listaSetor = setorDao.lista();
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		result.include("listaNorma",listaNorma);
		result.include("listaSetor",listaSetor);
		result.include("listaColaborador",listaColaborador);
	}
	
	@Post
	public void adiciona(@Valid Norma norma){
		validator.onErrorForwardTo(this).formulario();
		norma.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.add(norma);
		result.include("mensagem","Norma criada com sucesso!");
		result.redirectTo(this).formulario();
	}
	
	@Get("/alterar/{id}")
	public void alterar(Long id){		
		List<Setor> listaSetor = setorDao.lista();		
		Norma normaEncontrada = dao.buscaPorId(id);	
		result.include("norma",normaEncontrada);
		result.include("listaSetor",listaSetor);
	}
	
	@Post
	public void atualiza(Norma norma){
		validator.onErrorForwardTo(this).formulario();
		norma.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.update(norma);
		result.redirectTo(this).consultar();
	}
	
	@Get("/remove/{id},{titulo}")
	public void remove(Long id, String titulo){
		dao.remove(id);
		result.include("mensagem","Norma excluída com sucesso!");
		result.redirectTo(this).consultar();
	}
	
	@Get("/excluir/{id},{titulo}")
	public void excluir(Long id, String titulo){
		Norma normaEncontrada = dao.buscaPorId(id);
		result.include("norma", normaEncontrada);
	}
	
	@Get("/consultar")
	public void consultar(){		
		List<Norma> listaNorma = dao.lista();
		List<Setor> listaSetor = setorDao.lista();		
		result.include("listaNorma",listaNorma);
		result.include("listaSetor",listaSetor);				
	}
}
