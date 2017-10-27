<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head> <title>Students Details</title> </head>
            <body>
            <hr width="50%"/>
                <table border="1" align="center">
                    <tr>
                        <th> USN </th>
                        <th> NAME </th>
                        <th> COLLEGE </th>
                        <th> BRANCH </th>
                        <th> JOINED </th>
                        <th> EMAIL </th>
                    </tr>
                    <xsl:for-each select="studentdetails/students">
                        <tr>
                            <td> <xsl:value-of select="USN"/></td>
                            <td> <xsl:value-of select="Name"/></td>
                            <td> <xsl:value-of select="College"/></td>
                            <td> <xsl:value-of select="Branch"/></td>
                            <td> <xsl:value-of select="Joining"/></td>
                            <td> <xsl:value-of select="Email"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>