<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamForm.aspx.cs" Inherits="iWMS.Web.Master.Team.TeamForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>TeamForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Team" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Member" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Zone" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
             <table>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<br /><asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        <br />
                 <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0"  CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" ToolTip="Save"
                         Text="Update" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                 <br /><br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </telerik:RadPageView>
                     <telerik:RadPageView runat="server" Height="89%" ID="MemberRadPageView" />
                     <telerik:RadPageView runat="server" Height="89%" ID="ZoneRadPageView" />
         </telerik:RadMultiPage>
    </form>
</body>
</html>
