<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsigneePartnerHead.aspx.cs" Inherits="iWMS.Web.Master.ConsigneePartner.ConsigneePartnerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ConsigneePartnerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <!-- added -->
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Button ID="EditBtn" CssClass="White" runat="server" OnClick="EditBtn_Click" Text="Edit"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <div id="div1" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
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
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />&nbsp;
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="Partner_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Partner"
                                        runat="server"></a>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" AllowFiltering="false" HeaderText="Account">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="code" SortExpression="Code" HeaderText="Code">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="partnertype" SortExpression="partnertype" HeaderText="Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TaxNo" SortExpression="TaxNo" HeaderText="TaxNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Addr" SortExpression="Addr" HeaderText="Address">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr1" SortExpression="addr1" HeaderText="Address#1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr3" SortExpression="addr3" HeaderText="Address#3">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr4" SortExpression="addr4" HeaderText="Address#4">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zipcode" SortExpression="zipcode" HeaderText="Zip Code">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="citycode" SortExpression="citycode" HeaderText="City">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="countrycode" SortExpression="countrycode" HeaderText="Country">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="biztypedescr" SortExpression="biztypedescr" HeaderText="BusinessType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="smancodedescr" SortExpression="smancodedescr" HeaderText="SalesMan">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
