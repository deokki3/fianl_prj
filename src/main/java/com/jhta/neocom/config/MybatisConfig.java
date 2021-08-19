package com.jhta.neocom.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = { "com.jhta.neocom.mapper" })
@ComponentScan(basePackages = { "com.jhta.neocom.service" })
public class MybatisConfig {
    @Autowired
    ApplicationContext applicationContext;
    @Autowired
    private DataSource dataSource;

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sb = new SqlSessionFactoryBean();
        sb.setDataSource(dataSource);
        sb.setConfigLocation(applicationContext.getResource("classpath:com/jhta/neocom/mapper/mybatis-config.xml"));
        return (SqlSessionFactory) sb.getObject();
    }

}