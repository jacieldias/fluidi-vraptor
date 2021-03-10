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
import br.com.viattec.centralinfo.dao.AvisoDao;
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.model.Aviso;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Controller
@Path("/aviso")
public class AvisoController {
	
	private final Result result;
	private final AvisoDao dao;
	private final ColaboradorDao colaboradorDao;
	private final Validator validator;
	private final UsuarioLogado usuarioLogado;
	
	@Inject
	public AvisoController(Result result, AvisoDao dao, ColaboradorDao colaboradorDao, Validator validator, UsuarioLogado usuarioLogado){
		this.result = result;
		this.dao = dao;
		this.colaboradorDao = colaboradorDao;
		this.validator = validator;
		this.usuarioLogado = usuarioLogado;
	}
	
	public AvisoController(){
		this(null, null, null, null, null);
	}
	
	@Get("/formulario")
	public void formulario(){
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		result.include("listaColaborador", listaColaborador);
	}
	
	@Post
	public void adiciona(@Valid Aviso aviso){
		validator.onErrorForwardTo(this).formulario();
		aviso.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.add(aviso);
		result.include("mensagem","Aviso criado com sucesso!");
		result.redirectTo(this).formulario();
	}
	
	@Get("/alterar/{id}")
	public void alterar(Long id){
		Aviso avisoEncontrado = dao.buscaPorId(id);
		result.include("aviso",avisoEncontrado);
	}
	
	@Post
	public void atualiza(Aviso aviso){
		validator.onErrorForwardTo(this).formulario();
		aviso.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.update(aviso);
		result.redirectTo(this).consultar();		
	}
	
	@Get("/remove/{id}")
	public void remove(Long id){
		dao.remove(id);
		result.include("mensagem","Aviso excluído com sucesso!");
		result.redirectTo(this).formulario();
	}
	
	@Get("/excluir/{id}")
	public void excluir(Long id){
		Aviso avisoEncontrado = dao.buscaPorId(id);
		result.include("aviso", avisoEncontrado);
	}
	
	@Get("/consultar")
	public void consultar(){		
		List<Aviso> listaNorma = dao.lista();			
		result.include("listaAviso",listaNorma);						
	}
}
