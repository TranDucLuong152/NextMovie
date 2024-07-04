package myweb.dao;

import javax.persistence.EntityManager;

import myweb.utils.JpaUtils;

public class ShareDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

}
