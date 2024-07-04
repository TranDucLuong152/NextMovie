package myweb.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import myweb.bean.Favorite;
import myweb.bean.User;
import myweb.bean.Video;
import myweb.dao.FavoritesDAO;
import myweb.dao.UserDAO;
import myweb.dao.VideoDAO;
import myweb.utils.JpaUtils;

@WebServlet({ "/Main_servlet", "/login", "/sign_up_user", "/sign_up_admin", "/video", "/add_video", "/update_video",
		"/edit_video/*", "/remove_video/*", "/find_video","/find_video_delete", "/fill_video/*", "/favorite_video/*",
		"/favorite_delete_video/*", "/user", "/update_user", "/edit_user/*", "/remove_user/*", "/find_user", "/baocao",
		"/video_ql","/quaylai_homePage", "/favorite", "/DangXuat", "/per", "/next","/thongkeUser","/thongkeVideo" })
public class Main_servlet<K> extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public EntityManager em = JpaUtils.getEntityManager();
	String content_jsp = "content_main/quanly_video.jsp";
	String name_admin;
	String video_jsp = "slide_video.jsp";
	boolean chucNang = false;
	boolean login = false;
	int sizeTLMa = 0;
	int sizeTLHD = 0;
	int sizeTLKH = 0;
	int sizeTLDS = 0;
	int demTLMa = 1;
	int demTLHD = 1;
	int demTLKH = 1;
	int demTLDS = 1;

	public Main_servlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String uri = request.getRequestURI();
			if (uri.contains("fill_video")) {
				video_jsp = "components_video.jsp";
				request.setAttribute("video_jsp", video_jsp);
				int id = Integer.parseInt(request.getParameter("id"));
				if (request.getParameter("id") != null) {
					fillOne_Video(request, response, id);
					fillAll_Video_TL(request, response, "Phim ma");
					fillAll_Video_TL(request, response, "Phim hành động");
					fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
					fillAll_Video_TL(request, response, "Phim đặc sắc");
					request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);
				}
			}

			else if (uri.contains("edit_user")) {
				fillAll_User(request, response);
				String id = request.getParameter("id_user");
				if (request.getParameter("id_user") != null) {
					fill_User(request, response, id);
					request.getRequestDispatcher("/views/content_admin/content_main/user/update_user.jsp")
							.forward(request, response);
				}

			} else if (uri.contains("remove_user")) {
				fillAll_User(request, response);
				String id = request.getParameter("id_user");
				if (request.getParameter("id_user") != null) {
					Delete_User(request, response, id);
					fillAll_User(request, response);
					request.getRequestDispatcher("/views/content_admin/content_main/user/delete_user.jsp")
							.forward(request, response);
				}

			} else if (uri.contains("edit_video")) {
				fillAll_Video(request, response);
				int id = Integer.parseInt(request.getParameter("id_video"));
				if (request.getParameter("id_video") != null) {
					fillOne_Video(request, response, id);
					request.getRequestDispatcher("/views/content_admin/content_main/video/update_video.jsp")
							.forward(request, response);
				}

			} else if (uri.contains("remove_video")) {
				fillAll_Video(request, response);
				int id = Integer.parseInt(request.getParameter("id_video"));
				if (request.getParameter("id_video") != null) {

					VideoDAO daoVD = new VideoDAO();
					daoVD.remove(id);
					request.getRequestDispatcher("/views/content_admin/content_main/video/delete_video.jsp")
							.forward(request, response);
				}

			} else if (uri.contains("favorite_video")) {
				VideoDAO daoVD = new VideoDAO();
				int id = Integer.parseInt(request.getParameter("id_video"));
				if (request.getParameter("id_video") != null) {
					try {
						User user = (User) request.getSession().getAttribute("user");
						Video videoFavorite = daoVD.findById(id);

						request.setAttribute("video_id", videoFavorite);
						Create_Favorite(request, response, user, videoFavorite);

					} catch (Exception e) {
						// TODO: handle exception
					}
					video_jsp = "slide_video.jsp";
					request.setAttribute("video_jsp", video_jsp);
					fillAll_Video_TL(request, response, "Phim ma");
					fillAll_Video_TL(request, response, "Phim hành động");
					fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
					fillAll_Video_TL(request, response, "Phim đặc sắc");
					request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);
				}

			} else if (uri.contains("favorite_delete_video")) {
				VideoDAO daoVD = new VideoDAO();
				int id = Integer.parseInt(request.getParameter("id_video_dl"));
				if (request.getParameter("id_video_dl") != null) {
					try {
						Video video = new Video();
						video = daoVD.findById(id);
						User user = (User) request.getSession().getAttribute("user");
						Delete_Favorite(request, response, user, video);

					} catch (Exception e) {

					}
					video_jsp = "slide_video.jsp";
					request.setAttribute("video_jsp", video_jsp);
					fillAll_Video_TL(request, response, "Phim ma");
					fillAll_Video_TL(request, response, "Phim hành động");
					fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
					fillAll_Video_TL(request, response, "Phim đặc sắc");
					request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);
				}

			} else if (uri.contains("favorite")) {
				fill_Favorite(request, response);
				request.getRequestDispatcher("/views/content_web/favorite.jsp").forward(request, response);

			} else if (uri.contains("DangXuat")) {
				request.getSession().setAttribute("user", null);
				video_jsp = "slide_video.jsp";
				request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
			} else if (uri.contains("video_ql")) {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				fillAll_Video(request, response);
				fillAll_Favorite_User(request, response);
				fillAll_Favorite_Video(request, response);
				fillAll_User(request, response);
				request.setAttribute("content_admin", content_jsp);
				request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);

			} else if (uri.contains("next")) {

				request.setAttribute("phimhd", "phimhd");

				++demTLHD;
				if (demTLHD == sizeTLHD) {
					request.setAttribute("btnper_phimhd2", "pe-none");

				}
				request.setAttribute("demTLHD", demTLHD);

				VideoDAO daoVD = new VideoDAO();
				Video video = daoVD.findById(10);

				request.setAttribute("video_id", video);
				request.setAttribute("video_jsp", video_jsp);
				fillAll_Video_TL(request, response, "Phim ma");
				fillAll_Video_TL(request, response, "Phim hành động");
				fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
				fillAll_Video_TL(request, response, "Phim đặc sắc");
				request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);

			} else if (uri.contains("per")) {
				if (demTLHD <= 1) {
					request.setAttribute("btnper_phimhd1", "pe-none");

				}
				request.setAttribute("phimhd", "phimhd");
				--demTLHD;

				request.setAttribute("demTLHD", demTLHD);

				VideoDAO daoVD = new VideoDAO();
				Video video = daoVD.findById(10);

				request.setAttribute("video_id", video);
				request.setAttribute("video_jsp", video_jsp);
				fillAll_Video_TL(request, response, "Phim ma");
				fillAll_Video_TL(request, response, "Phim hành động");
				fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
				fillAll_Video_TL(request, response, "Phim đặc sắc");
				request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);

			}
			else if (uri.contains("quaylai_homePage")) {
				VideoDAO daoVD = new VideoDAO();
				Video video = daoVD.findById(10);
				request.setAttribute("demTLHD", demTLHD);
				request.setAttribute("video_id", video);
				request.setAttribute("video_jsp", video_jsp);
				fillAll_Video_TL(request, response, "Phim ma");
				fillAll_Video_TL(request, response, "Phim hành động");
				fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
				fillAll_Video_TL(request, response, "Phim đặc sắc");
				request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);

			}

			request.setCharacterEncoding("utf-8");
			fillAll_Video(request, response);

			request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);

		} catch (Exception e) {

		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String uri = request.getRequestURI();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			switch (uri) {
			case "/Assignment_Java4/login": {
				fillOne_User(request, response);

				if (chucNang && login) {

					fillAll_Video(request, response);
					request.setAttribute("content_admin", content_jsp);
					request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);

				} else if (!chucNang && login) {
					VideoDAO daoVD = new VideoDAO();
					Video video = daoVD.findById(10);
					request.setAttribute("demTLHD", demTLHD);
					request.setAttribute("video_id", video);
					request.setAttribute("video_jsp", video_jsp);
					fillAll_Video_TL(request, response, "Phim ma");
					fillAll_Video_TL(request, response, "Phim hành động");
					fillAll_Video_TL(request, response, "Phim khoa học viễn tưởng");
					fillAll_Video_TL(request, response, "Phim đặc sắc");
					request.getRequestDispatcher("/views/content_web/home.jsp").forward(request, response);
				} else {
					request.setAttribute("thongBaoLogin", "Sai username & password");
					request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
				}
				break;
			}

			case "/Assignment_Java4/sign_up_user": {
				Create_User(request, response, false);
				request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/sign_up_admin": {
				Create_User(request, response, true);
				request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/video": {
				fillAll_Video(request, response);
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				content_jsp = "content_main/quanly_video.jsp";
				request.setAttribute("admin_name", name_admin);
				request.setAttribute("content_admin", content_jsp);
				request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/add_video": {
				Create_Video(request, response);
				fillAll_Video(request, response);
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				content_jsp = "content_main/quanly_video.jsp";
				request.setAttribute("admin_name", name_admin);
				request.setAttribute("content_admin", content_jsp);
				request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/update_video": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				Update_Video(request, response);
				fillAll_Video(request, response);
				request.getRequestDispatcher("/views/content_admin/content_main/video/update_video.jsp")
						.forward(request, response);
				break;
			}
			case "/Assignment_Java4/find_video": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				String title = request.getParameter("title_video");
				titleSearch(request, response, title);
				request.getRequestDispatcher("/views/content_admin/content_main/video/find_video.jsp").forward(request,
						response);
				break;
			}
			case "/Assignment_Java4/find_video_delete": {

				String title = request.getParameter("title_video_delete");
				titleSearch(request, response, title);
				request.getRequestDispatcher("/views/content_admin/content_main/video/delete_video.jsp").forward(request,
						response);
				break;
			}
			case "/Assignment_Java4/delete_video": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				Update_Video(request, response);
				fillAll_Video(request, response);
				break;
			}
			case "/Assignment_Java4/find_user": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				UserSearch(request, response);
				request.getRequestDispatcher("/views/content_admin/content_main/user/find_user.jsp").forward(request,
						response);
				break;
			}

			case "/Assignment_Java4/user": {
				fillAll_User(request, response);
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				content_jsp = "content_main/quanly_user.jsp";
				request.setAttribute("admin_name", name_admin);
				request.setAttribute("content_admin", content_jsp);
				request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/update_user": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				Update_User(request, response);
				fillAll_User(request, response);
				request.getRequestDispatcher("/views/content_admin/content_main/user/update_user.jsp").forward(request,
						response);
				break;
			}
			case "/Assignment_Java4/baocao": {
				User user = (User) request.getSession().getAttribute("user");
				request.setAttribute("admin_name", user.getTenTaiKhoan());
				fillAll_Favorite_User(request, response);

				fillAll_Favorite_Video(request, response);
				request.setAttribute("admin_name", name_admin);
				content_jsp = "content_main/baocao_thongke.jsp";
				request.setAttribute("content_admin", content_jsp);
				request.getRequestDispatcher("/views/content_admin/home_admin.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/thongkeUser": {
				String title = request.getParameter("title_tk");

				findAll_Favorite_Video(request, response, title);
				request.getRequestDispatcher("/views/content_admin/content_main/baocao/locYTtheoTP.jsp").forward(request, response);
				break;
			}
			case "/Assignment_Java4/thongkeVideo": {
				String title = request.getParameter("title_tk_user");

				findAll_Favorite_User(request, response, title);
				request.getRequestDispatcher("/views/content_admin/content_main/baocao/thongke.jsp").forward(request, response);
				break;
			}
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void fillAll_User(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDAO daoUS = new UserDAO();
			List<User> user = daoUS.findAll();
			request.setAttribute("filluser", user);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void fill_User(HttpServletRequest request, HttpServletResponse response, String id)
			throws ServletException, IOException {
		try {
			UserDAO daoUS = new UserDAO();
			User user = daoUS.findById(id);
			request.setAttribute("fill_one_user", user);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected boolean fillOne_User(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("tenTaiKhoan");
			String pass = request.getParameter("matKhau");

			UserDAO daoUser = new UserDAO();
			User list = daoUser.findOne(id, pass);
			request.getSession().setAttribute("user", list);
			if (list != null) {

				if (list.getChucNang()) {

					chucNang = true;
				} else {
					chucNang = false;
				}
				login = true;
				name_admin = request.getParameter("tenTaiKhoan");
				request.setAttribute("admin_name", name_admin);
				request.setAttribute("btn_text", "text-success");
				request.setAttribute("thongBaoLogin", "Đăng nhập thành công");
			} else {
				login = false;
				request.setAttribute("btn_text", "text-danger");
				request.setAttribute("thongBaoLogin", "Sai username & password");
			}
		} catch (Exception e) {
			e.printStackTrace();
			login = false;
			request.setAttribute("btn_text", "text-danger");
			request.setAttribute("thongBaoLogin", "Sai username & password");
		}
		return chucNang;
	}

	protected void Create_User(HttpServletRequest request, HttpServletResponse response, boolean role)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			user.setChucNang(role);
			user.setImg("https://methnani.nl/wp-content/uploads/2012/07/onbekend-persoon.png");
			UserDAO daoUser = new UserDAO();
			daoUser.create(user);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Update_User(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			UserDAO daoUser = new UserDAO();
			daoUser.update(user);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Delete_User(HttpServletRequest request, HttpServletResponse response, String id)
			throws ServletException, IOException {
		try {
			UserDAO daoUser = new UserDAO();
			daoUser.remove(id);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void UserSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String title = request.getParameter("title_user");
			String spql = "Select distinct o from User o where o.tenTaiKhoan like:keyword or o.hoTen like:hoten";
			TypedQuery<User> query = em.createQuery(spql, User.class);
			query.setParameter("keyword", "%" + title + "%");

			query.setParameter("hoten", "%" + title + "%");
			List<User> list = query.getResultList();
			request.setAttribute("filluser", list);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void fillAll_Video(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			VideoDAO daoVD = new VideoDAO();
			List<Video> videos = daoVD.fillAll();
			request.setAttribute("fillvideo", videos);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void fillAll_Video_TL(HttpServletRequest request, HttpServletResponse response, String theLoai)

			throws ServletException, IOException {

		try {
			switch (theLoai) {
			case "Phim ma": {
				VideoDAO daoVD = new VideoDAO();
				List<Video> list_video1 = daoVD.fillCategory("Phim ma");
				sizeTLMa = list_video1.size() / 4;
				if (sizeTLMa == 1) {
					request.setAttribute("btnper_phimma", "disabled");

				}
				request.setAttribute("size_phimma", sizeTLMa);
				request.setAttribute("phim_ma", list_video1);

			}
			case "Phim hành động": {
				VideoDAO daoVD = new VideoDAO();
				List<Video> list_video2 = daoVD.fillCategory("Phim hành động");
				sizeTLHD = list_video2.size() / 4;
				if (sizeTLHD == 1) {
					request.setAttribute("btnper_phimhd", "disabled");

				}
				request.setAttribute("size_phimhd", sizeTLHD);
				request.setAttribute("phim_HD", list_video2);

			}
			case "Phim khoa học viễn tưởng": {

				VideoDAO daoVD = new VideoDAO();
				List<Video> list_video3 = daoVD.fillCategory("Phim khoa học viễn tưởng");
				sizeTLKH = list_video3.size() / 4;
				if (sizeTLKH == 1) {
					request.setAttribute("btnper_phimkh", "disabled");

				}
				request.setAttribute("size_phimkh", sizeTLKH);
				request.setAttribute("phim_KH", list_video3);

			}
			case "Phim đặc sắc": {

				VideoDAO daoVD = new VideoDAO();
				List<Video> list_video4 = daoVD.fillCategory("Phim đặc sắc");
				sizeTLDS = list_video4.size() / 4;
				if (sizeTLDS == 1) {
					request.setAttribute("btnper_phimds", "disabled");

				}
				request.setAttribute("size_phimds", sizeTLDS);
				request.setAttribute("phim_DS", list_video4);

			}

			default:
				throw new IllegalArgumentException("Unexpected value: " + theLoai);
			}
		} catch (Exception e) {

		}

	}

	protected void fillOne_Video(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {
		try {
			Video video = new Video();
			VideoDAO daoVD = new VideoDAO();
			video = daoVD.findById(id);
			request.setAttribute("video_id", video);
			switch (video.getTheLoai()) {
			case "Phim ma": {
				VideoDAO daoVD_LQ = new VideoDAO();
				List<Video> list_video1 = daoVD_LQ.fillCategory("Phim ma");
				request.setAttribute("video_LQ", list_video1);
				break;

			}
			case "Phim hành động": {

				VideoDAO daoVD_LQ = new VideoDAO();
				List<Video> list_video2 = daoVD_LQ.fillCategory("Phim hành động");
				request.setAttribute("video_LQ", list_video2);
				break;
			}
			case "Phim khoa học viễn tưởng": {
				VideoDAO daoVD_LQ = new VideoDAO();
				List<Video> list_video3 = daoVD_LQ.fillCategory("Phim khoa học viễn tưởng");
				request.setAttribute("video_LQ", list_video3);
				break;
			}
			case "Phim đặc sắc": {
				VideoDAO daoVD_LQ = new VideoDAO();
				List<Video> list_video4 = daoVD_LQ.fillCategory("Phim đặc sắc");
				request.setAttribute("video_LQ", list_video4);
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + video.getTheLoai());

			}

		} catch (Exception e) {

		}

	}

	protected void Create_Video(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VideoDAO daoVD = new VideoDAO();
		try {
			Date date = new Date();
			Video video = new Video();
			BeanUtils.populate(video, request.getParameterMap());
			video.setNgayRaMat(date);

			daoVD.create(video);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Update_Video(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Date date = new Date();
			Video video = new Video();

			BeanUtils.populate(video, request.getParameterMap());

			video.setNgayRaMat(date);
			VideoDAO daoVD = new VideoDAO();
			daoVD.update(video);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Delete_Video(HttpServletRequest request, HttpServletResponse response, int id)
			throws ServletException, IOException {
		try {
			VideoDAO daoVD = new VideoDAO();
			daoVD.remove(id);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void titleSearch(HttpServletRequest request, HttpServletResponse response ,String title)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			String spql = "Select distinct o from Video o where o.tenVideo like:keyword or o.theLoai like:theloai";
			TypedQuery<Video> query = em.createQuery(spql, Video.class);
			query.setParameter("keyword", "%" + title + "%");

			query.setParameter("theloai", "%" + title + "%");
			List<Video> list = query.getResultList();
			request.setAttribute("fillvideo", list);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void fill_Favorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			EntityManager em = myweb.utils.JpaUtils.getEntityManager();

			String spql = "SELECT DISTINCT v FROM Video v JOIN v.favorites f JOIN f.user u WHERE u.tenTaiKhoan = :tenTaiKhoan";
			User user = (User) request.getSession().getAttribute("user");

			TypedQuery<Video> query = em.createQuery(spql, Video.class);
			query.setParameter("tenTaiKhoan", user.getTenTaiKhoan());
			List<Video> list = query.getResultList();
			request.setAttribute("fillfavorite", list);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void fillAll_Favorite_User(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			EntityManager em = myweb.utils.JpaUtils.getEntityManager();

			String spql = "SELECT DISTINCT v FROM Video v JOIN v.favorites f JOIN f.user u ";

			TypedQuery<Video> query = em.createQuery(spql, Video.class);

			List<Video> list = query.getResultList();
			request.setAttribute("fillAllfavorite", list);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	protected void fillAll_Favorite_Video(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			EntityManager em = myweb.utils.JpaUtils.getEntityManager();

			String spql = "SELECT DISTINCT u FROM User u JOIN u.favorites f JOIN f.video v ";

			TypedQuery<User> query = em.createQuery(spql, User.class);


			List<User> list = query.getResultList();
			request.setAttribute("findFavorite_user", list);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	protected void findAll_Favorite_User(HttpServletRequest request, HttpServletResponse response,String tenUser)
			throws ServletException, IOException {
		try {

			EntityManager em = myweb.utils.JpaUtils.getEntityManager();

			String spql = "SELECT DISTINCT v FROM Video v JOIN v.favorites f JOIN f.user u where u.tenTaiKhoan like:tenUser";

			TypedQuery<Video> query = em.createQuery(spql, Video.class);
			query.setParameter("tenUser", tenUser);

			List<Video> list = query.getResultList();
			request.setAttribute("fillAllfavorite", list);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	protected void findAll_Favorite_Video(HttpServletRequest request, HttpServletResponse response,String tenVideo)
			throws ServletException, IOException {
		try {

			EntityManager em = myweb.utils.JpaUtils.getEntityManager();

			String spql = "SELECT DISTINCT u FROM User u JOIN u.favorites f JOIN f.video v where v.tenVideo like:tenVideo";

			TypedQuery<User> query = em.createQuery(spql, User.class);
			query.setParameter("tenVideo", "%" + tenVideo + "%");

			List<User> list = query.getResultList();
			request.setAttribute("findFavorite_user", list);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Create_Favorite(HttpServletRequest request, HttpServletResponse response, User user, Video video)
			throws ServletException, IOException {
		try {

			FavoritesDAO daoF = new FavoritesDAO();
			Date date = new Date();
			Favorite favorite = new Favorite(user, video, date);
			daoF.create(favorite);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	protected void Delete_Favorite(HttpServletRequest request, HttpServletResponse response, User user, Video video)
			throws ServletException, IOException {
		try {
			FavoritesDAO daoF = new FavoritesDAO();
			daoF.remove(user, video);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
