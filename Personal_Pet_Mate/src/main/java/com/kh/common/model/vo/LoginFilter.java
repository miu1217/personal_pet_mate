package com.kh.common.model.vo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginFilter
 */

//필터가 필요한 매핑주소가 여러개라면 {, , , }으로 나열하기
//만약 admin에 관련된 처리를 하는 매핑주소가 xxxx.ad일때
//  *.ad   .ad로 시작하는 모든걸 매핑주소 처리를함
//@WebFilter({"/myPage.me","/update.me","/delete.me"})
@WebFilter("*.myPage")
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//그냥 url에서 /myPage.me를 추가하면 들어가짐 그래서 이를 방지하기위해 로그인이 안되면 alert창 뜨게하기
		//로그인된 사람만 들어가게하고 로그인안되어있으면 막아주기
		
		//서블렛에서는 HttpServletRequest인데 filter에서는 ServletRequest임
		//즉 얘가 더 상위요소여서 다운캐스팅을 써야 session객체를 사용할수있음
		HttpSession session = ((HttpServletRequest)request).getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { //로그인이 되어있다면
			//요청을 그대로 유지
			chain.doFilter(request, response);   //그대로 유지해주는 코드
			
				
		}else { //로그인이 되어있지 않다면
			//흐름을 바꿔주는 작업처리
			session.setAttribute("message", "로그인이 필요한 서비스입니다.로그인 후 이용해주세요.");
			//response도 마찬가지로 다운캐스팅 해주기
			((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath());
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
