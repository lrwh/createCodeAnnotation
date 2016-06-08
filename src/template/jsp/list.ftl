<%@include file="../../frame/IncludeTop.jsp" %>
<%@page  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!-- Generated ${date} by Hibernate Tools ${version} -->
<!-- Tools update by com.cndatacom lish  -->

<link rel="stylesheet" href="../css/listForm.css" type="text/css" />

<form id="listForm" name="listForm" method="post" action="list_${pojo.getDeclarationName()}" >
    <input id="selIdsVal" name="selIdsVal" type="hidden" value="0" />
    <div id="filterDiv" >



        <#foreach field in pojo.getAllPropertiesIterator()>
        <div class="filterField">
            <label>${field.name}:</label>
            <input id="filter_${field.name}" name="filter_${field.name}" value=${'\"'}${r"${param['filter_"}${field.name}${r"']}"}${'\"'} />
        </div>
        </#foreach>

        <div class="filterField">
            <input id="btnFliterSubmit" value="确定" type="button" onclick="javascript:jumpPage(1)"  />
        </div>
    </div>
    <div class="clear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <%--################################################功能按钮#######################################--%>
        <tr>
            <td height="30" background="../images/tab/tab_05.gif">
                <table class="title" width="100%"  cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="../images/tab/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%"  cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="46%" valign="middle"><table width="100%"  cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="5%"><div align="center"><img src="../images/tab/tb.gif" width="16" height="16" /></div></td>
                                                <td width="95%" ><span class="STYLE3">你当前的位置</span>：[业务中心]-[我的邮件]</td>
                                            </tr>
                                        </table></td>
                                    <td width="54%"><table  align="right" cellpadding="0" cellspacing="0">
                                            <tr>

                                                <td width="60"><table width="90%"  cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td ><div align="center"><img src="../images/tab/22.gif" width="14" height="14" /></div></td>
                                                            <td ><div align="center"><a href="new_${pojo.getDeclarationName()}">新增</a></div></td>
                                                        </tr>
                                                    </table></td>
                                                <td width="52"><table width="88%"  cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td><div align="center"><img src="../images/tab/11.gif" width="14" height="14" /></div></td>
                                                            <td><div align="center"><a id="btnDel" action="del_${pojo.getDeclarationName()}" href="#">删除</a></div></td>
                                                        </tr>
                                                    </table></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="16"><img src="../images/tab/tab_07.gif" width="16" height="30" /></td>
                    </tr>
                </table>
            </td>
        </tr>

        <%--#################################################列表内容#######################################--%>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="8" background="../images/tab/tab_12.gif">&nbsp;</td>
                        <td>
                            <table class="content"  cellpadding="0" cellspacing="1"  >
                                <%--###############表头######################--%>
                                <tr>
                                    <td width="3%" height="22" class="ch" >
                                        <input type="checkbox" height="22" name="cbSelAll" id="cbSelAll"  value="checkbox" />
                                    </td>

                                    <#foreach field in pojo.getAllPropertiesIterator()>
                                    <#if field.name!="id">
                                    <td  class="ch">${field.name}</td>
                                    </#if>
                                    </#foreach>

                                    <td width="15%"class="ch" >基本操作</td>
                                </tr>

                                <%--####################记录######################--%>
                                <s:iterator value="results" >
                                    <tr >
                                        <%--################################选择框##############################--%>
                                        <td height="20" class="cr">
                                            <input type="checkbox" name="checkbox2" value="<s:property value="id" />" class="checkItem" />
                                        </td>

                                        <%--####################################记录值#########################################--%>
                                        <#foreach field in pojo.getAllPropertiesIterator()>
                                        <#if field.name!="id">
                                        <td  class="cr">
                                         <#if pojo.getJavaTypeName(field, jdk5)=="Date">
                                           <s:date name="${field.name}" format="yyyy-MM-dd" nice="false" />
                                         <#else>
                                           <s:property value="${field.name}" />
                                          </#if>
                                        </td>
                                        </#if>
                                          </#foreach>

                                        <%--########################编辑、删除 按钮############################--%>
                                        <td class="cr">
                                            <div align="center">
                                                <span >
                                                    <a href=javascript:onEditItem("edit_${pojo.getDeclarationName()}",'<s:property value="id" />') ><img src="../images/tab/edt.gif" border="0" width="16" height="16" />编辑</a>&nbsp; &nbsp;
                                                    <a href=javascript:onDelItem("del_${pojo.getDeclarationName()}",'<s:property value="id" />') ><img src="../images/tab/del.gif" border="0" width="16" height="16" />删除</a>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>

                        </td>
                        <td width="8" background="../images/tab/tab_15.gif">&nbsp;</td>
                    </tr>
                </table>

            </td>
        </tr>
        <%--#################################################分页控件##################################################--%>
        <tr>
            <td height="35" background="../images/tab/tab_19.gif">
                <%@include  file="../../frame/PagingCtrl.jsp" %>
            </td>
        </tr>
        <%-- ##############################################################################################################--%>
    </table>
</form>
<%@include file="../../frame/IncludeBottom.jsp" %>
