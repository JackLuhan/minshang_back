package com.minshang.erp.modules.base.controller.manage;

import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.constant.SettingConstant;
import com.minshang.erp.common.utils.*;
import com.minshang.erp.common.vo.OssSetting;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.base.entity.File;
import com.minshang.erp.config.exception.MinShangException;
import com.minshang.erp.modules.base.service.FileService;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.utils.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;


/**
 * @author houyi
 */
@Slf4j
@RestController
@Api(description = "文件管理管理接口")
@RequestMapping("/minshang/file")
@Transactional
public class FileController {

    @Autowired
    private FileService fileService;

    @Autowired
    private QiniuUtil qiniuUtil;

    @Autowired
    private AliOssUtil aliOssUtil;

    @Autowired
    private FileUtil fileUtil;

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private StringRedisTemplate redisTemplate;

    public String getUsedOss(){

        String v = redisTemplate.opsForValue().get(SettingConstant.OSS_USED);
        if(StrUtil.isBlank(v)){
            throw new MinShangException("您还未配置第三方OSS文件服务");
        }
        return v;
    }

    @RequestMapping(value = "/getByCondition",method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取")
    public Result<Page<File>> getFileList(@ModelAttribute File file,
                                          @ModelAttribute SearchVo searchVo,
                                          @ModelAttribute PageVo pageVo){
        String used = getUsedOss();
        if(used.equals(SettingConstant.LOCAL_OSS)){
            file.setLocation(CommonConstant.OSS_LOCAL);
        }else if(used.equals(SettingConstant.QINIU_OSS)){
            file.setLocation(CommonConstant.OSS_QINIU);
        }else if(used.equals(SettingConstant.ALI_OSS)){
            file.setLocation(CommonConstant.OSS_ALI);
        }
        Page<File> page = fileService.findByCondition(file, searchVo, PageUtil.initPage(pageVo));
        if(used.equals(SettingConstant.LOCAL_OSS)){
            OssSetting os =  fileUtil.getOssSetting();
            String url = os.getHttp() + os.getEndpoint() + "/";
            entityManager.clear();
            page.getContent().forEach(e -> {
                e.setUrl(url + e.getId());
            });
        }
        return new ResultUtil<Page<File>>().setData(page);
    }

    @RequestMapping(value = "/copy",method = RequestMethod.POST)
    @ApiOperation(value = "文件复制")
    public Result<Object> copy(@RequestParam String id,
                               @RequestParam String key) {

        File file = fileService.get(id);
        String toKey = "副本_" + key;
        String newUrl = "";
        if(getUsedOss().equals(SettingConstant.QINIU_OSS)){
            newUrl = qiniuUtil.copyFile(key, toKey);
        }else if(getUsedOss().equals(SettingConstant.ALI_OSS)){
            newUrl = aliOssUtil.copyFile(key, toKey);
        }else if(getUsedOss().equals(SettingConstant.LOCAL_OSS)){
            newUrl = fileUtil.copyFile(file.getUrl(), toKey);
        }
        File newFile = new File();
        newFile.setName(file.getName());
        newFile.setFKey(toKey);
        newFile.setSize(file.getSize());
        newFile.setType(file.getType());
        newFile.setLocation(file.getLocation());
        newFile.setUrl(newUrl);
        fileService.save(newFile);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/rename",method = RequestMethod.POST)
    @ApiOperation(value = "文件重命名")
    public Result<Object> upload(@RequestParam String id,
                                 @RequestParam String key,
                                 @RequestParam String newKey,
                                 @RequestParam String newName) {

        File file = fileService.get(id);
        String newUrl = "";
        if(!key.equals(newKey)){
            if(getUsedOss().equals(SettingConstant.QINIU_OSS)){
                newUrl = qiniuUtil.renameFile(key, newKey);
            }else if(getUsedOss().equals(SettingConstant.ALI_OSS)){
                newUrl = aliOssUtil.renameFile(key, newKey);
            }else if(getUsedOss().equals(SettingConstant.LOCAL_OSS)){
                newUrl = fileUtil.renameFile(file.getUrl(), newKey);
            }
        }
        file.setName(newName);
        file.setFKey(newKey);
        if(!key.equals(newKey)) {
            file.setUrl(newUrl);
        }
        fileService.update(file);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "文件删除")
    public Result<Object> delete(@PathVariable String[] ids) {

        for(String id : ids){
            File file = fileService.get(id);
            if(getUsedOss().equals(SettingConstant.QINIU_OSS)){
                qiniuUtil.deleteFile(file.getFKey());
            }else if(getUsedOss().equals(SettingConstant.ALI_OSS)){
                aliOssUtil.deleteFile(file.getFKey());
            }else if(getUsedOss().equals(SettingConstant.LOCAL_OSS)){
                fileUtil.deleteFile(file.getUrl());
            }
            fileService.delete(id);
        }
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "本地存储预览文件")
    @CrossOrigin
    public void view(@PathVariable String id, HttpServletResponse response) throws IOException {

        File file = fileService.get(id);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(file.getFKey(), "UTF-8") + "\"");
        response.addHeader("Content-Length", file.getSize().toString());
        response.setContentType("application/octet-stream;charset=UTF-8");
        fileUtil.view(file.getUrl(), response);
    }
}
