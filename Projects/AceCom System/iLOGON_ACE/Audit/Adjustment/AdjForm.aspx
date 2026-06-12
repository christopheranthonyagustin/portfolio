<%@ Page Language="c#" CodeBehind="AdjForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.Adjustment.AdjForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>AdjustmentForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Line" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Attc" Value="150" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
       <table>
        <tr>
            <td>
                <br />
               <asp:Label ID="AjIdLbl" runat="server" CssClass="pagetitle" ></asp:Label>
            </td>
        </tr>
    </table>
       <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="500px" ID="HeaderRadPageView">
           <br />
               <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" 
                    UseSubmitBehavior="false" Visible="true" ToolTip="Search" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="500px" ID="DetailRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="500px" ID="AttcRadPageView">
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    </form>
</body>
</html>
