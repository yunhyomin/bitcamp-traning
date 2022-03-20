package com.project.bank.comtroller;

import java.util.ArrayList;
import java.util.List;

import com.project.bank.dao.ProductsDAO;
import com.project.bank.vo.ProductsVO;

public class ProductsController {
	private List<ProductsVO> products;
	private ProductsDAO productsdao;
	boolean result = false;
	//생성자
	public ProductsController() {
		products = new ArrayList<>();
		productsdao = new ProductsDAO();
	}
	
	//사용안함 
//	public boolean insert(ProductsVO pvo) 
//	{
//		result=false;
//		if(productsdao.insertProducts(pvo,String id)==1)
//		{
//			result=true;
//		}
//		return result;
//	}
	
	//사용안함 
//	public List<ProductsVO> selectAll() 
//	{
//		products = new ArrayList<>();
//		if(productsdao.selectAll()!=null)
//		{
//			products = productsdao.selectAll();
//		}
//			return products;
//	}
	
	
	
	public List<ProductsVO> selectOne() {
		List<ProductsVO> list = productsdao.selectOne();
		
		return list;
	}
	
}
