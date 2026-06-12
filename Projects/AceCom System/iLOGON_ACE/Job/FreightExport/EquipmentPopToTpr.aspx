<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentPopToTpr.aspx.cs" Inherits="iWMS.Web.Job.FreightExport.EquipmentPopToTpr" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Equipment PopToTpr</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>        
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <br />
        <br />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>            
            <tr>
                <td>
                    <br />
                    <br />
                    <br />                   
                    <asp:Button ID="OkayBtn" runat="server" CssClass="white" OnClick="OkayBtn_Click" Text="OK" />
                </td>
            </tr>
        </table>       
    </form>
</body>
</html>