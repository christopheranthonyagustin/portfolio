<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderItemLineInsert.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderItemLineInsert" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" href="../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../css/style.css" type="text/css" />
    <script type="text/javascript" src="../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function navigateBackToParent() {
            window.parent.location.href = document.referrer;
        }
    </script>
    <script type="text/javascript">
    var integerTextBox = $find("LineInsert");
    integerTextBox.add_valueChanging(function (sender, args) {
        var newValue = args.get_newValue();
        if (!isInteger(newValue)) {
            args.set_cancel(true);
            alert("Please enter a valid integer value.");
        }
    });

    function isInteger(value) {
        return /^[0-9]+$/.test(value);
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel Text="Please Enter LineNo:" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="LineInsert" TextMode="MultiLine" runat="server" Skin="WebBlue"
                        Font-Size="Medium" Height="150px" Width="320px">
                    </telerik:RadTextBox>

                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" Text="Submit"
                        UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CloseBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseBtn_Click" Text="Close Window"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            var integerTextBox = $find("<%= LineInsert.ClientID %>");
            integerTextBox.add_valueChanging(function (sender, args) {
                var newValue = args.get_newValue();
                if (!isInteger(newValue)) {
                    args.set_cancel(true);
                    alert("Please enter a valid integer value.");
                }
            });

            function isInteger(value) {
                return /^[0-9]+$/.test(value);
            }
        </script>
    </form>
</body>
</html>
