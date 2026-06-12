<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintQueueHead.aspx.cs" Inherits="iWMS.Web.Interface.PrintQueue.PrintQueueHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>PrintQueueHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            Width="100%" Height="86%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            OnItemCommand="ResultDG_ItemCommand" AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowAutomaticInserts="True">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="PrintQueueEdit"
                                    ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                    CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="ResultDG_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                title="Delete" runat="server" /></a>
                        </ItemTemplate>
                        <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="PrintQueueUpdate" ImageUrl="..\..\image\floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="PrintQueueUpdate" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="PrintQueueCancel" ImageUrl="..\..\image\arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="PrintQueueCancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="userid" SortExpression="userid" HeaderText="User" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="documentname" SortExpression="documentname" HeaderText="DocumentName" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="filename" SortExpression="filename" HeaderText="FileName" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="printertype" SortExpression="printertype" HeaderText="PrinterType" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="printeraddress" SortExpression="printeraddress" HeaderText="PrinterAddress" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="printertray" SortExpression="printertray" HeaderText="PrinterTray" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="status" HeaderText="Status">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "statusdescr")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="StatusList" runat="server"
                                        Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(StatusDS,DataBinder.Eval(Container.DataItem, "statusdescr").ToString())%>'
                                        DataSource='<%# StatusDS%>' DataTextField="descr" DataValueField="item" AutoPostBack="true">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks1" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                            UniqueName="statuscolor" Display="false" ReadOnly="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>