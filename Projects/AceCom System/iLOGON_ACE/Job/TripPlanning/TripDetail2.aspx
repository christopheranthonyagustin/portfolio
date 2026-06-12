<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripDetail2.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.TripDetail2" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TripDetail</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
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
     <script type="text/javascript">
         function OnClientClose(sender, args) {
             document.location.href = document.location.href;
         }
     </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" method="post" runat="server">    
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2">
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="true" CssClass="detailButton"
                        OnClick="UpdateBtn_Click"></asp:Button>
                </td>
                <td>
                    <asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true" CssClass="detailButton"
                        OnClick="OpenBtn_Click" Width="100px"></asp:Button>
                        &nbsp;<asp:Button ID="DischargeBtn" runat="server" Text="Discharged" Visible="true" CssClass="detailButton"
                        OnClick="DischargeBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="EmptiedBtn" runat="server" Text="Emptied" Visible="true" CssClass="detailButton"
                        OnClick="EmptiedBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="RExportBtn" runat="server" Text="R-Export" Visible="true" CssClass="detailButton"
                        OnClick="RExportBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="AssignBtn" runat="server" Text="Assign" Visible="true" CssClass="detailButton"
                        OnClick="AssignBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                        CssClass="detailButton" OnClick="CompletedBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="VoidBtn" runat="server" Text="Void" Visible="true" CssClass="detailButton"
                        OnClick="VoidBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="CancelledBtn" runat="server" Text="Cancelled" Visible="true"
                        CssClass="detailButton" OnClick="CancelledBtn_Click" Width="100px"></asp:Button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="ChangeOpsUnitBtn" runat="server" OnClick="ChangeOpsUnitBtn_Click"
                        Text="ChangeOpsUnit" CssClass="detailButton" />&nbsp;
                    <asp:Button ID="personnelBtn"
                            runat="server" OnClick="PersonnelBtn_Click" CssClass="detailButton" />&nbsp;
                    <asp:Button ID="incentiveBtn" Text="Incentive"
                            runat="server" OnClick="incentiveBtn_Click" CssClass="detailButton" />&nbsp;                         
                    <asp:Button ID="TripSummary" Text="TripSummary"
                            runat="server" OnClick="TripSummaryBtn_Click" CssClass="detailButton" />&nbsp;
                              <asp:Button ID="Sms" Text="GenSMS"
                            runat="server" OnClick="SMS_Click" CssClass="detailButton" 
                        Height="24px" />&nbsp;
                </td>
            </tr>
        </table>
        &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
            CssClass="errorLabel"></asp:Label></div>
    </form>
</body>
</html>
