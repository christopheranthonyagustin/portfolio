<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadPlaningForm.aspx.cs" Inherits="iWMS.Web.Outbound.LoadPlaning.LoadPlaningForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OrderPlanForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>             
            </Tabs>
        </telerik:RadTabStrip>
        
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MaininfiRadPageView" Height="700px">
                <table id="table1" border="0" cellspacing="3" cellpadding="3" width="100%" runat="server">
                    <tr>
                        <td>                            
                            <br />
                            &nbsp;                  
                             <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" Visible="false"
                                UseSubmitBehavior="false"
                                CssClass="white" />
                           <%-- <asp:Label ID="IdLbl"
                                runat="server" CssClass="pagetitle"></asp:Label>--%>
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            </telerik:RadMultiPage>

    </form>
</body>
</html>

