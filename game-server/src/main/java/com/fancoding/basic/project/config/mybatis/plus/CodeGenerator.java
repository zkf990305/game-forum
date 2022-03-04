package com.fancoding.basic.project.config.mybatis.plus;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fancoding
 * Date: Created in 2019-03-12 11:29
 * Utils: Intellij Idea
 * Description: 代码生成器
 */
public class CodeGenerator {

    /**
     * 数据库链接地址
     */
    private static final String URL = "jdbc:mysql://localhost:3306/game_forum?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8";

    /**
     * 驱动
     */
    private static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";

    /**
     * 用户名
     */
    private static final String USERNAME = "root";

    /**
     * 密码
     */
    private static final String PASSWORD = "052018";

    /**
     * 作者
     */
    private static final String AUTHOR = "fancoding";

    /**
     * 父包名
     */
    private static final String PACKAGE_PARENT = "com.fancoding.basic.project";

    /**
     * 全局配置
     *
     * @return 返回 GlobalConfig
     */
    private static GlobalConfig getGlobalConfig() {
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir(System.getProperty("user.dir") + "/src/main/java");
        gc.setAuthor(AUTHOR);
        gc.setOpen(false);
        gc.setFileOverride(true);
        return gc;
    }

    /**
     * 数据源配置
     *
     * @return 返回 getDataSourceConfig
     */
    private static DataSourceConfig getDataSourceConfig() {
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(URL);
        dsc.setDriverName(DRIVER_NAME);
        dsc.setUsername(USERNAME);
        dsc.setPassword(PASSWORD);
        return dsc;
    }

    /**
     * 包名配置
     *
     * @return 返回 PackageConfig
     */
    private static PackageConfig getPackageConfig() {
        PackageConfig pc = new PackageConfig();
        pc.setParent(PACKAGE_PARENT);
        return pc;
    }

    /**
     * 模板引擎配置
     *
     * @return 返回 TemplateConfig
     */
    private static TemplateConfig getTemplateConfig() {
        TemplateConfig templateConfig = new TemplateConfig();
        templateConfig.setXml(null);
        return templateConfig;
    }

    /**
     * 策略配置
     *
     * @param tableNames 表名称
     * strategy.setInclude(tableNames) 传入需要 "生成" 的表名
     * strategy.setExclude(tableNames) 传入需要 "过滤" 的表名
     * strategy.setSuperEntityColumns("id");
     * @return 返回 getStrategyConfig
     */
    private static StrategyConfig getStrategyConfig(String... tableNames) {
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        strategy.setInclude(tableNames);
        strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix("_");
        return strategy;
    }

    /**
     * 自定义配置
     *
     * @return 返回 InjectionConfig
     */
    private static InjectionConfig getInjectionConfig() {

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };

        // 如果模板引擎是 freemarker
        final String templatePath = "/templates/mapper.xml.ftl";

        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return System.getProperty("user.dir") + "/src/main/resources/mapping/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });

        cfg.setFileOutConfigList(focList);

        return cfg;
    }


    /**
     * 获取代码生成器
     *
     * @return 返回代码生成器
     */
    private static AutoGenerator getAutoGenerator(String... tableNames) {

        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        mpg.setGlobalConfig(getGlobalConfig());

        // 数据源配置
        mpg.setDataSource(getDataSourceConfig());

        // 包配置
        mpg.setPackageInfo(getPackageConfig());

        // 自定义配置
        mpg.setCfg(getInjectionConfig());

        // 配置模板
        mpg.setTemplate(getTemplateConfig());

        // 策略配置
        mpg.setStrategy(getStrategyConfig(tableNames));

        // 设置模板引擎
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());

        return mpg;
    }

    /**
     * 生产代码
     *
     * @param args args
     */
    public static void main(String[] args) {
        // 执行
        // 用户

        // getAutoGenerator("gf_user").execute();

        // getAutoGenerator("gf_user_role").execute();

        // getAutoGenerator("gf_user__gf_user_role").execute();

        // getAutoGenerator("gf_user_info").execute();

        // 友链

        // getAutoGenerator("gf_links").execute();

        // 游戏分类
        // getAutoGenerator("gf_game_type").execute();

        // 游戏
        // getAutoGenerator("gf_game").execute();

        // 游戏-类型 中间表
        // getAutoGenerator("gf_game__gf_game_type").execute();

        // 帖子表
        // getAutoGenerator("gf_post").execute();

        // 帖子分类
        // getAutoGenerator("gf_post_classify").execute();

        //帖子表
        // 《中间表》
        // 分类表
        // getAutoGenerator("gf_post__gf_post_classify").execute();

        // 帖子标签
        // getAutoGenerator("gf_post_tag").execute();

        //帖子表
        // 《中间表》
        // 标签表
        // getAutoGenerator("gf_post__gf_post_tag").execute();

        // 公告表
        // getAutoGenerator("gf_news").execute();

        // 评论表
        // getAutoGenerator("gf_post_comment").execute();

        // 收藏表
        // getAutoGenerator("gf_post_collect").execute();

        // 点赞表
        // getAutoGenerator("gf_post_like").execute();

        // 游戏评价表
        // getAutoGenerator("gf_game_rank").execute();

        //留言板
        // getAutoGenerator("gf_message").execute();
    }

}