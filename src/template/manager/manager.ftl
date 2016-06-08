${pojo.getPackageDeclaration()?replace(";","")}.manager;
// Generated ${date} by Hibernate Tools ${version}
//Tools update by sztz


import ${pojo.getPackageDeclaration()?replace("package","")?replace(";","")}.persistence.domain.${pojo.getDeclarationName()?replace(tablePrefix,"")};

import org.springframework.stereotype.Service;

import com.mossle.core.hibernate.HibernateEntityDao;

/**
 *
 * @author admin ${date} 
 */
@Service
public class ${pojo.getDeclarationName()?replace(tablePrefix,"")}Manager extends HibernateEntityDao<${pojo.getDeclarationName()?replace(tablePrefix,"")}> {

}
