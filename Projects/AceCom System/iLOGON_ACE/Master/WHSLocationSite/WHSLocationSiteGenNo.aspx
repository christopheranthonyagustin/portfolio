<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSLocationSiteGenNo.aspx.cs" Inherits="iWMS.Web.Master.WHSLocationSite.WHSLocationSiteGenNo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WarehouseLocationSite GenNo</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table> 
            <tr>
                <td>
                    <asp:Label ID="MsgLbl" runat="server" ></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>                 
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>                 
                </td>
            </tr>
            <tr>
                <td align="center"> 
                    <br />                    
                    <asp:Button ID="GenerateBtn" CssClass="white" runat="server" OnClick="GenerateBtn_Click" Visible="true"
                        Text="Generate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                   
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
