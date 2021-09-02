package cn.fungus.service;

import cn.fungus.domain.Cart;
import cn.fungus.domain.Collect;
import java.util.List;

public interface CollectService {
    /**
     * 收藏表中插入数据
     * @param collect
     */
    void insertCollect(Collect collect);

    /**
     * 查询收藏表中的所有数据
     * @param
     * @return
     */
    List<Collect> selectCollectByUid(Long userId);

    /**
     * 根据id查询收藏表
     * @param
     * @return
     */
    Cart selectCollectById(Long id);

    /**
     * 根据id删除收藏
     * @param
     */
    void deleteCollectById(Long id);
}
