<#if ejb3?if_exists>
<#if pojo.isComponent()>
@${pojo.importType("javax.persistence.Embeddable")}
<#else>
@Entity
@${pojo.importType("javax.persistence.Table")}(name = "${clazz.table.name}"<#if databaseName?has_content>,catalog="${databaseName}"</#if>)
<#assign uniqueConstraint=pojo.generateAnnTableUniqueConstraint()>
<#if uniqueConstraint?has_content>
    , uniqueConstraints = ${uniqueConstraint} 
</#if>)
</#if>
</#if>