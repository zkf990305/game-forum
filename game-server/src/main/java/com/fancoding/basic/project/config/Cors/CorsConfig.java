package com.fancoding.basic.project.config.Cors;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Author: caidaxing
 * @Date: 2022/01/20/16:55
 * @Description: 跨域
 */
@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("*")
                .allowCredentials(true);
    }

    // /**
    //  * 当前跨域请求最大有效时长。这里默认1天
    //  */
    // private static final long MAX_AGE = 24 * 60 * 60;
    //
    // private CorsConfiguration buildConfig() {
    //     CorsConfiguration corsConfiguration = new CorsConfiguration();
    //     // 1 设置访问源地址
    //     corsConfiguration.addAllowedOrigin("*");
    //     // 2 设置访问源请求头
    //     corsConfiguration.addAllowedHeader("*");
    //     // 3 设置访问源请求方法
    //     corsConfiguration.addAllowedMethod("*");
    //     corsConfiguration.setMaxAge(MAX_AGE);
    //     return corsConfiguration;
    // }
    //
    // @Bean
    // public CorsFilter corsFilter() {
    //     UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    //     // 4 对接口配置跨域设置
    //     source.registerCorsConfiguration("/**", buildConfig());
    //     return new CorsFilter(source);
    // }
}
