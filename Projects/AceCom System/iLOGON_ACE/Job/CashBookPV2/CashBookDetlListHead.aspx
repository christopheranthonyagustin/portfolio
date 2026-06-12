<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookDetlListHead.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV2.CashBookDetlListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookDetlListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="PYLineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="ExcelBtn" runat="server" CssClass="green" Text="Excel" OnClick="ExcelBtn_Click"
                        UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="MessageLbl" Visible="false" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="300%"
            OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro" AllowPaging="true"
            AllowSorting="true" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnBatchEditCommand="ResultDG_BatchEditCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="Batch" CommandItemDisplay="Top" TableLayout="Auto">
                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="cbid" SortExpression="cbid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="accode" HeaderText="Account" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="accodeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "accode")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="number" HeaderText="ReferenceNo" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="numberLbl" Text='<%# DataBinder.Eval(Container.DataItem, "number")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Bank" HeaderText="Bank" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "BankCode")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="CBHExref2" HeaderText="ExternalReference" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CBHExref2")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="Exref2Txt" Width="128px" TextMode="SingleLine"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="CBHRem1" HeaderText="Remarks" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CBHRem1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RemarksTxt" Width="128px" TextMode="MultiLine" ReadOnly="true"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="chargedescr2" HeaderText="Charge" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="ChargeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr2")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="Description" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="DescriptionLbl" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="JobNo" HeaderText="srcno" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="JobNoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "JobNo")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="ctnrno" HeaderText="ctnrno" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="ctnrnoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="vehno" HeaderText="vehno" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="vehnoLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vehno")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="name" HeaderText="name" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="nameLbl" Text='<%# DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="vdcode" HeaderText="vdcode" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="vdcodeLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vdcode")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="vdname" HeaderText="vdname" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="vdnameLbl" Text='<%# DataBinder.Eval(Container.DataItem, "vdname")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="exdate1" HeaderText="Inv/RcDate" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="exdate1Lbl" Text='<%# Eval("exdate1", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="qty" HeaderText="Qty" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="qtyLbl" Text='<%# Eval("qty", "{0:#,0.##}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="unitrate" HeaderText="Rate($)" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="unitrateLbl" Text='<%# Eval("unitrate", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="fcamt" HeaderText="SubTotalAmt" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="fcamtLbl" Text='<%# Eval("fcamt", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="taxtypedescr" HeaderText="Tax Type" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="taxtypedescrLbl" Text='<%# DataBinder.Eval(Container.DataItem, "taxtypedescr")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="taxfcamt" HeaderText="TaxAmt" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="taxfcamtLbl" Text='<%# Eval("taxfcamt", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="TotalAmt" HeaderText="TotalAmt" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="TotalAmtLbl" Text='<%# Eval("TotalAmt", "{0:#,0.00}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="rem2" HeaderText="Remark2" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="rem2Lbl" Text='<%# DataBinder.Eval(Container.DataItem, "rem2")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="cbheadstatusdescr" HeaderText="Status" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="StatusLbl" Text='<%# DataBinder.Eval(Container.DataItem, "cbheadstatusdescr")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="adddate" HeaderText="Add Date" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="adddateLbl" Text='<%# Eval("adddate", "{0:dd/MMM/yyyy HH:mm:ss}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="editdate" HeaderText="Edit Date" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="editdateLbl" Text='<%# Eval("editdate", "{0:dd/MMM/yyyy HH:mm:ss}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="adduser" HeaderText="Add User" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="adduserLbl" Text='<%# DataBinder.Eval(Container.DataItem, "adduser")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="edituser" HeaderText="Edit User" HeaderStyle-Width="128px" ItemStyle-Width="128px" AllowFiltering="true">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="edituserLbl" Text='<%# DataBinder.Eval(Container.DataItem, "edituser")%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
