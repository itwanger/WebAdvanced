package com.cmower.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmower.database.entity.UploadFile;
import com.cmower.database.enumtype.YesOrNoType;
import com.cmower.database.mapper.UploadFileMapper;

@Service
public class UploadFileService {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private UploadFileMapper uploadFileMapper;

	public List<UploadFile> selectList(String tableName, String related_id, String parameterName, Integer limitNum) {
		UploadFile param = new UploadFile();
		param.setTableName(tableName);
		param.setRelated_id(related_id);
		param.setParameterName(parameterName);
		param.put("limitNum", limitNum);
		return uploadFileMapper.selectList(param);
	}


	public void delete(UploadFile deleteParam) {
		deleteParam.setDel_flag(YesOrNoType.YES.getValue());
		this.uploadFileMapper.delete(deleteParam);
	}

	public void delete(String parameterName, String tableName, String related_id) {
		UploadFile deleteParam = new UploadFile();
		deleteParam.setDel_flag(YesOrNoType.YES.getValue());
		deleteParam.setParameterName(parameterName);
		deleteParam.setRelated_id(related_id);
		deleteParam.setTableName(tableName);
		this.uploadFileMapper.delete(deleteParam);
	}

	public void insert(UploadFile uploadFile) {
		uploadFile.preInsert();
		this.uploadFileMapper.insert(uploadFile);
	}

	public UploadFile loadOne(String tableName, String related_id, String parameterName) {
		UploadFile param = new UploadFile();
		param.setTableName(tableName);
		param.setRelated_id(related_id);
		param.setParameterName(parameterName);
		return uploadFileMapper.loadOne(param);
	}
}
