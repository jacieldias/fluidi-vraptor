package br.com.viattec.centralinfo.util;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;

public class EntityManagerProducer {
	@Produces @RequestScoped
	private EntityManager createEntityManager() {
		return JPAUtil.getEntityManager();
	}

}
