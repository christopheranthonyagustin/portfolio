<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.InventoryByLot2.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InventoryByLot</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top" width="30%">
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" width="70%">
                    <asp:UpdatePanel ID="UpdButton" runat="server">
                        <ContentTemplate>
                            <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" type="checkbox"
                                name="checkall" />&nbsp;ALL&nbsp;&nbsp;
                            <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Run"
                                CssClass="white" OnClick="CompileBtn_Click"></asp:Button>&nbsp;
                                <input class="white" value="Reset" type="reset" />&nbsp;
                                <asp:Button ID="AddScheduleBtn" runat="server" Text="Add Schedule" Visible="False"
                                    CssClass="white" OnClick="AddScheduleBtn_Click"></asp:Button>&nbsp;
                                 <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="CheckBoxTB" runat="server">
                                        <br />
                                        <br />
                                        <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="3" Width="511px"
                                            CellSpacing="4" CellPadding="5" OnSelectedIndexChanged="DisplayChkBoxList_SelectedIndexChanged">
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="AddScheduleBtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdButton">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
