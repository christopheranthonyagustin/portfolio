<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveApplicationAddLeave.aspx.cs" Inherits="iWMS.Web.Master.LeaveApplication.LeaveApplicationAddLeave" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="~/Control/ModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LeaveApplicationAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
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
        function confirmation(msg) {
            var answer = confirm(msg)
            if (answer) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7"
            AutoPostBack="True">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <br />
                <div style="margin-left: 20px">
                    <asp:Button ID="SearchBtn" runat="server" CssClass="white" Text="Search" Enable="true"
                        OnClick="SearchBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    <br />
                    <br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    &nbsp; &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                </div>
                <table>
                    <tr>
                        <td>
                            &nbsp;
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <div style="margin-left: 20px">
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" Enable="true"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="false" />
                    &nbsp;
                    <asp:Button ID="Deletebtn" runat="server" CssClass="white" Text="Delete" OnClick="Deletebtn_Click"
                        OnClientClick="return confirmation('Are you sure want to delete ?');" UseSubmitBehavior="true" Visible="false" />
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </div>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" RenderMode="Lightweight"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnBatchEditCommand="ResultDG_BatchEditCommand">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="LeaveBalanceId" Name="MainGrid" EditMode="Batch" AllowFilteringByColumn="false"
                        CommandItemDisplay="TopAndBottom">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                        <CommandItemSettings ShowAddNewRecordButton="false"/>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false" HeaderStyle-Width="60px" ItemStyle-Width="60px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="LeaveType" HeaderText="Leave Type" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LeaveType" Text='<%# DataBinder.Eval(Container.DataItem, "LeaveType")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="LeaveTypeDDL" runat="server" Width="130px" Skin="WebBlue" DropDownWidth="130px" OnLoad="LeaveTypeDDL_Load" Enabled="false"></telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Year" HeaderText="Year" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Year" Text='<%# DataBinder.Eval(Container.DataItem, "Year")%>'></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="BroughtForwardLastYear" HeaderText="BroughtForwardLastYear" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="BroughtForwardLastYearLbl" Text='<%# DataBinder.Eval(Container.DataItem, "BroughtForwardLastYear")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="BroughtForwardLastYearTxt" Skin="Metro" Width="130px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="BroughtForwardLastYearVal" runat="server" ControlToValidate="BroughtForwardLastYearTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AnnualEntitlement" HeaderText="AnnualEntitlement" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AnnualEntitlementLbl" Text='<%# DataBinder.Eval(Container.DataItem, "AnnualEntitlement")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="AnnualEntitlementTxt" Skin="Metro" Width="130px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="AnnualEntitlementVal" runat="server" ControlToValidate="AnnualEntitlementTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Forfeited" HeaderText="Forfeited" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="ForfeitedLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Forfeited")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="ForfeitedTxt" Skin="Metro" Width="130px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="ForfeitedVal" runat="server" ControlToValidate="ForfeitedTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AppliedTillDate" HeaderText="AppliedTillDate" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AppliedTillDateLbl" Text='<%# DataBinder.Eval(Container.DataItem, "AppliedTillDate")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="AppliedTillDateTxt" Skin="Metro" Width="130px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="AppliedTillDateVal" runat="server" ControlToValidate="AppliedTillDateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TotalLeft" HeaderText="TotalLeft" HeaderStyle-Width="150px" ItemStyle-Width="150px" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TotalLeftLbl" Text='<%# DataBinder.Eval(Container.DataItem, "TotalLeft")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="TotalLeftTxt" Skin="Metro" Width="130px">
                                    </telerik:RadTextBox>
                                    <asp:CompareValidator ID="TotalLeftVal" runat="server" ControlToValidate="TotalLeftTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy hh:mm}",Eval("AddDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddUser" HeaderText="AddUser" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("AddUser")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ModifiedOn" HeaderText="ModifiedOn" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:dd/MMM/yyyy hh:mm}",Eval("EditDate")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="EditUser" HeaderText="EditUser" ItemStyle-Width="120px" HeaderStyle-Width="120px" AllowFiltering="false">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("EditUser")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
