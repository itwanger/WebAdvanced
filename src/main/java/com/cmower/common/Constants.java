package com.cmower.common;

public class Constants {
	public static final String SERVER_ERROR = "服务器访问太过频繁，请稍后再试。";
	public static final String QUERY_ERROR = "请求信息有误，请检查。";

	public class StatusCode {
		public static final int OK = 200;
		public static final int ERROR = 300;
		public static final int TIMEOUT = 301;
	}
}
