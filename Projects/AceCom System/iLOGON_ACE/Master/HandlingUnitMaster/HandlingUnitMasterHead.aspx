<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandlingUnitMasterHead.aspx.cs" Inherits="iWMS.Web.Master.HandlingUnitMaster.HandlingUnitMasterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Handling Unit Master Head</title>
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
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td class="style1">
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                Visible="False"></asp:Label>
                </table>
                &nbsp;
                <asp:Button ID="HULabelBtn" runat="server" CssClass="blue" Text="HU Label"
                    OnClick="HULabelBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="Edit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="HUNO" UniqueName="HUNO" SortExpression="HUNO"
                                HeaderText="Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HUType" UniqueName="HUType" SortExpression="HUType"
                                HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GINumber" UniqueName="number" SortExpression="number"
                                HeaderText=" GINumber">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ShipToCode" UniqueName="shname" SortExpression="shname"
                                HeaderText="ConsigneeName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DeliveryDate" UniqueName="expdate" SortExpression="expdate"
                                HeaderText="DeliveryDate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser"
                                HeaderText="AddUser" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="UniqueName"
                                HeaderText="EditUser" ShowFilterIcon="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false" />
                            <telerik:GridBoundColumn DataField="EntId" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
