<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BranchSearch.aspx.cs" Inherits="iWMS.Web.Master.Branch.BranchSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Branch Search</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        &nbsp;
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    </form>
</body>
</html>
