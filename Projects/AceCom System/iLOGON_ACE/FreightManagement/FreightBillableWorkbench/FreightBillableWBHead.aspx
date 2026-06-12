<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightBillableWBHead.aspx.cs" Inherits="iWMS.Web.FreightManagement.FreightBillableWorkbench.FreightBillableWBHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightBillableWBHead</title>
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" Width="100%"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />                        
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="FMCSLId">
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
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="ConsolNo" UniqueName="ConsolNo" SortExpression="ConsolNo" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="Consol">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" SortExpression="TransportMode" HeaderText="Mode" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="shippername" UniqueName="shippername" HeaderText="ShipperName" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POL" UniqueName="POL" SortExpression="POL" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="LoadPort">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="POD" UniqueName="POD" SortExpression="POD" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="DischargePort">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ETD">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" ShowFilterIcon="false" AllowFiltering="false"
                                HeaderText="ETA">
                            </telerik:GridBoundColumn>
<%--                            <telerik:GridCalculatedColumn HeaderText="ETD <br/> ETA" DataFields="ETD, ETA" AllowFiltering="false"
                                Expression='{0} + " <br/>" + {1}' SortExpression="ETA" Reorderable="true">
                            </telerik:GridCalculatedColumn>--%>
                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" AllowFiltering="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="CreatedOn" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("CreatedOn")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcCode" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobNo" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AcId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TransportMode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
