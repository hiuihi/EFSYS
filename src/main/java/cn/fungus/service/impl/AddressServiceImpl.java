package cn.fungus.service.impl;

import cn.fungus.dao.AddressDao;
import cn.fungus.domain.Address;
import cn.fungus.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.List;

@Service("addressService")
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDao addressDao;
    /**
     * 添加地址数据
     * @param addAddress
     */
    @Override
    public void addAddress(Address addAddress) {
        addressDao.insertAddress(addAddress);
    }
    /**
     * 查询购物车表中的所有数据
     * @param
     */
    @Override
    public List<Address> getAddressByUid(Long userId) {
        List<Address> addresses =addressDao.selectAddressByUid(userId);
        int a=0;
        for (Address address : addresses){
            if (address.getIsDefault()==1){
                Collections.swap(addresses, 0, a);
                break;
            }
            a++;
        }
        return addresses;
    }

    /**
     * 根据uid查询地址条数
     * @param userId
     * @return Integer
     */
    @Override
    public Long selectCountByUid(Long userId) {
        return addressDao.selectCountByUid(userId);
    }

    /**
     * 修改所有默认地址信息为不默认
     * @param
     */
    @Override
    public void updateDefaultAddress() {
        addressDao.updateDefaultAddress();
    }
    /**
     * 根据id修改为默认地址
     * @param
     */
    @Override
    public void updateDefaultAddressById(Long id) {
        addressDao.updateDefaultAddressById(id);
    }
    /**
     * 根据id修改地址
     * @param
     */
    @Override
    public void updateAddressById(Address address) {
        addressDao.updateAddressById(address);
    }
    /**
     * 根据id删除地址
     * @param
     */
    @Override
    public void deleteAddressById(Long id) {
        addressDao.deleteAddressById(id);
    }


}
