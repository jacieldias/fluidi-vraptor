package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Setor;

public class SetorDao {
	
	private final EntityManager em;
	
	@Inject
	public SetorDao(EntityManager em){
		this.em = em;
	}
	
	public SetorDao(){
		this(null);
	}
	
	public void add(Setor setor){
		em.getTransaction().begin();
		em.persist(setor);
		em.getTransaction().commit();
	}
	
	public void update(Setor setor) {
		Setor setorBD = new Setor();
		em.getTransaction().begin();
		setorBD = em.find(Setor.class, setor.getId());
		setorBD.setDescricao(setor.getDescricao());
		em.merge(setorBD);
		em.getTransaction().commit();
	}
	
	public void remove(int id, String descricao){
		em.getTransaction().begin();
		Setor setorBD = em.find(Setor.class, id);
		em.remove(setorBD);
		em.getTransaction().commit();
	}
	
	public Setor buscaPorId(int id) {
		return em.find(Setor.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Setor> lista() {
		return em.createQuery("select s from Setor s").getResultList();
	}
}
