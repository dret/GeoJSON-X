<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:output method="text" />
  <xsl:template match="GeoJSON-X">
    <xsl:result-document href="README.md">
      <xsl:text>GeoJSON-X Well-Known Extensions&#xa;</xsl:text>
      <xsl:text>===============================&#xa;&#xa;</xsl:text>
      <xsl:text>Well-Known Values&#xa;</xsl:text>
      <xsl:text>-----------------&#xa;&#xa;</xsl:text>
      <xsl:text>| Value | Description |&#xa;</xsl:text>
      <xsl:text>| ----- | ----------- |&#xa;</xsl:text>
      <xsl:for-each select="well-known">
        <xsl:sort select="@id"/>
        <xsl:value-of select="concat('| ', @id, ' | ')"/>
        <xsl:value-of select="concat(text(), ' (Source: ', //spec[@id eq current()/@src]/title, ')')"/>
        <xsl:text> |&#xa;</xsl:text>
      </xsl:for-each>
      <xsl:text>&#xa;References&#xa;</xsl:text>
      <xsl:text>----------&#xa;&#xa;</xsl:text>
      <xsl:for-each select="spec">
        <xsl:sort select="title"/>
        <xsl:value-of select="concat(position(), '. (', title/text(), ')[', @href, ']')"/>
      </xsl:for-each>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>
