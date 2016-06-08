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
public class ServiceExporter extends GenericExporter {

    private static final String SERVICE_INTERFACE_FTL = "template/manager/manager.ftl";

    public ServiceExporter(Configuration cfg, File outputdir, String subPackageName, String tablePrefix) {

        super(cfg, outputdir);
        this.subPackageName = subPackageName;
        this.tablePrefix = tablePrefix;
    }
    private String subPackageName = "";
    private String tablePrefix = "";
    @Override
    protected void exportPOJO(Map additionalContext, POJOClass element) {
        additionalContext.put("subPackageName", subPackageName);
        additionalContext.put("tablePrefix", tablePrefix);
        super.exportPOJO(additionalContext, element);
    }

    public ServiceExporter() {
    }

    @Override
    public void start() {

        setTemplateName(SERVICE_INTERFACE_FTL);
        setFilePattern("{package-name}/" + subPackageName + "{class-name}Manager.java");
        super.start();
    }

    public String getName() {
        return "hbm2service";
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
