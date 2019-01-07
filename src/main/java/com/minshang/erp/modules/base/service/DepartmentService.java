package com.minshang.erp.modules.base.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.base.entity.Department;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 部门接口
 * @author houyi
 */
public interface DepartmentService extends MinShangBaseService<Department,String> {

    /**
     * 通过父id获取 升序
     * @param parentId
     * @param openDataFilter 是否开启数据权限
     * @return
     */
    List<Department> findByParentIdOrderBySortOrder(String parentId, Boolean openDataFilter);

    /**
     * 通过父id和状态获取
     * @param parentId
     * @param status
     * @return
     */
    List<Department> findByParentIdAndStatusOrderBySortOrder(String parentId, Integer status);

    /**
     * 部门名模糊搜索 升序
     * @param title
     * @param openDataFilter 是否开启数据权限
     * @return
     */
    List<Department> findByTitleLikeOrderBySortOrder(String title, Boolean openDataFilter);

//    /**
//     * 分页查询部门
//     * @param department
//     * @param searchVo
//     * @param pageable
//     * @return
//     */
//    Page<Department> findByCondition(Department department, SearchVo searchVo, Pageable pageable);
}