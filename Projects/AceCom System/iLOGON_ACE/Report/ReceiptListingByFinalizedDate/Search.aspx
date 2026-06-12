<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Page Language="c#" CodeBehind="Search.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Report.ReceiptListingByFinalizedDate.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ReceiptSummaryListing</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
    
       
                <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text="Compile"
                    CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="return busyBox.Show();" ></telerik:RadButton>
                    
                    &nbsp;<%--<input class="detailButton"
                        value="Reset" type="reset">--%>
                        
               <%-- <telerik:RadButton runat="server" input class="detailButton"
                value="Reset" type="reset" Text="Reset"></telerik:RadButton>--%>
                        
                         <telerik:RadButton ID="Reset" runat="server" CssClass="detailbutton" OnClick="ResetBtn_Click"
                    Value="Reset" Text="Reset">
                </telerik:RadButton>
                
                        
                <telerik:RadButton ID="AddScheduleBtn" runat="server" Text="Add Schedule" Visible="False"
                    CssClass="detailButton" OnClick="AddScheduleBtn_Click"></telerik:RadButton>
                <br />
                <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
      
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

    </form>
</body>
</html>
