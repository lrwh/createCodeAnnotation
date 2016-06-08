<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "auth");%>
<%pageContext.setAttribute("currentMenu", "auth");%>
<!doctype html>
<html>
    <head>
	    <%@include file="/common/meta.jsp"%>
	    <title>编辑信息</title>
	    <%@include file="/common/s.jsp"%>     
	     <script type="text/javascript">     
		    $(function() {
			    $("#form").validate({
			    	 submitHandler: function(form) {
						bootbox.animate(false);
						var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
			            form.submit();
			        },
			        errorClass: 'validate-error'
			    });
		    });
		    </script>   
    </head>
    
    <body>
	    <%@include file="/header/market.jsp"%>
	
	    <div class="row-fluid">
		 <%@include file="/menu/wealth-product.jsp"%>
	
		<!-- start of main -->
	    <section id="m-main" class="span10">
	
	      <article class="m-widget">
	        <header class="header">
			  <h4 class="title">编辑产品信息</h4>
			</header>
	
			<div class="content content-inner">
	
		<form id="form" method="post" action="save.do" class="form-horizontal" name="form" enctype="multipart/form-data">
		  <input id="id" type="hidden" name="id" value="${r"${model"}.id}">
		  
		<#list pojo.getAllPropertiesIterator() as pro>
           <#if pro.name!="id">
		  <div class="control-group">
			<label class="control-label" ><#foreach column in pro.columnIterator><#if column.comment?exists && column.comment?trim?length!=0>${column.comment}<#else>${pro.name}</#if></#foreach>:</label>
		    <div class="controls">
                 <input id="${pro.name}" type="text" name="${pro.name}" value="${r"${model"}.${pro.name}}" class="text required">                             
		    </div>
		  </div>
		   </#if>
         </#list>   
		  
    	  <div class="control-group">
		    <div class="controls">
		      <button id="submitButton" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
			  &nbsp;
		      <button type="button" onclick="history.back();" class="btn"><spring:message code='core.input.back' text='返回'/></button>
		    </div>
		  </div>
		</form>
          </div>
      </article>

      <div class="m-spacer"></div>

    </section>
	<!-- end of main -->
	</div>

  </body>  
</html>
