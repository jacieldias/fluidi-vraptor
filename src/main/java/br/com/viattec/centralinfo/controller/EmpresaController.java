package br.com.viattec.centralinfo.controller;

import java.util.List;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.dao.EmpresaDao;
import br.com.viattec.centralinfo.model.Empresa;

@Controller
@Path("/empresa")
public class EmpresaController {

	private final Result result;
	private final Validator validator;
	private final EmpresaDao dao;
	
	public EmpresaController(Result result, Validator validator, EmpresaDao dao){
		this.result = result;
		this.validator = validator;
		this.dao = dao;
	}
	
	public EmpresaController(){
		this(null,null,null);
	}
	
	@Get("/formulario")
	public void formulario(){
		//Remover a linha abaixo depois
		validator.onErrorUsePageOf(this);
		List<Empresa> listaEmpresa = dao.lista();
		result.include("listaEmpresa",listaEmpresa);
	}
}
