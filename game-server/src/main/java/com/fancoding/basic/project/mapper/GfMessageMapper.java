package com.fancoding.basic.project.mapper;

import com.fancoding.basic.project.entity.GfMessage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 留言表 Mapper 接口
 * </p>
 *
 * @author fancoding
 * @since 2022-03-02
 */
@Repository
public interface GfMessageMapper extends BaseMapper<GfMessage> {


    /**
     * 获取留言列表
     * @return
     */
    @Select("SELECT id,name,phone,content FROM `gf_message`")
    List<GfMessage> listGfMessage() ;
}
