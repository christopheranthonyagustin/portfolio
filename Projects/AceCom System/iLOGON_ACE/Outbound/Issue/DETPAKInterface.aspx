<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DETPAKInterface.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.DETPAKInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DETPAKInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Interface" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="FilePathLbl" Text="Path" />&nbsp;
                        <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007"
                            ReadOnly="true">
                        </telerik:RadTextBox>
                </td>
                <td>
                    <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                        DropDownWidth="150px" Skin="WebBlue" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
                    </telerik:RadDropDownList>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
               
                <td>
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="IgnoreBtn" runat="server" Text="Ignore" OnClick="IgnoreBtn_Click" Visible="false" CssClass="white" />&nbsp;
                </td>
                <td>
                    <asp:Button ID="UndoBtn" runat="server" Text="Undo" OnClick="UndoBtn_Click" Visible="false" CssClass="white" />&nbsp;
                </td>
                
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultDG_ItemCreated"
        OnItemCommand="ResultDG_ItemCommand" Skin="Metro" OnPreRender="ResultDG_PreRender"
        OnItemDataBound="ResultDG_ItemDataBound" AllowMultiRowSelection="true">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridBoundColumn HeaderText="filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Files received" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CustomerReference" DataField="CustomerReference"
                        SortExpression="CustomerReference" UniqueName="CustomerReference" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OrderType" DataField="OrderType"
                        SortExpression="OrderType" UniqueName="OrderType" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DateRequired" DataField="DateRequired"
                        SortExpression="DateRequired" UniqueName="DateRequired" Reorderable="true" 
                        DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="WarehouseCode" DataField="WarehouseCode"
                        SortExpression="WarehouseCode" UniqueName="WarehouseCode" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ConsigneeCode" DataField="ConsigneeCode"
                        SortExpression="ConsigneeCode" UniqueName="ConsigneeCode" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="processid" DataField="processid"
                        SortExpression="processid" UniqueName="processid" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="id" DataField="id"
                        SortExpression="id" UniqueName="id" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
