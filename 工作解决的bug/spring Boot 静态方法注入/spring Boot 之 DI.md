# spring Boot 之DI





```java
@Component
public class QuickStart {
    @Resource
    private  MemberMapper memberMapper;

    private static  QuickStart quickStart;

//    初始化
    @PostConstruct
    public void init(){
        quickStart = this;
        quickStart.memberMapper = this.memberMapper;
    }

    /** 商户号 */
    public static String merchantId = "1607662657";
    /** 商户API私钥路径 */
    public static String privateKeyPath = "src/main/resources/pay/apiclient_key.pem";
    /** 商户证书序列号 */
    public static String merchantSerialNumber = "752E164B15E91EC8EE6EB883E87B3EBD91DB6F36";
    /** 商户APIV3密钥 */
    public static String apiV3Key = "ybjcwlybjcwlybjcwlybjcwlybjcwlyb";


    /**
     *
     * @param price 商品价格
     * @param productName  商品名称
     * @param additionalData 追加参数会通过回调函数返回
     * @param outTradeNo 订单号
     * @return Result
     */

    public static Result pay(BigDecimal price, String productName, String additionalData, String outTradeNo, String openID) {

        Member openid = quickStart.memberMapper.selectOne(new QueryWrapper<Member>().eq("openid", openID));
        if (openid == null){
            return  Result.error().message("用户未登陆请登陆");
        }


        //     转成integer
        Integer multiply = price.multiply(new BigDecimal(100)).intValue();

        // 使用自动更新平台证书的RSA配置
        // 一个商户号只能初始化一个配置，否则会因为重复的下载任务报错
        Config config =
                new RSAAutoCertificateConfig.Builder()
                        .merchantId(merchantId)
                        .privateKeyFromPath(privateKeyPath)
                        .merchantSerialNumber(merchantSerialNumber)
                        .apiV3Key(apiV3Key)
                        .build();
        // 构建service
        NativePayService service = new NativePayService.Builder().config(config).build();
        // request.setXxx(val)设置所需参数，具体参数可见Request定义
        PrepayRequest request = new PrepayRequest();
        Amount amount = new Amount();
        amount.setTotal(multiply); //单位为分
        request.setAmount(amount);
//        公众号公钥
        request.setAppid("wxd2151aa83d4b5530");
        request.setMchid(merchantId);
//        商品名
        request.setDescription(productName);
        request.setAttach(additionalData);
//       回调函数     使用内网穿透 暴露内网 成为外网方便 微信回调
        request.setNotifyUrl("https://4a880x0595.goho.co/order/payAfter");
//        订单号
        request.setOutTradeNo(outTradeNo);
        // 调用下单方法，得到应答
        PrepayResponse response = service.prepay(request);
        // 使用微信扫描 code_url 对应的二维码，即可体验Native支付
        String codeUrl = response.getCodeUrl();

        if (codeUrl != null){
            return Result.ok().message("支付链接").data(codeUrl);
        }
        return Result.error().message("支付链接获取失败");

    }



}
```

