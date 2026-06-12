<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SplitLineDetailInput.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.SplitLineDetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LineSplit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div>
            <table id="table1" border="0" cellspacing="0" cellpadding="1" width="100%" runat="server">
                <tr>
                    <td><b>
                        <asp:Label ID="Account" runat="server">Account</asp:Label></b></td>
                    <td>
                        <iWMS:iForm ID="FormCtl_Account" runat="server" Visible="false"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td><b>
                        <asp:Label ID="SiteCode" runat="server">SiteCode</asp:Label></b></td>
                    <td style="width: 50%;" valign="top">
                        <telerik:RadDropDownList ID="TEXT_SiteCodeList" runat="server" AutoPostBack="true" Skin="WebBlue"></telerik:RadDropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="*" ControlToValidate="TEXT_SiteCodeList"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 2px;"></td>
                </tr>
                <tr>
                    <td>
                        <b>
                            <asp:Label ID="UomLbl" runat="server">Packing UOM</asp:Label><input id="HIDDEN_Uom" type="hidden" runat="server" /></b>
                    </td>
                    <td style="width: 50%;" valign="top">
                        <telerik:RadDropDownList ID="TEXT_Uom" runat="server" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged" AutoPostBack="true" Skin="WebBlue"></telerik:RadDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 2px;"></td>
                </tr>
                <tr>
                    <td style="width: 50%;">
                        <b>
                            <asp:Label ID="QtyLbl" runat="server">Split line into</asp:Label></b>
                        <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                            ErrorMessage="*"></asp:RequiredFieldValidator><asp:CompareValidator ID="QtyVal" runat="server"
                                ControlToValidate="INTEGER_Qty" ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator><asp:CompareValidator
                                    ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                                    Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                    <td style="width: 80%;" valign="top">
                        <telerik:RadTextBox ID="INTEGER_Qty" runat="server" BackColor="Yellow" Width="80px"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 5px;"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Populate_Btn" runat="server" OnClick="Split_Btn_Click" Text="Explode" CssClass="white" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
