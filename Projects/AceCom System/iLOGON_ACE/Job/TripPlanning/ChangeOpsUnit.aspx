<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeOpsUnit.aspx.cs"
    Inherits="iWMS.Web.Job.TripPlanning.ChangeOpsUnit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ChangeOpsUnit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
     <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
     </script>
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="EqpTypelbl" runat="server">EquipmentType</asp:Label>
                <asp:RequiredFieldValidator ID="EqpTypeReq" runat="server" ControlToValidate="EqpTypeList"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="EqpTypeList" runat="server" BackColor="Yellow" OnSelectedIndexChanged="EqpTypeList_SelectedIndexChanged"
                    AutoPostBack="True" DataTextField="Descr" DataValueField="item" Enabled="True"
                    Width="155px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="JobTypelbl" runat="server">JobType</asp:Label>
                <asp:RequiredFieldValidator ID="JobTypeReq" runat="server" ControlToValidate="JobTypeList"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="JobTypeList" runat="server" AutoPostBack="True" BackColor="Yellow"
                    DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td nowrap class="style1">
                <asp:Label ID="sizetypelbl" runat="server">BillSizeType</asp:Label>
                <asp:RequiredFieldValidator ID="SizeTypeReq" runat="server" ControlToValidate="SizeTypeList"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="SizeTypeList" runat="server" Enabled="True" DataTextField="Descr"
                    DataValueField="item" BackColor="Yellow" Width="155px">
                </asp:DropDownList>
            </td>
            <td nowrap class="style1">
                <asp:Label ID="TptTypelbl" runat="server">TransportType</asp:Label>
                <asp:RequiredFieldValidator ID="TptTypeReq" runat="server" ControlToValidate="TptTypeList"
                    ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="TptTypeList" runat="server" AutoPostBack="True" BackColor="Yellow"
                    DataTextField="Descr" DataValueField="item" Enabled="True" Width="155px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ChangeBtn" runat="server" Text="Change" OnClick="ChangeBtn_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
