package cn.fungus.service;

import cn.fungus.domain.GoodsCategory;
import java.util.List;

public interface GoodsCategoryService {
    //查询商品分类
    public List<GoodsCategory> getCategory();

}
