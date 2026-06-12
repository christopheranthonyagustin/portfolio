<%@ Page Language="c#" CodeBehind="RptInvSearch.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.Inventory.RptInvSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RptInvSearch</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" target="_blank" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="2" cellpadding="2" width="100%" border="0">
        <tr>
            <td valign="top" width="30%">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="AccountLbl" runat="server">Account</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="AccountList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SKUTypeLbl" runat="server">SKU Type</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="SKUTypeList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SKUClassLbl" runat="server">SKU Class</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="SKUClassList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SKUFamilyLbl" runat="server">SKU Family</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="SKUFamilyList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SkuLbl" runat="server">SKU Code</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="SkuTxt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="DescrLbl" runat="server">SKU Descr</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="DescrTxt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LocLbl" runat="server">Location</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="LocTxt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Tu1Lbl" runat="server">TU#1</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="Tu1Txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Tu2Lbl" runat="server">TU#2</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:TextBox ID="Tu2Txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ZoneLbl" runat="server">Zone</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="ZoneList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SiteLbl" runat="server">Site</asp:Label>
                        </td>
                        <td>
                            &nbsp;
                            <asp:DropDownList ID="SiteList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <table cellspacing="2" cellpadding="2" width="100%" bgcolor="#efefef" border="0">
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="SelectLbl" runat="server">Select</asp:Label>&nbsp;:
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <asp:CheckBox ID="SkuGrpCB" runat="server" Checked="True" Text="Sku Group"></asp:CheckBox>
                        </td>
                        <td width="25%">
                            <asp:CheckBox ID="DescrCB" runat="server" Checked="True" Text="SKU Description">
                            </asp:CheckBox>
                        </td>
                        <td width="25%">
                            <asp:CheckBox ID="SKUTypeCB" runat="server" Checked="True" Text="SKU Type"></asp:CheckBox>
                        </td>
                        <td width="25%">
                            <asp:CheckBox ID="SKUClassCB" runat="server" Checked="True" Text="SKU Class"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="SKUFamilyCB" runat="server" Text="SKU Family" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="SiteCB" runat="server" Text="Site" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="ZoneCB" runat="server" Text="Zone" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="LocCB" runat="server" Text="Location" Checked="True"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <asp:CheckBox ID="Tu1CB" runat="server" Text="TU#1" Checked="True"></asp:CheckBox>
                        </td>
                        <td style="height: 24px">
                            <asp:CheckBox ID="Tu2CB" runat="server" Text="TU#2" Checked="True"></asp:CheckBox>
                        </td>
                        <td style="height: 24px">
                            <asp:CheckBox ID="LotIdCB" runat="server" Text="Lot Id" Checked="True"></asp:CheckBox>
                        </td>
                        <td style="height: 24px">
                            <!--Lot 1-->
                            <asp:CheckBox ID="RcDateCB" runat="server" Text="Receive Date" Checked="True"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--Lot 2-->
                            <asp:CheckBox ID="Lot1CB" runat="server" Text="Mfg Date" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <!--Lot 3-->
                            <asp:CheckBox ID="Lot2CB" runat="server" Text="Expiry Date" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <!--Lot 4-->
                            <asp:CheckBox ID="Lot3CB" runat="server" Text="Reserved (DATE)" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <!--Lot 5-->
                            <asp:CheckBox ID="Lot4CB" runat="server" Text="Mfg Batch" Checked="True"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--Lot 6-->
                            <asp:CheckBox ID="Lot5CB" runat="server" Text="Customs Lot" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <!--Lot 7-->
                            <asp:CheckBox ID="Lot6CB" runat="server" Text="Duty Payment No." Checked="True">
                            </asp:CheckBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="Lot7CB" runat="server" Text="Price" Checked="True"></asp:CheckBox><!--Lot 8-->
                        </td>
                        <td>
                            <asp:CheckBox ID="Lot8CB" runat="server" Text="Reserved (Decimal)" Checked="True">
                            </asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="UnitTypeCB" runat="server" Text="Unit Type" Checked="True"></asp:CheckBox>
                        </td>
                        <td>
                            <asp:CheckBox ID="VolCB" runat="server" Text="Volume(Litres)" Checked="False"></asp:CheckBox>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="CompileBtn" runat="server" Text="Compile" CssClass="formbtn" OnClick="CompileBtn_Click">
                </asp:Button>&nbsp;<input type="reset" value="Reset" class="formbtn">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
