package com.minshang.erp.modules.base.dao.elasticsearch;

import com.minshang.erp.modules.base.entity.elasticsearch.EsLog;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;


/**
 * @author houyi
 */
public interface EsLogDao extends ElasticsearchRepository<EsLog, String> {

}
