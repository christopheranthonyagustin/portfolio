<%@ Page Language="c#" CodeBehind="PersonnelHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.Personnel.PersonnelHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
<html>

<head runat="server">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table width="100%">
                    <td>
                        <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                            OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="SetInactiveBtn" runat="server" CssClass="LONGLABELWHITE" Text="Set Inactive"
                            OnClick="SetInactiveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        &nbsp;
                <asp:Button ID="SetactiveBtn" runat="server" CssClass="LONGLABELWHITE" Text="Set Active"
                    OnClick="SetactiveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                            Visible="False"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                    </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    AllowMultiRowSelection="false" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
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
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <asp:Label ID="PhotoLbl" runat="server"></asp:Label>
                                    <asp:Label ID="DetlLbl" runat="server"></asp:Label>
                                    <asp:Label ID="MeritLbl" runat="server"></asp:Label>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="Personnel_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            runat="server"></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Personnel#">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="alias" SortExpression="alias" HeaderText="Alias">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LinkedUserId" SortExpression="LinkedUserId" HeaderText="Linked User Id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="idno" SortExpression="idno" HeaderText="IDNo">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="idtype" SortExpression="idtype" HeaderText="IDType">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="nationality" SortExpression="nationality" HeaderText="Nationality">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Expirydate" SortExpression="Expirydate" HeaderText="Expiry date"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="dept" SortExpression="dept" HeaderText="Department">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="datebirth" SortExpression="datebirth" HeaderText="DateBirth"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="vocationdescr" SortExpression="vocationdescr"
                                HeaderText="Vocation">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="datejoin" SortExpression="datejoin" HeaderText="DateJoin"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="dateresign" SortExpression="dateresign" HeaderText="DateResign"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="gender" SortExpression="gender" HeaderText="Gender">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="Grade">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TeamDescr" SortExpression="teamdescr" HeaderText="Team">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks1" SortExpression="remarks1" HeaderText="Remarks1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks2" SortExpression="remarks2" HeaderText="Remarks2">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
