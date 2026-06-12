<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipmentOutbox.aspx.cs" Inherits="iWMS.Web.Job.Shipment.ShipmentOutbox" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OutBox</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>Path
                    <br />
                    <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="155px" Skin="Office2007"
                        ReadOnly="true">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowMultiRowSelection="true"
            Skin="Office2007" AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridTemplateColumn UniqueName="Preview" AllowFiltering="false" HeaderStyle-Width="70px">
                        <HeaderStyle />
                        <ItemTemplate>
                            <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="Filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="CreationDate" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true" AllowFiltering="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath" Display="false"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>

