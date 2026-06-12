<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportManifestHead.aspx.cs" Inherits="iWMS.Web.Job.ImportManifest.ImportManifestHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ImportManifestHead</title>
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
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
          <asp:Button ID="CollectionSummaryBtn" CssClass="blue" runat="server" OnClick="CollectionSummaryBtn_Click" Text="CollectionSummary"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Width="150"/>
        <br />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            RenderMode="Lightweight" CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <br />
                <telerik:RadGrid ID="ResultDg" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDg_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
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
                            <telerik:GridBoundColumn DataField="number" UniqueName="number" SortExpression="number"
                                HeaderText="Number">
                            </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="ctnrno" UniqueName="ctnrno" SortExpression="ctnrno"
                                HeaderText="Container Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="exref1" UniqueName="exref1" SortExpression="exref1"
                                HeaderText="Customer Reference">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outvessel" UniqueName="outvessel" SortExpression="outvessel"
                                HeaderText="Vessel">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outvoyage" UniqueName="outvoyage" SortExpression="outvoyage"
                                HeaderText="Voyage">
                            </telerik:GridBoundColumn>                        
                            <telerik:GridBoundColumn DataField="permitno" UniqueName="permitno" SortExpression="permitno"
                                HeaderText="Permit No">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outdischargeport" UniqueName="outdischargeport" SortExpression="outdischargeport"
                                HeaderText="Port of Discharge">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outetd" UniqueName="outetd" SortExpression="outetd"
                                HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="inloadingport" UniqueName="inloadingport" SortExpression="inloadingport"
                                HeaderText="Place of Loading">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ineta" UniqueName="ineta" SortExpression="ineta"
                                HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outfinaldest" UniqueName="outfinaldest" SortExpression="outfinaldest"
                                HeaderText="Place of Receipt">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="id" UniqueName="id" SortExpression="id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" UniqueName="acid" SortExpression="acid" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
