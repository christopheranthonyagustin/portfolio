<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eCommerceStatementUploadILogon.aspx.cs" Inherits="iWMS.Web.Outbound.eCommerceStatement.eCommerceStatementUploadILogon" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>InterfaceUpload_DUNI</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />    
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">        
            <tr>
                <td colspan="2" style="height: 10px;" valign="top" align="left">
                    <b>DUNI Interface Upload</b>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>            
            <tr>
                 <td class="style1">
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                     <br />
                     <br />
                </td>            
            </tr>
            <tr>
                <td class="style1">              
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                               
                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
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
            <tr>
                <td valign="top" align="left">
                    <table>
                      <tr>
                        <td class="style1">
                            <br /><br />
                            &nbsp;<asp:Label ID="Label1" Text="" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br /><br />
                            &nbsp;<asp:Label ID="Label4" Text="" Font-Size="15px" runat="server"></asp:Label>
                            <br />
                        </td>
                      </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />      
    </form>
</body>
</html>
