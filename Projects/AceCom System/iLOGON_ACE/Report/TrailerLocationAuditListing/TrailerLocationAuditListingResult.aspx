<%@ Page Language="c#" CodeBehind="TrailerLocationAuditListingResult.aspx.cs" AutoEventWireup="True" 
    Inherits="iWMS.Web.Report.TrailerLocationAuditListing.TrailerLocationAuditListingResult" EnableEventValidation="false"  %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TrailerLocationAuditListing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>
    <script runat="server"> 
     public override void VerifyRenderingInServerForm(Control control) 
     {
         
     } 
    </script> 
    <script type="text/javascript">
        function onRequestStart(sender, args) {
            if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                    args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {
                args.set_enableAjax(false);
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <%--<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />--%>
    <telerik:RadScriptManager ID="ToolkitScriptManager2" runat="server" ></telerik:RadScriptManager>
    <table width="100%">
    <tr class="graytitle">
				<td colspan="4"><asp:label ID="LicenseNameLbl" Runat="server"></asp:label></td>
				</tr>
        <tr class="graytitle">
            <td>
                Report
            </td>
            <td>
                :
            </td>
            <td>
                Trailer Location Audit Listing
            </td>
            <%--<td width="80%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>--%>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <br />
        <asp:Button ID="ExportExcelLnk" class="green" runat="server" OnClick="ExportExcel" Text="Excel" 
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Export to Excel"/>
        <br />
        <br />

       <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <ClientEvents OnRequestStart="onRequestStart" />
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="ResultDG">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="ResultDG" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" OnItemCommand="ResultDG_ItemCommand"
            AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            >
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="vehparkcode" HeaderText="VehPark" SortExpression="VehPark"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="VehParkOccupany" HeaderText="Occupancy" SortExpression="VehParkOccupany"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="vehtype" HeaderText="TrailerType" SortExpression="vehtype"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="code" HeaderText="TrailerNo" SortExpression="code"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="currentjobno" HeaderText="Current JobNo" SortExpression="currentjobno"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="currentvehno" HeaderText="Current VehNo" SortExpression="currentvehno"></telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="currentdriver" HeaderText="Current Driver" SortExpression="currentdriver"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickVehpark" HeaderText="LastPick VehPark" SortExpression="pickVehpark" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickDate" HeaderText="LastPick Date" SortExpression="pickDate" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickJobno" HeaderText="LastPick JobNo" SortExpression="pickJobno" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickVehno" HeaderText="LastPick VehNo" SortExpression="pickVehno" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickDriver" HeaderText="LastPick Driver" SortExpression="pickDriver" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickFrsvcpt" HeaderText="LastPick FromSvcPt" SortExpression="pickFrsvcpt" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="pickTosvcpt" HeaderText="LastPick ToSvcPt" SortExpression="pickTosvcpt" Visible="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropVehpark" HeaderText="LastDrop VehPark" SortExpression="dropVehpark"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropJobno" HeaderText="LastDrop JobNo" SortExpression="dropJobno"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropVehno" HeaderText="LastDrop VehNo" SortExpression="dropVehno"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropDate" HeaderText="LastDrop Date" SortExpression="dropDate"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropDriver" HeaderText="LastDrop Driver" SortExpression="dropDriver"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropFrsvcpt" HeaderText="LastDrop FromSvcPt" SortExpression="dropFrsvcpt"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="dropTosvcpt" HeaderText="LastDrop ToSvcPt" SortExpression="dropTosvcpt"></telerik:GridBoundColumn>  
                <telerik:GridBoundColumn DataField="typedescr" HeaderText="LastDrop TripType" SortExpression="typedescr"></telerik:GridBoundColumn>              
                <telerik:GridBoundColumn DataField="IdlingDays" HeaderText="Idling Days" SortExpression="IdlingDays"></telerik:GridBoundColumn>                
            </Columns>
            </MasterTableView>
            </telerik:RadGrid>
    </form>
</body>
</html>
