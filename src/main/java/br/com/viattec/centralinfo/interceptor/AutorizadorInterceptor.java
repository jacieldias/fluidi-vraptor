package br.com.viattec.centralinfo.interceptor;

import javax.inject.Inject;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.viattec.centralinfo.annotations.Public;
import br.com.viattec.centralinfo.controller.LoginController;
import br.com.viattec.centralinfo.model.UsuarioLogado;

@Intercepts
public class AutorizadorInterceptor {
	
	@Inject 
	private UsuarioLogado usuarioLogado;
	@Inject
	private Result result;
	@Inject
	private ControllerMethod controllerMethod;
	
	@Accepts
	public boolean accepts(){
		return !controllerMethod.containsAnnotation(Public.class);
	}
	
	@AroundCall
	public void intercepta(SimpleInterceptorStack stack){
		
		if(usuarioLogado.getColaborador() == null){
			result.redirectTo(LoginController.class).formulario();
			return;
		}
		stack.next();
	}
}
