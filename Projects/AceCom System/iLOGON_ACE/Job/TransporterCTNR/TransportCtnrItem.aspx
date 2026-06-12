<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportCtnrItem.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportCtnrItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportCtnrItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td style="height: 20px">
                <telerik:RadButton ID="SaveNextBtn" runat="server" Text="Save &amp; Next" Skin="WebBlue"
                    CssClass="detailButton" Visible="False" OnClick="SaveNextBtn_Click">
                </telerik:RadButton>
                <telerik:RadButton ID="SaveBtn" runat="server" Text="Save" Skin="WebBlue" CssClass="detailButton"
                    Visible="False" OnClick="SaveBtn_Click">
                </telerik:RadButton>
                <telerik:RadButton ID="UpdateBtn" runat="server" Text="Update" Skin="WebBlue" CssClass="detailButton"
                    Visible="False" OnClick="UpdateBtn_Click">
                </telerik:RadButton>
                <telerik:RadButton ID="BackButton" runat="server" Text="ShowAllLines" Skin="WebBlue"
                    CssClass="detailButton" Visible="True" OnClick="BackButton_Click" CausesValidation="False">
                </telerik:RadButton>
            </td>
            <td style="height: 20px" align="right">
                <asp:Label ID="CtnrNoLbl" runat="server" Font-Bold="True" Visible="false">Container No. :</asp:Label>&nbsp;
                <asp:DropDownList Style="z-index: 0" ID="CtnrNoList" runat="server" Visible="false">
                </asp:DropDownList>
                &nbsp;
                <asp:Label Style="z-index: 0" ID="InvNoLbl" runat="server" Font-Bold="True" Visible="false">Invoice No. :</asp:Label>&nbsp;
                <asp:DropDownList Style="z-index: 0" ID="InvNoList" runat="server" Visible="false">
                </asp:DropDownList>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true"></asp:ValidationSummary>
    </form>
</body>
</html>
