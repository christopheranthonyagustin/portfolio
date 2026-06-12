<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RSHInterface.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.RSHInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RSHInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self" />
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" Font-Size="17px" />
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
                DropDownWidth="150px" Skin="WebBlue" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
            </telerik:RadDropDownList>
                    &nbsp;
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files" UseSubmitBehavior="false" CssClass="white" />&nbsp;

                      <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                          OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                   <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                   <asp:Button ID="IgnoreBtn" runat="server" Text="Ignore" OnClick="IgnoreBtn_Click"
                       OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="UndoBtn" runat="server" Text="Undo" OnClick="UndoBtn_Click" Visible="true"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label Text="Processing Rules:" Font-Size="15px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    <asp:Label Text="1. Only filenames with prefixes INB* & SRR* will appear in the Outstanding folder" Font-Size="14px" runat="server"></asp:Label>
                    <br />
                    <asp:Label Text="2. Though their formats are different, both types of files will be uploaded as a Goods Receive document" Font-Size="14px" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>

        <telerik:RadGrid ID="ResultDG" runat="server" GridLines="None" AutoGenerateColumns="false" Width="100%" AllowFilteringByColumn="true"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowMultiRowSelection="true" CellPadding="2"
            UseAccessibleHeader="True" Skin="Office2007" Height="430px" ClientSettings-AllowColumnsReorder="true" OnColumnCreated="ResultDG_ColumnCreated">

            <ClientSettings>
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>

                     <%--<telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectChkBox" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>--%>
                    <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="DeliveryNumber" DataField="DeliveryNumber" AllowSorting="true"
                        SortExpression="DeliveryNumber" UniqueName="DeliveryNumber" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PurchaseOrder" DataField="PurchaseOrder" AllowSorting="true"
                        SortExpression="PurchaseOrder" UniqueName="PurchaseOrder" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DeliveryDate" DataField="DeliveryDate" AllowSorting="true"
                        SortExpression="DeliveryDate" UniqueName="DeliveryDate" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VendorCode" DataField="VendorCode" AllowSorting="false"
                        SortExpression="VendorCode" UniqueName="VendorCode" Reorderable="true" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="VendorName" DataField="VendorName" AllowSorting="false"
                        SortExpression="VendorName" UniqueName="VendorName" Reorderable="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SKULines" DataField="skulines" AllowSorting="false"
                        SortExpression="skulines" UniqueName="skulines" Reorderable="true" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filename" DataField="filename" AllowSorting="false"
                        SortExpression="filename" UniqueName="filename" Reorderable="true" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="FilesReceived" DataField="filereceived" AllowSorting="false"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Filepath" DataField="filepath" AllowSorting="false"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="processid" DataField="processid" AllowSorting="false"
                        SortExpression="processid" UniqueName="processid" Reorderable="true" Display="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="rcid" DataField="rcid"
                        SortExpression="rcid" UniqueName="rcid" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
