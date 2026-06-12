<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="EmailScheduleCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="EmailSchedule.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Control.EmailSchedule" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>EmailSchedule</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
        <meta http-equiv="Pragma" content="no-cache">
</head>
<body leftmargin="0" topmargin="3">
    <form action="EmailSchedule.aspx" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div style="text-align: center">
        <iWMS:EmailSchedule ID="emailScheduleCtl" runat="server"></iWMS:EmailSchedule>
        <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="detailButton" OnClick="SaveBtn_Click"
            Width="150" />
        <br />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabelBig"></asp:Label>
        <asp:LinkButton Style="z-index: 0" ID="LinkLbl" runat="server" CssClass="linkLabelBig"
            OnClick="LinkLbl_Click" Visible="false"></asp:LinkButton>
    </div>
    </form>
</body>
</html>
