package cn.fungus.service;

import cn.fungus.domain.Comment;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface CommentService {
    /**
     * 插入评价
     * @param
     */
    void insertComment(Comment comment);
    /**
     * 查询某商品评价
     * @param
     */
    List<Comment> selectCommentByGid(@Param("goodsId") Long goodsId);

    /**
     * 分页查询某商品评价
     * @param
     */
    List<Comment> selectCommentByGoodsId(@Param("goodsId") Long goodsId,@Param("start") Integer start, @Param("rows")Integer rows);
    /**
     * 根据订单号查询商品评价
     * @param
     */
    List<Comment> selectCommentByOrderSn(@Param("orderSn")String orderSn);
    /**
     * 分页查询所有商品评价
     * @param
     */
    List<Comment> selectAllComment(@Param("start") Integer start, @Param("rows")Integer rows);


    /**
     * 查询评论条数
     * @param
     */
    Long selectCount();

    /**
     * 根据gid查询评论条数
     * @param
     */
    Long selectCountByGid(@Param("goodsId")Long goodsId);


}
