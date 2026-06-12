<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsRcptFormat.aspx.cs" Inherits="iWMS.Web.Graphlet.GoodsReceiveAnalysis.GoodsRcptFormat" %>

<!DOCTYPE html>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GoodsReceiveFormat</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/NewBusyBox.js" language="javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        body{ padding:20px; } 
        .whole{ width:auto; height:auto; } 
        #eachLine{ width:auto; padding:5px; height:auto; display:table; }
        .tile{ height:100px; width:100px; float:left; margin:0 15px 20px 0; padding:2px; overflow-wrap: break-word; word-wrap: break-word; hyphens: auto;position:relative; border-radius:5px;
         transition: all 0.3s linear;} 
        .tile:hover {transform: scale(1.05, 1.05);box-shadow: 0 5px 5px rgba(0, 0, 0, 0.1);}
        .tile:hover::after {opacity: 1;}
        .tileLarge{ width:210px; }
        .small{}
        .tileText{color:white; font-weight:bold; font-size:10pt; } /*color:#5c5c5c;*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
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
            //string[][] temp = (string[][])Session["test"];
            string[][] format = (string[][])Session["format"];
            %> 
            <%
            if (format != null)
            {
                for (int i = 0; i < format.Length; i++)
                {
                    string[] t = format[i];
            %>
                //localStorage.setItem(""+i, <%=t%>);
                var divName = "<%=t[1]%>"
                var iDiv = document.createElement('div');
                iDiv.id= divName;
                iDiv.className = "tile small";
                iDiv.style.backgroundColor = "<%=t[2]%>"
                iDiv.style.cursor="pointer";
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
                    var des = document.getElementById(id).firstChild.innerHTML;
                    window.location = 'GoodsRcpt.aspx?id=' + id + '&des=' + des;
                });
            <%}
            }%>

        </script>
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
    </form>
</body>
</html>
