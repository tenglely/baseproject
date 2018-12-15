package com.teng.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teng.model.Buy;
import com.teng.model.Medicine;
import com.teng.service.BuyService;
import com.teng.service.BuyServiceImpl;
import com.teng.service.ClientService;
import com.teng.service.ClientServiceImpl;
import com.teng.service.MedicineService;
import com.teng.service.MedicineServiceImpl;


@WebServlet(urlPatterns={"*.bdo"})
public class BuyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BuyService buyService=new BuyServiceImpl();
	MedicineService medicineService=new MedicineServiceImpl();
	ClientService clientService=new ClientServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	/**
	 * 根据订单编号删除一条数据，回退药品数量，并删除该用户信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int sno=Integer.parseInt(req.getParameter("sno"));
		String use=req.getParameter("use");
		Buy buy=buyService.get(sno);
		//回退药品数量
		Medicine medicine=medicineService.get(buy.getMno());
		int count=medicine.getMcount()+buy.getNum();
		System.out.println(medicine.getMcount()+ " "+count);
		medicine.setMcount(count);
		medicineService.updateUserById(medicine);

		//删除订单信息
		int i=buyService.deleteUserById(sno);
		//删除用户信息：当订单中无该cno数据时，说明它cno没订单了，删除用户cno
		List<Buy> bList=buyService.findByCno(buy.getCno());
		if(bList.size()==0){
			clientService.deleteUserById(buy.getCno());
		}
		
		if(i>0){
			if(!use.equals("'use'"))
				req.getRequestDispatcher("/seetable?table=buy").forward(req, resp);
			else
				req.getRequestDispatcher("/planB/indexAgency.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}
	/**
	 * 根据sno查询
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findBySno(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String sno=req.getParameter("sno");
		String ano=req.getParameter("ano");
		String cno=req.getParameter("cno");
		String use=req.getParameter("use");
		String mno=req.getParameter("mno");
		req.setAttribute("use", use);
		if(sno!=null&&sno!=""){
			List<Buy> list=buyService.findBySno(Integer.parseInt(sno));
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("list", list);
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}
		}
		if(ano!=null&&ano!=""){
			List<Buy> list=buyService.find(Integer.parseInt(ano));
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("list", list);
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}
		}
		if(cno!=null&&cno!=""){
			List<Buy> list=buyService.findByCno(Integer.parseInt(cno));
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("list", list);
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}
		}
		if(mno!=null&&mno!=""){
			List<Buy> list=buyService.findByMno(Integer.parseInt(mno));
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("list", list);
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
			}else{
				req.setAttribute("aresult","noresult");		
				req.getRequestDispatcher("/find-b.jsp").forward(req, resp);
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
		String[] moreB=req.getParameterValues("moreB");
		int[] a=new int[100];
		for(int i=0;i<moreB.length;i++){
			a[i]=Integer.parseInt(moreB[i]);
			System.out.println(a[i]);
		}
		int q=0;
		for(int j:a){
			q=0;
			q=buyService.deleteUserById(j);
		}
		if(q==0){
			req.getRequestDispatcher("/seetable?table=buy").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}		
}
