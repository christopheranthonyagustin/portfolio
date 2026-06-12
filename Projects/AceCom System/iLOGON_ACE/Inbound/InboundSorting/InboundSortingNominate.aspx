<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundSortingNominate.aspx.cs" Inherits="iWMS.Web.Inbound.InboundSorting.InboundSortingNominate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Label Text="No of records selected" runat="server"></asp:Label>
                    <br />
                    <telerik:RadTextBox ID="RecordSelectedTxt" TextMode="SingleLine" runat="server" Skin="WebBlue"
                        Font-Size="Medium" Width="155" ReadOnly="true">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="VLM" runat="server"></asp:Label>
                    <br />
                    <telerik:RadComboBox ID="VLMCBB" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155"
                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="VLMCBB_ItemsRequested" OnSelectedIndexChanged="VLMCBB_SelectedIndexChanged"
                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="VLMCBB_Load">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Putaway Location" runat="server"></asp:Label>
                    <br />
                    <telerik:RadComboBox ID="PutawayLocationCBB" runat="server" Skin="WebBlue" RenderMode="Lightweight" Width="155" ExpandDirection="Down"
                        EnableLoadOnDemand="true" DropDownAutoWidth="Enabled" DropDownCssClass="radComboboxWithMultiCol" OnItemsRequested="PutawayLocationCBB_ItemsRequested"
                        ItemsPerRequest="200" ShowMoreResultsBox="true" HighlightTemplatedItems="true" CausesValidation="false" AutoPostBack="true" OnLoad="PutawayLocationCBB_Load">
                    </telerik:RadComboBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ProceedBtn" CssClass="LongLabelWhite" runat="server" OnClick="ProceedBtn_Click"
            Text="Proceed" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
    </form>
</body>
</html>
