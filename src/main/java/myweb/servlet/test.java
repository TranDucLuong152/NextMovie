package myweb.servlet;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import myweb.bean.User;
import myweb.bean.Video;
import myweb.dao.UserDAO;
import myweb.utils.JpaUtils;




public class test {
	public static void main(String[] args) {

		try {
		
			UserDAO dao = new UserDAO();
			User u = dao.findOne("myNguyen", "123");
			System.out.println(u);
			System.out.println("test");

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
