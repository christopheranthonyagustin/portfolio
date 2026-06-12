<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderManagerSplit.aspx.cs" Inherits="iWMS.Web.Outbound.WorkOrderManager.WorkOrderManagerSplit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Status @ Zone Master</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Text="Submit" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
