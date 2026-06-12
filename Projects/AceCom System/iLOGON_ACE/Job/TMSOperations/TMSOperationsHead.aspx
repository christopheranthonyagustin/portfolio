<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSOperationsHead.aspx.cs" Inherits="iWMS.Web.Job.TMSOperations.TMSOperationsHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSOperationsHead </title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
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
    <telerik:RadCodeBlock runat="server">
    <script type="text/javascript">
        var startingIndex = 0, gridViewID = '<%= ResultDG.MasterTableView.ClientID %>';
        function selectCheckbox(e, selectedIndex) {
            if (e.shiftKey) {
                if (startingIndex < selectedIndex) {
                    jQuery(':checkbox', '#' + gridViewID).slice(startingIndex, selectedIndex).prop("checked", true);
                } else {
                    jQuery(':checkbox', '#' + gridViewID).slice(selectedIndex, startingIndex).prop("checked", true);
                }
            }
            startingIndex = selectedIndex;
        }
    </script>
</telerik:RadCodeBlock>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Activity" Value="150" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CompleteBtn" CssClass="White" runat="server" OnClick="CompleteBtn_Click"
                                Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        &nbsp;
                        <td>
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    </tr>
                </table>
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                    </table>
                </div>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" onclick='<%# string.Format("javascript:selectCheckbox(event,{0});", Container.ItemIndex+1) %>' runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="EditButton" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="EditButton_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="TMSOperationsDelete" ImageUrl="../../image/bin.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15"
                                        OnClick="TMSOperationsDelete_Click" OnClientClick="return confirm('Confirm Delete?')" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Number" SortExpression="Number" HeaderText="JobNo"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="Sales Order No"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="Customer Reference"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="projectcode" SortExpression="projectcode" HeaderText="Project No"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected From Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="enddate" SortExpression="enddate" HeaderText="Expected To Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsEquipmentRequired" SortExpression="IsEquipmentRequired" HeaderText="Equipment" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsPersonnelListRequired" SortExpression="IsPersonnelListRequired" HeaderText="PersonnelList" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="IsSafetyDocumentRequired" SortExpression="IsSafetyDocumentRequired" HeaderText="SafetyDocument" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="Status" HeaderText="Status" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                ItemStyle-Wrap="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="88%" ID="ActivityRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
