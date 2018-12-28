package com.minshang.erp.modules.base.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务接口
 * @author houyi
 */
public interface QuartzJobService extends MinShangBaseService<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}