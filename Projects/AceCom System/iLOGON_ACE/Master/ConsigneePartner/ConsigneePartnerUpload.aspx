<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsigneePartnerUpload.aspx.cs" Inherits="iWMS.Web.Master.ConsigneePartner.ConsigneePartnerUpload" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ConsigneePartnerUpload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Upload" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" /><br />
                    &nbsp;
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
                    <asp:Button ID="UploadBtn" CssClass="white" runat="server" OnClick="UploadBtn_Click" Visible="true"
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="ResultTable" Visible="false">
            <table>
                <tr>
                    <td class="style2">
                        <br />
                        <br />
                        <asp:Label ID="GridLbl1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" AllowSorting="True" BorderStyle="Solid" Skin="Office2007">
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" Width="120px"></HeaderStyle>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
