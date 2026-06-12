<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptUploadTUNO1.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.ReceiptUploadTUNO1" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                   <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" >
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" Text="Note : Only Microsoft Excel files can be Uploaded." runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                   
                            <asp:Button ID="excelSend" runat="server" Text="Upload" CssClass="white" OnClick="excelSend_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                            <br />
                            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            <br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    &nbsp;<asp:Label ID="Label2" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label3" Text="1. Eash TUNO1 can only be uploaded once." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>

       <%-- <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro" Visible="false">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                    </telerik:GridClientSelectColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>--%>
        <table>
            <td class="style1">&nbsp;
                <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
        </table>
    </form>
</body>
</html>

