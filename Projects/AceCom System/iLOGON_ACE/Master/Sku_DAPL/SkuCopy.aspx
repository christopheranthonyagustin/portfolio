<%@ Page Language="c#" CodeBehind="SkuCopy.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.SkuCopy" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuCopy</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table class="TABLE" id="FormTable" width="100%" runat="server">
        <tr width="100%">
            <td width="20%">
                <asp:Label ID="headerLbl1" runat="server" CssClass="pagetitle">Copy SKU From :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromAccountDDL" runat="server" CssClass="LISTING" AutoPostBack="True"
                    OnSelectedIndexChanged="fromAccountDDL_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="headerLbl2" runat="server" CssClass="pagetitle">Copy SKU To :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toAccountDDL" runat="server" CssClass="LISTING" AutoPostBack="True"
                    TabIndex="9" OnSelectedIndexChanged="toAccountDDL_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromGroupLbl" runat="server" CssClass="BlackText">Group :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromGroupDDL" runat="server" CssClass="" TabIndex="1">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toGroupLbl" runat="server" CssClass="BlackText">Group :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toGroupDDL" runat="server" CssClass="" TabIndex="10">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromPutawayLbl" runat="server" CssClass="BlackText">Putaway Logic :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromPutawayDDL" runat="server" CssClass="" TabIndex="2">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toPutawayLbl" runat="server" CssClass="BlackText">Putaway Logic :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toPutawayDDL" runat="server" CssClass="" TabIndex="11">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromAllocationLbl" runat="server" CssClass="BlackText">Allocation Logic :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromAllocationDDL" runat="server" CssClass="" TabIndex="3">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toAllocationLbl" runat="server" CssClass="BlackText">Allocation Logic :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toAllocationDDL" runat="server" CssClass="" TabIndex="12">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromTypeLbl" runat="server" CssClass="BlackText">Type :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromTypeDDL" runat="server" TabIndex="4">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toTypeLbl" runat="server" CssClass="BlackText">Type :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toTypeDDL" runat="server" TabIndex="13">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromClassLbl" runat="server" CssClass="BlackText">Class :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromClassDDL" runat="server" CssClass="" TabIndex="5">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toClassLbl" runat="server" CssClass="BlackText">Class :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toClassDDL" runat="server" CssClass="" TabIndex="14">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Label ID="fromStatusLbl" runat="server" CssClass="BlackText">Status :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="fromStatusDDL" runat="server" CssClass="" TabIndex="6">
                </asp:DropDownList>
            </td>
            <td width="20%">
            </td>
            <td width="20%">
                <asp:Label ID="toStatusLbl" runat="server" CssClass="BlackText">Status :</asp:Label>
            </td>
            <td width="20%">
                <asp:DropDownList ID="toStatusDDL" runat="server" CssClass="" TabIndex="15">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%" style="height: 13px">
                <asp:Label ID="fromAbcLbl" runat="server" CssClass="BlackText">ABC :</asp:Label>
            </td>
            <td width="20%" style="height: 13px">
                <asp:DropDownList ID="fromAbcDDL" runat="server" CssClass="" TabIndex="7">
                </asp:DropDownList>
            </td>
            <td width="20%" style="height: 13px">
            </td>
            <td width="20%" style="height: 13px">
                <asp:Label ID="toAbcLbl" runat="server" CssClass="BlackText">ABC :</asp:Label>
            </td>
            <td width="20%" style="height: 13px">
                <asp:DropDownList ID="toAbcDDL" runat="server" CssClass="" TabIndex="16">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="20%" style="height: 13px">
                <asp:Label ID="skuCodeLbl" runat="server" CssClass="BlackText">Sku Code :</asp:Label>
            </td>
            <td width="20%" style="height: 13px">
                <asp:TextBox ID="skuCodeTxt" runat="server" TabIndex="17"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Button ID="SearchBtn" runat="server" CssClass="formbtn" Text="Display Selection"
                    TabIndex="8" OnClick="SearchBtn_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ListBox ID="fromListbox" runat="server" SelectionMode="Multiple" Rows="10" Width="100%">
                </asp:ListBox>
            </td>
            <td align="center">
                <asp:Button ID="SelectBtn" runat="server" Text=" Select  " OnClick="SelectBtn_Click">
                </asp:Button><br>
                <br>
                <asp:Button ID="RemoveBtn" runat="server" Text="Remove" OnClick="RemoveBtn_Click">
                </asp:Button><br>
                <br>
                <asp:Button ID="RemoveAllBtn" runat="server" Text="Remove All" OnClick="RemoveAllBtn_Click">
                </asp:Button>
            </td>
            <td colspan="2">
                <asp:ListBox ID="toListbox" runat="server" SelectionMode="Multiple" Rows="10" Width="100%">
                </asp:ListBox>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Button ID="Copy_Btn" runat="server" CssClass="formbtn" Text=" Copy " OnClick="Copy_Btn_Click">
                </asp:Button>
            </td>
            <td>
                <asp:Button ID="Clear" runat="server" CssClass="formbtn" Text=" Clear All " OnClick="Clear_Click">
                </asp:Button>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
