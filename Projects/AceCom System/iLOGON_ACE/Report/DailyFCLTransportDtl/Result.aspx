<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.DailyFCLTransportDtl.Result" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>Daily FCL Transport Details Report</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <table width="100%">
            <tr class="graytitle">
                <td colspan="3">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label></td>
            </tr>
            <tr class="graytitle">
                <td>Report : Daily FCL Transport Details</td> 
            </tr>
             <tr class="graytitle">
                <td>JobAddDate :
                    <asp:Label ID="JobAddDate_Lbl" runat="server" /></td>
            </tr>
             <tr class="graytitle">
                <td>FrExpDate :
                    <asp:Label ID="FrExpDate_Lbl" runat="server" /></td>
            </tr>
             <tr class="graytitle">
                <td>ToActDate :
                    <asp:Label ID="ToActDate_Lbl" runat="server" /></td>
                  <td width="50%" align="right">
                    <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                        <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                            height="20" runat="server"></a></td>
            </tr>
            <tr class="graytitle">
                <td>Date :               
                    <asp:Label ID="NowLbl" runat="server"></asp:Label></td>
            </tr>
        </table>
        <div style="height: 90%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="Solid"
                GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True" OnNeedDataSource="ResultDG_NeedDataSource"
                AllowPaging="False" Skin="Metro" OnGridExporting="ResultDG_GridExporting" OnExcelExportCellFormatting="ResultDG_ExcelExportCellFormatting">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle></AlternatingItemStyle>
                <ItemStyle></ItemStyle>              
                <HeaderStyle Wrap="false"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridBoundColumn Visible="False" DataField="id"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbadddate" SortExpression="jbadddate" HeaderText="JobAddDate" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>                        
						<telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="orderby" SortExpression="orderby" HeaderText="OrderBy">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" HeaderText="Job No">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcjobtype" SortExpression="jbcjobtype" HeaderText="JobType">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="triptypedescr" SortExpression="triptypedescr" HeaderText="TripType">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="bookingref" SortExpression="bookingref" HeaderText="BookingRef">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustomerRef" UniqueName="exref1">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exportername" SortExpression="exportername" HeaderText="Shipper">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcfraddr" SortExpression="jbcfraddr" HeaderText="FrAddr">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbctoaddr" SortExpression="jbctoaddr" HeaderText="ToAddr">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outdischargeport" SortExpression="outdischargeport" HeaderText="POD">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="inloadingport" SortExpression="inloadingport" HeaderText="POL">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="ContainerNo">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbcctnrsealno" SortExpression="jbcctnrsealno" HeaderText="SealNo">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="Size">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EmptyDate" SortExpression="EmptyDate" HeaderText="EmptyDate" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LoadedDate" SortExpression="LoadedDate" HeaderText="LoadedDate" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="jbstatusdescr" SortExpression="jbstatusdescr" HeaderText="Status">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="FrExpDate" SortExpression="FrExpDate" HeaderText="FrExpDate" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn DataField="ToActDate" SortExpression="ToActDate" HeaderText="ToActDate" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn> 
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
