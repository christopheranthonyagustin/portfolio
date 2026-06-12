<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeSheetSummary.aspx.cs" Inherits="iWMS.Web.Master.TimeSheetRegisterV2.TimeSheetSummary" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TimeSheetSummary</title>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <div>
        <table>
            <tr>
                <td>
                    &nbsp;<asp:Label ID="ddllbl" runat="server" Text="Personnel"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="Personnelddl"
                        ErrorMessage="*"></asp:RequiredFieldValidator>                    
                    <br />
                    &nbsp;<telerik:RadComboBox ID="Personnelddl" ZIndex="15000" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;<asp:Label ID="RadMonthYearPickerLbl" runat="server" >Month</asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadMonthYearPicker"
                        ErrorMessage="*"></asp:RequiredFieldValidator> 
                    <br />
                    &nbsp;<telerik:RadMonthYearPicker ID="RadMonthYearPicker" runat="server" AutoPostBack="false" RenderMode="Lightweight"
                        DateInput-Display="true" Skin="WebBlue" Width="155px">
                    </telerik:RadMonthYearPicker >
                </td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;
         <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
              Text="Refresh" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />    
    </div>
    </form>
</body>
</html>
