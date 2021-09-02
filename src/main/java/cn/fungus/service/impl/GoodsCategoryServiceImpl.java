package cn.fungus.service.impl;

import cn.fungus.dao.GoodsCategoryDao;
import cn.fungus.domain.GoodsCategory;
import cn.fungus.service.GoodsCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("goodsCategoryService")
public class GoodsCategoryServiceImpl implements GoodsCategoryService {

    @Autowired
    private GoodsCategoryDao goodsCategoryDao;
    /**
     * 查询商品分类
     * */
    @Override
    public List<GoodsCategory> getCategory() {
        return goodsCategoryDao.selectCategory();
    }
}
