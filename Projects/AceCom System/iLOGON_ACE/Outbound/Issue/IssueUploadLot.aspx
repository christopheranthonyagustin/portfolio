<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueUploadLot.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueUploadLot" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Upload Lot</title>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td class="style1"> 
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" >
                         <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>                               
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />                                      
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="excelSend" runat="server" Text="Upload" CssClass="white" OnClick="excelSend_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>                           
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    &nbsp;<asp:Label ID="Label2" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label3" Text="1. Eash SKU Line can only be uploaded once." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label4" Text="2. SKU Line ExpectedQty must tally with total UploadQty." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label5" Text="3. If an UploadLot column is left blank, it will inherit the corresponding value from the original SKU Line." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>      
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
             BorderStyle="Solid" Skin="Metro" Visible="false" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">            
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>                   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>       
    </form>
</body>
</html>
