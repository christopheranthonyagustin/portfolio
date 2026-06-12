<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneChangeStatus.aspx.cs" Inherits="iWMS.Web.Master.Zone.ZoneChangeStatus" %>

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
                    <telerik:RadLabel Text="Number of Zone selected" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="NumberofZonesTxt" TextMode="SingleLine" runat="server" Resize="Both" Skin="WebBlue"
                        Font-Size="Medium" Height="5px" Width="320px" UseSubmitBehavior="false" AutoPostBack="true" ReadOnly="true">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel Text="Reason" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="ReasonTxt" TextMode="MultiLine" runat="server" Skin="Sunset"
                        Font-Size="Medium" Height="150px" Width="320px" BackColor="#ded7c6">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="SubmitBtn" class="white" runat="server" OnClick="SubmitBtn_Click"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Text="Submit" />
                    &nbsp;
                    <asp:Button ID="CloseWindowBtn" class="LongLabelWhite" runat="server" OnClick="CloseWindowBtn_Click"
                        OnClientClick="disableBtn(this.id,false )" UseSubmitBehavior="false" Text="Close Window" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
