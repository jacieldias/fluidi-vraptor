package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Aviso;

public class AvisoDao {
	
	private final EntityManager em;
	
	@Inject
	public AvisoDao(EntityManager em){
		this.em = em;
	}
	
	public AvisoDao(){
		this(null);
	}
	
	public void add(Aviso aviso){
		em.getTransaction().begin();
		em.persist(aviso);
		em.getTransaction().commit();
	}
	
	public void update(Aviso aviso){
		em.getTransaction().begin();
		Aviso avisoDB = em.find(Aviso.class, aviso.getId());
		avisoDB.setConteudo(aviso.getConteudo());
		avisoDB.setColaborador(aviso.getColaborador());
		em.merge(aviso);
		em.getTransaction().commit();
	}
	
	public void remove(Long id){
		em.getTransaction().begin();
		Aviso avisoEncontrado = em.find(Aviso.class, id);
		em.remove(avisoEncontrado);
		em.getTransaction().commit();
	}
	
	public Aviso buscaPorId(Long id) {
		return em.find(Aviso.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Aviso> lista() {
		return em.createQuery("select a from Aviso a").getResultList();
	}
}
