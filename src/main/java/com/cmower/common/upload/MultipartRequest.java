package com.cmower.common.upload;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cmower.common.Constants;
import com.cmower.common.base.PathKit;
import com.cmower.database.entity.UploadFile;

/**
 * MultipartRequest.
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class MultipartRequest extends HttpServletRequestWrapper {

	private UploadFileManager fileManager;
	private MultipartHttpServletRequest multipartRequest;

	public MultipartRequest(HttpServletRequest request) {
		super(request);
		fileManager = new UploadFileManager();
		wrapMultipartRequest(request);
	}

	/**
	 * 将上传文件的请求转成预期的文件对象，便于进行下一步操作
	 * 
	 * @param request
	 */
	private void wrapMultipartRequest(HttpServletRequest request) {
		String saveDirectory = PathKit.getWebRootPath() + File.separator + Constants.DEFAULT_UPLOAD + File.separator;

		File dir = new File(saveDirectory);
		if (!dir.exists()) {
			if (!dir.mkdirs()) {
				throw new RuntimeException("Directory " + saveDirectory + " not exists and can not create directory.");
			}
		}

		multipartRequest = (MultipartHttpServletRequest) request;

		Iterator<String> fileIterator = multipartRequest.getFileNames();

		while (fileIterator.hasNext()) {
			String fileKey = fileIterator.next();

			// 取得上传文件
			List<MultipartFile> multipartFiles = multipartRequest.getFiles(fileKey);

			for (MultipartFile multipartFile : multipartFiles) {

				String originalFileName = multipartFile.getOriginalFilename();

				if (StringUtils.isNotEmpty(originalFileName)) {
					UploadFile uploadFile = new UploadFile(fileKey, saveDirectory, originalFileName,
							UploadFileManager.renameFile(originalFileName), multipartFile);
					if (isSafeFile(uploadFile)) {
						fileManager.add(uploadFile);
					}
				}
			}
		}
	}

	/**
	 * 要限制上传文件的类型，在收到上传文件名时，判断后缀名是否合法。
	 * 
	 * @param uploadFile
	 * @return
	 */
	private boolean isSafeFile(UploadFile uploadFile) {
		if (uploadFile.getFileName().toLowerCase().endsWith(".jsp")) {
			uploadFile.getFile().delete();
			return false;
		}
		return true;
	}

	public UploadFileManager getFileManager() {
		return fileManager;
	}

	/**
	 * Methods to replace HttpServletRequest methods
	 */
	public Enumeration getParameterNames() {
		return multipartRequest.getParameterNames();
	}

	public String getParameter(String name) {
		return multipartRequest.getParameter(name);
	}

	public String[] getParameterValues(String name) {
		return multipartRequest.getParameterValues(name);
	}

	public Map getParameterMap() {
		Map map = new HashMap();
		Enumeration enumm = getParameterNames();
		while (enumm.hasMoreElements()) {
			String name = (String) enumm.nextElement();
			map.put(name, multipartRequest.getParameterValues(name));
		}
		return map;
	}
}
