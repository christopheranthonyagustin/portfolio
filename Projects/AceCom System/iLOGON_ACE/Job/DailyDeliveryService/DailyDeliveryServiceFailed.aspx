<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyDeliveryServiceFailed.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveryService.DailyDeliveryServiceFailed" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DailyDeliveryServiceSummary</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
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
    <form id="Form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
       <telerik:RadWindowManager ID="RadWindowManager" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="Silk" Modal="true" EnableSkinTransparency="true" EnableEmbeddedSkins="true" MinDisplayTime="500">
        </telerik:RadAjaxLoadingPanel>
        <table border="0" cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <asp:Button ID="RescheduleDeliveryBtn" runat="server" CssClass="white" OnClick="RescheduleDeliveryBtn_Click"
                        Text="Redeliver" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClick="CancelBtn_Click"
                        Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="false" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowFilteringByColumn="true"
                    AllowPaging="true" Skin="Metro"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="530px" />
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="TripId" Name="FailedGrid" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c" HeaderStyle-Font-Bold="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="50px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#05538c">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click" ToolTip="Edit Booking"></asp:ImageButton>&nbsp;                                           
                                    <asp:ImageButton runat="server" ID="Attc" ImageUrl="../../image/attached.jpg" BorderWidth="0"
                                        BackColor="Transparent" Width="15" Height="15" AlternateText="Attc" OnClick="Attc_Click" ToolTip="View Attach"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
