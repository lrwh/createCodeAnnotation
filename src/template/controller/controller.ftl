${pojo.getPackageDeclaration()?replace(";","")}.web;
// Generated ${date} by Hibernate Tools ${version}

import ${pojo.getPackageDeclaration()?replace("package","")?replace(";","")}.persistence.domain.${pojo.getDeclarationName()?replace(tablePrefix,"")};
import ${pojo.getPackageDeclaration()?replace("package","")?replace(";","")}.persistence.manager.${pojo.getDeclarationName()?replace(tablePrefix,"")}Manager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mossle.core.hibernate.PropertyFilter;
import com.mossle.core.mapper.BeanMapper;
import com.mossle.core.page.Page;

import java.util.Date;
import java.util.List;


/**
 * @title:${pojo.getDeclarationName()?replace(tablePrefix,"")}Controller
 * @author admin 
 * @Date:${date}
 * @Verision:V1.0
 */
@Controller
@RequestMapping("${actionNamespace}/${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}")
public class ${pojo.getDeclarationName()?replace(tablePrefix,"")}Controller{

	@Resource
	private ${pojo.getDeclarationName()?replace(tablePrefix,"")}Manager ${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}Manager;
	
	/**
	 * 添加
	 */
	@RequestMapping("input")
	public String input(Model model,String id) {
		if(id!=null){
			model.addAttribute("model", ${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}Manager.get(id));
		}
		return "input";
	}

	/**
	 * 保存
	 */
	@RequestMapping("save")
	public String save(@ModelAttribute ${pojo.getDeclarationName()?replace(tablePrefix,"")} ${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}, RedirectAttributes redirectAttributes) {

		${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}Manager.save(${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first});
		return "redirect:/list.do";
	}

	/**
	 * 列表
	 */
	@RequestMapping("list")
	public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model){
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = ${(pojo.getDeclarationName()?replace(tablePrefix,""))?uncap_first}Service.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        return "list";
	}
}