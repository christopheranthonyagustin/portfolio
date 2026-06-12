<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TradingPartnerUpload.aspx.cs" Inherits="iWMS.Web.Accounting.TradingPartner.TradingPartnerUpload" %>


<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Trading Partner Upload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />    
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
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
                </td>
            </tr>     
            <tr>
                <td class="style1">                 
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />     <br />&nbsp;                          
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
                    <asp:Button ID="uploadBtn" CssClass="white" runat="server" OnClick="uploadBtn_Click" Visible="true"  
                                Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />                   
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="style1">
                    <br />
                    &nbsp;<asp:Label ID="Label2" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label3" Text="1. The first column in the Excel template is TradePartnerCode." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label4" Text="2. Upon processing a row with TradePartnerCode=<'blank'>, the system will assume that the End-of-File is reached." Font-Size="15px" runat="server"></asp:Label>
                    <br />
                    &nbsp;<asp:Label ID="Label5" Text="3. Rows after End-of-File will not be processed or uploaded." Font-Size="15px" runat="server"></asp:Label>

                    <br />
                </td>
            </tr>
        </table>
 
    </form>
</body>
</html>

