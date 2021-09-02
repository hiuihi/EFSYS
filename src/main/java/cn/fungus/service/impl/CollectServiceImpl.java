package cn.fungus.service.impl;

import cn.fungus.dao.CollectDao;
import cn.fungus.domain.Cart;
import cn.fungus.domain.Collect;
import cn.fungus.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("collectService")
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectDao collectDao;

    /**
     * 收藏表中插入数据
     * @param collect
     */
    @Override
    public void insertCollect(Collect collect) {
        collectDao.insertCollect(collect);
    }
    /**
     * 查询收藏表中的所有数据
     * @param
     * @return
     */
    @Override
    public List<Collect> selectCollectByUid(Long userId) {
        return collectDao.selectCollectByUid(userId);
    }
    /**
     * 根据id查询收藏表
     * @param
     * @return
     */
    @Override
    public Cart selectCollectById(Long id) {
        return collectDao.selectCollectById(id);
    }
    /**
     * 根据id删除收藏
     * @param
     */
    @Override
    public void deleteCollectById(Long id) {
        collectDao.deleteCollectById(id);
    }
}
