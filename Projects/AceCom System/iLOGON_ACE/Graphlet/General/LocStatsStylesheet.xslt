<!--
	- XSLT is a template based language to transform Xml documents
	It uses XPath to select specific nodes 
	for processing.
	
	- A XSLT file is a well formed Xml document
-->

<!-- every StyleSheet starts with this tag -->
<xsl:stylesheet
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      version="1.0">

  <!-- indicates what our output type is going to be -->
  <xsl:output method="html" />

  <xsl:param name="sectionId"></xsl:param>
  <xsl:param name="lastSectionId"></xsl:param>

  <!-- 
		Main template to kick off processing our Sample.xml
		From here on we use a simple XPath selection query to 
		get to our data.
	-->
  <xsl:template match="/">
    <style type="text/css">
      .menu ul.level {
      margin: 50px 0 0px;
      padding: 0;
      list-style: none;
      float: left;
      clear: both;
      width: 1023px;
      }
      .menu ul.level li {
      padding: 0;
      margin: 0 2px;
      float: left;
      position: relative;
      text-align: center;
      }
      .menu ul.level span {
      padding: 14px 10px;
      display: block;
      color: #000000;
      text-decoration: none;
      font-weight: bold;
      background-color: #ccc;
      }

      .occupied {
      background-color: #F79992 !important;
      }

      .notOccupied {
      background-color: #A2D959 !important;
      }

      .menu ul.level li em {
      color: #fff;
      background:#1d1d1d;
      display:none; /*--Hides by default--*/
      position:absolute;
      padding: 10px 20px;
      z-index:1000;
      -webkit-border-radius: 3px;
      -moz-border-radius: 3px;
      border-radius: 3px;
      top: -40px;
      left: -5px;
      border: 5px solid #444;
      }
    </style>

    <script type="text/javascript">
      <!--$(document).ready(function() {
        $(".menu span").each(function() {
          $(this).qtip({
            content: $(this).next("em"), // Use the tooltip attribute of the element for the content
            position: {
              corner: {
                target: 'topMiddle',
                tooltip: 'bottomMiddle'
              }
            },
            style: {
                  border: {
                     width: 5,
                     radius: 10
                  },
                  padding: 10, 
                  textAlign: 'center',
                  tip: true, // Give it a speech bubble tip with automatic corner detection
                  name: 'cream' // Style it according to the preset 'cream' style
               }
          });
        });
      });-->
      <!--$(document).ready(function(){
        $(".menu span").hover(function(e) {
          $(this).next("em").hoverFlow(e.type, {opacity: "show", top: "-75"}, "slow");
        }, function(e) {
          $(this).next("em").hoverFlow(e.type, {opacity: "hide", top: "-85"}, "fast");
        });
      });-->
      $(document).ready(function(){
        $(".menu span").hover(function(){
            tip = $(this).next('em');
            tip.show(); //Show tooltip
        }, function() {
            tip.hide(); //Hide tooltip
        });
      });
    </script>
    
    <ul class="menu">
      <xsl:for-each select="/root/Section[position() &lt;=$lastSectionId and position() &gt;=$sectionId]/Rack">
        <xsl:variable name="aisle" select="@aisle"></xsl:variable>
        <xsl:variable name="side" select="@side"></xsl:variable>
        <ul class="level">
          <xsl:for-each select="Level">
            <xsl:variable name="test" select="@id"></xsl:variable>
            <li>
              <ul>
                <xsl:for-each select="self::node()[@id=$test]/Location">
                  <li>
                    <xsl:choose>
                      <xsl:when test="onhand='true'">
                        <span class="occupied">
                          <xsl:value-of select="@code" />
                        </span>
                      </xsl:when>
                      <xsl:when test="onhand='false'">
                        <span class="notOccupied">
                          <xsl:value-of select="@code" />
                        </span>
                      </xsl:when>
                      <xsl:otherwise>
                          <span>
                            <xsl:value-of select="@code" />
                          </span>
                      </xsl:otherwise>
                    </xsl:choose>
                    <em>Occupied: <xsl:value-of select="onhand" /></em>
                  </li>
                </xsl:for-each>
              </ul>
            </li>
          </xsl:for-each>
        </ul>
      </xsl:for-each>
    </ul>

  </xsl:template>

</xsl:stylesheet>