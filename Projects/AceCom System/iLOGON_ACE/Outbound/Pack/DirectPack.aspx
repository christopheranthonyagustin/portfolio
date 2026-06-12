<%@ Page Language="c#" CodeBehind="DirectPack.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Pack.DirectPack" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DirectPack</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellpadding="2" cellspacing="2" width="100%" border="0">
        <tr>
            <td class="pagetitle">
                Direct Pack For Issue
            </td>
        </tr>
        <tr>
            <td>
                Issue ID :
                <asp:TextBox ID="IsIdTxt" runat="server"></asp:TextBox>&nbsp;
                <asp:Button ID="NewPackBtn" runat="server" Text="New Pack"></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="pagetitle">
                Packing Unit
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="CartonPanel" runat="server">
                    <table>
                        <tr>
                            <td nowrap>
                                Ref#:
                                <asp:RequiredFieldValidator ID="RefVal" runat="server" ControlToValidate="RefTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:TextBox ID="RefTxt" runat="server"></asp:TextBox>
                            </td>
                            <td nowrap>
                                Type:
                                <asp:RequiredFieldValidator ID="TypeReqVal" runat="server" ControlToValidate="TypeList"
                                    ErrorMessage="*"></asp:RequiredFieldValidator><br>
                                <asp:DropDownList ID="TypeList" runat="server">
                                </asp:DropDownList>
                                <input id="IdHidden" type="hidden" name="IdHidden" runat="server">
                            </td>
                            <td nowrap>
                                Length:
                                <asp:CompareValidator ID="LengthCompVal" runat="server" ControlToValidate="LengthTxt"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><br>
                                <asp:TextBox ID="LengthTxt" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap>
                                Width:
                                <asp:CompareValidator ID="WidthCompVal" runat="server" ControlToValidate="WidthTxt"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><br>
                                <asp:TextBox ID="WidthTxt" runat="server"></asp:TextBox>
                            </td>
                            <td nowrap>
                                <p>
                                    Height:
                                    <asp:CompareValidator ID="HeightCompVal" runat="server" ControlToValidate="HeightTxt"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><br>
                                    <asp:TextBox ID="HeightTxt" runat="server"></asp:TextBox></p>
                            </td>
                            <td nowrap>
                                Weight:
                                <asp:CompareValidator ID="WtCompVal" runat="server" ControlToValidate="WeightTxt"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><br>
                                <asp:TextBox ID="WeightTxt" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Button ID="Button1" runat="server" Text="Button"></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="pagetitle">
                Pack Item
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
