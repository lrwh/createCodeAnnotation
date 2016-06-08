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
public class JSPPageExporter extends GenericExporter {

    private static final String JSP_LISTFORM_FTL = "template/jkfy/jsp.ftl";
    private static final String JSP_EDITFORM_FTL = "template/jkfy/js.ftl";
    private static final String JSP_LIST_2_FTL = "template/jsp/list.ftl";
    private static final String JSP_EDIT_2_FTL = "template/jsp/edit.ftl";

    public JSPPageExporter(Configuration cfg, File outputdir, String actionNamespace) {

        super(cfg, outputdir);
       
        this.actionNamespace = actionNamespace;
    }

    public JSPPageExporter() {
    }
    private String subPackageName = "";
    private String actionNamespace = "";

    @Override
    protected void exportPOJO(Map additionalContext, POJOClass element) {
        additionalContext.put("subPackageName", subPackageName);
        additionalContext.put("actionNamespace", actionNamespace);
        super.exportPOJO(additionalContext, element);
        String filename = resolveFilename(element);
        File destination = new File(getOutputDirectory(), filename);
    }

    @Override
    public void start() {

        ///jsp
    /**    setTemplateName(JSP_LISTFORM_FTL);
        setFilePattern("jsp_ext/{class-name}.jsp");
        super.start();

        
        setTemplateName(JSP_EDITFORM_FTL);
        setFilePattern("js/{class-name}Store.js");
        super.start();
**/
    	System.out.println(getOutputDirectory());
        
        setTemplateName(JSP_LIST_2_FTL);
        setFilePattern("jsp/{class-name}List.jsp");
        super.start();

      
        setTemplateName(JSP_EDIT_2_FTL);
        setFilePattern("jsp/{class-name}Edit.jsp");
        super.start();
    }

    public String getName() {
        return "hbm2jsppage";
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
