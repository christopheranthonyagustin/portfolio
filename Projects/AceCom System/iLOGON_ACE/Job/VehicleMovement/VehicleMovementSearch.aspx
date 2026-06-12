<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleMovementSearch.aspx.cs"
    Inherits="iWMS.Web.Job.VehicleMovement.VehicleMovementSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VehicleMovement</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" width="70%">
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="SelectLbl" runat="server">Display</asp:Label>&nbsp;:
                            <input onclick="checkBoxes(this.form, this.checked)" value="ALL" checked type="checkbox"
                                name="checkall" />&nbsp;ALL
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <br />
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="3" Width="511px"
                                CellSpacing="4" CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                    CssClass="white" OnClick="CompileBtn_Click"></asp:Button>&nbsp;<input class="white"
                        value="Reset" type="reset" />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
