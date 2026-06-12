<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV2ReleaseRequestHead.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV2.GIV2ReleaseRequestHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>GIV2ReleaseRequestHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="ReleaseRequest" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmBtn" CssClass="white" runat="server" OnClick="ConfirmBtn_Click" Text="Confirm"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false" HeaderStyle-Width="30px"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="60px">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TemplateEdit"
                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReleaseOrderNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr"
                        HeaderText="Priority">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shcountrycode" SortExpression="shcountrycode"
                        HeaderText="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
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
    </form>
</body>
</html>
