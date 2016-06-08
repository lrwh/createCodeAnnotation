package com.tools;

import java.io.File;
import java.util.Map;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2x.GenericExporter;
import org.hibernate.tool.hbm2x.pojo.POJOClass;

public class ControllerExporter extends GenericExporter{

	private static final String STRUTS_FTL = "template/controller/controller.ftl";

    public ControllerExporter(Configuration cfg, File outputdir, String subPackageName,String actionNamespace,String tablePrefix) {

        super(cfg, outputdir);
        this.actionNamespace=actionNamespace;
        this.subPackageName = subPackageName;
        this.tablePrefix = tablePrefix;
    }

    public ControllerExporter() {
    	
    }
    private String subPackageName = "";
    private String actionNamespace="";
    private String tablePrefix="";

    @Override
    protected void exportPOJO(Map additionalContext, POJOClass element) {
        additionalContext.put("subPackageName", subPackageName);
        additionalContext.put("actionNamespace", actionNamespace);
        additionalContext.put("tablePrefix", tablePrefix);
        super.exportPOJO(additionalContext, element);
    }

    @Override
    public void start() {
        setTemplateName(STRUTS_FTL);
        setFilePattern("{package-name}/" + subPackageName + "{class-name}Controller.java");
        super.start();
    }

    public String getName() {
        return "hbm2controller";
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
