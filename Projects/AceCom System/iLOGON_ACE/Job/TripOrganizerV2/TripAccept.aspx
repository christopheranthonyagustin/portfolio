<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripAccept.aspx.cs" Inherits="iWMS.Web.Job.TripOrganizerV2.TripAccept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripAccept</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
     <script type="text/javascript">
         function GetRadWindow() {
             var oWindow = null; if (window.radWindow)
                 oWindow = window.radWindow; else if (window.frameElement.radWindow)
                     oWindow = window.frameElement.radWindow; return oWindow;
         }

         function close() {
             GetRadWindow().close();
         }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="JbNoLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table cellspacing="2" cellpadding="2" width="100%">
             <%--<tr>
                
                <td>
                    <iWMS:iForm ID="formCtlJBHEAD" runat="server"></iWMS:iForm>
                </td>
             </tr>
              <tr>
                
                <td>
                    <iWMS:iForm ID="formCtlJBCTNRTRIP" runat="server"></iWMS:iForm>
                </td>
             </tr>--%>
            
            <tr>    
                <td>   
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr style="margin-top:10px;">
                <td>   
                <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                 <td>
                    <%-- <asp:Button ID="AssignBtn" CssClass="white" runat="server" OnClick="AssignBtn_Click"  Text="Assign" CausesValidation="true"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />--%>

                     <asp:Button ID="AssignBtn" runat="server" CssClass="white" Text="Assign"
                    OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <br /></td>
            </tr>
        </table>
    </form>
</body>
</html>
