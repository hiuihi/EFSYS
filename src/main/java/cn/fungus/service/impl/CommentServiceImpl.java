package cn.fungus.service.impl;

import cn.fungus.dao.CommentDao;
import cn.fungus.domain.*;
import cn.fungus.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    /**
     * 插入评价
     * @param
     */
    @Override
    public void insertComment(Comment comment) {
        commentDao.insertComment(comment);
    }
    /**
     * 查询某商品评价
     * @param
     */

    @Override
    public List<Comment> selectCommentByGid(Long goodsId) {
        return commentDao.selectCommentByGid(goodsId);
    }

    /**
     * 分页查询某商品评价
     * @param
     */
    @Override
    public List<Comment> selectCommentByGoodsId(Long goodsId, Integer start, Integer rows) {
        return commentDao.selectCommentByGoodsId(goodsId, start, rows);
    }
    /**
     * 根据订单号查询商品评价
     * @param
     */
    @Override
    public List<Comment> selectCommentByOrderSn(String orderSn) {
        return commentDao.selectCommentByOrderSn(orderSn);
    }
    /**
     * 分页查询所有商品评价
     * @param
     */
    @Override
    public List<Comment> selectAllComment(Integer start, Integer rows) {
        return commentDao.selectAllComment(start, rows);
    }
    /**
     * 查询评论条数
     * @param
     */
    @Override
    public Long selectCount() {
        return commentDao.selectCount();
    }
    /**
     * 根据gid查询评论条数
     * @param
     */
    @Override
    public Long selectCountByGid(Long goodsId) {
        return commentDao.selectCountByGid(goodsId);
    }
}
