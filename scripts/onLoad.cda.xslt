<?xml version="1.0" encoding="UTF-8"?>
<!--
  - Updates the IG to list all found spreadsheets, sets license and fills in all of the default parameters used by this template
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://hl7.org/fhir" exclude-result-prefixes="html f">
  <xsl:import href="onload.xslt"/>
  <xsl:template match="f:definition">
    <xsl:copy>
      <xsl:apply-templates select="@*|f:id|f:extension|f:modifierExtension|f:grouping|f:resource|f:page|f:parameter"/>
      <xsl:call-template name="addParameters"/>
      <xsl:call-template name="addCDAParameters"/>
      <xsl:apply-templates select="f:template"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template name="addCDAParameters">
    <xsl:call-template name="setParameter">
      <xsl:with-param name="code" select="'excludejson'"/>
      <xsl:with-param name="value" select="'true'"/>
    </xsl:call-template>
    <xsl:call-template name="setParameter">
      <xsl:with-param name="code" select="'excludettl'"/>
      <xsl:with-param name="value" select="'true'"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>