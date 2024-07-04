package myweb.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import myweb.bean.Video;
import myweb.utils.JpaUtils;

public class VideoDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}
	public Video create(Video video) {
		try {
			em.getTransaction().begin();
			em.persist(video);
			em.getTransaction().commit();
			return video;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);

		}

	}

	public Video update(Video entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {

			em.getTransaction().rollback();
			throw new RuntimeException(e);

		}
	}

	public Video remove(int id) {
		try {
			em.getTransaction().begin();
			Video entity = this.findById(id);
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}

	public Video findById(int videoID) {
		return em.find(Video.class, videoID);
	}
	public List<Video> fillAll(){
		String jpql = "Select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	public List<Video> fillCategory(String category){
		String spql = "Select distinct o from Video o where o.theLoai like:category";
		TypedQuery<Video> query = em.createQuery(spql, Video.class);
		query.setParameter("category", "%" + category + "%");
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> fillTitle(String nameVideo){
		String spql = "Select distinct o from Video o where o.tenPhim like:nameVideo";
		TypedQuery<Video> query = em.createQuery(spql, Video.class);
		query.setParameter("nameVideo", "%" + nameVideo + "%");
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> fillVideoNew(Date date){
		String spql = "Select distinct o from Video o where o.ngayRaMat  = date";
		TypedQuery<Video> query = em.createQuery(spql, Video.class);
		query.setParameter("date", "%" + date + "%");
		List<Video> list = query.getResultList();
		return list;
	}

}
