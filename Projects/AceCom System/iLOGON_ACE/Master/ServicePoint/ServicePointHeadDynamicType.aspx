<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePointHeadDynamicType.aspx.cs" Inherits="iWMS.Web.Master.ServicePoint.ServicePointHeadDynamicType" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServicePointHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" Height="0px" ID="HeaderRadPageView">
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%"
                                            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
                                            OnItemDataBound="ResultDG_ItemDataBound">
                                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                <Selecting AllowRowSelect="True" />
                                                <Scrolling AllowScroll="True" ScrollHeight="500px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                                            </ClientSettings>
                                            <SortingSettings EnableSkinSortStyles="false" />
                                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
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
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:ImageButton runat="server" Visible="True" ID="ServicePtEdit" ImageUrl="../../image/pencil.gif"
                                                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit ServicePt"
                                                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                                onserverclick="ldDelete_Click" runat="server">
                                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete ListDetl" title="Delete ListDetl"
                                                                    runat="server" /></a>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="code" SortExpression="code" HeaderText="Code">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
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
                                                    <telerik:GridBoundColumn DataField="zipcode" SortExpression="zipcode" HeaderText="Postal Code">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="citycode" SortExpression="citycode" HeaderText="City">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="countrycode" SortExpression="countrycode" HeaderText="Country">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks">
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
                                                    <telerik:GridBoundColumn Display="False" DataField="StatusColourCode" />
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>