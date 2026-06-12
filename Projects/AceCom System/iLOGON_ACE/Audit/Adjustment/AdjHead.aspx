<%@ Page Language="c#" CodeBehind="AdjHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.Adjustment.AdjHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>AdjHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="ShipEDIBtn" runat="server" Text="Send Confirmation"
            OnClick="ShipEDIBtn_Click" CssClass="LongLabelGreen" ToolTip="Send Confirmation?" />
        &nbsp;
         <asp:Button ID="ExcelBtn" runat="server" Text="Excel"
            OnClick="ExcelBtn_Click" CssClass="green" UseSubmitBehavior="false"/>   

        <br />
        <br />
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" AllowSorting="True"
                AllowFilteringByColumn="True" EnableLinqExpressions="False" AllowPaging="True"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                GroupPanelPosition="Top">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>&nbsp;&nbsp;

                                     <asp:ImageButton ID="Finalize" runat="server" Visible="True" ImageUrl="../../image/finalize.gif" ToolTip="Finalize"
                                         Width="15" Height="15" AlternateText="Finalize" BackColor="Transparent" OnClick="Finalize_Click"
                                         OnClientClick="return confirm('Are you sure you want to Finalize?');"
                                         BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;

                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="lnkDelete_ServerClick" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            runat="server"></a>&nbsp;&nbsp;

                                    <asp:ImageButton ID="Print" runat="server" Visible="True" ImageUrl="../../image/print.gif" ToolTip="Print"
                                        Width="15" Height="15" AlternateText="Print" BackColor="Transparent" OnClick="Print_Click"
                                        OnClientClick="return confirm('Are you sure you want to Print?');"
                                        BorderWidth="0"></asp:ImageButton>&nbsp;&nbsp;

                                  <asp:Label ID="ShipEDILbl" runat="server" />
                                &nbsp;&nbsp;
                                <asp:Label ID="AdjustmentEDIDoneLbl" runat="server" />

                            </ItemTemplate>
                            <ItemStyle Wrap="false" />
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="acid" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Adjustment No">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="Reference No">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="HTMLColourCode" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="reasondescr" SortExpression="reasondescr" HeaderText="Reason">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Project" SortExpression="Project" HeaderText="Project">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Department" SortExpression="Department" HeaderText="Department">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Class" SortExpression="Class" HeaderText="Class">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Rental" SortExpression="Rental" HeaderText="Rental">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="EmployeeCode" SortExpression="Employee" HeaderText="Employee">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="Purpose" SortExpression="Purpose" HeaderText="Purpose">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="finalizeddate" SortExpression="finalizeddate"
                            HeaderText="Finalized Date" DataFormatString="{0:dd/MMM/yyyy}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AdjustmentEDIStatus" Display="false" />
                        <telerik:GridBoundColumn DataField="AdjustmentEDIDone" Display="false" />
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
