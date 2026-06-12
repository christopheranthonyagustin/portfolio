<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TradingPartnerHead.aspx.cs" Inherits="iWMS.Web.Accounting.TradingPartner.TradingPartnerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TradingPartnerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose_Edit(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table style="width: 100%; height: 30px">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="RefreshBtn" runat="server" class="white" Text="Refresh"
                        OnClick="RefreshBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="SetAsActiveBtn" class="LongLabelWhite" runat="server" OnClick="SetAsActiveBtn_Click"
                        Text="Set as Active" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="SetAsInactiveBtn" class="LongLabelWhite" runat="server" OnClick="SetAsInactiveBtn_Click"
                        Text="Set as Inactive" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                     <asp:Button ID="CopyBtn" runat="server" class="white" Text="Copy"
                         OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" MasterTableView-AllowSorting="true"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
                            <telerik:GridBoundColumn DataField="code" ItemStyle-Wrap="false" SortExpression="Code"
                                HeaderText="Code" AllowSorting="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" ItemStyle-Wrap="false" SortExpression="name" AllowSorting="true"
                                HeaderText="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="uen" SortExpression="uen" HeaderText="UEN" AllowSorting="false"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="countrycodedescr" ItemStyle-Wrap="false" SortExpression="countrycodescr" AllowSorting="false"
                                HeaderText="CountryCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="taxstatusdescr" ItemStyle-Wrap="false" SortExpression="taxstatusdescr" AllowSorting="false"
                                HeaderText="TaxStatus">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="taxstatusdate" ItemStyle-Wrap="false" SortExpression="taxstatusdate" AllowSorting="false"
                                HeaderText="TaxStatusDate" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="taxisinclusive" ItemStyle-Wrap="false" SortExpression="taxisinclusive" AllowSorting="false"
                                HeaderText="TaxIsInclusive">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr" AllowSorting="false"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" AllowSorting="false"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AllowSorting="false"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" AllowSorting="false"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" AllowSorting="false"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="400px" Height="400px"
                    Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose_Edit" Visible="false" Behaviors="Move, Close">
                </telerik:RadWindow>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
