<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CtnrGateInHead.aspx.cs" Inherits="iWMS.Web.Inbound.CtnrGateIn.CtnrGateInHead" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CtnrGateInHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script src="../../js/CastleBusyBox.js" language="javascript" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <p>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </p>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="CtnrGateInEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="CtnrGateIn"
                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                        <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="rcId" DataField="rcid" Display="false"
                    SortExpression="rcid" UniqueName="rcid" Reorderable="true">  
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="acId" DataField="acid" Display="false"
                    SortExpression="acid" UniqueName="acid" Reorderable="true">  
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="skucode" AllowFiltering="true"
                    SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ContainerType" DataField="skusizetype" AllowFiltering="true"
                    SortExpression="skusizetype" UniqueName="skusizetype" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="CustRef" DataField="exref1" AllowFiltering="true"
                    SortExpression="exref1" UniqueName="exref1" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Vessel" DataField="vslvoy" AllowFiltering="true"
                    SortExpression="vslvoy" UniqueName="vslvoy" Reorderable="true">
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn HeaderText="Voyage" DataField="vslvoy2" AllowFiltering="true"
                    SortExpression="vslvoy2" UniqueName="vslvoy2" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Empty/Laden" DataField="lot4" AllowFiltering="true"
                    SortExpression="lot4" UniqueName="lot4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GradeType" DataField="lot5" AllowFiltering="true"
                    SortExpression="lot5" UniqueName="lot5" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Condition" DataField="lot6" AllowFiltering="true"
                    SortExpression="lot6" UniqueName="lot6" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="StoringDate" DataField="lot1" AllowFiltering="true"
                    SortExpression="lot1" UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Driver" DataField="lot9" AllowFiltering="true"
                    SortExpression="lot9" UniqueName="lot9" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="VehNo" DataField="lot10" AllowFiltering="true"
                    SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Haulier" DataField="lot22" AllowFiltering="true"
                    SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DHCAmount" DataField="lot11" AllowFiltering="true"
                    SortExpression="lot11" UniqueName="lot11" Reorderable="true"  ItemStyle-HorizontalAlign="Right">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="WashingAmount" DataField="lot13" AllowFiltering="true"
                    SortExpression="lot13" UniqueName="lot13" Reorderable="true" ItemStyle-HorizontalAlign="Right">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="RepairAmount" DataField="lot15" AllowFiltering="true"
                    SortExpression="lot15" UniqueName="lot15" Reorderable="true" ItemStyle-HorizontalAlign="Right">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="id" />
                <telerik:GridBoundColumn Display="False" DataField="status" />
                <telerik:GridBoundColumn Display="False" DataField="rcdstatus" />
                <telerik:GridBoundColumn Display="False" DataField="rcid" />
                <telerik:GridBoundColumn Display="False" DataField="rcdtid" />
                <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                <telerik:GridBoundColumn Display="False" DataField="skuid" />
                <telerik:GridBoundColumn Display="False" DataField="skustatus" />
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
