<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsNotInvoiceGen.aspx.cs"
    Inherits="iWMS.Web.Job.InvoiceRegisterV2.JobsNotInvoiceGen" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OSJobGeneration</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <base target="_self" />

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
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" EnableLinqExpressions="False"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated"
                GroupPanelPosition="Top" AllowFilteringByColumn="true">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--<telerik:GridBoundColumn DataField="jobno" SortExpression="jobno" UniqueName="jobno" HeaderText="JobNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpDate" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofchargelines" SortExpression="noofchargelines" HeaderText="NoOfChargeLine" ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="totchargeamt" SortExpression="totchargeamt" HeaderText="TotChargeAmt" DataFormatString="{0:#,#0.00}" ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opsunitdescr" SortExpression="opsunit" HeaderText="ShipmentType">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="jobtypedescr" SortExpression="jobtype" HeaderText="JobType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tpttypedescr" SortExpression="tpttype" HeaderText="TptType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" UniqueName="id" SortExpression="id" Display="false">
                        </telerik:GridBoundColumn>--%>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
