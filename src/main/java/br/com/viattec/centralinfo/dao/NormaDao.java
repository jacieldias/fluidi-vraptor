package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Norma;

public class NormaDao {
	
	private final EntityManager em;
	
	@Inject
	public NormaDao(EntityManager em){
		this.em = em;
	}
	
	public NormaDao(){
		this(null);
	}
	
	public void add(Norma norma){
		em.getTransaction().begin();
		em.persist(norma);
		em.getTransaction().commit();
	}
	
	public void update(Norma norma){
		em.getTransaction().begin();
		Norma normaDB = em.find(Norma.class, norma.getId());
		normaDB.setTitulo(norma.getTitulo());
		normaDB.setDescricao(norma.getDescricao());
		normaDB.setSetor(norma.getSetor());
		normaDB.setColaborador(norma.getColaborador());
		em.merge(normaDB);
		em.getTransaction().commit();
	}
	
	public void remove(Long id){
		em.getTransaction().begin();
		Norma normaEncontrada = em.find(Norma.class, id);
		em.remove(normaEncontrada);
		em.getTransaction().commit();	
	}
	
	public Norma buscaPorId(Long id) {
		return em.find(Norma.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Norma> lista() {
		return em.createQuery("select n from Norma n").getResultList();
	}
}
