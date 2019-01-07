package com.minshang.erp.modules.head.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.head.entity.HeadDepot;

import java.util.List;

/**
 * 总部仓库数据处理层
 * @author lcmaijia
 */
public interface HeadDepotDao extends MinShangBaseDao<HeadDepot,String> {

    /**
     *
     * @param depotName
     * @return
     */
    List<HeadDepot> findByDepotName(String depotName);

    /**
     *
     * @param depotCode
     * @return
     */
    List<HeadDepot> findByDepotCode(String depotCode);

}