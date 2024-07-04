package myweb.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import myweb.bean.User;
import myweb.utils.JpaUtils;

public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}

	public User create(User entity) {
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

	public User update(User entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}

	public User remove(String id) {
		try {
			em.getTransaction().begin();
			User entity = this.findById(id);
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}

	public User findById(String id) {
		return em.find(User.class, id);
	}

	public List<User> findByRole(boolean role) {
		String jpql = "Select o from Users o where o.admin=:role";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("role", role);
		List<User> list = query.getResultList();
		return list;
	}

	public List<User> findByKeyWord(String keyword) {
		String jpql = "Select o from Users o where o.fullname like ?0";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter(0, keyword);
		List<User> list = query.getResultList();
		return list;

	}

	public User findOne(String username, String password) {
		String jpql = "Select o from User o where o.tenTaiKhoan=:id and o.matKhau=:pass";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("id", username);
		query.setParameter("pass", password);
		return query.getSingleResult();
	}


	public List<User> findPage(int page, int size) {
		String jpql = "Select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setFirstResult(page*size);
		query.setMaxResults(size);
		List<User> list = query.getResultList();
		return list;
	}

	public List<User> findAll(){
		String jpql = "Select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		List<User> list = query.getResultList();
		return list;
	}
}
