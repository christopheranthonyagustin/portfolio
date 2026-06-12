<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundDisplay.aspx.cs" Inherits="iWMS.Web.App.Profile.InboundDisplay" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Inbound Goods Receive</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <%--<link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />--%>

 <style type="text/css">
        .DGHeaderFontLargeBold {
            border: 1px solid #003366;
            background-color: #003366;
            color: White;
            padding: 5px 5px 5px 5px;
            text-align: center;
            font-family: Helvetica;
            font-size: 18px;
            font-weight: bold;
            position: relative;
            cursor: default;
            line-height: 1.0;
        }

        .DGItemLargeBoldFont
        {
	        color:Black;
	        /*background-color:#EEEEEE;*/
	        font-family: Courier New;
	        font-size: 16px;
	        font-weight:bold;
	        padding: 3px 3px 3px 3px;
        }
    </style>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="50px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td>
                            <asp:Label ID="refreshLbl" runat="server" Text="Refresh" /><br />
                            <telerik:RadDropDownList ID="refreshDdl" runat="server" DropDownHeight="100px" Width="150px"
                                Skin="WebBlue" DefaultMessage="Select a Refresh Interval" DropDownWidth="150px" OnSelectedIndexChanged="refreshDdl_SelectedIndexChanged" AutoPostBack="true">
                            </telerik:RadDropDownList>
                            <asp:Timer ID="Refreshtmr" runat="server" OnTick="Refreshtmr_Tick"></asp:Timer>
                        </td>
                        <td>
                            &nbsp;
                              <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                            <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>

        <br />
        
       <table id="resultTable" runat="server" cellspacing="0" cellpadding="0" width="100%"
        border="0">        
        <tr>
            <td class="style2">  
        <asp:Label ID="GridLbl" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>   
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="0" Width="45%" Height="50%" >

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="15px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center"></ItemStyle>            
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
                </td>
            </tr>
            </table>
        <br />
        <asp:Label ID="GridLbl1" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2" >

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl2" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl3" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG3" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl4" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG4" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl5" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG5" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <br />
        <asp:Label ID="GridLbl6" runat="server" Visible="false" Font-Bold="true" Font-Size="16px"></asp:Label>
        <telerik:RadGrid ID="ResultDG6" runat="server" AutoGenerateColumns="true"
            EnableLinqExpressions="False" AllowPaging="True"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GridLines="Both" CellPadding="2">

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" Wrap="false" Height="30px"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItemLargeBoldFont" Wrap="false" HorizontalAlign="Center" Height="30px"></ItemStyle>
            <HeaderStyle CssClass="DGHeaderFontLargeBold" Wrap="true" HorizontalAlign="Center" Height="50px"></HeaderStyle>
            <ExportSettings UseItemStyles="True">
            </ExportSettings>
            <ClientSettings>
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" />
            </ClientSettings>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
