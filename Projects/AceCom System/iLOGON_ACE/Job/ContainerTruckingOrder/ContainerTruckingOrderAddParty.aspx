<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerTruckingOrderAddParty.aspx.cs" Inherits="iWMS.Web.Job.ContainerTruckingOrder.ContainerTruckingOrderAddParty" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Split Charge</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript"></script>
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
        .ctoAddPartyVertical {
            display: flex;
            flex-direction: column;
            width: 100%;
            height: auto;
        }

        .ctoAddPartyVertical > * {
            margin: 0 0 10px 0;
        }

        .ctoAddPartyHorizontal {
            display: flex;
            flex-direction: row;
        }

        .ctoAddPartyHorizontal > * {
            margin: 0 10px 0 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="ctoAddPartyVertical">
            <asp:Label ID="IdLbl" runat="server" Text="Add Party" Visible="True" CssClass="pagetitle" Font-Size="Large" />
            <div>
                <asp:UpdatePanel ID="formCtlUpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="ctoAddPartyHorizontal">
                <asp:Button ID="AddBtn" CssClass="white" runat="server"
                    Visible="true" Text="Add" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" OnClick="addBtn_Click" />
                <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="cancelBtn_Click"
                    Visible="true" Text="Cancel" UseSubmitBehavior="false" />
            </div>
        </div>
    </form>
</body>
</html>
