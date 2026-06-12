<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfPaymentTransDetailResult.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfPaymentTransaction.ListOfPaymentTransDetailResult" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 112px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div style="height: 92%" id="div-datagrid">
        <table>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    List Of Payment Transaction (Detail)
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="DateLbl" runat="server">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</asp:Label>
                </td>
                <td align="left">
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td align="left" class="style1">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="Img1" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                            height="20" runat="server">
                    </a>
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" EnableLinqExpressions="false" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                AllowPaging="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BankCode" SortExpression="BankCode" HeaderText="BankCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="PVNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PVDate" DataField="pvdate" DataFormatString="{0:dd/MMM/yyyy}"
                        UniqueName="pvdate" SortExpression="pvdate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vdname" SortExpression="Vendor" HeaderText="Vendor">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="VendorDocNo" HeaderText="VendorDocNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VendorDocDate" DataField="exdate1" DataFormatString="{0:dd/MMM/yyyy}"
                        UniqueName="exdate1" SortExpression="exdate1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="chargecode" SortExpression="ChargeCode" HeaderText="ChargeCode"
                        Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="chargedescr" SortExpression="ChargeDescr" HeaderText="ChargeDescr"
                        Display="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ExistInJob" SortExpression="ExistInJob" HeaderText="ExistInJob"
                        Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="chequeno" SortExpression="chequeno" HeaderText="ChequeNo"
                        Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RecoverableType" SortExpression="RecoverableType"
                        HeaderText="RecoverableType" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RecoverableRemarks" SortExpression="RecoverableRemarks"
                        HeaderText="RecoverableRemarks" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNumber"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="apglcode" SortExpression="apglcode" HeaderText="APGLCODE"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="CtnrNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="BLNo" SortExpression="BLNo" HeaderText="BLNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="EqpNo" HeaderText="EqpNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pername" SortExpression="Personnel" HeaderText="Personnel"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Currency" SortExpression="Currency" HeaderText="Currency"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fcamt" SortExpression="TotalAmt" HeaderText="TotalAmt"
                        DataFormatString="{0:N}" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="taxfcamt" SortExpression="TotalGSTAmt" HeaderText="TotalGSTAmt"
                        DataFormatString="{0:N}" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TotalAmt" SortExpression="GrandTotal" HeaderText="GrandTotal"
                        DataFormatString="{0:N}" ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
