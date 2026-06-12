<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ALPSPurchaseOrderInterface.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.ALPSPurchaseOrderInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALPSPurchaseOrderInterface</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />

        <table border="0" cellspacing="0" cellpadding="0" width="200%">
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" ID="FilePathLbl" Text="Path" />
                    <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007"
                        ReadOnly="true">
                    </telerik:RadTextBox>
                    &nbsp;
                    <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                        DropDownWidth="150px" Skin="WebBlue" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_SelectedIndexChanged">
                    </telerik:RadDropDownList>
                    &nbsp;
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                      &nbsp;
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Refresh" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;&nbsp;
                    <br />
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                        <Localization Select="Select" />
                    </telerik:RadAsyncUpload>
                    <br />
                         <asp:Button ID="DepositFile" runat="server" Text=" Deposit File  " OnClick="DepositFileClick"
                             CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowMultiRowSelection="true"
            Skin="Office2007" Height="460px" BorderStyle="Solid" AllowPaging="true">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
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
                    <telerik:GridBoundColumn HeaderText="Order Count" DataField="OrderCount"
                        SortExpression="OrderCount" UniqueName="OrderCount" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Received On" DataField="ReceivedOn"
                        SortExpression="ReceivedOn" UniqueName="ReceivedOn" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="id" DataField="PurchaseOrderId" AllowSorting="false"
                        SortExpression="id" UniqueName="id" Reorderable="true" Display="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ProcessId" AllowSorting="false" DataField="ProcessId"
                        SortExpression="ProcessId" UniqueName="ProcessId" Reorderable="true" Display="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
