<?xml version="1.0" encoding="UTF-8"?>
<!-- 
     Written by Gjermund G Thorsen 2018, all rights deserved
     for the purpose of generating Swift 4 Struct from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<xsl:text>enum </xsl:text><xsl:value-of select="$tableName"/><xsl:text> {
</xsl:text>			
				<xsl:for-each select="fmp:METADATA/fmp:FIELD">
          <xsl:text>  case </xsl:text><xsl:value-of select="@NAME"/><xsl:text>( </xsl:text>
          <xsl:value-of select="concat(
			              substring( 'String',	1 div boolean( @TYPE  = 'TEXT'      ) ),
			              substring( 'String',	1 div boolean( @TYPE  = 'CONTAINER' ) ),
			              substring( 'Date',	1 div boolean( @TYPE  = 'DATE'      ) ),
			              substring( 'Date',	1 div boolean( @TYPE  = 'TIMESTAMP' ) ),
			              substring( 'Date',	1 div boolean( @TYPE  = 'TIME'      ) ),
			              substring( 'Float',	1 div boolean( @TYPE  = 'NUMBER'    ) )
			              )" />
                  <xsl:text>)
</xsl:text>
				</xsl:for-each>
		<xsl:text>}

</xsl:text>
		<xsl:call-template name="makesamplevars"/>
		<xsl:text>
</xsl:text>
		<xsl:call-template name="doswitchcase"/>
	</xsl:template>
		
	
	<xsl:template name="makesamplevars">
		<xsl:for-each select="fmp:METADATA/fmp:FIELD">
			<xsl:text>var </xsl:text>
			<xsl:value-of select="$tableName"/>
			<xsl:value-of select="@NAME"/>
			<xsl:text> = </xsl:text>
			<xsl:value-of select="$tableName"/>
			<xsl:text>.</xsl:text>
			<xsl:value-of select="@NAME"/>
			<xsl:text>("test")
</xsl:text>
			</xsl:for-each>
		</xsl:template>	
	
	
	<xsl:template name="doswitchcase">
		<xsl:text>switch </xsl:text><xsl:value-of select="$tableName"/><xsl:text> {
</xsl:text>			
				<xsl:for-each select="fmp:METADATA/fmp:FIELD">
			<xsl:text>  case .</xsl:text><xsl:value-of select="@NAME"/><xsl:text>
    print("Output: \(</xsl:text><xsl:value-of select="@NAME"/><xsl:text>)")</xsl:text>
                  <xsl:text>
</xsl:text>
				</xsl:for-each>
		<xsl:text>}

</xsl:text>
	</xsl:template>
	
	
	
	<!--
var studDetails = Student.Name("Swift 4")
var studMarks = Student.Mark(98,97,95)

switch studMarks {
   case .Name(let studName):
      print("Student name is: \(studName).")
   case .Mark(let Mark1, let Mark2, let Mark3):
      print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
}
	
	-->
	
	
	<xsl:variable name="databaseName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME"/>
	</xsl:variable>
	<xsl:variable name="tableName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT"/>
	</xsl:variable>
	<xsl:variable name="timeformat">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@TIMEFORMAT"/>
	</xsl:variable>
</xsl:stylesheet><!--
========================================================================================
Copyright (c) 2008 Gjermund Gusland Thorsen, released under the MIT License.
All rights deserved.
This piece comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
========================================================================================
-->
