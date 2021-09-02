package cn.fungus.dao;

import cn.fungus.domain.GoodsCategory;
import java.util.List;

public interface GoodsCategoryDao{
    // 查询商品分类
    List<GoodsCategory> selectCategory();
}