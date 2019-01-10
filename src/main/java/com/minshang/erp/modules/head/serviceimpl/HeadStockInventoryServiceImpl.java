package com.minshang.erp.modules.head.serviceimpl;

import com.minshang.erp.modules.head.dao.HeadStockInventoryDao;
import com.minshang.erp.modules.head.entity.HeadStockInventory;
import com.minshang.erp.modules.head.service.HeadStockInventoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 总部盘点管理接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadStockInventoryServiceImpl implements HeadStockInventoryService {

    @Autowired
    private HeadStockInventoryDao headStockInventoryDao;

    @Override
    public HeadStockInventoryDao getRepository() {
        return headStockInventoryDao;
    }
}