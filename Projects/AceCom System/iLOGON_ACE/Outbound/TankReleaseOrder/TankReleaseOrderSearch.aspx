<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankReleaseOrderSearch.aspx.cs" Inherits="iWMS.Web.Outbound.TankReleaseOrder.TankReleaseOrderSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TankReleaseOrderSearch</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table width="20%" id="report" runat="server">
        &nbsp;
        <tr>
            <td>               
                <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" Visible="true"  
                    Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />
                &nbsp;
                <asp:Button ID="excelImgBtn" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true"  
                    Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
            </td>
            <td align="left" class="style1">               
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
        RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <br />
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    </form>
</body>
</html>
