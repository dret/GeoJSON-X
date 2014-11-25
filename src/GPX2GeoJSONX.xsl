<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" exclude-result-prefixes="xs" version="2.0">
  <xsl:output method="text" />
  <xsl:template match="gpx">
    <xsl:text>{ "type" : "GeometryCollection",&#xa;</xsl:text>
    <xsl:text>  "geometries" : [&#xa;</xsl:text>
    <xsl:for-each select="trk">
      <xsl:text>    { "type" : "LineString",&#xa;</xsl:text>
      <xsl:variable name="time" select="distinct-values(trkseg/trkpt/time/local-name())"/>
      <xsl:variable name="gpxtpx" select="distinct-values(trkseg/trkpt/extensions/gpxtpx:TrackPointExtension/gpxtpx:*/local-name())"/>
      <xsl:if test="exists(($time, $gpxtpx))">
        <xsl:text>      "extensions" : [ </xsl:text>
        <xsl:for-each select="$time, $gpxtpx">
          <xsl:value-of select="concat('&quot;', ., '&quot;')"/>
          <xsl:if test="position() ne last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each>
        <xsl:text> ],&#xa;</xsl:text>
      </xsl:if>
      <xsl:text>      "coordinates" : [&#xa;</xsl:text>
      <xsl:for-each select="trkseg/trkpt">
        <xsl:text>        [&#xa;</xsl:text>
        <xsl:value-of select="concat('          ', @lon, ',&#xa;')"/>
        <xsl:value-of select="concat('          ', @lat, '')"/>
        <xsl:if test="exists(ele)">
          <xsl:value-of select="concat(',&#xa;          ', ele)"/>
        </xsl:if>
        <xsl:if test="exists(($time, $gpxtpx))">
          <xsl:text>, &#xa;</xsl:text>
        </xsl:if>
        <xsl:if test="exists(time)">
          <xsl:value-of select="concat('          &quot;', time/text(), '&quot;')"/>
          <xsl:if test="exists($gpxtpx)">
            <xsl:text>, &#xa;</xsl:text>
          </xsl:if>
        </xsl:if>
        <xsl:variable name="trkpt" select="."/>
        <xsl:for-each select="$gpxtpx">
          <xsl:variable name="extvalue" select="$trkpt/extensions/gpxtpx:TrackPointExtension/gpxtpx:*[local-name() eq current()]"/>
          <xsl:value-of select="concat('          ', if ( exists($extvalue) ) then $extvalue/text() else '0')"/>
          <xsl:if test="position() ne last()">
            <xsl:text>, &#xa;</xsl:text>
          </xsl:if>
        </xsl:for-each>
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
