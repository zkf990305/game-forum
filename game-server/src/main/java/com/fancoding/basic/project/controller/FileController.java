package com.fancoding.basic.project.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import com.fancoding.basic.project.utils.ResultVoUtil;
import com.fancoding.basic.project.utils.vo.ResultVo;
import io.swagger.annotations.Api;


import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * @Author: caidaxing
 * @Date: 2022/02/09/0:32
 * @Description:
 */
@RestController
@Api(tags = "文件上传下载")
@RequiredArgsConstructor
@RequestMapping("/files")
public class FileController {

    @Value("${server.port}")
    private String port;

    @Value("${file.ip}")
    private String ip;

    @Value("${server.servlet.context-path}")
    private String contextPath;


    /**
     * 上传接口
     * @param file
     * @return
     * @throws IOException
     */
    @ApiOperation("上传接口")
    @PostMapping("/upload")
    public ResultVo upload(MultipartFile file) throws IOException {
        // 获取源文件的名称
        String originalFilename = file.getOriginalFilename();
        // 定义文件的唯一标识（前缀）
        String flag = IdUtil.fastSimpleUUID();
        // 获取上传的路径
        String rootFilePath = System.getProperty("user.dir") + "/files/" + flag +
                "_" + originalFilename;
        // 把文件写入到上传的路径
        FileUtil.writeBytes(file.getBytes(), rootFilePath);
        // 返回结果 url
        return ResultVoUtil.success("http://" + ip + ":" + port + "/files/" + flag);
    }

    /**
     * 下载接口
     * @param flag
     * @param response
     */
    @ApiOperation("下载接口")
    @GetMapping("/{flag}")
    public void getFiles(@PathVariable String flag, HttpServletResponse response) {
        // 新建一个输出流对象
        OutputStream os;
        // 定于文件上传的根路径
        String basePath = System.getProperty("user.dir") + "/files/";
        // 获取所有的文件名称
        List<String> fileNames = FileUtil.listFileNames(basePath);
        // 找到跟参数一致的文件
        String fileName = fileNames
                .stream()
                .filter(name -> name.contains(flag))
                .findAny()
                .orElse("");
        try {
            if (StrUtil.isNotEmpty(fileName)) {
                response.addHeader("Content-Disposition", "attachment;filename="
                        + URLEncoder.encode(fileName, "UTF-8"));
                response.setContentType("application/octet-stream");
                // 通过文件的路径读取文件字节流
                byte[] bytes = FileUtil.readBytes(basePath + fileName);
                // 通过输出流返回文件
                os = response.getOutputStream();
                os.write(bytes);
                os.flush();
                os.close();
            }
        } catch (Exception e) {
            System.out.println("文件下载失败");
        }
    }

    /**
     * 富文本文件上传接口
     * @param file
     * @return
     * @throws IOException
     */
    @ApiOperation("富文本文件上传接口")
    @PostMapping("/editor/upload")
    public JSON editorUpload(MultipartFile file) throws IOException {
        // 获取源文件的名称
        String originalFilename = file.getOriginalFilename();
        // 定义文件的唯一标识（前缀）
        String flag = IdUtil.fastSimpleUUID();
        // 获取上传的路径
        String rootFilePath = System.getProperty("user.dir") + "/files/" + flag + "_" + originalFilename;
        // 把文件写入到上传的路径
        FileUtil.writeBytes(file.getBytes(), rootFilePath);
        String url = "http://" + ip + ":" + port + contextPath+ "/files/" + flag;
        JSONObject json = new JSONObject();
        json.set("errno", 0);
        JSONArray arr = new JSONArray();
        JSONObject data = new JSONObject();
        arr.add(data);
        data.set("url", url);
        json.set("data", arr);
        // 返回结果 url
        return json;
    }
}
