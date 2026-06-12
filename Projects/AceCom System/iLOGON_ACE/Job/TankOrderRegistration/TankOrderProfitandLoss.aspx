<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderProfitandLoss.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderProfitandLoss" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>TankOrderProfitandLoss</title>
   <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

    <%--<script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 12%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <%----//Added By San 17/12/18 6672 Point 8---%>
                <td align="left">
                   <asp:Button ID="pdfImgBtn" runat="server" Text="PDF" OnClick="ExportPdf"
                        UseSubmitBehavior="False" CssClass="blue" ToolTip ="Export To PDF" />
                    &nbsp;
                     <asp:Button ID="excelImgBtn" runat="server" Text="Excel" OnClick="ExportExcel"  
                         UseSubmitBehavior="false" CssClass="green" ToolTip="Export To Excel"/>
  
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" Skin="Office2007" AllowPaging="false"
            OnGridExporting="ResultDG_GridExporting" GridLines="Both" OnItemDataBound="ResultDG_ItemDataBound">
            <ExportSettings OpenInNewWindow="true" IgnorePaging="true">
                <Pdf DefaultFontFamily="Arial Unicode MS" BorderStyle="Medium" BorderColor="#666666" ForceTextWrap="true" PageWidth="450mm" PageHeight="300mm">
                </Pdf>
            </ExportSettings>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="true" ShowHeader="false" TableLayout="Fixed">
                <ItemTemplate>
                    <b><u>Job Information</u></b>
                    <br />
                    <br />
                    <table width="600px">
                        <colgroup>
                            <col width="150px" />
                            <col width="10px" />
                            <col width="440px" />
                        </colgroup>
                        <tr>
                            <td>
                                <asp:Label ID="JobLbl" runat="server">Job Number</asp:Label>
                            </td>
                            <td>:
                            </td>
                            <td>&nbsp;&nbsp;<asp:Label ID="JobNumberLbl" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="POLLBL" runat="server">POL</asp:Label>
                            </td>
                            <td>:
                            </td>
                            <td>&nbsp;&nbsp;<asp:Label ID="POLLBLTxt" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="PODLBL" runat="server">POD</asp:Label>
                            </td>
                            <td>:
                            </td>
                            <td>&nbsp;&nbsp;<asp:Label ID="PODLBLTxt" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="CarrierLbl" runat="server">Carrier</asp:Label>
                            </td>
                            <td>:
                            </td>
                            <td>&nbsp;&nbsp;<asp:Label ID="CarrierLblTxt" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="CommodityLbl" runat="server">Commodity</asp:Label>
                            </td>
                            <td>:
                            </td>
                            <td>&nbsp;&nbsp;<asp:Label ID="CommodityLblTxt" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <b><u>Invoice Information</u></b>
                    <br />
                    <br />
                    <telerik:RadGrid ID="SubResultDG" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        GridLines="Both" OnNeedDataSource="SubResultDG_NeedDataSource" OnItemDataBound="SubResultDG_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <ClientSettings>
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <br />
                    <b><u>Costing Detail Breakdown</u></b>
                    <br />
                    <br />
                    <telerik:RadGrid ID="SubResultDG2" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        GridLines="Both" OnNeedDataSource="SubResultDG2_NeedDataSource" OnItemDataBound="SubResultDG2_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <ClientSettings>
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <br />
                    <b><u>Profit/Loss</u></b>
                    <br />
                    <br />
                    <telerik:RadGrid ID="SubResultDG3" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        GridLines="Both" OnNeedDataSource="SubResultDG3_NeedDataSource" OnItemDataBound="SubResultDG3_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <ClientSettings>
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="false" ShowHeader="false">
                            <Columns>
                                <telerik:GridBoundColumn DataField="itemdescr" ItemStyle-Width="300px" ItemStyle-Font-Bold="true" />
                                <%--<telerik:GridBoundColumn DataField="amount" DataFormatString="{0:C}" />--%>
                                <telerik:GridBoundColumn DataField="amount" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <br />
                    <br />
                    <b><u>Container Information</u></b>
                    <br />
                    <br />                    
                     <telerik:RadGrid ID="SubResultDG4" runat="server" AutoGenerateColumns="True" Skin="Office2007"
                        GridLines="Both" OnNeedDataSource="SubResultDG4_NeedDataSource" OnItemDataBound="SubResultDG4_ItemDataBound">
                        <ExportSettings ExportOnlyData="true" OpenInNewWindow="true" />
                        <ClientSettings>
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="true">
                        </MasterTableView>
                    </telerik:RadGrid>
                </ItemTemplate>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
