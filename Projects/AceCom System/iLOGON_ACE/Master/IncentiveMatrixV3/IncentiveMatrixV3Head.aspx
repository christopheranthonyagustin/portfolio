<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncentiveMatrixV3Head.aspx.cs" Inherits="iWMS.Web.Master.IncentiveMatrixV3.IncentiveMatrixV3Head" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IncentiveMatrixV3Head</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href=".paif./../css/iWMSTelerik.css">

    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" type="text/javascript">
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" ClientDataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="INCTHeadEdit" ImageUrl="..\..\image\pencil.gif"
                                BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit INCTHead"
                                OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" ID="ldAdd" ImageUrl="..\..\image\add.png" Width="15"
                                Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add"
                                OnClick="ldAdd_Click" CausesValidation="False"></asp:ImageButton>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="INCTHEAD_Delete" runat="server">
                                <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                    runat="server"></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="pergradedescr" SortExpression="pergradedescr" HeaderText="PersonnelGrade">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="incentivemethod" SortExpression="incentivemethod" HeaderText="IncentiveMethod">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="effectivedate" SortExpression="effectivedate" HeaderText="EffectiveDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tieroption" SortExpression="tieroption" HeaderText="TierOption">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
