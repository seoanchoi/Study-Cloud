package study.cloud.stc.product.model.service;

import java.util.List;


import study.cloud.stc.product.model.vo.ProductVo;


public interface ProductService {

	public List<ProductVo> selectList(ProductVo vo) throws Exception;
	public List<ProductVo> selectList(int currentPage, int limit, String proAddress) throws Exception;

	public int selectCount(String proAddress) throws Exception;
}
