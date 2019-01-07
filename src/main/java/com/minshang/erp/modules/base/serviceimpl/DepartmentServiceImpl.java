package com.minshang.erp.modules.base.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.utils.SecurityUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.base.dao.DepartmentDao;
import com.minshang.erp.modules.base.entity.Department;
import com.minshang.erp.modules.base.service.DepartmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 部门接口实现
 * @author houyi
 */
@Slf4j
@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private SecurityUtil securityUtil;

    @Override
    public DepartmentDao getRepository() {
        return departmentDao;
    }

    @Override
    public List<Department> findByParentIdOrderBySortOrder(String parentId, Boolean openDataFilter) {

        // 数据权限
        List<String> depIds = securityUtil.getDeparmentIds();
        if(depIds!=null&&depIds.size()>0&&openDataFilter){
            return departmentDao.findByParentIdAndIdInOrderBySortOrder(parentId, depIds);
        }
        return departmentDao.findByParentIdOrderBySortOrder(parentId);
    }

    @Override
    public List<Department> findByParentIdAndStatusOrderBySortOrder(String parentId, Integer status) {

        return departmentDao.findByParentIdAndStatusOrderBySortOrder(parentId, status);
    }

    @Override
    public List<Department> findByTitleLikeOrderBySortOrder(String title, Boolean openDataFilter) {

        // 数据权限
        List<String> depIds = securityUtil.getDeparmentIds();
        if(depIds!=null&&depIds.size()>0&&openDataFilter){
            return departmentDao.findByTitleLikeAndIdInOrderBySortOrder(title, depIds);
        }
        return departmentDao.findByTitleLikeOrderBySortOrder(title);
    }

//    @Override
//    public Page<Department> findByCondition(Department department, SearchVo searchVo, Pageable pageable) {
//        return departmentDao.findAll(new Specification<Department>() {
//            @Nullable
//            @Override
//            public Predicate toPredicate(Root<Department> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
//                //根据部门名称查询
//                Path<String> nameField = root.get("title");
//                Path<Date> createTimeField=root.get("createTime");
//
//                List<Predicate> list = new ArrayList<Predicate>();
//
//                //模糊搜素
//                if(StrUtil.isNotBlank(department.getTitle())) {
//                    list.add(cb.like(nameField, '%' + department.getTitle() + '%'));
//                }
//                //创建时间
//                if(StrUtil.isNotBlank(searchVo.getStartDate())&&StrUtil.isNotBlank(searchVo.getEndDate())){
//                    Date start = DateUtil.parse(searchVo.getStartDate());
//                    Date end = DateUtil.parse(searchVo.getEndDate());
//                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
//                }
//
//                Predicate[] arr = new Predicate[list.size()];
//                cq.where(list.toArray(arr));
//                return null;
//            }
//        }, pageable);
//    }
}