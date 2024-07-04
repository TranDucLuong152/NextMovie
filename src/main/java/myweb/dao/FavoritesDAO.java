package myweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import myweb.bean.Favorite;
import myweb.bean.User;
import myweb.bean.Video;
import myweb.utils.JpaUtils;

public class FavoritesDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}
	public Favorite create(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}


	public Favorite remove(User user,Video video) {
		try {
			em.getTransaction().begin();
			Favorite entity = this.findById(user,video);
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);

		}
	}
	public Favorite findById(User user,Video video) {
		String jpql = "Select f FROM Favorite f where f.user =:user and f.video =:video";

		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("user", user);
		query.setParameter("video", video);
		return query.getSingleResult();

	}
	public List<Favorite> fillAll(){
		String jpql = "Select o from Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		List<Favorite> list = query.getResultList();
		return list;
	}
}
