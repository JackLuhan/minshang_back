package com.minshang.erp.modules.section.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.section.entity.Section;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 部门接口
 * @author lcmaijia
 */
public interface SectionService extends MinShangBaseService<Section,String> {

    Page<Section> findByCondition(Section section, SearchVo searchVo, Pageable pageable);

    /**
     * 通过部门名获取机构
     * @param sectionname
     * @return
     */
    Section findBySectionname(String sectionname);


}