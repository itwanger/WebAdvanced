package com.cmower.common.exception;

/**
 * 系统异常基础实现-Unchecked Exception.<br/>
 * 
 * 对于调用者， 异常即使捕获， 也无法处理或者没有任何价值时， 可以继承或者直接使用此异常，然后重新抛出<br/>
 * 
 * 系统中发生的异常， 都需要重新包装为 ServiceException&ServiceRuntimeException 或者其子类
 * 
 * 实现这个异常的目的：<br/>
 * 1.统一异常的父类，便于系统中对异常做统一处理.<br/>
 * 2.复写fillInStackTrace 方法， 降低创建异常的开销.<br/>
 * <br/>
 * Error日志输出时机：<br/>
 * 重新包装原始异常时， 进行日志输出<br/>
 * <br/>
 * 例如：<br/>
 * <pre>
 * try{
 * ...
 * }catch(XxxException e){
 *     logger.error(e);
 *     //重新包装， 进行日志输出
 *     throw new ServiceRuntimeException(e);
 * }catch(ServiceRuntimeException e2){
 *     //接收到ServiceRuntimeException，不做重新包装， 不进行日志输出
 *     throw e2;
 * 
 * }catch(Exception e1){
 *     //重新包装， 进行日志输出
 * 	   logger.error(e1);
 * 	   throw new ServiceRuntimeException(e1);
 * }
 * </pre>
 * 
 * 
 * @author zhaozhl
 *
 */
public class OrderException extends RuntimeException {

	private static final long serialVersionUID = -6879298762342455L;
	
	 private String forward;
	 private String title;

	public OrderException() {
		super();
	}
	
	public OrderException(String message, String forward, String title) {
		super(message);
		this.forward = forward;
		this.title = title;
	}

	public OrderException(String message) {
		super(message);
	}

	public OrderException(Throwable cause) {
		super(cause);
	}

	public OrderException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * 出于性能考虑， 复写此方法。
	 */
	public Throwable fillInStackTrace() {
		return this;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
