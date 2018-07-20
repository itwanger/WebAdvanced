package com.cmower.common.upload;

import java.util.Date;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.apache.commons.lang3.time.DateFormatUtils;

import com.cmower.common.base.IdGen;
import com.cmower.database.entity.UploadFile;

/**
 * 上传文件的管理器类
 * 
 * @author maweiqing
 */
public class UploadFileManager {
	private CopyOnWriteArrayList<UploadFile> uploadFiles = new CopyOnWriteArrayList<UploadFile>();

	public void add(UploadFile uploadFile) {
		uploadFiles.add(uploadFile);
	}

	public int size() {
		return uploadFiles.size();
	}

	public UploadFileManager save() {
		for (UploadFile file : uploadFiles) {
			file.transferTo();
		}
		return this;
	}

	public boolean isEmpty() {
		return uploadFiles == null || uploadFiles.size() < 1;
	}

	public List<UploadFile> getFiles() {
		return uploadFiles;
	}

	public UploadFile getFile() {
		if (isEmpty()) {
			return null;
		}
		return uploadFiles.get(0);
	}

	public UploadFile get(String parameterName) {
		for (UploadFile uploadFile : uploadFiles) {
			if (uploadFile.getParameterName().equals(parameterName)) {
				return uploadFile;
			}
		}
		return null;
	}

	/**
	 * 为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名。
	 * 
	 * @param name
	 * @return
	 */
	public static String renameFile(String name) {
		String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			ext = name.substring(dot); // includes "."
		} else {
			ext = "";
		}

		String preName = DateFormatUtils.format(new Date(), "yyyyMMdd") + IdGen.uuid();

		return preName + ext;
	}
}
