package br.com.viattec.centralinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.simplemail.Mailer;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.viattec.centralinfo.dao.ColaboradorDao;
import br.com.viattec.centralinfo.dao.ComentarioTarefaDao;
import br.com.viattec.centralinfo.dao.TarefaDao;
import br.com.viattec.centralinfo.model.Arquivo;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.ComentarioTarefa;
import br.com.viattec.centralinfo.model.Tarefa;
import br.com.viattec.centralinfo.model.UsuarioLogado;
import br.com.viattec.centralinfo.storage.Storage;
import br.com.viattec.centralinfo.storage.StorageDirectory;
@Controller
@Path("/tarefa")
public class TarefaController {
	
	private final Result result;
	private final TarefaDao dao;
	private final ColaboradorDao colaboradorDao;
	private final UsuarioLogado usuarioLogado;
	private final Validator validator;
	private final ComentarioTarefaDao comentarioTarefaDao;
	private final Mailer mailer;
	private final Storage storage;
	private final ServletContext context;
	
	@Inject
	public TarefaController(Result result, TarefaDao dao,
			ColaboradorDao colaboradorDao, Validator validator,
			UsuarioLogado usuarioLogado, ComentarioTarefaDao comentarioTarefaDao, Mailer mailer
			, StorageDirectory storage, ServletContext context) {
		this.result = result;
		this.dao = dao;
		this.colaboradorDao = colaboradorDao;
		this.validator = validator;
		this.usuarioLogado = usuarioLogado;
		this.comentarioTarefaDao = comentarioTarefaDao;
		this.mailer = mailer;
		this.storage = storage;
		this.context = context;
	}
	
	public TarefaController(){
		this(null,null,null,null,null,null,null,null,null);
	}
	
	@Get("/formulario")
	public void formulario(){		
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		result.include("listaColaborador",listaColaborador);
		result.include("listaGestor",listaColaborador);
	}
	
	@Post
	public void adiciona(@Valid Tarefa tarefa, List<UploadedFile> files) throws EmailException, IOException{
		if(!validaData(tarefa.getDataAbertura(), tarefa.getDataPrevistaEncerramento())){
			validator.add(new I18nMessage("Data", "Data de encerramento não pode ser menor que a de abertura!"));
			validator.onErrorRedirectTo(TarefaController.class).formulario();
		}
		if (tarefa.getColaboradorGestor().getId() == null) {
			tarefa.setColaboradorGestor(null);
		}
		tarefa.setColaboradorCriador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.add(tarefa);
		Long idGerado = tarefa.getId();
		
		if(files != null){
			String basePathFiles = context.getRealPath("/resources/arquivos/");

			List<Arquivo> listaArquivos = new ArrayList<Arquivo>();
			for (UploadedFile file : files) {
				Arquivo arquivo = new Arquivo();
				arquivo.setNome(file.getFileName());
				arquivo.setDataModificacao(Calendar.getInstance());
				arquivo.setContentType(file.getContentType());
				String diretorioDemanda = "demanda_"+idGerado;
				String pathDestino = basePathFiles+diretorioDemanda;
				arquivo.setPath(pathDestino);
				listaArquivos.add(arquivo);
				System.out.println(">>>Path"+basePathFiles);
				storage.write(file, pathDestino);
			}
			dao.atribuiArquivosADemanda(idGerado, listaArquivos);
		}
		result.include("mensagem","Demanda cadastrada com sucesso!");
		result.redirectTo(this).sendEmail(idGerado);		
	}
	
	@Post
	public void adicionaComentario(@Valid ComentarioTarefa comentarioTarefa){
		validator.onErrorUsePageOf(this).comentario(comentarioTarefa.getTarefa().getId());
		comentarioTarefa.setColaborador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		comentarioTarefa.setTarefa(dao.buscaPorId(comentarioTarefa.getTarefa().getId()));
		comentarioTarefaDao.add(comentarioTarefa);
		result.redirectTo(this).detalhamento(comentarioTarefa.getTarefa().getId());
	}
	
	@Get("/alterar/{id}")
	public void alterar(Long id) {
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		List<Colaborador> listaGestor = colaboradorDao.lista();
		Tarefa tarefaEncontrada = dao.buscaPorId(id);
		List<Colaborador> listaSeguidor = tarefaEncontrada.getSeguidores();
		result.include("tarefa",tarefaEncontrada);
		result.include("listaSeguidor",listaSeguidor);
		result.include("listaGestor",listaGestor);
		result.include("listaColaborador",listaColaborador);		
	}	
	
	@Post
	public void atualiza(Tarefa tarefa) {
		if(!validaData(tarefa.getDataAbertura(), tarefa.getDataPrevistaEncerramento())){
			validator.add(new I18nMessage("Data", "  Data de encerramento não pode ser menor que a de abertura!  "));
			validator.onErrorRedirectTo(TarefaController.class).alterar(tarefa.getId());
		}
		if (tarefa.getColaboradorGestor().getId() == null) {
			tarefa.setColaboradorGestor(null);
		}
		tarefa.setColaboradorCriador(colaboradorDao.buscaPorId(usuarioLogado.getColaborador().getId()));
		dao.update(tarefa);
		result.redirectTo(this).consultar();		
	}
	
	@Get("/remove/{id}")
	public void remove(Long id){
		dao.remove(id);
		result.include("mensagem","Demanda excluída com sucesso!");
		result.redirectTo(this).consultar();
	}
	
	@Get("/excluir/{id}")
	public void excluir(Long id){
		Tarefa tarefa = dao.buscaPorId(id);
		result.include("tarefa", tarefa);
	}
	
	public boolean validaData(Date dtAbertura, Date dtEncerramento){
		if(dtEncerramento.before(dtAbertura)){
			return false;
		}else{
			return true;
		}		
	}
	
	@Get("/detalhamento/{id}")
	public void detalhamento(Long id) {		
		Tarefa tarefaEncontrada = dao.buscaPorId(id);
		List<ComentarioTarefa> listaComentarios = comentarioTarefaDao.listaComentariosDaTarefa(tarefaEncontrada);
		result.include("tarefa",tarefaEncontrada);		
		result.include("listaComentarios",listaComentarios);
	}
	
	@Get("/inicia/{id}")
	public void iniciaTarefa(Long id){
		dao.atualizaStatusTarefaEmAndamento(id);
		result.redirectTo(IndexController.class).index();
	}
	
	@Get("/finaliza/{id}")
	public void finalizaTarefa(Long id){
		dao.atualizaStatusTarefaFinalizada(id);
		result.redirectTo(IndexController.class).index();
	}
	
	@Get("/consultar")
	public void consultar(){		
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		result.include("listaColaborador",listaColaborador);
		List<Tarefa> listaMinhasTarefas = dao.listaMinhasTarefas(usuarioLogado.getColaborador());		
		List<Tarefa> listaMinhasTarefasDelegadas = dao.listaMinhasTarefasDelegadas(usuarioLogado.getColaborador());
		result.include("listaMinhasTarefas",listaMinhasTarefas);		
		result.include("listaMinhasTarefasDelegadas",listaMinhasTarefasDelegadas);
	}
	
	@Get("/consultarMinhasDemandas/{id}")
	public void consultarMinhasDemandas(Long id){		
		List<Colaborador> listaColaborador = colaboradorDao.lista();
		Tarefa tarefaEncontrada = dao.buscaPorId(id);		
		result.include("tarefa",tarefaEncontrada);
		result.include("listaColaborador",listaColaborador);
	}
	
	@Get("/comentario/{id}")
	public void comentario(Long id) {		
		Tarefa tarefaEncontrada = dao.buscaPorId(id);
		List<ComentarioTarefa> listaComentarios = comentarioTarefaDao.listaComentariosDaTarefa(tarefaEncontrada);
		result.include("tarefa",tarefaEncontrada);		
		result.include("listaComentarios",listaComentarios);
	}
	
	@Get
	public void sendEmail(Long id) throws EmailException{
		Tarefa tarefa = dao.buscaPorId(id);
		List<Colaborador> seguidores = tarefa.getSeguidores();
		Colaborador criador = tarefa.getColaboradorCriador();
		Colaborador responsavel = tarefa.getColaboradorExecutor();
		Colaborador gestor = tarefa.getColaboradorGestor();
		HtmlEmail email = new HtmlEmail();
		email.setSubject("Nova Demanda");
		String msg = "<strong>Nova Demanda cadastrada por: </strong>" + criador.getNome() + "<br>" +
					 "<strong>Título: </strong>" + tarefa.getTitulo()+ "<br><br>"+
					 "<strong>Pessoas envolvidas: </strong><br><br>";
		StringBuilder msgFormatada = new StringBuilder();
		msgFormatada.append(msg);
		msgFormatada.append("<strong>Responsável: </strong>" + responsavel.getNome() + "<br>");
		if(gestor != null){
			msgFormatada.append("<strong>Gestor: </strong>" + gestor.getNome() + "<br>");
			email.addCc(gestor.getEmail(), gestor.getNome());
		}
		if(seguidores.size() > 0){
			msgFormatada.append("<strong>Seguidor(es): </strong><br>");
			for (Colaborador seguidor : seguidores) {
				msgFormatada.append(seguidor.getNome() + "<br>");
			}
		}
		email.setHtmlMsg(msgFormatada.toString());
		email.addTo(responsavel.getEmail(), responsavel.getNome());
		for (Colaborador seguidor : seguidores) {
			email.addCc(seguidor.getEmail(), seguidor.getNome());
		}
		mailer.send(email);
		result.redirectTo(this).formulario();
	}
}
