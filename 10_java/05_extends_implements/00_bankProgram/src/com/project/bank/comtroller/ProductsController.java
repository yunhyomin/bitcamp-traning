package com.project.bank.comtroller;

import java.util.ArrayList;
import java.util.List;

import com.project.bank.dao.ProductsDAO;
import com.project.bank.vo.ProductsVO;



public class ProductsController {
	private ArrayList<ProductsVO> list;
	private ProductsDAO productsdao;
	
	public ProductsController() {
		list = new ArrayList<>();
		productsdao = new ProductsDAO();
		
	}
	
	public void insert(ProductsVO pvo) {
		
		productsdao.insertProducts(pvo);

	}
	
	public ArrayList<ProductsVO> selectAll() {
		ArrayList<ProductsVO> list = productsdao.selectAll();

		return list;
	}
	
	public void delete(int deleteNo) {
		System.out.println(deleteNo);
		productsdao.deleteProucts(deleteNo);
	}
	
	public void update(ProductsVO pvo) {
		productsdao.updateProducts(pvo);
	}
	
	public ArrayList<ProductsVO> selectOne() {
		ArrayList<ProductsVO> list = productsdao.selectOne();
		
		return list;
	}
	
	public boolean check(String fnnNo) {
		boolean check = false;
		List<String> list = productsdao.check();
		
        for (String no : list) {
            if (no.equalsIgnoreCase(fnnNo)) {
                check = true;
            }
        }

        return check;
    }
}
