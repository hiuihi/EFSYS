package cn.fungus.dao;

import cn.fungus.domain.Goods;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface GoodsDao {
    /**
     * 查询商品部分信息
     * @param
     * @return List<Goods>
     */
    List<Goods> selectGoods(@Param("goodsName") String goodsName , @Param("categoryId")String categoryId,@Param("start") Integer start , @Param("rows")Integer rows);
    /**
     * 查询商品信息无分页
     * @param
     * @return List<Goods>
     */
    List<Goods> selectGoodsNoPagination();

    /**
     * 查询所有商品数(有条件)
     * @param goodsName,categoryId
     * @return Integer
     */
    Integer selectCount(@Param("goodsName") String goodsName , @Param("categoryId")String categoryId);

    /**
     * 根据商品id查询商品信息
     * @param gid
     * @return Goods
     */
    Goods selectGoodsByGid(Integer gid);
    /**
     * 根据id查询商品信息
     * @param id
     * @return Goods
     */
    Goods selectGoodsById(Integer id);
    /**
     * 查询全部商品
     * @param start,rows
     * @return List<Goods>
     */
    List<Goods> selectAllGoods(@Param("goodsId") String goodsId , @Param("goodsName")String goodsName,@Param("start") Integer start , @Param("rows")Integer rows);

    /**
     * 查询全部商品数
     * @param
     * @return Integer
     */
    Integer selectCountGoods(@Param("goodsId") String goodsId , @Param("goodsName")String goodsName);
    /**
     * 插入商品全部信息
     * @param goods
     * @return
     */
    void insertGoodsAll(Goods goods);

    /**
     * 修改插入商品全部信息
     * @param goods
     * @return
     */
    void updateGoodsAll(Goods goods);

    /**
     * 删除商品
     * @param id
     * @return
     */
    void delGoodsById(Integer id);

    /**
     * 修改商品上架状态
     * @param goods
     * @return
     */
    void updPubStatusById(Goods goods);
    /**
     * 修改商品状态
     * @param goods
     * @return
     */
    void updNewStatusById(Goods goods);
    /**
     * 修改商品推荐状态
     * @param goods
     * @return
     */
    void updRecStatusById(Goods goods);
    /**
     * 修改商品折扣状态
     * @param goods
     * @return
     */
    void updDisStatusById(Goods goods);
    /**
     * 修改商品评分
     * @param grade,goodsId
     * @return
     */
    void updGradeByGid(@Param("grade")Integer grade,@Param("goodsId")Integer goodsId);
    /**
     * 修改商品库存
     * @param stock,goodsId
     * @return
     */
    void updStockByGid(@Param("stock")Integer stock,@Param("goodsId")Integer goodsId);

    /**
     * 修改商品销量
     * @param sale,goodsId
     * @return
     */
    void updSaleByGid(@Param("sale")Integer sale,@Param("goodsId")Integer goodsId);

}