<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Form.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Form" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvCountV3Form</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Candidates" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Variance" Value="110" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Pending Recount" Value="115" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Serialized" Value="120" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="RegisterCounter" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="AssignCounter" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Uploaded" Value="150" runat="server" Visible="false">
                </telerik:RadTab>
                <telerik:RadTab Text="UploadCounted" Value="200" runat="server" Visible="false">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    &nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td width="45%" align="right">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <br>
                <asp:Button ID="UpdateBtn" class="white" runat="server" Visible="False" OnClick="UpdateBtn_Click" Text="Update"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                   &nbsp;
                  <%-- <asp:Button ID="GenerateCycleCountBtn" class="LongLabelWhite" runat="server" OnClick="GenerateCycleCountBtn_Click" Text="Generate Cycle Count" 
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />      --%>      
                <br>
                <br>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CandidatesRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="VarianceRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="PendingRecountRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="SerializedRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="RegisterCounterRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AssignCounterRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="UploadedRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="UploadCountedRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
    </form>
</body>
</html>
