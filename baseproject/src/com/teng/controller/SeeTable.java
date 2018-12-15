package com.teng.controller;

import java.io.IOException;
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
import com.teng.service.AgencyService;
import com.teng.service.AgencyServiceImpl;
import com.teng.service.BuyService;
import com.teng.service.BuyServiceImpl;
import com.teng.service.ClientService;
import com.teng.service.ClientServiceImpl;
import com.teng.service.MedicineService;
import com.teng.service.MedicineServiceImpl;

@WebServlet(urlPatterns={"/seetable"})
public class SeeTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AgencyService agencyService=new AgencyServiceImpl();
	ClientService clientService=new ClientServiceImpl();
	MedicineService medicineService=new MedicineServiceImpl();
	BuyService buyService=new BuyServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String name=req.getParameter("table");
		String asee=req.getParameter("asee");
		System.out.println(name);
		if(name.equals("agency")){
			List<Agency> list=agencyService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/see-a.jsp").forward(req, resp);
		}
		if(name.equals("client")){
			List<Client> list=clientService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/see-c.jsp").forward(req, resp);
		}
		if(name.equals("medicine")){
			List<Medicine> list=medicineService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/see-m.jsp?asee="+asee).forward(req, resp);
		}
		if(name.equals("buy")){
			List<Buy> list=buyService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/see-b.jsp").forward(req, resp);
		}
		if(name.equals("Agencyclient")){
			List<Client> list=clientService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/AgencySee.jsp").forward(req, resp);
		}
		if(name.equals("mchose")){
			List<Medicine> list=medicineService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/chose-m.jsp").forward(req, resp);
		}
		if(name.equals("deleteMoreA")){
			List<Agency> list=agencyService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/planB/deleteA.jsp").forward(req, resp);
		}
		if(name.equals("deleteMoreC")){
			List<Client> list=clientService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/planB/deleteC.jsp").forward(req, resp);
		}
		if(name.equals("deleteMoreM")){
			List<Medicine> list=medicineService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/planB/deleteM.jsp").forward(req, resp);
		}
		if(name.equals("deleteMoreB")){
			List<Buy> list=buyService.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/planB/deleteB.jsp").forward(req, resp);
		}
	}
}
