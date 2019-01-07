package com.minshang.erp.modules.head.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.dao.HeadOrderDao;
import com.minshang.erp.modules.head.entity.HeadOrder;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.mapper.HeadSupplierMapper;
import com.minshang.erp.modules.head.service.HeadOrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 总部订单管理接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadOrderServiceImpl implements HeadOrderService {

    @Autowired
    private HeadOrderDao headOrderDao;
    @Resource
    private HeadSupplierMapper headSupplierMapper;

    @Override
    public HeadOrderDao getRepository() {
        return headOrderDao;
    }


    @Override
    public Page<HeadOrder> findByCondition(HeadOrder headOrder, SearchVo searchVo, Pageable pageable) {
        return headOrderDao.findAll(new Specification<HeadOrder>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<HeadOrder> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据单据号查询
                Path<String> nameField = root.get("documentNo");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(headOrder.getDocumentNo())) {
                    list.add(cb.like(nameField, '%' + headOrder.getDocumentNo() + '%'));
                }
                //创建时间
                if(StrUtil.isNotBlank(searchVo.getStartDate())&&StrUtil.isNotBlank(searchVo.getEndDate())){
                    Date start = DateUtil.parse(searchVo.getStartDate());
                    Date end = DateUtil.parse(searchVo.getEndDate());
                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }

    @Override
    public HeadOrder findByDocumentNo(String documentNo) {
        List<HeadOrder> list = headOrderDao.findByDocumentNo(documentNo);
        if(list!=null&&list.size()>0){
            HeadOrder headOrder = list.get(0);
            // 关联总部仓库
            List<HeadSupplier> headSupplierList = headSupplierMapper.findByHeadSupplierId(headOrder.getId());
            headOrder.setHeadSuppliers(headSupplierList);
            return headOrder;
        }
        return null;
    }
}