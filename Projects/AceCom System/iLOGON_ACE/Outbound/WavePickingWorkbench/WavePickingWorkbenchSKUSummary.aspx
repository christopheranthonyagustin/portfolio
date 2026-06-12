<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WavePickingWorkbenchSKUSummary.aspx.cs" Inherits="iWMS.Web.Outbound.WavePickingWorkbench.WavePickingWorkbenchSKUSummary" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wave Picking Workbench Order SKU Summary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>


    <style type="text/css">
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                        </td>
                        <td>
                            <asp:Button ID="Button1" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="ExcelBtn" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated" OnPreRender="ResultDG_PreRender">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                <Scrolling UseStaticHeaders="true" ScrollHeight="500px" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50"  HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" TableLayout="fixed">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
