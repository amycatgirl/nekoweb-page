<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <title>
                    RSS Feed |
                    <xsl:value-of select="/atom:feed/atom:title"/>
                </title>
                <link rel="stylesheet" href="/styles/base.css"/>
                <link rel="stylesheet" href="/styles/rss.css"/>
            </head>
            <body>
                <main>
                    <h1><span class="material-symbols-outlined">rss_feed</span>RSS Feed</h1>
                    <xsl:for-each select="/atom:feed/atom:entry">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="atom:link/@href"/>
                            </xsl:attribute>

                            <div class="article">
                                <h2>
                                    <xsl:value-of select="atom:title"/>
                                </h2>
                                <p>
                                    <xsl:value-of select="atom:description"/>
                                </p>
                                <xsl:value-of select="atom:summary"/>
                                <span>
                                    Last updated:
                                    <time>
                                        <xsl:value-of select="substring(atom:updated, 0, 11)"/>
                                    </time>
                                </span>
                            </div>
                        </a>
                    </xsl:for-each>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>