<#if pojo.needsEqualsHashCode() && !clazz.superclass?exists>   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ${pojo.getDeclarationName()?replace(tablePrefix,"")}) ) return false;
		 ${pojo.getDeclarationName()?replace(tablePrefix,"")} castOther = ( ${pojo.getDeclarationName()?replace(tablePrefix,"")} ) other; 
         
		 return ${pojo.generateEquals("this", "castOther", jdk5)};
   }
   
   public int hashCode() {
         int result = 17;
         
<#foreach property in pojo.getAllPropertiesIterator()>         ${pojo.generateHashCode(property, "result", "this", jdk5)}
</#foreach>         return result;
   }   
</#if>