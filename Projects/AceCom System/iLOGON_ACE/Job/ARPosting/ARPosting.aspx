<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARPosting.aspx.cs" Inherits="iWMS.Web.Job.ARPosting.ARPosting" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>InterfaceSalestoAR</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="2" cellpadding="2" width="100%" runat="server">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="RetrieveBtn" runat="server" Text="Post" OnClick="RetrieveBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                </td>
                <td align="right">
                    <telerik:RadButton Style="z-index: 0" ID="GenerateBtn" runat="server" Skin="WebBlue" CssClass="detailbutton"
                        Text="Generate" OnClick="GenerateBtn_Click" OnClientClick="busyBox.Show();" Visible="false">
                    </telerik:RadButton>
                    <asp:ImageButton ID="excel_ImgBtn" runat="server" OnClick="ExportExcel" ImageUrl="~/Image/excel.gif"
                        Height="20" Visible="false" />
                </td>
            </tr>
        </table>
        <div style="height: 90%" id="div-datagrid">
            <table border="0" cellpadding="2" cellspacing="2">
                <tr>
                    <td valign="top">
                        <asp:DataGrid ID="ResultDG1" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                            CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                            <Columns>
                                <asp:BoundColumn DataField="invno" SortExpression="invno" HeaderText="Invoice No.">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="code" SortExpression="code" HeaderText="Customer Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="invdate" SortExpression="invdate" HeaderText="Invoice Date"
                                    DataFormatString="{0:dd/MM/yyyy}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="totalamt" SortExpression="totalamt" HeaderText="Invoice Amount"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="Exchange Rate"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="referedinvno" SortExpression="referedinvno" HeaderText="Refer To Invoice No.">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="deptcode" SortExpression="deptcode" HeaderText="Department Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="incometype" SortExpression="incometype" HeaderText="Income Type">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="projref" SortExpression="projref" HeaderText="Project Reference">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                    <td valign="top">
                        <asp:DataGrid ID="ResultDG2" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                            CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                            <Columns>
                                <asp:BoundColumn DataField="invno" SortExpression="invno" HeaderText="Invoice No.">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="taxtype" SortExpression="taxtype" HeaderText="GST Type Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="invamt" SortExpression="invamt" HeaderText="Amount Before GST"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="gstrate" SortExpression="gstrate" HeaderText="GST %"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="gstamt" SortExpression="gstamt" HeaderText="GST Amount"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="totalamt" SortExpression="totalamt" HeaderText="Amount After GST"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:DataGrid ID="ResultDG3" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                            CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                            <Columns>
                                <asp:BoundColumn DataField="Customer Code" SortExpression="Customer Code" HeaderText="Customer Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Customer Name" SortExpression="Customer Name" HeaderText="Customer Name">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Job" SortExpression="Job" HeaderText="Job">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Invoice #" SortExpression="Invoice #" HeaderText="Invoice #">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Date" SortExpression="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Item Code" SortExpression="Item Code" HeaderText="Item Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Quantity" SortExpression="Quantity" HeaderText="Quantity"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="Description">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Price" SortExpression="Price" HeaderText="Price">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Inc-Tax Price" SortExpression="Inc-Tax Price" HeaderText="Inc-Tax Price">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Total" SortExpression="Total" HeaderText="Total">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Inc Tax Total" SortExpression="Inc Tax Total" HeaderText="Inc Tax Total">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Tax Code" SortExpression="Tax Code" HeaderText="Tax Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Currency Code" SortExpression="Currency Code" HeaderText="Currency Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Exchange Rate" SortExpression="Exchange Rate" HeaderText="Exchange Rate">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Payment Terms" SortExpression="Payment Terms" HeaderText="Payment Terms">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Account Code" SortExpression="Account Code" HeaderText="Account Code">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDG4" runat="server" AutoGenerateColumns="true" AllowSorting="false"
                            BorderStyle="Solid" Skin="Office2007">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                        <%--<asp:DataGrid ID="ResultDG4" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                        CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="True">
                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                    </asp:DataGrid>--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDG5" runat="server" AutoGenerateColumns="true" AllowSorting="false"
                            BorderStyle="Solid" Skin="Office2007">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDG6" runat="server" AutoGenerateColumns="true" AllowSorting="false"
                            BorderStyle="Solid" Skin="Office2007">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDGMYOB" runat="server" AutoGenerateColumns="true" AllowSorting="false"
                            BorderStyle="Solid" Skin="Office2007" OnItemDataBound="ResultDGMYOB_ItemDataBound">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:DataGrid ID="ResultDGEZ" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
                            CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="False">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                            <Columns>
                                <asp:BoundColumn DataField="INV_NO" SortExpression="INV_NO" HeaderText="INV_NO">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="AC_NO" SortExpression="AC_NO" HeaderText="AC_NO">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="AC_NAME" SortExpression="AC_NAME" HeaderText="AC_NAME">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="PRODUCT_NO" SortExpression="PRODUCT_NO" HeaderText="PRODUCT_NO">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="PRODUCT_NAME" SortExpression="PRODUCT_NAME" HeaderText="PRODUCT_NAME">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="QTY" SortExpression="QTY" HeaderText="QTY"
                                    DataFormatString="{0:N}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>

                                <asp:BoundColumn DataField="UOM" SortExpression="UOM" HeaderText="UOM">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Price" SortExpression="Price" HeaderText="PRICE">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="AMOUNT" SortExpression="AMOUNT" HeaderText="AMOUNT">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DATETIME" SortExpression="DATETIME" HeaderText="DATETIME" DataFormatString="{0:dd/MM/yyyy}">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="PROJ_NO" SortExpression="PROJ_NO" HeaderText="PROJ_NO">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="GST" SortExpression="GST" HeaderText="INCL_GST">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="currcode" SortExpression="currcode" HeaderText="CURRENCY">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="GST Rate" SortExpression="GST Rate" HeaderText="RATE">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Payment Terms" SortExpression="Payment Terms" HeaderText="TERM">
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowSorting="false"
                            BorderStyle="Solid" Skin="Office2007">
                            <ClientSettings Selecting-AllowRowSelect="true"></ClientSettings>
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <telerik:RadGrid ID="ResultDG_Xero" runat="server" AutoGenerateColumns="true" GridLines="None"
                            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                            AllowPaging="true" Skin="Metro">
                            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                            <ItemStyle Wrap="true"></ItemStyle>
                            <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
            &nbsp;<asp:Label ID="msg_Lbl" runat="server" Visible="false" Font-Bold="true" ForeColor="Red" />
        </div>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
            scrolling="no"></iframe>

        <script type="text/javascript">
            // Instantiate our BusyBox object
            var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 1, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
        </script>
    </form>


</body>
</html>
