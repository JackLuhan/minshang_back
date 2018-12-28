package com.minshang.erp.common.utils;

import com.minshang.erp.common.constant.SettingConstant;
import com.minshang.erp.common.vo.OssSetting;
import com.minshang.erp.config.exception.MinShangException;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author houyi
 */
@Component
@Slf4j
public class FileUtil {

    @Autowired
    private StringRedisTemplate redisTemplate;

    public OssSetting getOssSetting(){

        String v = redisTemplate.opsForValue().get(SettingConstant.LOCAL_OSS);
        if(StrUtil.isBlank(v)){
            throw new MinShangException("您还未配置本地文件存储服务");
        }
        return new Gson().fromJson(v, OssSetting.class);
    }

    /**
     * 文件路径上传
     * @param file
     * @param key
     * @return
     */
    public String localUpload(MultipartFile file, String key) {

        OssSetting os = getOssSetting();
        String day = DateUtil.format(DateUtil.date(), "yyyyMMdd");
        String path = os.getFilePath() + "/" + day;
        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }
        File f = new File(path + "/" + key);
        if(f.exists()){
            throw new MinShangException("文件名已存在");
        }
        try {
            file.transferTo(f);
            return path + "/" + key;
        } catch (IOException e) {
            log.error(e.toString());
            throw new MinShangException("上传文件出错");
        }
    }

    /**
     * 读取文件
     * @param url
     * @param response
     */
    public void view(String url, HttpServletResponse response){

        File file = new File(url);
        FileInputStream i = null;
        OutputStream o = null;

        try {
            i = new FileInputStream(file);
            o = response.getOutputStream();

            byte[] buf = new byte[1024];
            int bytesRead;

            while ((bytesRead = i.read(buf))>0){
                o.write(buf, 0, bytesRead);
                o.flush();
            }

            i.close();
            o.close();
        } catch (IOException e) {
            log.error(e.toString());
            throw new MinShangException("读取文件出错");
        }
    }

    /**
     * 重命名
     * @param url
     * @param toKey
     * @return
     */
    public String renameFile(String url, String toKey){

        String result = copyFile(url, toKey);
        deleteFile(url);
        return result;
    }

    /**
     * 复制文件
     * @param url
     * @param toKey
     */
    public String copyFile(String url, String toKey){

        File file = new File(url);
        FileInputStream i = null;
        FileOutputStream o = null;

        try {
            i = new FileInputStream(file);
            o = new FileOutputStream(new File(file.getParentFile() + "/" + toKey));

            byte[] buf = new byte[1024];
            int bytesRead;

            while ((bytesRead = i.read(buf))>0){
                o.write(buf, 0, bytesRead);
            }

            i.close();
            o.close();
            return file.getParentFile() + "/" + toKey;
        } catch (IOException e) {
            log.error(e.toString());
            throw new MinShangException("复制文件出错");
        }
    }

    /**
     * 删除文件
     * @param url
     */
    public void deleteFile(String url){

        File file = new File(url);
        file.delete();
    }
}
