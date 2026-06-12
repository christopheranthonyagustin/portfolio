<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWindowConsole.aspx.cs" Inherits="iWMS.Web.Adm.QueryWindowConsole.QueryWindowConsole" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>QueryWindowConsole</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" >
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <div>
                    &nbsp;
                    <asp:Button ID="ExecuteBtn" runat="server" CssClass="White" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" 
                        Text="Execute" OnClick="ExecuteBtn_Click" />
                    &nbsp;
                    <asp:CheckBox ID="UpdateChkBox" runat="server" Text="Update/Delete"
                        Font-Size="12px" Font-Bold="true"></asp:CheckBox>
                    <br />
                    <br />
                    &nbsp;
                    <telerik:RadTextBox ID="QueryTxt" runat="server" Height="75px" Width="750px"
                        Resize="Both" TextMode="MultiLine">
                    </telerik:RadTextBox>
                </div>
                <div id="GridDIV" runat="server">
                    <br />
                    &nbsp;
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" Height="80%" >
                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting EnableDragToSelectRows="false" AllowRowSelect="true" />
                            <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true" ></AlternatingItemStyle>
                        <ItemStyle Wrap="true" ></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" >
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>

                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
