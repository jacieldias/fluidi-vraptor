package br.com.viattec.centralinfo.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.annotations.Public;
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Controller
public class LoginController {
	
	private final ColaboradorDao dao;
	private final Validator validator;
	private final Result result;
	private final UsuarioLogado usuarioLogado;
	
	@Inject
	public LoginController(ColaboradorDao dao, Validator validator, Result result, UsuarioLogado usuarioLogado){
		this.dao = dao;
		this.validator = validator;
		this.result = result;
		this.usuarioLogado = usuarioLogado;
	}
	
	public LoginController() {
		this(null,null,null,null);
	}

	@Get
	@Public
	public void formulario(){
		
	}
	@Post
	@Public
	public void autentica(Colaborador colaborador){
		if(colaborador.getLogin() == null){
			colaborador.setLogin("");
		}
		if(colaborador.getSenha() == null){
			colaborador.setSenha("");
		}
		Colaborador colaboradorDB = dao.existe(colaborador);
		if(colaboradorDB == null){
			validator.add(new I18nMessage("Usuário ou senha inválida!", null));
			validator.onErrorUsePageOf(this).formulario();			
		}		
		usuarioLogado.setColaborador(colaboradorDB);
		result.redirectTo(IndexController.class).index();
	}
	@Get("/logout")
	public void logout(){
		usuarioLogado.setColaborador(null);
		result.redirectTo(this).formulario();
	}
}
