<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerHead.aspx.cs" Inherits="iWMS.Web.Master.Customer.CustomerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMSF" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>CustomerHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td class="style1">
                            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                Visible="False"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <asp:Label Style="z-index: 0" ID="Label2" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
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
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <%--<asp:ImageButton runat="server" Visible="True" ID="ldDelete" ImageUrl="..\..\image\bin.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Delete Issue "
                                ToolTip="Delete Issue" OnClick="ldDelete_Click" CausesValidation="False"></asp:ImageButton>--%>

                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ListDetlDelete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete ListDetl" title="Delete ListDetl"
                                            runat="server" /></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="code" ItemStyle-Wrap="false" SortExpression="Code"
                                HeaderText="Mobile Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" ItemStyle-Wrap="false" SortExpression="name"
                                HeaderText="First Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="code2" ItemStyle-Wrap="false" SortExpression="code2"
                                HeaderText="Last Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="citycode" ItemStyle-Wrap="false" SortExpression="citycode"
                                HeaderText="District Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr1" ItemStyle-Wrap="false" SortExpression="addr1"
                                HeaderText="Address#1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr3" ItemStyle-Wrap="false" SortExpression="addr3"
                                HeaderText="Address#3">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="addr4" ItemStyle-Wrap="false" SortExpression="addr4"
                                HeaderText="Address#4">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="zipcode" ItemStyle-Wrap="false" SortExpression="zipcode"
                                HeaderText="Postal Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tel" ItemStyle-Wrap="false" SortExpression="tel"
                                HeaderText="Telephone Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="email" ItemStyle-Wrap="false" SortExpression="email"
                                HeaderText="Email">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
