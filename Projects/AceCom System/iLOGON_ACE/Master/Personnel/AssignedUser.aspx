<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignedUser.aspx.cs" Inherits="iWMS.Web.Master.Personnel.AssignedUser" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AssignUser</title>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td style="padding-bottom: 5px; width: 700px">
                    <asp:Label ID="Label1" runat="server" Text="AssignedUsers" Font-Bold="true" Font-Size="Medium" />
                </td>
                <td style="padding-bottom: 5px; padding-left: 15px;">

                    <asp:Label ID="Label2" runat="server" Text="Users" Font-Bold="true" Font-Size="Medium" />
                </td>
            </tr>
            <tr>
                <td valign="top" style="width: 45%; height: 75%">
                    <telerik:RadGrid ID="ResultDGAssigned" runat="server" AutoGenerateColumns="false" GridLines="None" OnItemDataBound="ResultDGAssigned_ItemDataBound"
                        EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGAssigned_RowDrop"
                        Height="450px" UseAccessibleHeader="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDGAssigned_NeedDataSource" AllowMultiRowSelection="true" Width="100%">
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                            <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="userId" SortExpression="UserId" HeaderText="UserId"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" SortExpression="Name" HeaderText="Name"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Profile" SortExpression="Profile" HeaderText="Profile"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ActiveDescr" SortExpression="ActiveDescr" HeaderText="Active" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LastLogin" SortExpression="LastLogin" HeaderText="Last Login"
                                  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" DataType="System.DateTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" DataType="System.DateTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="adduser"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Active" SortExpression="Active" HeaderText="Active" AllowFiltering="false" Display="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
                <td valign="top" style="padding-left: 10px; width: 45%">
                    <telerik:RadGrid ID="ResultDGUnAssigned" runat="server" AutoGenerateColumns="false" GridLines="None"
                        Height="450px" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGUnAssigned_RowDrop"
                        OnItemDataBound="ResultDGUnAssigned_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="false" OnNeedDataSource="ResultDGUnAssigned_NeedDataSource" AllowMultiRowSelection="true">
                        <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                            <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="userId" SortExpression="UserId" HeaderText="UserId"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" SortExpression="Name" HeaderText="Name"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Profile" SortExpression="Profile" HeaderText="Profile"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ActiveDescr" SortExpression="ActiveDescr" HeaderText="Active" AllowFiltering="false">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LastLogin" SortExpression="LastLogin" HeaderText="Last Login"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Active" SortExpression="Active" HeaderText="Active" Display="false"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
