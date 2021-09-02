package cn.fungus.config;
import java.io.FileWriter;
import java.io.IOException;
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117635682";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCWUovc3fkUaeCX3dUHHWnoLn+UAwtJH6R8bfXddkN3CLsurCLI8aPMB7GZDsmiWutXBPaNGqzZIxemAjKrsBsKcGi00gdHPr1e4Tk075D1gADvH/Vpmz5MSn2gY8EwTbSCllOKxM4VgLKBMHDgUgdaYLDvvhzu9mfbZIpURjuG8XHaoV99ByPCXonhtJRGRNJHICVJkssOTeXpEcy0y0morZAssVMoAhdYlzWTsIu0gD7Vtjb2Gd8qqZD67qO73mvM48vJhsrzsE6iiX5otuEeonUbmSeDDMalYtTyLIGu/jV19oiiWty8rgaVKiSNeluwanoEPPyjYpc3YiQ6LXh/AgMBAAECggEACy+3YsdN+tvqL8L9UFs6/2E+czhKxbVKG0xfiIx9dsU6kL2UlRmOU+eaqsYz8RYM/1vKMTPz+vCmmN7/AFHJoVw+Hn6mtgGQPBhMlojhY7OT3jelnqdD2o+Mi7wAq2SM807WhrQgle8O2ZhOPhM8otghMqYWJx5FGkmAFcdoNKFzxmX9yNzEWgA1EgzsOUYrTnWQ2XcMcI0iDZ3RjOP528pXHrWmZVQK14IrlITUjIG1N7qRB7nsoLkus9Ps3VT86xjlVSZSUriWOgup1dhb7Kj4FNuY8j2n43dF5Rp2VcabcfgxEUSXWZw6gyUCASe3EBrC/O3I1mwB56L86lpsQQKBgQDV1GMgbek8Tb1GadBHmwd8LbvwP2bZzi8X9fBpwR9XtsouJC8l6WMaChKEHkdIX5rfpWNddSVVIDi8eSeivftqnjc5fdaGI5yf4f8GKzKgAqvayWEIflT8x4tclDB/UgQ6f1UVilIX4pX4a7yHhA46og6ci0Ch6bgmgYxHWwCn3wKBgQCz999v/RVWOXFjQ7c/YNa85YloRQUNJPPISzevwwl/a9Cl9E+6IeKkThkHZzeM2q7LnOMOS2qgQ1nr6uJro/oWb9NXB9XhVu6Fg2Tx1f5cdMi9LzlxmIB0uCT7GmjM95D8dJOJlqlBPuY8EnZRtAiljbZAEUZhHky55t4uDtHDYQKBgQCufoBaEXd4z5O651ShaoDENGoe1w5uhVRnADstgfy6zp7U4pBbJsbJlBiiGjdfdy1ifovE03kgq4fBPjk7FEAcNHqqfudWVa9Vxc4gUZYhf6yQgS+fB8EA+zHd3cxpyhtLRWfAiT0O4sgxjnGuQPR/oom78+NNffXZ7nP0Mu4pDwKBgD/vuOa9X/4xDDJ61Thj/AZB+e4cTy4bSayH5HHB9bbaI9dBk62J6k37HPM/XUHiUyUtSJFEg84J/4FMAkLBj9C2y7toojibPMQcKRmtr99C8iocA+lyh3hwD1tSR5dCALVf6SaBawIuCXegC379WfEPBod+W6WXMST+e0KbqzQhAoGAaiBTI8bXAfVTK8gcVDucUYho/jT2w25HRGjNgePlghSlMTbCoVUjN6e1IfXT/KOVGOT6I8lMZedwIMZ6jQOH5R2gqGdkk30yHHVgn6JMeco3XDJuIfPZ46HHQNTGNDk6M0LAulkcqN7La77AEZfFO4Zfp0vSg2BYFokJNnIXpFo=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArxm7RksHPJaViK/lYz3+JfKSmsOdlg9QyzKhuteBD1Bi67Im5ouOIEKA5OXhn25VokcwqyEdMB4PaZCH6kwzoKvdkpUF79cZSn0D7mxhR6gQdddJf4Kv8V/EXvaznXwyc81Tpw8F+6s1YbSPknVyrNk3UFMjCbyAp/hHIBOlAJOJcMsOX4TjfYq+JdrYVqsMCwuSEwr+dtfy2ixmKse3MUgl5W4ri0Yodl/4Y8abDHbaGnhv5fYzmBDArjrZ67ckk1mKcruOUprfclejyoShppUH1AfattxCorlohjBum85HtplFuv0dOLCKGLMgyDl8ugzPdvk7uNrdcCk8RSAonQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";
	public static String notify_url = "http://localhost:8088/EdibleFungusSMS/alipay/aliNotify";
//	public static String notify_url = "http://localhost:8088/EdibleFungusSMS/alipay/6";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
	public static String return_url = "http://localhost:8088/EdibleFungusSMS/alipay/aliReturn";
//	public static String return_url = "http://localhost:8088/EdibleFungusSMS/alipay/7";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

