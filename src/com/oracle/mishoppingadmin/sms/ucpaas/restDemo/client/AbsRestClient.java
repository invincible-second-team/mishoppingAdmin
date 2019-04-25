package com.oracle.mishoppingadmin.sms.ucpaas.restDemo.client;


import com.oracle.mishoppingadmin.sms.ucpaas.restDemo.SysConfig;

public abstract class AbsRestClient {
	public String server=SysConfig.getInstance().getProperty("rest_server");

	public abstract String sendSms(String sid, String token, String appid, String templateid, String param, String mobile, String uid);

	public StringBuffer getStringBuffer() {
		StringBuffer sb = new StringBuffer("https://");
		sb.append(server).append("/ol/sms");
		return sb;
	}
}
