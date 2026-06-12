<%@ Page Language="c#" CodeBehind="InvCountForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvCountForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%--Ticket #4396: PILSG : Enhancement to Inventory Count module Modified by XM 20/06/2016--%>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Candidates" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Uploaded" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadCounted" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <%--<table id="table1" width="100%" border="0" runat="server">
        <tr>
            <td>
                &nbsp;
                <input id="tab1" class="TabTitle" value="Header" onclick='clickRow(1, "table1");' readonly="readonly"
                    style='cursor: pointer' runat="server">
                <input id="tab2" class="TabTitle" value="Candidates" onclick='clickRow(2, "table1");' readonly="readonly"
                    style='cursor: pointer' runat="server">
                <input id="tab3" class="TabTitle" value="Uploaded" onclick='clickRow(3, "table1");' readonly="readonly"
                    style='cursor: pointer' runat="server">
                <input id="tab4" class="TabTitle" value="UploadCounted" onclick='clickRow(4, "table1");' readonly="readonly"
                    style='cursor: pointer' runat="server">
                <input id="tab5" class="TabTitle" value="Log" onclick='clickRow(5, "table1");' style='cursor: pointer' readonly="readonly"
                    runat="server">
                <br />--%>
        <%--Ticket #4396: PILSG : Enhancement to Inventory Count module Modified by XM 20/06/2016--%>
        <table>
            <tr>
                <td>
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td width="45%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                &nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <%-- <telerik:RadButton Style="z-index: 0" ID="UpdateBtn" runat="server" CssClass="detailButton"
                Visible="False" Text="Update" OnClick="UpdateBtn_Click"></telerik:RadButton>--%>
               <%-- <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="../../Image/Update.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="UpdateBtn_Click" />--%>
                             <asp:Button ID="UpdateBtn" class="white" runat="server" Visible="False" 
                 OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;<br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CandidatesRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="UploadedRadPageView" />
            V<telerik:RadPageView runat="server" Height="90%" ID="UploadCountedRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
        <%--<table>
        <tr>
            <td>
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                &nbsp<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                    OnClick="UpdateBtn_Click"></telerik:RadButton>&nbsp;
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr style="display: none">
            <td style="border-top: #c0c0c0 1px solid" height="900">
                <iframe style="width: 100%; height: 100%" id="detailFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="1200">
                <iframe style="width: 100%; height: 100%" id="countedFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="1200">
                <iframe style="width: 100%; height: 300%;" id="uploadFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
        <tr>
            <td style="border-top: #c0c0c0 1px solid" height="1200">
                <iframe style="width: 100%; height: 300%;" id="logFrame" marginheight="0" frameborder="no"
                    marginwidth="0" runat="server"></iframe>
            </td>
        </tr>
    </table>--%>
    </form>
</body>
</html>
