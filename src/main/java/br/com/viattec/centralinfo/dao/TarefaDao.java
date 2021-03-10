package br.com.viattec.centralinfo.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Arquivo;
import br.com.viattec.centralinfo.model.Colaborador;
import br.com.viattec.centralinfo.model.Tarefa;

public class TarefaDao {
	
	public static final String STATUS_ANDAMENTO = "EM ANDAMENTO";
	public static final String STATUS_FINALIZADA = "FINALIZADA";
	public static final String STATUS_PENDENTE = "PENDENTE";
	
	private final EntityManager em;
	
	@Inject
	public TarefaDao(EntityManager em){
		this.em = em;
	}
	
	public TarefaDao(){
		this(null);
	}
	
	public void add(Tarefa tarefa){
		em.getTransaction().begin();
		em.persist(tarefa);
		em.getTransaction().commit();
	}
	
	public void update(Tarefa tarefa){
		em.getTransaction().begin();
		Tarefa tarefaBD = em.find(Tarefa.class, tarefa.getId());
		tarefaBD.setDataPrevistaEncerramento(tarefa.getDataPrevistaEncerramento());
		tarefaBD.setTitulo(tarefa.getTitulo());
		tarefaBD.setDescricao(tarefa.getDescricao());
		tarefaBD.setColaboradorExecutor(tarefa.getColaboradorExecutor());
		tarefaBD.setColaboradorGestor(tarefa.getColaboradorGestor());
		tarefaBD.setSeguidores(tarefa.getSeguidores());
		tarefaBD.setTag(tarefa.getTag());
		em.merge(tarefaBD);
		em.getTransaction().commit();
	}
	
	public void remove(Long id){
		em.getTransaction().begin();
		Tarefa tarefaBD = em.find(Tarefa.class, id);
		em.remove(tarefaBD);
		em.getTransaction().commit();
	}
	
	public Tarefa buscaPorId(Long id){
		return em.find(Tarefa.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Tarefa> listaMinhasTarefas(Colaborador colaborador){
		return em.createQuery("select t from Tarefa t where colaboradorExecutor = :colaboradorExecutor "
				+ "and status <> :status")
				.setParameter("colaboradorExecutor",colaborador)
				.setParameter("status", STATUS_FINALIZADA)
				.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Tarefa> listaMinhasTarefasDelegadas(Colaborador colaborador){
		return em.createQuery("select t from Tarefa t where colaboradorCriador = :colaboradorCriador "
				+ "and colaboradorExecutor <> :colaboradorCriador and status <> :status")
				.setParameter("colaboradorCriador",colaborador)
				.setParameter("status", STATUS_FINALIZADA)
				.getResultList();
	}
		
	public void atualizaStatusTarefaEmAndamento(Long id){
		em.getTransaction().begin();
		Tarefa tarefaEncontrada = em.find(Tarefa.class, id);
		tarefaEncontrada.setStatus(STATUS_ANDAMENTO);
		em.merge(tarefaEncontrada);
		em.getTransaction().commit();
	}
	
	public void atualizaStatusTarefaFinalizada(Long id){
		em.getTransaction().begin();
		Tarefa tarefaEncontrada = em.find(Tarefa.class, id);
		tarefaEncontrada.setStatus(STATUS_FINALIZADA);
		Date date = new Date(); 
		tarefaEncontrada.setDataEncerramento(date);
		em.merge(tarefaEncontrada);
		em.getTransaction().commit();
	}
	
	public void atribuiArquivosADemanda(Long id, List<Arquivo> arquivos){
		em.getTransaction().begin();
		Tarefa tarefaEncontrada = em.find(Tarefa.class, id);
		tarefaEncontrada.setArquivos(arquivos);
		em.merge(tarefaEncontrada);
		em.getTransaction().commit();
	}
}
