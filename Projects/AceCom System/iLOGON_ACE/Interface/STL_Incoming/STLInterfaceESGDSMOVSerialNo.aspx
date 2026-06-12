<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="STLInterfaceESGDSMOVSerialNo.aspx.cs" Inherits="iWMS.Web.Interface.STL_Incoming.STLInterfaceESGDSMOVSerialNo" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>STL Interface SerialNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>
    <style type="text/css">
        html{
        overflow:hidden;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                <asp:Label ID="nameLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
       <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" Width="100%" Height="90%" AutoGenerateColumns="false" 
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="false" AllowSorting="true" Skin="Office2007">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling AllowScroll="true" UseStaticHeaders="true"/>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" Name="Master" >
            <Columns>
                <telerik:GridBoundColumn DataField="SequenceNumber" UniqueName="SequenceNumber" HeaderText="SequenceNo" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RecordCounter" UniqueName="RecordCounter" HeaderText="RecordCounter" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Indicator" UniqueName="Indicator" HeaderText="Indicator" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MaterialDocumentNumber" UniqueName="MaterialDocumentNumber" HeaderText="MaterialDocumentNo" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MaterialDocumentYear" UniqueName="MaterialDocumentYear" HeaderText="MaterialDocumentYear" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="140px" ItemStyle-Width="140px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ItemInMaterialDocument" UniqueName="ItemInMaterialDocument" HeaderText="ItemInMaterialDocument" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MaterialNumber" UniqueName="MaterialNumber" HeaderText="MaterialNo" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="SerialNumber" UniqueName="SerialNumber" HeaderText="SerialNo" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RecordNumber" UniqueName="RecordNumber" HeaderText="RecordNo" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" HeaderText="AddDate" AllowFiltering="true" 
                    Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" HeaderText="AddUser" AllowFiltering="true" 
                    Reorderable="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" UniqueName="id" HeaderText="id" AllowFiltering="true" 
                    Reorderable="true" Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FileId" UniqueName="FileId" HeaderText="FileId" AllowFiltering="true" 
                    Reorderable="true" Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FileRecordId" UniqueName="FileRecordId" HeaderText="FileRecordId" AllowFiltering="true" 
                    Reorderable="true" Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="processid" UniqueName="processid" HeaderText="processid" AllowFiltering="true" 
                    Reorderable="true" Display="false" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
