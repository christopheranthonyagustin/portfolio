<%@ Page Language="c#" CodeBehind="PerAbsentList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.PerAbsent.PerAbsentList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>PerAbsent</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <div style="height: 85%;" id="div1">
                    <table>
                        <tr>
                            <td align="left">&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Button ID="Approve_RadButton" runat="server" Text="Approve" OnClick="Approve_RadButtonClicked" Visible="True"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" ToolTip="Approve Selected PINo(s)" />
                                &nbsp; &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="Reject_RadButton" runat="server" Text="Reject" OnClick="Reject_RadButtonClicked" Visible="True"
                                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" ToolTip="Reject Selected PINo" />
                                &nbsp; &nbsp;
                            </td>
                            <td>
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <div id="div2" style="height: 100%; overflow: hidden">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="100%"
                            AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                                <Selecting AllowRowSelect="true"></Selecting>
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">

                                        <HeaderTemplate>
                                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="PerAbsentDelete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete vehOff"
                                                    runat="server"></a>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Driver"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="FrDate" DataFormatString="{0:dd/MMM/yyyy}"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="ToDate" DataFormatString="{0:dd/MMM/yyyy}"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="ampmdescr" SortExpression="ampmdescr" HeaderText="AM/PM" AllowFiltering="false"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                        ItemStyle-Wrap="false">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="Status" UniqueName="Status" Display="false">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
