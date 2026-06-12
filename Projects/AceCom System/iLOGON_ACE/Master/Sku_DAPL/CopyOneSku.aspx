<%@ Page Language="c#" CodeBehind="CopyOneSku.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Sku_DAPL.CopyOneSku" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Copy SKU</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
        <meta content="no-cache" http-equiv="Pragma">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" class="TABLE" width="100%" runat="server">
        <tr>
            <td width="379" style="width: 379px" colspan="2">
                <asp:Label ID="frmLbl" runat="server" CssClass="pagetitle">From</asp:Label>
            </td>
            <td width="134" style="width: 134px" colspan="2" bgcolor="yellow">
                <asp:Label ID="toLbl" runat="server" CssClass="pagetitle">To</asp:Label>
            </td>
        </tr>
        <tr>
            <td width="124" style="width: 124px">
                <asp:Label ID="frmAccountLbl" runat="server">Account :</asp:Label>
            </td>
            <td style="width: 245px" width="245">
                <asp:DropDownList ID="frmAccountDDL" TabIndex="1" runat="server" OnSelectedIndexChanged="frmAccountDDL_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td width="117" style="width: 117px">
                <asp:Label ID="toAccountLbl" runat="server">Account :</asp:Label>
            </td>
            <td width="40%">
                <asp:DropDownList ID="toAccountDDL" TabIndex="5" runat="server" OnSelectedIndexChanged="toAccountDDL_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 124px">
                <asp:Label ID="frmSkuLbl" runat="server">SKU :</asp:Label>
            </td>
            <td style="width: 245px">
                <asp:TextBox ID="frmSkuTxt" TabIndex="2" runat="server" AutoPostBack="True" MaxLength="50"
                    BackColor="White" BorderColor="White" Font-Bold="True" OnTextChanged="frmSkuTxt_TextChanged"></asp:TextBox><asp:Label
                        ID="frmVerifyLbl" runat="server" ForeColor="Red" Visible="False">* Code not Found *</asp:Label>
            </td>
            <td style="width: 117px">
                <asp:Label ID="toSkuLbl" runat="server">SKU :</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="toSkuTxt" TabIndex="6" runat="server" AutoPostBack="True" MaxLength="50"
                    OnTextChanged="toSkuTxt_TextChanged"></asp:TextBox>
                <asp:Label ID="toVerifyLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 124px">
            </td>
            <td style="width: 245px">
            </td>
            <td style="width: 117px">
                <asp:Label ID="toSku2Lbl" runat="server">SKU code 2 :</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="toSku2Txt" TabIndex="7" runat="server" MaxLength="20"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 124px">
                <asp:Label ID="frmDescrLbl" runat="server">Description :</asp:Label>
            </td>
            <td style="width: 245px">
                <asp:TextBox ID="frmDescrTxt" TabIndex="3" runat="server" MaxLength="60" BackColor="White"
                    Width="300px" ReadOnly="True" BorderColor="White" Font-Bold="True"></asp:TextBox>
            </td>
            <td style="width: 117px">
                <asp:Label ID="toDescrLbl" runat="server">Description :</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="toDescrTxt" TabIndex="8" runat="server" MaxLength="60" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 124px; height: 24px">
                <asp:Label ID="frmPackingLbl" runat="server">Packing :</asp:Label>
            </td>
            <td style="width: 245px; height: 24px">
                <asp:TextBox ID="frmPackingTxt" TabIndex="4" runat="server" BackColor="White" ReadOnly="True"
                    BorderColor="White" Font-Bold="True"></asp:TextBox>
            </td>
            <td style="width: 117px; height: 24px">
                <asp:Label ID="toPackingLbl" runat="server">Packing :</asp:Label>
            </td>
            <td style="height: 24px">
                <asp:TextBox ID="toPackingTxt" TabIndex="9" runat="server"></asp:TextBox>
                <asp:DropDownList Style="z-index: 0" ID="toPackingDDL" TabIndex="9" runat="server"
                    Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 124px; height: 23px">
                <asp:Label ID="frmLiterageLbl" runat="server">Literage :</asp:Label>
            </td>
            <td style="width: 245px; height: 23px">
                <asp:TextBox ID="frmLiterageTxt" TabIndex="4" runat="server" BackColor="White" ReadOnly="True"
                    BorderColor="White" Font-Bold="True"></asp:TextBox>
            </td>
            <td style="width: 117px; height: 23px">
                <asp:Label ID="toLiterageLbl" runat="server">Literage :</asp:Label>
            </td>
            <td style="height: 23px">
                <asp:TextBox ID="toLiterageTxt" TabIndex="10" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 124px; height: 23px">
                <asp:Label ID="frmAbvLbl" runat="server">Alcohol By Vol :</asp:Label>
            </td>
            <td style="width: 245px; height: 23px">
                <asp:TextBox ID="frmAbvTxt" TabIndex="4" runat="server" BackColor="White" ReadOnly="True"
                    BorderColor="White" Font-Bold="True"></asp:TextBox>
            </td>
            <td style="width: 117px; height: 23px">
                <asp:Label ID="toAbvLbl" runat="server">Alcohol By Vol :</asp:Label>
            </td>
            <td style="height: 23px">
                <asp:TextBox ID="toAbvTxt" TabIndex="11" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 124px; height: 23px">
                <asp:Label ID="frmCooLbl" runat="server">Country of Origin :</asp:Label>
            </td>
            <td style="width: 245px; height: 23px">
                <asp:TextBox ID="frmCooTxt" TabIndex="4" runat="server" BackColor="White" ReadOnly="True"
                    BorderColor="White" Font-Bold="True"></asp:TextBox>
            </td>
            <td style="width: 117px; height: 23px">
                <asp:Label ID="toCooLbl" runat="server">Country of Origin :</asp:Label>
            </td>
            <td style="height: 23px">
                <asp:DropDownList ID="toCooDDL" TabIndex="12" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 124px">
            </td>
            <td style="width: 245px">
                <asp:Label ID="uomConfigLbl" runat="server">UOM Configuration</asp:Label><br>
                <asp:DataGrid ID="uomConfigDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    GridLines="Both" CellPadding="2">
                    <HeaderStyle CssClass="DGHeader" />
                    <AlternatingItemStyle CssClass="DGAlternateItem" />
                    <ItemStyle CssClass="DGItem" />
                    <Columns>
                        <asp:BoundColumn HeaderText="Uom" DataField="descr" SortExpression="descr">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn HeaderText="Qty" DataField="qty" SortExpression="qty">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
            <td style="width: 117px">
            </td>
            <td>
                <asp:Button ID="CopyBtn" runat="server" Visible="False" CssClass="detailbutton" Text=" Copy "
                    OnClick="CopyBtn_Click"></asp:Button><br>
                <br>
                <br>
                <asp:Button ID="ResetBtn" runat="server" Visible="False" CssClass="detailbutton"
                    Text="Another Copy" OnClick="ResetBtn_Click"></asp:Button>
            </td>
        </tr>
    </table>
    <br>
    <iframe style="width: 100%; height: 45%" id="skuPackFrame" marginheight="0" frameborder="no"
        marginwidth="0" runat="server"></iframe>
    </form>
</body>
</html>
