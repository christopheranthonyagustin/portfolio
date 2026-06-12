<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrailarMonitorTrailerMovement.aspx.cs" Inherits="iWMS.Web.Job.TrailerMonitor.TrailarMonitorTrailerMovement" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TrailerMovement @ TrailerMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" CssClass="white" runat="server" OnClick="SearchBtn_Click" 
                        Text="Search" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" ID="TrailerNoLbl" Text="TrailerNo"></asp:Label><br />
                    <telerik:RadTextBox ID="TrailerNoTxtBox" runat="server" Width="155"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="TrailerNoReqVal" runat="server" ControlToValidate="TrailerNoTxtBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False" AllowPaging="True" Visible="false"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" ExportSettings-UseItemStyles="true" GridLines="None" AllowFilteringByColumn="true">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="495px" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn UniqueName="JobNumber" HeaderText="Job Number" DataField="JobNumber" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TripType" HeaderText="Trip Type" DataField="TripType" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TrailerNo" HeaderText="Trailer No" DataField="TrailerNo" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TrailerPark" HeaderText="Trailer Park" DataField="TrailerPark" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ContainerNo" HeaderText="Container No" DataField="ContainerNo" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Vehicle" HeaderText="Vehicle" DataField="Vehicle" HeaderStyle-Width="120px" ItemStyle-Width="120px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Driver" HeaderText="Driver" DataField="Driver" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Date" HeaderText="Date" DataField="Date" DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-Width="150px" ItemStyle-Width="150px"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FromAddress" HeaderText="From Address" DataField="FromAddress"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="ToAddress" HeaderText="To Address" DataField="ToAddress"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
