package com.teng.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teng.model.Buy;
import com.teng.model.Client;
import com.teng.model.Medicine;
import com.teng.service.BuyService;
import com.teng.service.BuyServiceImpl;
import com.teng.service.ClientService;
import com.teng.service.ClientServiceImpl;
import com.teng.service.MedicineService;
import com.teng.service.MedicineServiceImpl;

/**
 * Servlet implementation class ClientController
 */
@WebServlet(urlPatterns={"*.cdo"})
public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ClientService clientService=new ClientServiceImpl();
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
	
	private void find(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num1=req.getParameter("cno");
		String cname=req.getParameter("cname");
		String num2=req.getParameter("csex");
		String num3=req.getParameter("cage");
		String use=req.getParameter("use");
		String a=req.getParameter("a");
		req.setAttribute("use", use);
		if(num1!=""&&num1!=null){
			int cno=Integer.parseInt(req.getParameter("cno"));
			Client client=clientService.get(cno);
			if(client!=null){
			req.setAttribute("client",client);
			req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}else{
				req.setAttribute("result","noresult");		
				req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}
		}else if(cname!=""&&cname!=null){
			List<Client> list=clientService.find(cname);
			if(list!=null){
			req.setAttribute("list", list);
			req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}else{
				req.setAttribute("result","noresult");		
				req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}
		}else if(num2!=""&&num2!=null){
			List<Client> list=clientService.findSex(num2);
			if(list!=null&& !list.isEmpty()){
			req.setAttribute("mnolist", list);
			req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}else{
				req.setAttribute("result","noresult");		
				req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}
		}else if(num3!=""&&num3!=null){
			List<Client> list=clientService.findAge(num3);
			if(list!=null&& !list.isEmpty()){
			req.setAttribute("anolist", list);
			req.setAttribute("a", a);
			req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}else{
				req.setAttribute("result","noresult");		
				req.getRequestDispatcher("/find-c.jsp").forward(req, resp);
			}
		}else{
			req.getRequestDispatcher("/error.jsp.jsp").forward(req, resp);
		}
		
	}
	/**
	 * 删除前确定要删除信息，client对象
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delecheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("cno");
		if(num!=""&&num!=null){
			int cno=Integer.parseInt(num);
			Client client=clientService.get(cno);
			if(client!=null){
				req.setAttribute("client", client);
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
	 * 删除一条client
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String num=req.getParameter("cno");
		String use=req.getParameter("use");
		if(num!=""&&num!=null){
			int cno=Integer.parseInt(num);
			int i=clientService.deleteUserById(cno);
			System.out.println(i);
			if(i>0){
				if(!use.equals("'use'")){
					req.getRequestDispatcher("/seetable?table=client").forward(req, resp);
				}else{
					req.getRequestDispatcher("/planB/indexAgency.jsp").forward(req, resp);
				}
				
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
		String[] moreC=req.getParameterValues("moreC");
		int[] a=new int[100];
		for(int i=0;i<moreC.length;i++){
			a[i]=Integer.parseInt(moreC[i]);
			System.out.println(a[i]);
		}
		int q=0;
		for(int j:a){
			q=0;
			q=clientService.deleteUserById(j);
		}
		if(q==0){
			req.getRequestDispatcher("/seetable?table=client").forward(req, resp);
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
		String  num=req.getParameter("updateC");
		String use=req.getParameter("use");
		if(num!=null&&num!=""){
			int cno=Integer.parseInt(num);
			Client client=clientService.get(cno);
			if(client!=null){
				req.setAttribute("client", client);
				req.getRequestDispatcher("/update.jsp?a="+use).forward(req, resp);
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
		int cno=Integer.parseInt(req.getParameter("cno"));
		String use=req.getParameter("use");
		Client client=clientService.get(cno);
		String a=client.getCname();
		String b=req.getParameter("cname");
		int count=clientService.getCountByName(b);
		if(!a.equals(b)&&count>0){
			req.setAttribute("non",b+"已存在！！！");
			req.getRequestDispatcher("/update.jsp").forward(req, resp);
			return;
		}
		int cage=Integer.parseInt(req.getParameter("cage"));
		client.setCname(b);
		client.setCsex(req.getParameter("csex"));
		client.setCage(cage);
		client.setCaddress(req.getParameter("caddress"));
		client.setCphone(req.getParameter("cphone"));
		client.setCremark(req.getParameter("cremark"));
		int row=clientService.updateUserById(client);
		if(row>0){
			if(!use.equals("'use'")){
				req.getRequestDispatcher("/seetable?table=client").forward(req, resp);
			}else{
				req.getRequestDispatcher("/planB/indexAgency.jsp").forward(req, resp);
			}
		}else{
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}	
	
	/**
	 * 将Client数据传过去outClient.jsp，输出xml文件
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void outTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<Client> list=clientService.getAll();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/planB/outClient.jsp").forward(req, resp);
	}
	
	/**
	 * 经办人登记/添加顾客
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	private void AgencyAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String cname=req.getParameter("cname");
		int cage=Integer.valueOf(req.getParameter("cage"));
		String Csex=req.getParameter("csex");
		String caddress=req.getParameter("caddress");
		String cphone=req.getParameter("cphone");
		String csymptom=req.getParameter("csymptom");
		int ano=Integer.valueOf(req.getParameter("ano"));
		String cremark=req.getParameter("cremark");
		HttpSession session=req.getSession();
		String num[]=(String[])session.getAttribute("num");
		Client client=new Client();
		System.out.println(client.getCno());
		client.setCname(cname);
		client.setCage(cage);
		client.setCsex(Csex);
		client.setCaddress(caddress);
		client.setCphone(cphone);
		client.setCremark(cremark);
		clientService.save(client);
		int cno = 0;
		List<Client> clients=clientService.getAll();
		for(Client cc:clients)
			cno=cc.getCno();
		System.out.println(cno);
		List<Medicine> list=(List<Medicine>)session.getAttribute("mlist");
		int j=0,i=0;
		for(Medicine m:list)
		{
		if(num[i]!=null&&num[i]!=""){
			j=0;
			System.out.println(num[i]);
		Buy buy=new Buy();
		buy.setCno(cno);
		buy.setCsymptom(csymptom);
		buy.setMno(m.getMno());
		buy.setAno(ano);
		buy.setNum(Integer.valueOf(num[i]));
		Date date=new Date();
		buy.setDate(date);
		buy.setPrice(Integer.valueOf(num[i])*m.getMprice());
		System.out.println(buy);
		//当前库存=原来-购买的
		Medicine medicine=medicineService.get(m.getMno());
		int count=medicine.getMcount()-Integer.valueOf(num[i]);
		medicine.setMcount(count);
		int row=medicineService.updateUserById(medicine);
		j=buyService.save(buy);
		}
		i++;
		}
		if(j>0){
			req.getRequestDispatcher("/findBySno.bdo?ano="+ano+"&use='use'").forward(req, resp);
		}else{
			resp.sendRedirect(req.getContextPath()+"/error.jsp");
		}
		
	}
	/**
	 * 保存一个订单信息，并返回查看
	 * @param req
	 * @param resp
	 * @param cname
	 * @param ano
	 * @throws ServletException
	 * @throws IOException
	 */
	/**
	private void AgencyBuy(HttpServletRequest req, HttpServletResponse resp,String cname,int ano,String[] num,List<Medicine> list) throws ServletException, IOException{
		System.out.println("oks");
		String a="";
		int sum=0;
		int b=0;
		for(Medicine m:list){
			a=a+m.getMno()+" "+m.getMname()+" -----"+m.getMprice()+"*"+num[b]+"<br>";
			sum=sum+m.getMprice()*Integer.parseInt(num[b]);
			b++;
		}
		BuyService buyService=new BuyServiceImpl();
		Buy buy=new Buy();
		buy.setAno(ano);
		buy.setCname(cname);
		buy.setPrice(sum);
		buy.setMdescribe(a);
		int j=buyService.save(buy);
		if(j>0){
			req.setAttribute("buy", buy);
			req.getRequestDispatcher("/buy.jsp").forward(req, resp);
		}else{
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}
	*/	
}
