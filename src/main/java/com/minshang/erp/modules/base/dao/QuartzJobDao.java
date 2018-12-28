package com.minshang.erp.modules.base.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务数据处理层
 * @author houyi
 */
public interface QuartzJobDao extends MinShangBaseDao<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}