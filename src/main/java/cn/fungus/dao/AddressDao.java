package cn.fungus.dao;

import cn.fungus.domain.Address;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AddressDao {
    /**
     * 地址表中插入数据
     * @param address
     */
    void insertAddress(Address address);

    /**
     * 查询地址中的所有数据
     * @param userId
     * @return
     */
    List<Address> selectAddressByUid(Long userId);
    /**
     * 据id查询地址
     * @param id
     * @return
     */
    Address selectAddressById(Long id);
    /**
     * 根据uid查询地址条数
     * @param userId
     * @return Integer
     */
    Long selectCountByUid(@Param("userId") Long userId);


    /**
     * 修改所有默认地址信息为不默认
     * @param
     */
    void updateDefaultAddress();

    /**
     * 根据id修改为默认地址
     * @param
     */
    void updateDefaultAddressById(Long id);

    /**
     * 根据id修改地址
     * @param
     */
    void updateAddressById(Address address);

    /**
     * 根据id删除地址
     * @param
     */
    void deleteAddressById(Long id);

}