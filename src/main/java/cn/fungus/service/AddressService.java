package cn.fungus.service;

import cn.fungus.domain.Address;
import java.util.List;

public interface AddressService {
    /**
     * 添加地址数据
     * @param address
     */
    void addAddress(Address address);
    /**
     * 查询购物车表中的所有数据
     * @param
     */
    List<Address> getAddressByUid(Long userId);

    /**
     * 根据uid查询地址条数
     * @param userId
     * @return Integer
     */
    Long selectCountByUid(Long userId);

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
