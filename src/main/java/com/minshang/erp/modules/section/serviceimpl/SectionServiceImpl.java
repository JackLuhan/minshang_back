package com.minshang.erp.modules.section.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.organization.mapper.OrganizationMapper;
import com.minshang.erp.modules.section.dao.SectionDao;
import com.minshang.erp.modules.section.entity.Section;
import com.minshang.erp.modules.section.service.SectionService;
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
 * 部门接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionDao sectionDao;

    @Resource
    private OrganizationMapper organizationMapper;

    @Override
    public SectionDao getRepository() {
        return sectionDao;
    }

    @Override
    public Page<Section> findByCondition(Section section, SearchVo searchVo, Pageable pageable) {
        return sectionDao.findAll(new Specification<Section>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<Section> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据品牌名字查询
                Path<String> nameField = root.get("sectionname");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(section.getSectionname())) {
                    list.add(cb.like(nameField, '%' + section.getSectionname() + '%'));
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
    public Section findBySectionname(String sectionname) {
        List<Section> list = sectionDao.findBySectionname(sectionname);
        if(list!=null&&list.size()>0){
            Section section = list.get(0);
            // 关联机构表
            List<Organization> organizationList = organizationMapper.findByOrgId(section.getId());
            section.setOrganizations(organizationList);
            return section;
        }
        return null;
    }
}