<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPackingPopulateToJobTPR.aspx.cs" Inherits="iWMS.Web.Outbound.OrderPacking.OrderPackingPopulateToJobTPR" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Book Transport @ Order Packing</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function callbackFn(arg) //the value indicates how the dialog was closed
        {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .rwPopupButton {
            margin-left: 100px !important;
            margin-top: 30px !important;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td valign="top" width="30%">
                    <table id="Table2">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" AutoSize="true" CenterIfModal="true" Modal="true"></telerik:RadWindowManager>
                    <br />
                    <br />
                    &nbsp;<asp:Button ID="PopulateBtn" runat="server" CssClass="white" Text="Populate"
                        OnClick="PopulateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    &nbsp;<br />
                    <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="NoteLbl" runat="server" Style="z-index: 0" Font-Size="Medium" Text="<b>Note</b> : If you have accidentally selected a record that had already gone through the Book Transport process, this record will be ignored. "
                        Visible="true"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>