package com.cmower.database.entity;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.exception.OrderException;
import com.cmower.dal.DataEntity;

@SuppressWarnings("serial")
public class UploadFile extends DataEntity<UploadFile> {
	/**
	 * 保存文件的目录
	 */
	private String uploadPath;
	/**
	 * 上传文件的原始文件名
	 */
	private String originalFileName;
	/**
	 * 文件大小
	 */
	private Long fileSize;
	/**
	 * 文件保存后的唯一文件名
	 */
	private String fileName;
	/**
	 * 客户端可以访问的文件路径+文件名
	 */
	private String completeName;
	/**
	 * <input type="file" name="headimg">中的headimg
	 */
	private String parameterName;

	/**
	 * MultipartFile
	 * 
	 * 封装了请求数据中的文件，此时这个文件存储在内存中或临时的磁盘文件中，需要将其转存到一个合适的位置，因为请求结束后临时存储将被清空。
	 * <p>
	 * 在 MultipartFile 接口中有如下方法：
	 * 
	 * String getName(); // 获取参数的名称 <br>
	 * 
	 * String getOriginalFilename(); // 获取文件的原名称 <br>
	 * 
	 * String getContentType(); // 文件内容的类型 <br>
	 * 
	 * boolean isEmpty(); // 文件是否为空 <br>
	 * 
	 * long getSize(); // 文件大小 <br>
	 * 
	 * byte[] getBytes(); // 将文件内容以字节数组的形式返回 <br>
	 * 
	 * InputStream getInputStream(); // 将文件内容以输入流的形式返回 <br>
	 * 
	 * void transferTo(File dest); // 将文件内容传输到指定文件中
	 */
	private MultipartFile multipartFile;

	public UploadFile() {
		super();
	}

	public UploadFile(String parameterName, String uploadPath, String originalFileName, String fileName,
			MultipartFile multipartFile) {
		this.parameterName = parameterName;
		this.uploadPath = uploadPath;
		this.originalFileName = originalFileName;
		this.fileName = fileName;
		this.multipartFile = multipartFile;
		this.fileSize = multipartFile.getSize();
		this.completeName = Variables.ctx + "/" + Constants.DEFAULT_UPLOAD + "/" + fileName;
	}

	/**
	 * @return 文件对象
	 */
	public File getFile() {
		if (uploadPath == null || fileName == null) {
			return null;
		}
		return new File(uploadPath + File.separator + fileName);

	}

	/**
	 * 保存文件
	 */
	public void transferTo() {
		try {
			File file = getFile();
			this.multipartFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			throw new OrderException(e);
		}
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCompleteName() {
		return completeName;
	}

	public void setCompleteName(String completeName) {
		this.completeName = completeName;
	}

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
}
