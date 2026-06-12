<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyTransportPlanningInvoice.aspx.cs" Inherits="iWMS.Web.Job.DailyTransportPlanning.DailyTransportPlanningInvoice" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Invoice @ DailyTransportPlanning</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab ID="SummaryTab" Text="Summary" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="4px" ID="HeaderRadPageView" Width="3500px">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="GenerateInvBtn" runat="server" CssClass="white" Text="Generate"
                                OnClick="GenerateInvBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PrintInvBtn" runat="server" CssClass="Blue" Text="Print Invoice"
                                OnClick="PrintInvBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="UndoInvBtn" runat="server" Text="Undo" OnClick="UndoInvBtn_Click"
                                CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                             <asp:Button ID="PostBtn" runat="server" Text="Post" OnClick="PostBtn_Click"
                                CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                           <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" ClientSettings-Resizing-AllowColumnResize="true"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" AllowFilteringByColumn="true" EnableHeaderContextFilterMenu="true"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="450px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" Name="InvoiceGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true" ShowFilterIcon="true"  HeaderStyle-Width="200px" ItemStyle-Width="200px"
                                SortExpression="accode" UniqueName="accode" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Billing Name" DataField="billname" AllowFiltering="true" HeaderStyle-Width="320px" ItemStyle-Width="320px"
                                SortExpression="billname" UniqueName="billname" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="InvoiceNo"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                AllowFiltering="true" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="InvDate" DataField="invdate" AllowFiltering="true"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="invdate" UniqueName="invdate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Booking Date" DataField="BookingDate" AllowFiltering="true"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="BookingDate" UniqueName="BookingDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TotalAmt" DataField="totinvamt" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="totinvamt" UniqueName="totinvamt" Reorderable="true" DataFormatString="{0:#,0.00}"
                                ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Currency" DataField="currcode" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="currcode" UniqueName="currcode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="BillingContact" DataField="billcontact" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                ColumnGroupName="billcontact" SortExpression="billcontact" UniqueName="billcontact" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="invtypedescr" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="invtypedescr" UniqueName="invtypedescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="JobNo" DataField="DrdtSrcNo" AllowFiltering="true" Resizable="true" HeaderStyle-Width="520px" ItemStyle-Width="520px"
                                 AutoPostBackOnFilter="true" SortExpression="DrdtSrcNo" UniqueName="DrdtSrcNo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SvcChitNo" DataField="tripsvcchitno" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="tripsvcchitno" UniqueName="tripsvcchitno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Source" DataField="srcdescr" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="srcdescr" UniqueName="srcdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CtnrNo" DataField="ctnrno" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem" AllowFiltering="false"  HeaderStyle-Width="200px" ItemStyle-Width="200px"
                                SortExpression="rem" UniqueName="rem" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="status" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="status" UniqueName="status" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="statusdescr" UniqueName="statusdescr" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="FromDate" DataField="frdate" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="frdate" UniqueName="frdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="To Date" DataField="todate" AllowFiltering="false"
                                SortExpression="todate" UniqueName="todate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Period" DataField="period" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="period" UniqueName="period" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Entity" DataField="entity" AllowFiltering="false" HeaderStyle-Width="180px" ItemStyle-Width="180px"
                                SortExpression="entity" UniqueName="entity" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reference" DataField="exref1" AllowFiltering="false"  HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                SortExpression="exref1" UniqueName="exref1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"  HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="adduser" UniqueName="adduser" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"  HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                SortExpression="editdate" UniqueName="editdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"  HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                SortExpression="edituser" UniqueName="edituser" AutoPostBackOnFilter="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" UniqueName="statuscolor" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acId" UniqueName="acId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JBId" UniqueName="JBId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
