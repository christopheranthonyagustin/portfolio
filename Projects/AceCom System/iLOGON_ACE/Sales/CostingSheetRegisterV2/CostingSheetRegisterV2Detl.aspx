<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2Detl.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2Detl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CostingSheetDetl</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="priceBreakBtn" runat="server" Text="Price Break" OnClick="priceBreakBtn_Click" Visible="false"
                        CssClass="white"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="SaveNextBtn" runat="server" Text="Save &amp; Next" OnClick="SaveNextBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" Visible="false"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" CssClass="white"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="BackButton" runat="server" Text="ShowAll" OnClick="BackButton_Click" Visible="true" CausesValidation="False"
                        CssClass="white" ToolTip="ShowAllLines" />
                </td>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" Visible="false"
                        CssClass="white" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:CheckBox ID="SaveOnPanChk" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="SaveOnPanChkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
