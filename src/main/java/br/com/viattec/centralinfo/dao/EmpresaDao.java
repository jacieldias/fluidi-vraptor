package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.viattec.centralinfo.model.Empresa;

public class EmpresaDao {
	
	private final EntityManager em;
	
	@Inject
	public EmpresaDao(EntityManager em){
		this.em = em;
	}

	public EmpresaDao(){
		this(null);
	}
	
	public void add(Empresa empresa){
		em.getTransaction().begin();
		em.persist(empresa);
		em.getTransaction().commit();
	}
	
	public void update(Empresa empresa){
		em.getTransaction().begin();
		Empresa empresaDB = em.find(Empresa.class, empresa.getId());
		empresaDB.setNomeFantasia(empresa.getNomeFantasia());
		empresaDB.setRazaoSocial(empresa.getRazaoSocial());
		empresaDB.setTelefone(empresa.getTelefone());
		em.merge(empresaDB);
		em.getTransaction().commit();
	}
	
	public void remove(Long id, String nomeFantasia){
		em.getTransaction().begin();
		Empresa empresaDB = em.find(Empresa.class, id);
		em.remove(empresaDB);
		em.getTransaction().commit();
	}
	
	public Empresa buscaPorId(Long id){
		return em.find(Empresa.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Empresa> lista(){
		return em.createQuery("select e from Empresa e").getResultList();
	}

}
