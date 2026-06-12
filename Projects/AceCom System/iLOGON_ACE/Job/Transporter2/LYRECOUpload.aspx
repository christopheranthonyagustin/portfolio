<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LYRECOUpload.aspx.cs" Inherits="iWMS.Web.Job.Transporter2.LYRECOUpload" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iform ID="formCtl" runat="server"></iWMS:iform>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true"  Skin="Outlook">
                        <Localization Select="Select a File" />
                    </telerik:RadAsyncUpload>
                </td>
                
            </tr>
            <tr>
                <td>
                     <asp:Button ID="UploadBtn" runat="server" Text="Upload" CssClass="white" OnClick="Upload_Click"   
                     OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false">
                </asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblError" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    &nbsp;<asp:Label ID="Label1" Text="Processing Rules:" Font-Size="15px" Font-Bold="true" runat="server" ></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label2" Text="1. Default" Font-Size="12px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label3" Text="-a- ShipmentType='Lorry'" Font-Size="12px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label4" Text="-b- JobType='Local'" Font-Size="12px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label5" Text="-c- TransportType='Delivery' or 'Collection'" Font-Size="12px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label6" Text="-d- BillSizeType='Per DO'" Font-Size="12px" runat="server"></asp:Label>
                    <br />
                    
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
            OnNeedDataSource="ResultDG_NeedDataSource" Visible="false" GridLines="None"
            AutoGenerateColumns="True" GroupPanelPosition="Top"
            AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true">
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
