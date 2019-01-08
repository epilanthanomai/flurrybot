<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:svg="http://www.w3.org/2000/svg">

<!--

This file is part of flurrybot.

Flurrybot is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Flurrybot is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
flurrybot. If not, see <https://www.gnu.org/licenses/>.

-->

  <xsl:output indent="yes"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:svg">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="svg:circle"/>
      <xsl:apply-templates select="svg:path[1]" mode="outside"/>
      <xsl:apply-templates select="svg:path[position()>1]" mode="inside"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:circle">
    <xsl:copy>
      <xsl:attribute name="stroke">black</xsl:attribute>
      <xsl:attribute name="fill">black</xsl:attribute>
      <xsl:copy-of select="@cx|@cy|@r"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:path" mode="outside">
    <xsl:copy>
      <xsl:attribute name="stroke">white</xsl:attribute>
      <xsl:attribute name="fill">white</xsl:attribute>
      <xsl:copy-of select="@d"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="svg:path" mode="inside">
    <xsl:copy>
      <xsl:attribute name="stroke">black</xsl:attribute>
      <xsl:attribute name="fill">black</xsl:attribute>
      <xsl:copy-of select="@d"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
