package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.mapper.BrandAreaMapper;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
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
 * 机构表接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    private OrganizationDao organizationDao;

    @Resource
    private BrandAreaMapper brandAreaMapper;

    @Override
    public OrganizationDao getRepository() {
        return organizationDao;
    }

    @Override
    public Page<Organization> findByCondition(Organization organization, SearchVo searchVo, Pageable pageable) {
        return organizationDao.findAll(new Specification<Organization>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<Organization> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据品牌名字查询
                Path<String> nameField = root.get("orgName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(organization.getOrgName())) {
                    list.add(cb.like(nameField, '%' + organization.getOrgName() + '%'));
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
    public Organization findByOrgName(String orgName) {
        List<Organization> list = organizationDao.findByOrgName(orgName);
        if(list!=null&&list.size()>0){
            Organization organization = list.get(0);
            // 关联品牌区域
            List<BrandArea> brandAreaList = brandAreaMapper.findByBrandAreaId(organization.getId());
            organization.setBrandAreas(brandAreaList);
            return organization;
        }
        return null;
    }


}