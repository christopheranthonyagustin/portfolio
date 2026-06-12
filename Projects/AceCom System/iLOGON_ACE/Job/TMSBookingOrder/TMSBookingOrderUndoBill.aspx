<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderUndoBill.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderUndoBill" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UndoBill</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
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
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                        oWindow = window.frameElement.radWindow; return oWindow;
            }

            function closeWin(url) {
                GetRadWindow().BrowserWindow.location.href = url;
                GetRadWindow().close();
            }

            function close() {
                GetRadWindow().close();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="false" />
        <br />

        <asp:Button ID="UndoBtn" CssClass="white" runat="server" OnClick="UndoBtn_Click"
            Text="Undo" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound" MasterTableView-AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="DRId">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="date" SortExpression="date" HeaderText="Date"
                        DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NoOfJobs" SortExpression="NoOfJobs" HeaderText="NoOfJobs"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="currency" SortExpression="currency" HeaderText="Currency"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="amount" SortExpression="amount" HeaderText="Amount"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="createdon" SortExpression="createdon" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="createdby" SortExpression="createdby" HeaderText="AddUser"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscode" Display="false"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </p>
    </form>
</body>
</html>
