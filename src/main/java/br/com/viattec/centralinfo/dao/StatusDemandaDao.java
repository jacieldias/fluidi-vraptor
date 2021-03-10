package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.StatusDemanda;

public class StatusDemandaDao {
	
	private EntityManager em;
	
	@Inject
	public StatusDemandaDao(EntityManager em) {
		this.em = em;
	}
	
	public void salvar(StatusDemanda statusDemanda){
		em.getTransaction().begin();
		if(statusDemanda.getId() == null)
			em.persist(statusDemanda);
		else
			em.merge(statusDemanda);	
		em.getTransaction().commit();
	}
	
	public StatusDemanda buscaPorId(Long id){
		return em.find(StatusDemanda.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<StatusDemanda> lista(){
		return em.createQuery("select s from demanda_status s").getResultList(); 
	}

}
