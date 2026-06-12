<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="TimesheetDetlForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.TimesheetDetl.TimesheetDetlForm" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TimeSheetRegister</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/row.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 1050px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
 <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
               <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
               <iWMS:iForm ID="IForm1" runat="server"></iWMS:iForm>
               
        
    <table id="table1" width="100%" border="0" runat="server">
   
       <%-- <tr>
            <td class="style1">
                &nbsp;
            <input id="tab1" class="TabTitle" value="Main Info" onclick='clickRow(1, "table1");'
                    style='cursor: pointer' runat="server">
            </td>--%>
            <%--<td align="right">&nbsp						
					    <asp:button id="BackButton" runat="server" CssClass="detailButton" Visible="True" Text="Search Results"
							Width="120px" CausesValidation="False" onclick="BackButton_Click"></asp:button></td>
        </tr>--%>
        <tr>
            <td colspan="2" class="style1">
                <br />
                &nbsp<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    Style="z-index: 0" OnClick="UpdateBtn_Click"></telerik:RadButton>&nbsp<asp:Label ID="IdLbl"
                        runat="server" CssClass="pagetitle"></asp:Label>
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    </telerik:RadPageView>
   </telerik:RadMultiPage>
    </form>
</body>
</html>
