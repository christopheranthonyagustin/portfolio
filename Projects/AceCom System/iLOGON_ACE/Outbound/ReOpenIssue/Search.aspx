<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReOpenIssue.Search" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Search</title>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            width: 113px;
        }
        .style3
        {
            height: 45px;
            width: 113px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table style="z-index: 0; margin-right: 0px;" id="Table1" border="0" cellspacing="2"
        cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" class="style2">
                <table id="Table3" border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <%--Ticket #3699: KDS : Enhancement to Re-Open Issue module, PT 13, Modified by JL 5th May 2016--%>
                <%--<telerik:RadButton ID="RetrieveBtn" runat="server" Text="Retrieve"  OnClick="RetrieveBtn_Click"
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white">
                </telerik:RadButton>--%>
                 <%--<telerik:RadButton ID="ReOpenBtn" runat="server" Text="Reopen" 
                    OnClick="ReOpenBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white">
                </telerik:RadButton>--%>
                <%--<telerik:RadButton ID="ResetBtn" runat="server" Text="Reset" 
                    OnClick="ResetBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white">
                      </telerik:RadButton>--%>
                <asp:Button ID="RetrieveBtn" runat="server" Text="Retrieve"  OnClick="RetrieveBtn_Click" ToolTip="Retrieve" 
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />  
                &nbsp;
                 <asp:Button ID="ReOpenBtn" runat="server" Text="Reopen"  ToolTip="Reopen" OnClick="ReOpenBtn_Click" 
                     OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" /> 
                &nbsp;
                <asp:Button ID="ResetBtn" runat="server" Text="Reset" ToolTip="Reset" OnClick="ResetBtn_Click" 
                    OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />  
                &nbsp;
                <br />
            </td>
            <td class="style3">
                &nbsp;<br>
            </td>
        </tr>
    </table>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>
    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
</body>
</html>
