package com.teng.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teng.model.Agency;
import com.teng.service.AgencyService;
import com.teng.service.AgencyServiceImpl;
import com.teng.utils.CookieUtil;

@WebServlet(urlPatterns={"*.ado"})
public class AgencyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AgencyService agencyService=new AgencyServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//在这个方法里处理增删查改
				//设置字符集，防止中文乱码
				req.setCharacterEncoding("UTF-8");
				resp.setCharacterEncoding("UTF-8");
				String a=req.getServletPath();//获取servlet路径，如：/query.udo
				String b=a.substring(1, a.length()-4);//获取.udo的前缀，如：query
				try {
					//根据b值自动调用下面与b名一样的方法
					Method mothod=this.getClass().getDeclaredMethod(b,HttpServletRequest.class,HttpServletResponse.class);
					mothod.invoke(this,req,resp);
				} catch (Exception e) {
					e.printStackTrace();
				} 
	}
	private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Agency agency=new Agency();
		agency.setAname(req.getParameter("aname"));
		agency.setApassword(req.getParameter("apassword"));
		agency.setAsex(req.getParameter("asex"));
		agency.setAphone(req.getParameter("aphone"));
		agency.setAremark(req.getParameter("aremark"));
		agency.setAclass(req.getParameter("aclass"));
		System.out.println(agency);
		int i=agencyService.save(agency);
		if(i>0){
			req.getRequestDispatcher("/seetable?table=agency").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
	
	private void find(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("ano");
		String aname=req.getParameter("aname");
		String aphone=req.getParameter("aphone");
		String use=req.getParameter("use");
		req.setAttribute("use", use);
		if(num!=""&&num!=null){
			int ano=Integer.parseInt(req.getParameter("ano"));
			Agency agency=agencyService.get(ano);
			if(agency!=null){
				req.setAttribute("agency", agency);
				req.getRequestDispatcher("/find-a.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-a.jsp").forward(req, resp);
			}	
		}else{
			List<Agency> list=agencyService.find(aname,aphone);
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("userlist", list);
				req.getRequestDispatcher("/find-a.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-a.jsp").forward(req, resp);
			}	
		}
	}
	/**
	 * 删除前确定信息，返回一个agency对象
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delecheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("ano");
		if(num!=null&&num!=""){
			int ano=Integer.parseInt(num);
			Agency agency=agencyService.get(ano);
			if(agency!=null){
				req.setAttribute("agency", agency);
				req.getRequestDispatcher("/delete.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/delete.jsp").forward(req, resp);
			}	
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
		
	}
	/**
	 * 删除一个对象
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("ano");
		if(num!=null&&num!=""){
			int ano=Integer.parseInt(num);
			int i=agencyService.deleteUserById(ano);
			if(i!=0){
				req.getRequestDispatcher("/seetable?table=agency").forward(req, resp);
			}else{
				resp.sendRedirect(req.getContextPath()+"/error.jsp");
			}
		}
	}
	/**
	 * 批量删除
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delemore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String[] moreA=req.getParameterValues("moreA");
		int[] a=new int[100];
		for(int i=0;i<moreA.length;i++){
			a[i]=Integer.parseInt(moreA[i]);
			System.out.println(a[i]);
		}
		int q=0;
		for(int j:a){
			q=0;
			q=agencyService.deleteUserById(j);
		}
		if(q==0){
			req.getRequestDispatcher("/seetable?table=agency").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
		
	/**
	 * 验证需修改的信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void updatecheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String  num=req.getParameter("updateA");
		String a=req.getParameter("a");
		if(num!=null&&num!=""){
			int ano=Integer.parseInt(num);
			Agency agency=agencyService.get(ano);
			if(agency!=null){
				req.setAttribute("agency", agency);
				req.getRequestDispatcher("/update.jsp?a="+a).forward(req, resp);
			}else{
				req.setAttribute("result","noresult");		
				req.getRequestDispatcher("/update.jsp").forward(req, resp);
			}	
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
	/**
	 * 修改信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int ano=Integer.parseInt(req.getParameter("ano"));
		String pp=req.getParameter("a");
		System.out.println(pp);
		Agency agency=agencyService.get(ano);
		String a=agency.getAname();
		String b=req.getParameter("aname");
		int count=agencyService.getCountByName(b);
		if(!a.equals(b)&&count>0){
			req.setAttribute("non",b+"已c存在！！！");
			req.getRequestDispatcher("/update.jsp").forward(req, resp);
			return;
		}
		agency.setAname(b);
		agency.setApassword(req.getParameter("apassword"));
		agency.setAphone(req.getParameter("aphone"));
		agency.setAremark(req.getParameter("aremark"));
		agency.setAsex(req.getParameter("asex"));
		agency.setAclass(req.getParameter("aclass"));
		int row=agencyService.updateUserById(agency);
		if(row>0){
			if(pp.equals("'true'")){
				req.getSession().setAttribute("agency", agency);
				req.getRequestDispatcher("/planB/indexAgency.jsp").forward(req, resp);
			}else if(pp.equals("'other'")){
				req.getSession().setAttribute("agency", agency);
				req.getRequestDispatcher("/planB/indexMedicine.jsp").forward(req, resp);
			}
			else{
				req.getRequestDispatcher("/seetable?table=agency").forward(req, resp);
			}
		}else{
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}	
	/**
	 * 将agency数据传过去outAgency.jsp，输出xml文件
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void outTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<Agency> list=agencyService.getAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/planB/outAgency.jsp").forward(req, resp);
	}
	
	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		Cookie[] cookies=req.getCookies();
		boolean login=false;//是否已登陆过的标记：true：已登陆过，false:没登陆过
		String account=null;//登陆账号
		String ssid=null;//这是一个标记，通过cookie拿到的一个判断用户该不该登陆成功的标志
		
		if(cookies!=null&&cookies.length>0){
			for(Cookie cookie:cookies){
				if(cookie.getName().equals("userkey")){
					account=cookie.getValue();
				}
				if(cookie.getName().equals("ssid")){
					ssid=cookie.getValue();
				}
			}
		}
		
		if(account!=null&&ssid!=null){
			login=ssid.equals(CookieUtil.md5Encrypt(username));
		}
		if(!login){  //login:false 取反  true:用户还没登陆过
			//用户第一次访问过来
			Agency agency=agencyService.login(username,password);
			//通过访问数据库，来判断用户
			//agencyService里的login方法，判断用户名和密码对不对，对：Agency对象，错：null
			if(agency!=null){//对的，登陆成功
				CookieUtil.creatCook(username, req, resp, 7*24*60*60);
				//登陆成功，允许用户登录（经办人，采购人员,管理员）
				if(agency.getAclass().equals("经办人")){
					req.getSession().setAttribute("agency", agency);
					resp.sendRedirect(req.getContextPath() + "/planB/indexAgency.jsp");
				}else if(agency.getAclass().equals("采购人员")){
					req.getSession().setAttribute("agency", agency);
					resp.sendRedirect(req.getContextPath() + "/planB/indexMedicine.jsp");
				}else{
					resp.sendRedirect(req.getContextPath() + "/planB/indexB.jsp");
				}
				
			}else{//user为null,登陆失败
				HttpSession session=req.getSession();
				session.setAttribute("note", "用户名或密码错误！");
				resp.sendRedirect(req.getContextPath() + "/planB/login.jsp");
			}
		}else{
//			Agency agency=agencyService.login(username,password);
//			req.getSession().setAttribute("agency",agency);
			resp.sendRedirect(req.getContextPath() + "/planB/indexAgency.jsp");
		}
	}
	
}
