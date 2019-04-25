package com.oracle.mishoppingadmin.sms;


import com.oracle.mishoppingadmin.sms.ucpaas.restDemo.client.AbsRestClient;
import com.oracle.mishoppingadmin.sms.ucpaas.restDemo.client.JsonReqClient;
import com.oracle.mishoppingadmin.util.FastJsonUtil;

import java.io.IOException;

public class RestUtil {

    private static AbsRestClient InstantiationRestAPI() {
        return new JsonReqClient();
    }

    /**
     * 发送短信
     * @param validateCode 验证码
     * @param mobile 手机号
     */
    public static void sendSms(String validateCode, String mobile) {
        try {
            String SID = "b211f6eda228173766b74673dc07aef3";
            String TOKEN = "b40b88924faff33bee9785df8504a817";
            String APPID = "4240ee44b235434bbefa0b9dde0a3449";
            String TEMPLATEID = "457613";
            String UID = "";
            String result = InstantiationRestAPI().sendSms(SID, TOKEN, APPID, TEMPLATEID, validateCode, mobile, UID);
            System.out.println("Response content is: " + result);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 测试说明  启动main方法后，请在控制台输入数字(数字对应 相应的调用方法)，回车键结束
     * 参数名称含义，请参考rest api 文档
     *
     * @throws IOException
     * @method main
     */
    public static void main(String[] args) throws IOException {
        sendSms("132456","18871013157");
    }
}
