<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="iWMS.Web.Report.SIVServiceLevel.Result" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SIV Service Level Report</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%" id="report" runat="server">
            <tr class="graytitle">
                <td colspan="4">
                    <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label></td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="TitleLbl" runat="server" CssClass="Graytitle">SIV Service Level Report</asp:Label>
                    <asp:Label ID="FromDateLbl" runat="server"></asp:Label>
                    <asp:Label ID="ToDateLbl" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td>
                    <asp:Label ID="DateLbl" runat="server">Date :</asp:Label>
                    <asp:Label ID="NowLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExportExcel" Visible="true" Text="Excel"
              OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export To Excel" />
        <br />
        <br />
        <%--<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
            EnableLinqExpressions="False" AllowPaging="True" GridLines="Both"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnGridExporting="ResultDG_GridExporting" >

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>--%>
        <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="true" AllowSorting="true" Skin="Office2007" 
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnGridExporting="ResultDG_GridExporting" PageSize="50">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
           <MasterTableView AllowMultiColumnSorting="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn HeaderText="SIV No" DataField="sivno" UniqueName="sivno"  >
                    </telerik:GridBoundColumn>
                                    
                    <telerik:GridBoundColumn HeaderText="Staus" DataField="status" UniqueName="status" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="Move" DataField="move" UniqueName="move" >                   
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="DNno" DataField="skudescr" UniqueName="skudescr" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="MZone" DataField="MZone" UniqueName="mrzone"  >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="MatNo" DataField="MatNo"  >
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="MatName" DataField="MatName" >
                    </telerik:GridBoundColumn>
                
                    <telerik:GridBoundColumn HeaderText="MatGrp" DataField="MatGrp" >
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="Area" DataField="Area" >
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="CreatedDate" DataField="CreatedDate"  DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="CfmDate" DataField="CfmDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="HNDDate" DataField="HNDDate"  DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn HeaderText="Uom" DataField="Uom" >
                    </telerik:GridBoundColumn>
               
                    <telerik:GridBoundColumn HeaderText="Qty" DataField="Qty"  DataFormatString="{0:#.##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>                
                    
                    <telerik:GridBoundColumn HeaderText="PackedQty" DataField="PackedQty" DataFormatString="{0:#.##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>                
                    
                </Columns>
            </MasterTableView> 
    </telerik:RadGrid>
            </div>
  </form>
</body>
</html>
