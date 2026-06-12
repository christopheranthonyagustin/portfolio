<%@ Page Language="c#" CodeBehind="LoadPlanningCtnrEditPlan.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.LoadPLanningCtnrEditPlan" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LoadPLanningCtnrEditPlan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td class="pagetitle">
                Container LoadPlanning (Step 2 of 2)
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadButton ID="BackBtn" runat="server" Text="Back" Visible="true" Skin="WebBlue"
                    OnClick="BackBtn_Click" />
                &nbsp;
                <telerik:RadButton ID="SaveBtn" runat="server" Text="Save" Visible="true" Skin="WebBlue"
                    OnClick="SaveBtn_Click" />
            </td>
            <td align="left">
                <br />
                &nbsp;<br />
                &nbsp;<br />
                <br />
            </td>
            <td align="right">
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                Choose Container 
            </td>
            <td>
                <telerik:RadDropDownList ID ="CtnrDDL" runat="server" OnSelectedIndexChanged="CtnrDDL_SelectedIndexChanged" Skin="Sunset" AutoPostBack="true"></telerik:RadDropDownList>
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="false"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        Width="50%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderText="No">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="ref" SortExpression="ref" HeaderText="PalletNo"
                        ItemStyle-Wrap="false">
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
