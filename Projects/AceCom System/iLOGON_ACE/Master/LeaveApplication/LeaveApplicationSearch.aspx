<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplicationSearch.aspx.cs" Inherits="iWMS.Web.Master.LeaveApplication.LeaveApplicationSearch" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LeaveApplication</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab ID="SearchTab" Text="Search" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="AddLeave" Text="Add Leave" Value="10" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="SearchRadPageView">
                <br />
                &nbsp;
                <div style="margin-left: 20px">
                    <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
                    <br />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    &nbsp; &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                </div>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="600px" ID="AddLeaveRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
