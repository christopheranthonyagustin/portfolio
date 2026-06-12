<%@ Page Language="c#" CodeBehind="SkuGroupListDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.SkuGroup.SkuGroupListDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuGroupListDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Lot Config" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="UOM Config" Value="150" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td><br />
                &nbsp;<asp:Label ID="InfoLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
            <%--<telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Visible="False" CssClass="detailButton"
                Style="z-index: 0" OnClick="UpdateBtn_Click">
            </telerik:RadButton>--%>
            <%--<telerik:RadButton ID="Button1" runat="server" Text="Update" Visible="False"
                CssClass="detailButton" OnClick="UpdateBtn_Click">
            </telerik:RadButton>--%><br />
            <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click"
                Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="False" />
            &nbsp;
            <br />
            <br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="500px" ID="LotConfigRadPageView">
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="UOMConfigRadPageView">
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </form>
</body>
</html>
