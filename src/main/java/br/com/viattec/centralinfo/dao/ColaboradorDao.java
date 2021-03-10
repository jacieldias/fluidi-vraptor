package br.com.viattec.centralinfo.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.viattec.centralinfo.model.Colaborador;

public class ColaboradorDao {

	private EntityManager em;
	
	@Inject
	public ColaboradorDao(EntityManager em){
		this.em = em;
	}
	
	public ColaboradorDao(){
		this(null);
	}
	
	public Colaborador existe(Colaborador colaborador){
		try{
			return em.createQuery("select c from Colaborador c where upper(c.login) = :login and c.senha = :senha",Colaborador.class)
					.setParameter("login", colaborador.getLogin().trim().toUpperCase())
					.setParameter("senha", colaborador.getSenha().trim())
					.getSingleResult();
		}catch(NoResultException e){
			return null;
		}
	}
	
	public Colaborador existeLogin(Colaborador colaborador){
		try{
			return em.createQuery("select c from Colaborador c where upper(c.login) = :login",Colaborador.class)
					.setParameter("login", colaborador.getLogin().trim().toUpperCase())
					.getSingleResult();
		}catch(NoResultException e){
			return null;
		}
	}
	
	public void add(Colaborador colaborador){
		em.getTransaction().begin();
		em.persist(colaborador);
		em.getTransaction().commit();	
	}
	
	public void update(Colaborador colaborador){
		em.getTransaction().begin();
		Colaborador colaboradorBD = em.find(Colaborador.class, colaborador.getId());
		colaboradorBD.setNome(colaborador.getNome());
		colaboradorBD.setEmail(colaborador.getEmail());
		colaboradorBD.setLogin(colaborador.getLogin());
		colaboradorBD.setSenha(colaborador.getSenha());
		colaboradorBD.setConfirmaSenha(colaborador.getConfirmaSenha());
		colaboradorBD.setTipoColaborador(colaborador.getTipoColaborador());
		colaboradorBD.setSetor(colaborador.getSetor());
		em.merge(colaboradorBD);
		em.getTransaction().commit();
	}
	
	public void remove(Long id, String nome){
		em.getTransaction().begin();
		Colaborador colaboradorBD = em.find(Colaborador.class, id);
		em.remove(colaboradorBD);
		em.getTransaction().commit();
	}
	
	public Colaborador buscaPorId(Long id){
		return em.find(Colaborador.class, id);
	}
	
	public Colaborador buscaPorLogin(String login){
		return em.createQuery("select c from Colaborador c where c.login = :login",Colaborador.class)
		.setParameter("login", login.trim())
		.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Colaborador> lista(){
		return em.createQuery("select c from Colaborador c").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Colaborador> buscaPorNome(String nome){
		return em.createQuery("select c from Colaborador c where c.nome like %:nome")
				.setParameter("nome", nome.trim())
				.getResultList();
	}
	
	public void alteraSenha(Colaborador colaborador){
		em.getTransaction().begin();
		Colaborador colaboradorEncontrado = em.find(Colaborador.class, colaborador.getId());
		colaboradorEncontrado.setSenha(colaborador.getSenha());
		colaboradorEncontrado.setConfirmaSenha(colaborador.getConfirmaSenha());
		em.merge(colaboradorEncontrado);
		em.getTransaction().commit();
	}
}
