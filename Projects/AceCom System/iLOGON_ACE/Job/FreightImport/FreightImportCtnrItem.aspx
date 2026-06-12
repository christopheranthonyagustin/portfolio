<%@ Page Language="c#" CodeBehind="FreightImportCtnrItem.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.FreightImport.FreightImportCtnrItem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightImportCtnrItem</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td style="height: 20px" align="left">
                    <br>
                    <%--<telerik:RadButton ID="SaveNextBtn" runat="server" CssClass="detailButton" Visible="False" Skin="WebBlue"
                    Text="Save &amp; Next" OnClick="SaveNextBtn_Click">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="SaveBtn" runat="server" CssClass="detailButton" Visible="False" Skin="WebBlue"
                    Text="Save" OnClick="SaveBtn_Click">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="UpdateBtn" runat="server" CssClass="detailButton" Visible="False" Skin="WebBlue"
                    Text="Update" OnClick="UpdateBtn_Click">
                </telerik:RadButton>
                &nbsp;
                <telerik:RadButton ID="BackButton" runat="server" CssClass="detailButton" Visible="True" Skin="WebBlue"
                    Text="All Item(s)" CausesValidation="False" OnClick="BackButton_Click">
                </telerik:RadButton>--%>
                    <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" UseSubmitBehavior="false"
                        OnClick="SaveNextBtn_Click" OnClientClick="disableBtn(this.id,false)" Visible="False"></asp:Button>&nbsp;
                      <asp:Button ID="SaveBtn" runat="server" CssClass="white" 
                          OnClientClick="disableBtn(this.id,true)" Text="Save" OnClick="SaveBtn_Click" Visible="False"></asp:Button>&nbsp;
                     <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" UseSubmitBehavior="false" Visible="False"
                          OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>&nbsp;
                     <asp:Button ID="BackButton" runat="server" CssClass="white" Text="- Hide" UseSubmitBehavior="false"
                         CausesValidation="False" OnClick="BackButton_Click" OnClientClick="disableBtn(this.id,false)"></asp:Button>
                <br />
                <br />
                    &nbsp;
                <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    &nbsp;<asp:Label ID="CtnrNoLbl" runat="server" Font-Bold="True" Visible="false">Container No. :</asp:Label>&nbsp;
                <%--<asp:DropDownList Style="z-index: 0" ID="CtnrNoList" runat="server" Visible="false">
                </asp:DropDownList>--%>
                    <telerik:RadDropDownList ID="CtnrNoList" runat="server" Visible="false"></telerik:RadDropDownList>
                    &nbsp;
                <asp:Label Style="z-index: 0" ID="InvNoLbl" runat="server" Font-Bold="True" Visible="false">Invoice No. :</asp:Label>&nbsp;
               <%-- <asp:DropDownList Style="z-index: 0" ID="InvNoList" runat="server" Visible="false">
                </asp:DropDownList>--%>
                    <telerik:RadDropDownList ID="InvNoList" runat="server" Visible="false"></telerik:RadDropDownList>
                    &nbsp; &nbsp;
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
