<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsReceiveUPLInterfaceUpload_13.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionGoodsReceive.GoodsReceiveUPLInterfaceUpload_13" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GoodsReceiveUPLInterfaceUpload</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />    
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">        
            <tr>
                <td colspan="2" style="height: 10px; font-size: 17px" valign="top" align="left">
                    <b>UPL Interface Upload</b>
                    <br /> 
                    <br />
                </td>
            </tr>            
            <tr>
                 <td width="30%">
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                     <br />
                     <br />
                </td> 
                <td >
                    <iwms:iform ID="formCtl1" runat="server"></iwms:iform>
                </td>           
            </tr>
            <tr>
                <td class="style1">              
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                    <br />
                               &nbsp;
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
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
        <br />
        <div id="div-datagrid" style="height: 92%">
            <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" AutoGenerateColumns="true" BorderStyle="None" UseAccessibleHeader="True">
                <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem"></ItemStyle>
                <HeaderStyle Wrap="False"></HeaderStyle>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
