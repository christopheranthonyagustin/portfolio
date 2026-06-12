<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistanceMatrixHead.aspx.cs" Inherits="iWMS.Web.Job.DistanceMatrix.DistanceMatrixHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>DistanceMatrix</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Id="ResultTab" Text="Result" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="false"/>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" >
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="FrPostalCode" SortExpression="FrPostalCode" HeaderText="FrPostalCode"
                                Display="true" UniqueName="FrPostalCode" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ToPostalCode" SortExpression="ToPostalCode" HeaderText="ToPostalCode"
                                Display="true" UniqueName="ToPostalCode" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Duration" SortExpression="Duration" HeaderText="Duration"
                                Display="true" UniqueName="Duration" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DurationText" SortExpression="DurationText" HeaderText="DurationText"
                                Display="true" UniqueName="DurationText" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Distance" SortExpression="Distance" HeaderText="Distance"
                                Display="true" UniqueName="Distance" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DistanceText" SortExpression="DistanceText" HeaderText="DistanceText"
                                Display="true" UniqueName="DistanceText" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HitCount" SortExpression="HitCount" HeaderText="HitCount"
                                Display="true" UniqueName="HitCount" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LastHitDate" SortExpression="LastHitDate" HeaderText="LastHitDate"
                                Display="true" UniqueName="LastHitDate" ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="StatusDescr"
                                Display="true" UniqueName="StatusDescr" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                                Display="true" UniqueName="AddUser" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser"
                                Display="true" UniqueName="EditUser" ItemStyle-Wrap="false" Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Id" SortExpression="Id" HeaderText="Id"
                                Display="false" UniqueName="Id" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" HeaderText="StatusColourCode"
                                Display="false" UniqueName="StatusColourCode" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
