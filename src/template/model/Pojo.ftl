${pojo.getPackageDeclaration()?replace(";","")}.entity;

// Generated ${date} by Hibernate Tools ${version}
import java.io.Serializable;
import javax.persistence.GeneratedValue;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.annotations.GenericGenerator;

<#assign classbody>
<#include "PojoTypeDeclaration.ftl"/> {

<#if !pojo.isInterface()>
<#include "PojoFields.ftl"/>

<#include "PojoConstructors.ftl"/>
   
<#include "PojoPropertyAccessors.ftl"/>

<#include "PojoToString.ftl"/>

<#include "PojoEqualsHashcode.ftl"/>

<#else>
<#include "PojoInterfacePropertyAccessors.ftl"/>

</#if>
<#include "PojoExtraClassCode.ftl"/>
<#include "PojoToStringInLogs.ftl">

}
</#assign>

${pojo.generateImports()}
${classbody}

