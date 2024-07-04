package myweb.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myweb.bean.User;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "/admin","/video", "/add_video", "/update_video",
		"/edit_video/*", "/remove_video/*", "/find_video", "/fill_video/*", "/favorite_video/*", "/user",
		"/update_user", "/edit_user/*", "/remove_user/*", "/find_user", "/baocao", "/video_ql", "/favorite"})
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		String error = "";
		if(user == null) {
			error = response.encodeURL("Vui lòng nhập đăng nhập") ;

		}
		else if(!user.getChucNang() && uri.contains("/admin")) {
			error = response.encodeURL("vui lòng đăng nhập bằng vai trò admin") ;

		}
		if(!error.isEmpty()) {
			request.getRequestDispatcher("/views/main/main.jsp").forward(request, response);
		}
		else {
			chain.doFilter(request, response);
		}

	}

}
