<%@ Register TagPrefix="iWMS" TagName="iInput2" Src="../../Control/iInputCtl2.ascx" %>

<%@ Page Language="c#" CodeBehind="DetailInput2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.DetailInput2" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DetailInput</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self" />
    <meta content="no-cache" http-equiv="Pragma">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tbody>
            <tr>
                <td class="pagetitle">
                    <asp:Label Style="z-index: 0" ID="IdLbl" runat="server"></asp:Label><asp:Label ID="ModeLbl"
                        runat="server"></asp:Label>&nbsp;&nbsp;
                </td>
                <td valign="top" align="center">
                    <asp:Button Style="z-index: 0" ID="SaveNextBtn" TabIndex="0" runat="server" CssClass="detailButton"
                        Text=" Save " OnClick="SaveNextBtn_Click"></asp:Button>&nbsp;<asp:Button Style="z-index: 0"
                            ID="ResetBtn" runat="server" CssClass="detailButton" Text="Reset" OnClick="ResetBtn_Click">
                        </asp:Button>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <br>
                    <asp:Label ID="DefaultQtyLbl" runat="server">Default Qty:</asp:Label>&nbsp;<asp:TextBox
                        ID="DefaultQtyTxt" runat="server" Width="80px">1</asp:TextBox><asp:CompareValidator
                            Style="z-index: 0" ID="QtyVal" runat="server" Type="Integer" Operator="DataTypeCheck"
                            ControlToValidate="DefaultQtyTxt" ErrorMessage="#"></asp:CompareValidator><asp:Label
                                ID="DefaultUOMLbl" runat="server">Default UOM:</asp:Label>&nbsp;<asp:DropDownList
                                    ID="DefaultUOMList" runat="server">
                                </asp:DropDownList>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <div style="text-align: center; height: 80%" id="div-datagrid">
        <asp:DataGrid ID="DetailDG" runat="server" UseAccessibleHeader="True" AutoGenerateColumns="False"
            GridLines="Both" CellPadding="2">
            <AlternatingItemStyle CssClass="DGAlternateItem" HorizontalAlign="Center"></AlternatingItemStyle>
            <ItemStyle CssClass="DGAlternateItem" HorizontalAlign="Center"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <table width="100%" style="font-weight: bold; font-size: 12px; color: white;">
                            <tr>
                                <td align="center">
                                    SKU/UPC&nbsp;&nbsp;&nbsp;&nbsp;Qty&nbsp;&nbsp;&nbsp;&nbsp;UOM
                                </td>
                        </table>
                        <asp:DropDownList ID="SKUList" runat="server" Visible="False">
                        </asp:DropDownList>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <iWMS:iInput2 ID="iInput" runat="server" AcId='<%# Request.QueryString["acId"] %>'>
                        </iWMS:iInput2>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid></div>
    <center>
        Note: SKUs successfully added will be <strong>cleared&nbsp;</strong>from the screen</center>
    </form>
</body>
</html>
