package com;

import java.io.File;

import org.hibernate.cfg.Environment;
import org.hibernate.cfg.JDBCMetaDataConfiguration;
import org.hibernate.cfg.reveng.DefaultReverseEngineeringStrategy;
import org.hibernate.cfg.reveng.OverrideRepository;
import org.hibernate.cfg.reveng.ReverseEngineeringSettings;
import org.hibernate.cfg.reveng.ReverseEngineeringStrategy;

import com.tools.ControllerExporter;
import com.tools.JSPPageExporter;
import com.tools.ModelExporter;
import com.tools.ServiceExporter;

public class Main {
	public static void main(String[] args) {

        // <editor-fold defaultstate="collapsed" desc="逆向工程配置">
        //数据库连接配置文件
    	File cfgFile;
    	 String dir=System.getProperty("user.dir");
//         cfgFile = new File(dir+"\\src\\cfg\\oracle\\hibernate.cfg.xml");
         cfgFile = new File(dir+"\\resources\\hibernate.cfg.xml");

         //逆向工程配置文件
         File revengFile;
         revengFile = new File(dir+"\\resources\\hibernate.reveng.xml");

         //文件输出目录
         File outputdir;
         outputdir = new File("d:\\test\\frame\\");

         //主包名
         String defaultPackageName;
         defaultPackageName = "com.mossle.wealth";

         //manager层子包名
         String subPackageName = "persistence/manager/";
         //controller层-web层
         String controllerPackageName = "web/";

         //service层子包名
         String actionNamespace = "";
         
         //表前缀,如果没有就不填
         String tablePrefix = "T";
         
         //数据库名称 只有model 数据库名称用到
         String databaseName = "";
         

        JDBCMetaDataConfiguration jdbcmetadataconfiguration;
        jdbcmetadataconfiguration = new JDBCMetaDataConfiguration();
        
        jdbcmetadataconfiguration.setProperty(Environment.AUTOCOMMIT, "true");
        DefaultReverseEngineeringStrategy defaultreverseengineeringstrategy = new DefaultReverseEngineeringStrategy();
        Object obj1 = defaultreverseengineeringstrategy;
        OverrideRepository overriderepository = new OverrideRepository();
        org.hibernate.cfg.Configuration configuration = jdbcmetadataconfiguration.configure(cfgFile);
       
        overriderepository.addFile(revengFile);
        obj1 = overriderepository.getReverseEngineeringStrategy(((ReverseEngineeringStrategy) (obj1)));
        ReverseEngineeringSettings reverseengineeringsettings = new ReverseEngineeringSettings(((ReverseEngineeringStrategy) (obj1)));
        reverseengineeringsettings.setDefaultPackageName(defaultPackageName);
        defaultreverseengineeringstrategy.setSettings(reverseengineeringsettings);
        ((ReverseEngineeringStrategy) (obj1)).setSettings(reverseengineeringsettings);
        jdbcmetadataconfiguration.setReverseEngineeringStrategy(overriderepository.getReverseEngineeringStrategy(((ReverseEngineeringStrategy) (obj1))));
        jdbcmetadataconfiguration.readFromJDBC();
        jdbcmetadataconfiguration.buildMappings();
        // </editor-fold>

        // <editor-fold defaultstate="collapsed" desc="通过ftl模板，生成各层文件（java、jsp...）">
        //生成model层 entity
        ModelExporter pojoexporter = new ModelExporter(jdbcmetadataconfiguration, outputdir ,tablePrefix,databaseName);
        pojoexporter.getProperties().setProperty("jdk5", "true");
        pojoexporter.getProperties().setProperty("ejb3", "true");
        pojoexporter.start();
        System.out.println("###################生成model层成功#################");

        //生成service层-manager
        ServiceExporter serviceexporter = new ServiceExporter(configuration, outputdir,subPackageName,tablePrefix);
        serviceexporter.getProperties().setProperty("jdk5", "true");
        serviceexporter.getProperties().setProperty("ejb3", "true");
        serviceexporter.start();
        System.out.println("###################生成service层成功#################");
        
        //生成jsp层
        JSPPageExporter jSPPageExporter = new JSPPageExporter(configuration, outputdir,actionNamespace);
        jSPPageExporter.getProperties().setProperty("jdk5", "true");
        jSPPageExporter.getProperties().setProperty("ejb3", "true");
        jSPPageExporter.start();
        System.out.println("###################生成jsp层成功#################");
        

        //生成controller
        ControllerExporter controllerExporter = new ControllerExporter(configuration, outputdir, controllerPackageName, actionNamespace,tablePrefix);
        controllerExporter.getProperties().setProperty("jdk5", "true");
        controllerExporter.getProperties().setProperty("ejb3", "true");
        controllerExporter.start();
        System.out.println("###################生成controller层成功#################");
        // </editor-fold>
    }
}
