<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <all_tags>
      <xsl:for-each select="//contractnum">
      	<xsl:variable name="tmpContract" select="."/>
      	<xsl:variable name="opt2" select="sum(//tag[ContractNum=$tmpContract]/Opt2Price)"/>
      	<xsl:variable name="opt3" select="sum(//tag[ContractNum=$tmpContract]/Opt3ICPrice) + sum(//tag[ContractNum=$tmpContract]/Opt3ACPrice)"/>
      	<xsl:variable name="opt1" select="sum(//tag[ContractNum=$tmpContract]/Opt1Price)"/>
        <contract number="{$tmpContract}" opt2total="{$opt2}" opt3total="{$opt3}" opt1total="{$opt1}">
          <!--
          <SoldToNum total="{//tag[ContractNum='node()']/Opt2Price}">
          -->
          <SoldToNum bpos="{position()}">
            <xsl:value-of select="."/>
          </SoldToNum>
        </contract>
      </xsl:for-each>
    </all_tags>
  </xsl:template>
</xsl:stylesheet>
