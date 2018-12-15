package com.teng.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teng.model.Agency;
import com.teng.model.Buy;
import com.teng.model.Client;
import com.teng.model.Medicine;
import com.teng.service.BuyService;
import com.teng.service.BuyServiceImpl;
import com.teng.service.MedicineService;
import com.teng.service.MedicineServiceImpl;


@WebServlet(urlPatterns={"*.mdo"})
public class MedicineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MedicineService medicineService=new MedicineServiceImpl();
	BuyService buyService=new BuyServiceImpl();
	
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
	/**
	 * 添加药物信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Medicine medicine=new Medicine();
		medicine.setMname(req.getParameter("mname"));
		medicine.setMmode(req.getParameter("mmode"));
		medicine.setMefficacy(req.getParameter("mefficacy"));
		medicine.setMprice(Integer.parseInt(req.getParameter("mprice")));
		medicine.setMcount(Integer.parseInt(req.getParameter("mcount")));
		int i=medicineService.save(medicine);
		if(i>0){
			req.getRequestDispatcher("/seetable?table=medicine").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
	private void find(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Medicine medicine=new Medicine();
		String mno=req.getParameter("mno");
		String mname=req.getParameter("mname");
		String use=req.getParameter("use");
		if(mno!=""&&mno!=null){
			int i=Integer.parseInt(mno);
			medicine=medicineService.get(i);
			if(medicine!=null){
				req.setAttribute("medicine",medicine);
				req.setAttribute("use",use);
				req.getRequestDispatcher("/find-m.jsp").forward(req, resp);
			}else{
				req.setAttribute("mresult","noresult");		
				req.getRequestDispatcher("/find-m.jsp").forward(req, resp);
			}		
		}else{
			List<Medicine> list=medicineService.find(mname);
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("list", list);
				req.getRequestDispatcher("/find-m.jsp").forward(req, resp);
			}else{
				req.setAttribute("mresult","noresult");		
				req.getRequestDispatcher("/find-m.jsp").forward(req, resp);
			}
		}
	}
	
	/**
	 * 删除前确定信息，返回一个agency对象
	 * @param req
	 * @param resp
	 */
	private void delecheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("mno");
		if(num!=null&&num!=""){
			int mno=Integer.parseInt(num);
			Medicine medicine=medicineService.get(mno);
			if(medicine!=null){
				req.setAttribute("medicine", medicine);
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
	 * 删除一个Medicine对象
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("mno");
		String asee=req.getParameter("asee");
		if(num!=null&&num!=""){
			int mno=Integer.parseInt(num);
			List<Buy> list=buyService.findByMno(mno);
			if(list!=null&& !list.isEmpty()){
				req.setAttribute("message", "该药品已被使用，不能删除!");
				if(asee.equals("'true'")){
					req.getRequestDispatcher("/planB/indexMedicine.jsp").forward(req, resp);
				}else{
					req.getRequestDispatcher("/seetable?table=medicine").forward(req, resp);
				}
			}else{
			int i=medicineService.deleteUserById(mno);
			if(i!=0){
				if(asee.equals("'true'")){
					req.getRequestDispatcher("/planB/indexMedicine.jsp").forward(req, resp);
				}else{
					req.getRequestDispatcher("/seetable?table=medicine").forward(req, resp);
				}
			}else{
				resp.sendRedirect(req.getContextPath()+"/error.jsp");
			}
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
		String[] moreM=req.getParameterValues("moreM");
		int[] a=new int[100];
		for(int i=0;i<moreM.length;i++){
			a[i]=Integer.parseInt(moreM[i]);
			System.out.println(a[i]);
		}
		int q=0;
		for(int j:a){
			q=0;
			q=medicineService.deleteUserById(j);
		}
		if(q==0){
			req.getRequestDispatcher("/seetable?table=medicine").forward(req, resp);
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
		String  num=req.getParameter("updateM");
		String asee=req.getParameter("asee");
		if(num!=null&&num!=""){
			int mno=Integer.parseInt(num);
			Medicine medicine=medicineService.get(mno);
			if(medicine!=null){
				req.setAttribute("medicine", medicine);
				req.getRequestDispatcher("/update.jsp?asee="+asee).forward(req, resp);
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
		int mno=Integer.parseInt(req.getParameter("mno"));
		String asee=req.getParameter("asee");
		Medicine medicine=medicineService.get(mno);
		String a=medicine.getMname();
		String b=req.getParameter("mname");
		int count=medicineService.getCountByName(b);
		if(!a.equals(b)&&count>0){
			req.setAttribute("non",b+"已存在！！！");
			req.getRequestDispatcher("/update.jsp").forward(req, resp);
			return;
		}
		medicine.setMname(req.getParameter("mname"));
		medicine.setMmode(req.getParameter("mmode"));
		medicine.setMefficacy(req.getParameter("mefficacy"));
		medicine.setMprice(Integer.parseInt(req.getParameter("mprice")));
		medicine.setMcount(Integer.parseInt(req.getParameter("mcount")));
		int row=medicineService.updateUserById(medicine);
		if(row>0){
			if(asee.equals("'true'")){
				req.getRequestDispatcher("/planB/indexMedicine.jsp").forward(req, resp);
			}else{
				req.getRequestDispatcher("/seetable?table=medicine").forward(req, resp);
			}
			
		}else{
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}		
	
	/**
	 * 将Medicine数据传过去outMedicine.jsp，输出xml文件
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void outTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<Medicine> list=medicineService.getAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/planB/outMedicine.jsp").forward(req, resp);
	}
	
	/**
	 * 采药人员录入信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void Agencyadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		Medicine medicine=new Medicine();
		medicine.setMname(req.getParameter("mname"));
		medicine.setMmode(req.getParameter("mmode"));
		medicine.setMefficacy(req.getParameter("mefficacy"));
		medicine.setMprice(Integer.parseInt(req.getParameter("mprice")));
		medicine.setMcount(Integer.parseInt(req.getParameter("mcount")));
		int i=medicineService.save(medicine);
		if(i>0){
			req.getRequestDispatcher("/seetable?table=medicine&asee='true'").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
	}
	
	private void mchose(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String a[]=req.getParameterValues("mchose");
		String b[]=new String[10];
		for(int i=0;i<a.length;i++){
			b[i]=req.getParameter(a[i]);
		}
		List<Medicine> medicines=new ArrayList();
		Medicine medicine=new Medicine();
		for(int j=0;j<a.length;j++){
			medicine=medicineService.get(Integer.parseInt(a[j]));
			medicines.add(medicine);
		}
		req.setAttribute("mList",medicines);
		req.setAttribute("mnum", b);
		req.getRequestDispatcher("/planB/indexAgency.jsp").forward(req, resp);;
	}
		
}
