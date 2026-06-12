<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerTruckingOrderCreateBill.aspx.cs" Inherits="iWMS.Web.Job.ContainerTruckingOrder.ContainerTruckingOrderCreateBill" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Create Bill</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta http-equiv="Pragma" content="no-cache" />
    <base target="_self" />

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

    <style type="text/css">
        .vt-container {
            display: flex;
            flex-direction: column;
        }

            .vt-container > * {
                margin: 1em;
            }

        .hz-container {
            display: flex;
            flex-direction: row;
        }

            .hz-container > * {
                margin: 0 1em 0 0;
            }
    </style>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="vt-container">
            <asp:Label ID="TitleLbl" runat="server" CssClass="pagetitle">Choose Invoice Date</asp:Label>

            <telerik:RadDatePicker ID="InvDate" Width="150px" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-EmptyMessage="Date"
                DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007" Visible="true">
                <Calendar runat="server">
                    <SpecialDays>
                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                    </SpecialDays>
                </Calendar>
            </telerik:RadDatePicker>

            <div class="hz-container">
                <asp:Button ID="CancelBtn" runat="server" Text=" Cancel " CssClass="white" OnClick="CancelBtn_Click" OnClientClick="return confirm('Confirm to Cancel?');" />
                <asp:Button ID="OkayBtn" runat="server" Text="Okay" CssClass="white" Enabled="true" OnClick="OkayBtn_Click" OnClientClick="return confirm('Confirm to Create?');" />
            </div>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
