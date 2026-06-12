<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.DrListingByCharge.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>RevenueByCharge</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>   
                        </td>
                     </tr>
                    <tr>                          
                        <td> 
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
           <%-- <td valign="top" width="70%">
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
                            <asp:CheckBoxList ID="DisplayChkBoxList" runat="server" RepeatColumns="2" Width="511px"
                                CellSpacing="4" CellPadding="5">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>--%>
        </tr>
    </table>  
             &nbsp; &nbsp; &nbsp;
            <asp:Button ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile" CssClass="white" 
                OnClick="CompileBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
            &nbsp;
            <asp:Button ID="resetBtn" CausesValidation="false" runat="server" Text="Reset" CssClass="white" 
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" OnClick="ResetBtn_Click"></asp:Button>
            <br />
            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
      
    </form>
</body>
</html>
