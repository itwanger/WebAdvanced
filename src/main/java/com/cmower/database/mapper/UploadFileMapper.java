package com.cmower.database.mapper;

import com.cmower.dal.BaseMapper;
import com.cmower.database.entity.UploadFile;

public interface UploadFileMapper extends BaseMapper<UploadFile, Long> {
	void delete(UploadFile param);
}