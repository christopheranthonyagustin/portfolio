<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptRegisterV2Explode.aspx.cs" Inherits="iWMS.Web.Inbound.ReceiptRegisterV2.ReceiptRegisterV2Explode" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>Receipt Register V2 - Explode Function</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
	<base target="_self" />
	<meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /> 
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width:40%;">
                
                    &nbsp;
                    <b><asp:Label ID="UomLbl" runat="server">Packing UOM</asp:Label><input id="HIDDEN_Uom" type="hidden"
                        runat="server" /></b>
                </td>
                <td style="width:50%;" valign="top">
                    <telerik:RadDropDownList ID="TEXT_Uom" runat="server" OnSelectedIndexChanged="TEXT_Uom_SelectedIndexChanged" AutoPostBack="true" Skin="WebBlue" ></telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width:40%;">
                    &nbsp;
                    <b><asp:Label ID="QtyLbl" runat="server">Qty</asp:Label></b>
                    <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="INTEGER_Qty"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="QtyVal" runat="server"
                        ControlToValidate="INTEGER_Qty" ErrorMessage="#" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
                    <asp:CompareValidator
                        ID="QtyValueVal" runat="server" ControlToValidate="INTEGER_Qty" ErrorMessage="#"
                        Type="Integer" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                </td>
                <td style="width:80%;" valign="top">
                    <telerik:RadTextBox ID="INTEGER_Qty" runat="server" Skin="Sunset" BackColor="#ded7c6"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height:30px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width:40%;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="ExplodeBtn" runat="server" OnClick="ExplodeBtn_Click" Text=" Explode " CssClass="detailButton" Skin="WebBlue" ></telerik:RadButton>
                </td>
                <td style="width:80%;" valign="top">
                    <telerik:RadButton ID="SplitBtn" runat="server" OnClick="SplitBtn_Click" Text="   Split   " CssClass="detailButton" Skin="WebBlue" ></telerik:RadButton>
                    &nbsp;&nbsp;&nbsp;
                    <telerik:RadButton ID="MassSplitBtn" runat="server" OnClick="MassSplitBtn_Click" Text="MassSplit" CssClass="detailButton" Skin="WebBlue" ></telerik:RadButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

