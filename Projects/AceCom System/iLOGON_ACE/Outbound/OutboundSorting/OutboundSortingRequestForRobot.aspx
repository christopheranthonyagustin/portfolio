<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutboundSortingRequestForRobot.aspx.cs" Inherits="iWMS.Web.Outbound.OutboundSorting.OutboundSortingRequestForRobot" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request for Robot @ Outbound Sorting</title>
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label Text="Pick-Up Point" runat="server"></asp:Label>
                    <br />
                    <telerik:RadComboBox ID="ServicePtCombo" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="ServicePtCombo_ItemsRequested"
                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="ServicePtCombo_Load">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel Text="MissionNotes" Font-Size="Small" runat="server"></telerik:RadLabel>
                    <br />
                    <telerik:RadTextBox ID="MissionNotesTxt" TextMode="MultiLine" runat="server" Skin="WebBlue" Resize="Both"
                        Font-Size="Medium" Height="150px" Width="320px">
                    </telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="SubmitBtn" CssClass="white" runat="server" OnClick="SubmitBtn_Click" Text="Submit"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
