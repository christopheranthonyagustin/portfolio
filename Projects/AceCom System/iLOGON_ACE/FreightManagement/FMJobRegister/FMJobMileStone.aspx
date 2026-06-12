<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMJobMileStone.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMJobMileStone" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaJobRegisterMileStone</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" /><br />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" Width="100%">
                        <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                            <asp:Panel ID="Panel1" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="NewBtn" runat="server" Text="New" OnClick="NewBtn_Click"
                                                CssClass="white" ToolTip="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                        <td>
                                            <asp:Button ID="DeleteBtn" runat="server" Text="Delete" OnClick="DeleteBtn_Click"
                                                CssClass="white" ToolTip="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text=""
                                                OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <asp:Panel ID="Panel3" runat="server">
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true"
                                    AllowFilteringByColumn="false" Skin="Metro" Height="600px">
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true"></Selecting>
                                        <Scrolling AllowScroll="True"></Scrolling>
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="200" HierarchyLoadMode="Client">
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
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
                                                    &nbsp;
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="Milestone" DataField="MilestoneDescr" AllowFiltering="true"
                                                ColumnGroupName="Milestone" SortExpression="Milestone" UniqueName="Milestone"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Port" DataField="Port" AllowFiltering="true"
                                                ColumnGroupName="Port" SortExpression="Port" UniqueName="Port"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="expecteddate" UniqueName="expecteddate" SortExpression="expecteddate" HeaderText="Estimate Date"
                                                DataFormatString="{0:dd/MM/yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ActualDate" UniqueName="ActualDate" SortExpression="ActualDate" HeaderText="Actual Date"
                                                DataFormatString="{0:dd/MM/yyyy}">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Transport Mode" DataField="TransportMode" Display="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Contact" DataField="Contact" Display="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="Pack" HeaderText="Packs" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:} <br/> {1}", Eval("Packs"), Eval("PacksUom")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                             <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:} <br/> {1}", Eval("wt"), Eval("wtUom")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                             <telerik:GridTemplateColumn UniqueName="Volume" HeaderText="Volume" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:} <br/> {1}", Eval("vol"), Eval("volUom")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" Display="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("adddate"), Eval("adduser")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="EditDate <br/> EditUser" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("editdate"), Eval("edituser")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </asp:Panel>
                        </telerik:RadPageView>
                          <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
</html>
