<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutgoingShipmentSkuSearch.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.OutgoingShipmentSkuSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="SKULineSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
            OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
        &nbsp;
        <asp:Button ID="Excelbtn" runat="server" Text="Excel" OnClick="Excelbtn_Click"
            OnClientClick="disableBtn(this.id)" ToolTip="Export to Excel" UseSubmitBehavior="false" CssClass="green" />

        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="float: left">
                <tr id="trformCtl" runat="server">
                    <td>
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
            <table style="float: left">
                <tr>
                    <td>
                        <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        &nbsp; &nbsp;
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    </form>
</body>
</html>
