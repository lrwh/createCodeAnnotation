/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tools;

import java.io.File;
import java.util.Map;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2x.GenericExporter;
import org.hibernate.tool.hbm2x.pojo.POJOClass;

/**
 *
 * @author Administrator
 */
public class ModelExporter extends GenericExporter {

    private static final String POJO_JAVACLASS_FTL = "template/model/Pojo.ftl";

    private String tablePrefix="";
    private String databaseName="";
    public ModelExporter(Configuration cfg, File outputdir,String tablePrefix, String databaseName) {
        super(cfg, outputdir);
        this.tablePrefix = tablePrefix;
        this.databaseName = databaseName;
    }

    @Override
    protected void exportPOJO(Map additionalContext, POJOClass element) {
        additionalContext.put("tablePrefix", tablePrefix);
        additionalContext.put("databaseName", databaseName);
        super.exportPOJO(additionalContext, element);
    }
    
    @Override
    public void start() {
        setTemplateName(POJO_JAVACLASS_FTL);
        setFilePattern("{package-name}/persistence/domain/{class-name}.java");
        super.start();
    }
    
    public ModelExporter() {

    }

    public String getName() {
        return "hbm2model";
    }

    protected void setupContext() {
        //TODO: this safe guard should be in the root templates instead for each variable they depend on.
        if (!getProperties().containsKey("ejb3")) {
            getProperties().put("ejb3", "false");
        }
        if (!getProperties().containsKey("jdk5")) {
            getProperties().put("jdk5", "false");
        }
        super.setupContext();
    }
}
