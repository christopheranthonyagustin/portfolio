<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.RcLogListing.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReceiptLogListing</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top" class="style1">
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
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="padding-left:30px">
                    <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white" OnClick="CompileBtn_Click"></asp:Button>&nbsp;
                       <input class="white" value="Reset" type="reset">
               
                    <br />
                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>

