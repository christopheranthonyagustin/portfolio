<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GLMappingHead.aspx.cs" Inherits="iWMS.Web.Master.Charge.GLMappingHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ChargeCode</title>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="GLMappingSearch Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" Selecting-AllowRowSelect="true">
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn HeaderText="Entity" DataField="EntityName" AllowFiltering="true"
                                SortExpression="Entity" UniqueName="Entity" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Charge Code" DataField="ChargeCode" AllowFiltering="true"
                                SortExpression="ChargeCode" UniqueName="ChargeCode" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Charge Description" DataField="ChargeDescr" AllowFiltering="true"
                                SortExpression="ChargeDescr" UniqueName="ChargeDescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="RevenueGLAccount" DataField="RevenueGLAccDescr" AllowFiltering="true"
                                SortExpression="RevenueGLAccDescr" UniqueName="RevenueGLAccDescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            
                            <%--<telerik:GridBoundColumn HeaderText="AccruedRevenueGLAccount" DataField="AccruedRevenueGLAccDescr" AllowFiltering="true"
                                SortExpression="AccruedRevenueGLAccDescr" UniqueName="AccruedRevenueGLAccDescr" Reorderable="true">
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridBoundColumn HeaderText="ExpenseGLAccount" DataField="ExpenseGLAccDescr" AllowFiltering="true"
                                SortExpression="ExpenseGLAccDescr" UniqueName="ExpenseGLAccDescr" Reorderable="true">
                            </telerik:GridBoundColumn>

<%--                            <telerik:GridBoundColumn HeaderText="AccruedExpenseGLAccount" DataField="AccruedExpenseGLAccDescr" AllowFiltering="true"
                                SortExpression="AccruedExpenseGLAccDescr" UniqueName="AccruedExpenseGLAccDescr" Reorderable="true">
                            </telerik:GridBoundColumn>--%>

                            <telerik:GridBoundColumn HeaderText="AccruedExpenseControlGLAccount" DataField="AccruedExpenseControlGLAccDescr" AllowFiltering="true"
                                SortExpression="AccruedExpenseControlGLAccDescr" UniqueName="AccruedExpenseControlGLAccDescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="TaxType" DataField="TaxTypeDescr" AllowFiltering="true"
                                SortExpression="TaxType" UniqueName="TaxType" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" AllowFiltering="true"
                                SortExpression="StatusDescr" UniqueName="StatusDescr" Reorderable="true">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                                SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                                SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                                SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                                SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="false" DataField="statuscolor" UniqueName="StatusColor" />
                            <telerik:GridBoundColumn Display="false" DataField="Id" UniqueName="Id" />
                            <telerik:GridBoundColumn Display="false" DataField="ChargeId" UniqueName="ChargeId" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
