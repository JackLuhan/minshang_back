package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadDepot;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 总部仓库接口
 * @author lcmaijia
 */
public interface HeadDepotService extends MinShangBaseService<HeadDepot,String> {

    Page<HeadDepot> findByCondition(HeadDepot headDepot, SearchVo searchVo, Pageable pageable);
}