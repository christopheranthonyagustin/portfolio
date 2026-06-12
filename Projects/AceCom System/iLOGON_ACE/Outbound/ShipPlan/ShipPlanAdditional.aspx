<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShipPlanAdditional.aspx.cs" Inherits="iWMS.Web.Outbound.ShipPlan.ShipPlanAdditional" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ShipPlanAdditional</title>
     <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
     <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
   
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />       
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" Visible="true"  
                        Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Search" />              
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                     <iwms:iform id="formCtl" runat="server"></iwms:iform>
                </td>
            </tr>        
    </table>       
    <div>            
    </div>
         &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label>
    </form>
</body>
</html>
