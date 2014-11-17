<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.topografix.com/GPX/1/1" exclude-result-prefixes="xs" version="2.0">
  <xsl:output method="text" />
  <xsl:template match="gpx">
    <xsl:text>{ "type" : "GeometryCollection",&#xa;</xsl:text>
    <xsl:text>  "geometries" : [&#xa;</xsl:text>
    <xsl:for-each select="trk">
      <xsl:text>    { "type" : "LineString",&#xa;</xsl:text>
      <xsl:text>      "coordinates" : [&#xa;</xsl:text>
      <xsl:for-each select="trkseg/trkpt">
        <xsl:text>        [&#xa;</xsl:text>
        <xsl:value-of select="concat('          ', @lon, ',&#xa;')"/>
        <xsl:value-of select="concat('          ', @lat, '')"/>
        <xsl:if test="exists(ele)">
          <xsl:value-of select="concat(',&#xa;          ', ele)"/>
        </xsl:if>
        <xsl:text>&#xa;        ]</xsl:text>
        <xsl:if test="position() ne last()">
          <xsl:text>, &#xa;</xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text> ] }&#xa;</xsl:text>
    </xsl:for-each>
    <xsl:text>] }&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
