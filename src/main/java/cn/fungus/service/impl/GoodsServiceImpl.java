package cn.fungus.service.impl;

import cn.fungus.dao.GoodsDao;
import cn.fungus.domain.Goods;
import cn.fungus.service.GoodsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    /**
     * 查询商品部分信息
     * */
    @Override
    public List<Goods> getGoods(String goodsName ,String categoryId,Integer start ,Integer rows) {
        return goodsDao.selectGoods(goodsName, categoryId, start, rows);
    }
    /**
     * 查询商品信息无分页
     * @param
     * @return List<Goods>
     */
    @Override
    public List<Goods> selectGoodsNoPagination() {
        return goodsDao.selectGoodsNoPagination();
    }
    /**
     * 查询所有商品数(有条件)
     * @param goodsName,categoryId
     * @return Integer
     */
    @Override
    public Integer selectCount(String goodsName, String categoryId) {
        return goodsDao.selectCount(goodsName, categoryId);
    }

    /**
     * 根据商品id查询商品信息
     * */
    @Override
    public Goods selectGoodsByGid(Integer gid,Integer code) {
        Goods goods=goodsDao.selectGoodsByGid(gid);
        if (code==1){
            return goods;
        }else{
            if (goods==null){
                return goods;
            }else{
                if (goods.getPublishStatus()==1){
                    return goods;
                }else{
                    return new Goods();
                }
            }
        }
    }
    /**
     * 根据id查询商品信息
     * @param id
     * @return Goods
     */
    @Override
    public Goods selectGoodsById(Integer id) {
        return goodsDao.selectGoodsById(id);
    }

    /**
     * 查询全部商品
     * @param
     * @return List<Goods>
     */
    @Override
    public List<Goods> selectAllGoods(String goodsId,String goodsName,Integer start , Integer rows) {
        return goodsDao.selectAllGoods(goodsId,goodsName,start,rows);
    }
    /**
     * 查询全部商品数
     * @param
     * @return Integer
     */
    @Override
    public Integer selectCountGoods(String goodsId,String goodsName) {
        return goodsDao.selectCountGoods(goodsId, goodsName);
    }

    /**
     * 插入商品全部信息
     * @param goods
     * @return
     */
    @Override
    public void insertGoodsAll(Goods goods) {
        goodsDao.insertGoodsAll(goods);
    }

    /**
     * 修改插入商品全部信息
     * @param goods
     * @return
     */
    @Override
    public void updateGoodsAll(Goods goods) {
        goodsDao.updateGoodsAll(goods);
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @Override
    public void delGoodsById(Integer id) {
        goodsDao.delGoodsById(id);
    }
    /**
     * 修改商品上架状态
     * @param goods
     * @return
     */
    @Override
    public void updPubStatusById(Goods goods) {
        goodsDao.updPubStatusById(goods);
    }
    /**
     * 修改商品状态
     * @param goods
     * @return
     */
    @Override
    public void updNewStatusById(Goods goods) {
        goodsDao.updNewStatusById(goods);
    }
    /**
     * 修改商品推荐状态
     * @param goods
     * @return
     */
    @Override
    public void updRecStatusById(Goods goods) {
        goodsDao.updRecStatusById(goods);
    }
    /**
     * 修改商品折扣状态
     * @param goods
     * @return
     */
    @Override
    public void updDisStatusById(Goods goods) {
        goodsDao.updDisStatusById(goods);
    }
    /**
     * 修改商品评分
     * @param grade,goodsId
     * @return
     */
    @Override
    public void updGradeByGid(Integer grade, Integer goodsId) {
        goodsDao.updGradeByGid(grade, goodsId);
    }
    /**
     * 修改商品库存
     * @param stock,goodsId
     * @return
     */

    @Override
    public void updStockByGid(Integer stock, Integer goodsId) {
        goodsDao.updStockByGid(stock, goodsId);
    }


    /**
     * 修改商品销量
     * @param sale,goodsId
     * @return
     */
    @Override
    public void updSaleByGid(Integer sale, Integer goodsId) {
        goodsDao.updSaleByGid(sale, goodsId);
    }

}
