package br.com.viattec.centralinfo.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.viattec.centralinfo.dao.TarefaDao;
import br.com.viattec.centralinfo.model.Tarefa;
import br.com.viattec.centralinfo.model.UsuarioLogado;
import br.com.viattec.centralinfo.model.Aviso;
import br.com.viattec.centralinfo.dao.AvisoDao;
@Controller
public class IndexController {

	private final TarefaDao dao;
	private final Result result;
	private final UsuarioLogado usuarioLogado;
	private final AvisoDao avisoDao;
	
	@Inject
	public IndexController(TarefaDao dao, Result result, UsuarioLogado usuarioLogado, AvisoDao avisoDao){
		this.dao = dao;
		this.result = result;
		this.usuarioLogado = usuarioLogado;
		this.avisoDao = avisoDao;
	}
	
	public IndexController(){
		this(null,null,null, null);
	}
	
	@Get("/")
	public void login(){
		
	}
	
	@Get("/index")
	public void index() {
		List<Tarefa> listaMinhasTarefas = dao.listaMinhasTarefas(usuarioLogado.getColaborador());
		List<Aviso> listaMeusAvisos = avisoDao.lista();
		List<Tarefa> listaMinhasTarefasDelegadas = dao.listaMinhasTarefasDelegadas(usuarioLogado.getColaborador());
		result.include("listaMinhasTarefas",listaMinhasTarefas);
		result.include("listaMeusAvisos",listaMeusAvisos);
		result.include("listaMinhasTarefasDelegadas",listaMinhasTarefasDelegadas);
	}
	
}