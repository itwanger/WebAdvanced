package com.cmower.common.util;

import com.cmower.common.Constants;
import com.cmower.dal.AjaxResponse;

public class AjaxResponseUtils {

	public static AjaxResponse getFailureResponse() {
		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setStatusCode(Constants.StatusCode.ERROR);
		return ajaxResponse;
	}
	
	public static AjaxResponse getSuccessResponse() {
		AjaxResponse ajaxResponse = new AjaxResponse();
		ajaxResponse.setStatusCode(Constants.StatusCode.OK);
		return ajaxResponse;
	}

}
