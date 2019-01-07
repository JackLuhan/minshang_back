package com.minshang.erp.modules.section.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.section.entity.Section;

import java.util.List;

/**
 * 部门数据处理层
 * @author lcmaijia
 */
public interface SectionDao extends MinShangBaseDao<Section,String> {

    // 查找sectionname
    List<Section> findBySectionname(String sectionname);
}