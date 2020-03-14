<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:wd="urn:com.workday/bsvc"
	xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" 
	exclude-result-prefixes="#all">
	
	<xsl:output method="xml" />

	<xsl:template match="/">
		<xsl:variable name="first_name"><xsl:value-of select="wd:Worker/wd:Worker_Data/wd:Personal_Data/wd:Name_Data/wd:Preferred_Name_Data/wd:Name_Detail_Data/wd:First_Name"/></xsl:variable>
		<xsl:variable name="last_name"><xsl:value-of select="wd:Worker/wd:Worker_Data/wd:Personal_Data/wd:Name_Data/wd:Preferred_Name_Data/wd:Name_Detail_Data/wd:Last_Name"/></xsl:variable>
		<worker-information>
			<worker>
					<employee_id><xsl:value-of select="wd:Worker/wd:Worker_Data/wd:Worker_ID" /></employee_id>
					<first_name><xsl:value-of select="$first_name" /></first_name>
					<last_name><xsl:value-of select="$last_name" /></last_name>
					<gender><xsl:value-of select="/wd:Worker/wd:Worker_Data/wd:Personal_Data/wd:Gender_Reference/wd:ID[@wd:type='Gender_Code']" /></gender>
					<birth_date><xsl:value-of select="substring(/wd:Worker/wd:Worker_Data/wd:Personal_Data/wd:Birth_Date,1,10)" /></birth_date>
			</worker>
		</worker-information>
	</xsl:template>
</xsl:stylesheet>