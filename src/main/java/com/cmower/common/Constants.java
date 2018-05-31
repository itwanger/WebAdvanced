package com.cmower.common;

public class Constants {
	public static final String SERVER_ERROR = "服务器访问太过频繁，请稍后再试。";
	public static final String QUERY_ERROR = "请求信息有误，请检查。";
	public static final String SESSION_KAPTCHA_CODE = "SESSION_KAPTCHA_CODE";

	public class StatusCode {
		public static final int OK = 200;
		public static final int ERROR = 300;
		public static final int TIMEOUT = 301;
	}

	public class Geetest {
		public static final String ID = "9fa36260326373f288c95bd4a2ac3bfc";
		public static final String KEY = "5a2f49e9c606aebe58c7be61e64ee15c";
		public static final boolean NEWFAILBACK = true;
	}
}
