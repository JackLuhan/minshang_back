package com.minshang.erp.common.utils;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 查询参数
 */
public class Query extends LinkedHashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	// 
	private int pageSize;
	// 每页条数
	private int pageNum;

	public Query(Map<String, Object> params) {
		this.putAll(params);
		// 分页参数
		this.pageSize = Integer.parseInt(params.get("pageSize").toString());
		this.pageNum = Integer.parseInt(params.get("pageNum").toString());
		this.put("pageSize", pageSize);
		this.put("page", pageSize / pageNum + 1);
		this.put("pageNum", pageNum);
	}

	public int getOffset() {
		return pageSize;
	}

	public void setOffset(int pageSize) {
		this.put("pageSize", pageSize);
	}

	public int getLimit() {
		return pageNum;
	}

	public void setLimit(int pageNum) {
		this.pageNum = pageNum;
	}
}
