package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Canal;

public class CanalDao {
	
	private final EntityManager em;
	
	@Inject
	public CanalDao(EntityManager em){
		this.em = em;
	}
	
	public CanalDao(){
		this(null);
	}
	
	public void add(Canal canal){
		em.getTransaction().begin();
		em.persist(canal);
		em.getTransaction().commit();
	}
	
	public void update(Canal canal){
		em.getTransaction().begin();
		Canal canalBD = em.find(Canal.class, canal.getId());
		canalBD.setNome(canal.getNome());
		canalBD.setFinalidade(canal.getFinalidade());
		canalBD.setVisibilidade(canal.getVisibilidade());
		em.merge(canalBD);
		em.getTransaction().commit();
	}
	
	public void remove(Long id){
		em.getTransaction().begin();
		Canal canalBD = em.find(Canal.class, id);
		em.remove(canalBD);
		em.getTransaction().commit();
	}
	
	public Canal buscaPorId(Long id){
		return em.find(Canal.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Canal> lista(){
		return em.createQuery("select c from Canal c").getResultList();
	}
}
