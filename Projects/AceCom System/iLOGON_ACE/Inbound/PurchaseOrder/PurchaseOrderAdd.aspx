<%@ Page Language="c#" CodeBehind="PurchaseOrderAdd.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.PurchaseOrder.PurchaseOrderAdd" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PurchaseOrderPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

    <script src="../../js/row.js" type="text/javascript"></script>

    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .style1 {
            width: 953px;
        }

        .style2 {
            height: 62px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Remarks" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="MainRadPageView" DefaultButton="AddImgBtn">
                <table id="table2" width="100%" border="0" runat="server" cellspacing="3" cellpadding="3">
                    <tr>
                        <td colspan="2" class="style2">
                            <br />
                            <asp:Button ID="AddImgBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" Visible="true" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;<br />
                            <br>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="RemarkRadPageView" DefaultButton="AddImgBtn2">
                <table>
                    <tr>
                        <td colspan="2" class="style2">
                            <br />
                 <asp:Button ID="AddImgBtn2" class="white" runat="server" OnClick="AddBtn_Click" Text="Add" Visible="true" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;<br />
                            <br>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:ValidationSummary Style="z-index: 0" ID="valSummary" runat="server" CssClass="RedText"
            HeaderText="The following field(s) need to be entered correctly:" DisplayMode="BulletList"
            EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
