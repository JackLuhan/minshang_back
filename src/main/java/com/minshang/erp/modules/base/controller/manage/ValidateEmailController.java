package com.minshang.erp.modules.base.controller.manage;

import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.constant.SettingConstant;
import com.minshang.erp.common.limit.RedisRaterLimiter;
import com.minshang.erp.common.utils.*;
import com.minshang.erp.common.vo.EmailValidate;
import com.minshang.erp.common.vo.OtherSetting;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.VaptchaSetting;
import com.minshang.erp.modules.base.entity.User;
import com.minshang.erp.config.exception.MinShangException;
import com.minshang.erp.modules.base.service.UserService;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.google.gson.Gson;
import com.minshang.erp.common.utils.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.TimeUnit;

/**
 * @author houyi
 */
@Slf4j
@RestController
@Api(description = "邮箱验证接口")
@RequestMapping("/minshang/email")
@Transactional
public class ValidateEmailController {

    @Autowired
    private EmailUtil emailUtil;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private UserService userService;

    @Autowired
    private IpInfoUtil ipInfoUtil;

    @Autowired
    private RedisRaterLimiter redisRaterLimiter;

    @Autowired
    private SecurityUtil securityUtil;

    private static final String VAPTCHA_URL = "http://api.vaptcha.com/v2/validate";

    public VaptchaSetting getVaptchaSetting(){

        String v = redisTemplate.opsForValue().get(SettingConstant.VAPTCHA_SETTING);
        if(StrUtil.isBlank(v)){
            throw new MinShangException("系统还未配置Vaptcha验证码");
        }
        return new Gson().fromJson(v, VaptchaSetting.class);
    }

    public OtherSetting getOtherSetting(){

        String v = redisTemplate.opsForValue().get(SettingConstant.OTHER_SETTING);
        if(StrUtil.isBlank(v)){
            throw new MinShangException("系统未配置访问域名");
        }
        return new Gson().fromJson(v, OtherSetting.class);
    }

    @RequestMapping(value = "/sendCode/{email}",method = RequestMethod.GET)
    @ApiOperation(value = "发送邮箱验证码")
    public Result<Object> sendCodeEmail(@PathVariable String email,
                                        HttpServletRequest request){

        // IP限流 1分钟限1个请求
        String tokenLimit = redisRaterLimiter.acquireTokenFromBucket("sendCheckEmail:"+ipInfoUtil.getIpAddr(request), 1, 60000);
        if (StrUtil.isBlank(tokenLimit)) {
            throw new MinShangException("您发送的太频繁啦，请稍后再试");
        }
        // 生成验证码 存入相关信息
        EmailValidate e = new EmailValidate();
        // 验证是否注册
        User user = userService.findByEmail(email);
        if(user!=null){
            return new ResultUtil<Object>().setErrorMsg("该邮箱已绑定其他账号");
        }
        User u = securityUtil.getCurrUser();
        e.setUsername(u.getUsername());
        e.setOperation("修改邮箱");

        String code = new CreateVerifyCode().getRandomNum();
        e.setCode(code);
        e.setEmail(email);
        e.setFullUrl(getOtherSetting().getDomain());
        redisTemplate.opsForValue().set(CommonConstant.PRE_EMAIL + email, new Gson().toJson(e, EmailValidate.class), 10L, TimeUnit.MINUTES);

        emailUtil.sendTemplateEmail(email, "【MinShang】修改邮箱验证","code-email", e);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/sendResetCode",method = RequestMethod.POST)
    @ApiOperation(value = "发送邮箱验证码")
    public Result<Object> sendResetCode(@RequestParam String email,
                                        @RequestParam String token,
                                        HttpServletRequest request){

        VaptchaSetting vs = getVaptchaSetting();
        // 验证vaptcha验证码
        String params = "id=" + vs.getVid() + "&secretkey=" + vs.getSecretKey() + "&token=" + token
                + "&ip=" + ipInfoUtil.getIpAddr(request);
        String result = HttpUtil.post(VAPTCHA_URL, params);
        if(!result.contains("\"success\":1")){
            return new ResultUtil<Object>().setErrorMsg("Vaptcha验证码验证失败");
        }
        // 生成验证码 存入相关信息
        EmailValidate e = new EmailValidate();
        // 验证是否注册
        User user = userService.findByEmail(email);
        if(user==null){
            return new ResultUtil<Object>().setErrorMsg("该邮箱未注册");
        }
        // IP限流 1分钟限1个请求
        String tokenLimit = redisRaterLimiter.acquireTokenFromBucket("sendCheckEmail:"+ipInfoUtil.getIpAddr(request), 1, 60000);
        if (StrUtil.isBlank(tokenLimit)) {
            throw new MinShangException("您发送的太频繁啦，请稍后再试");
        }
        e.setUsername(user.getUsername());
        e.setOperation("重置密码");

        String code = new CreateVerifyCode().getRandomNum();
        e.setCode(code);
        e.setEmail(email);
        e.setFullUrl(getOtherSetting().getDomain());
        redisTemplate.opsForValue().set(CommonConstant.PRE_EMAIL + email, new Gson().toJson(e, EmailValidate.class), 10L, TimeUnit.MINUTES);

        emailUtil.sendTemplateEmail(email, "【MinShang】重置密码邮箱验证","code-email", e);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/editEmail",method = RequestMethod.POST)
    @ApiOperation(value = "修改邮箱或重置密码")
    public Result<Object> editEmail(@RequestParam String code,
                                    @RequestParam String email) {

        String v = redisTemplate.opsForValue().get(CommonConstant.PRE_EMAIL + email);
        if(StrUtil.isBlank(v)){
            return new ResultUtil<Object>().setErrorMsg("验证码已过期或邮箱错误");
        }
        EmailValidate e = new Gson().fromJson(v, EmailValidate.class);
        if(!email.equals(e.getEmail())){
            return new ResultUtil<Object>().setErrorMsg("无效的邮箱");
        }
        if(!code.equals(e.getCode())){
            return new ResultUtil<Object>().setErrorMsg("验证码错误");
        }
        User u = securityUtil.getCurrUser();
        u.setEmail(e.getEmail());
        userService.update(u);
        // key失效
        redisTemplate.delete(CommonConstant.PRE_EMAIL + email);
        // 删除缓存
        redisTemplate.delete("user::"+u.getUsername());
        return new ResultUtil<Object>().setSuccessMsg("修改邮箱成功");
    }

    @RequestMapping(value = "/resetByEmail",method = RequestMethod.POST)
    @ApiOperation(value = "通过邮箱重置密码")
    public Result<Object> resetByEmail(@RequestParam String code,
                                       @RequestParam String email,
                                       @RequestParam String password,
                                       @RequestParam String passStrength) {

        String v = redisTemplate.opsForValue().get(CommonConstant.PRE_EMAIL + email);
        if(StrUtil.isBlank(v)){
            return new ResultUtil<Object>().setErrorMsg("验证码已过期或邮箱错误");
        }
        EmailValidate e = new Gson().fromJson(v, EmailValidate.class);
        if(!email.equals(e.getEmail())){
            return new ResultUtil<Object>().setErrorMsg("无效的邮箱");
        }
        if(!code.equals(e.getCode())){
            return new ResultUtil<Object>().setErrorMsg("验证码错误");
        }
        User u = userService.findByEmail(email);

        //在线DEMO所需
        if("test".equals(u.getUsername())||"test2".equals(u.getUsername())){
            return new ResultUtil<Object>().setErrorMsg("演示账号不支持重置密码");
        }
        String encryptPass= new BCryptPasswordEncoder().encode(password);
        u.setPassword(encryptPass);
        u.setPassStrength(passStrength);
        userService.update(u);
        // key失效
        redisTemplate.delete(CommonConstant.PRE_EMAIL + email);
        // 删除缓存
        redisTemplate.delete("user::"+u.getUsername());
        return new ResultUtil<Object>().setSuccessMsg("重置密码成功");
    }
}
