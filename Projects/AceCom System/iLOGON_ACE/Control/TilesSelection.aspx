<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TilesSelection.aspx.cs" Inherits="iWMS.Web.Control.TilesSelection" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="UserMsgModalPopup.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SearchFormat</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <link rel="stylesheet" type="text/css" href="../css/iWMS.css" />
    <script src="../js/NewBusyBox.js" language="javascript"></script>
    <script src="../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        .whole{ width:auto; height:auto; } 
        #eachLine{ width:auto; padding:5px; height:auto; display:table;}
        .tile{ height:70px; width:215px; float:left; margin:0 12px 12px 0; padding:5px 4px 4px 4px; overflow-wrap: break-word; word-wrap: break-word; hyphens: auto;position:relative; border-radius:5px; box-shadow: 2px 2px 2px #808080;
         transition: all 0.3s linear;} 
        .tile:hover {transform: scale(1.05, 1.05);box-shadow: 0 5px 5px rgba(0, 0, 0, 0.1);}
        .tile:hover::after {opacity: 0.5;}
        .tileLarge{ width:210px; }
        .small{}
        .tileText{color:white; font-weight:bold; font-size:11pt; } /*color:#5c5c5c;*/

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <div class="whole"> <div id="eachLine" class="all-tiles"> </div> </div>
        
        <script type="text/javascript">
            <%="" %>
            <%
            string module = (string)Session["mod"];
            string[][] format = (string[][])Session["format"];
            %> 
            <%
            if (format != null)
            {
                for (int i = 0; i < format.Length; i++)
                {
                    string[] t = format[i];
            %>
            var divName = "<%=t[1]%>"
            var iDiv = document.createElement('div');
            iDiv.id = divName;
            iDiv.className = "tile small";
            iDiv.style.backgroundColor = "<%=t[2]%>"
            iDiv.style.cursor = "pointer";
            document.getElementById("eachLine").appendChild(iDiv);

            var iSpan = document.createElement("span");
            iSpan.className = "tileText";
            iSpan.id = divName;
            iSpan.innerHTML = "<%=t[0]%>"
            document.getElementById(divName).appendChild(iSpan);
            <%}%>
            
            <%for (int i = 0; i < format.Length; i++)
            {
                string[] t = format[i];
                %>
            var eachId = "<%=t[1]%>";

            document.getElementById(eachId).addEventListener('click', function (event) {
                var id = event.target.id;
                var descr = document.getElementById(id).firstChild.innerHTML;
                var result = "<%=t[3]%>";

                if (result == "")
                {
                    var location = "../" + "<%=module%>" + '.aspx?id=' + id + '&des=' + descr;
                    window.location = location;
                }
                else {
                    var location = "../" + result + '?id=' + id + '&des=' + descr;
                    var url = CheckUrl(location) //Added by HH on 13/Mar/2020 Ticket:#6387 pt14
                    {
                        if(url == true)
                        {
                            window.open(location);
                        }
                        else {
                            alert("This format is not supported by the system. Please recheck your format setup.");
                        }
                    }
                }
            });
            <%}
            }%>
            //Added by HH on 13/Mar/2020 Ticket:#6387 pt14
            function CheckUrl(url) {
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    var http = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    var http = new ActiveXObject("Microsoft.XMLHTTP");
                }
                http.open('HEAD', url, false);
                http.send();
                return http.status != 404;
            }

        </script>
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
    </form>
</body>
</html>

