package br.com.viattec.centralinfo.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.ComentarioTarefa;
import br.com.viattec.centralinfo.model.Tarefa;

public class ComentarioTarefaDao {
	
	private final EntityManager em;
	
	@Inject
	public ComentarioTarefaDao(EntityManager em){
		this.em = em;
	}
	
	public ComentarioTarefaDao(){
		this(null);
	}
	
	public void add(ComentarioTarefa comentarioTarefa){
		em.getTransaction().begin();
		Date date = new Date(); 
		comentarioTarefa.setDataCriacao(date);
		em.persist(comentarioTarefa);
		em.getTransaction().commit();
	}
	
	public void update(ComentarioTarefa comentarioTarefa){
		em.getTransaction().begin();
		ComentarioTarefa comentarioTarefaDB = em.find(ComentarioTarefa.class, comentarioTarefa.getId());
		comentarioTarefaDB.setDataCriacao(comentarioTarefa.getDataCriacao());
		comentarioTarefaDB.setComentario(comentarioTarefa.getComentario());
		comentarioTarefaDB.setColaborador(comentarioTarefa.getColaborador());
		comentarioTarefaDB.setTarefa(comentarioTarefa.getTarefa());
		em.merge(comentarioTarefaDB);
		em.getTransaction().commit();
	}
	
	public void remove(Long id){
		em.getTransaction().begin();
		ComentarioTarefa comentarioTarefaDB = em.find(ComentarioTarefa.class, id);
		em.remove(comentarioTarefaDB);
		em.getTransaction().commit();
	}
	
	public ComentarioTarefa buscaPorId(Long id){
		return em.find(ComentarioTarefa.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<ComentarioTarefa> listaComentariosDaTarefa(Tarefa tarefa){
		return em.createQuery("select c from ComentarioTarefa c where tarefa = :tarefa")
				.setParameter("tarefa", tarefa)
				.getResultList();
	}
}
