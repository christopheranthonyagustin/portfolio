<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSOperationsActivity.aspx.cs" Inherits="iWMS.Web.Job.TMSOperations.TMSOperationsActivity" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>TMSOperations Activity</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="SearchBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    &nbsp;
                    <asp:Button ID="ExcelImgBtn" class="green" runat="server" OnClick="ExportExcel_Click" Text="Excel"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Visible="true" ToolTip="Export To Excel" />
                </td>
            </tr>
        </table>
        <br />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        &nbsp;
        <table width="100%">
            <tr>
                <td align="right">
                      <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true"/>

                </td>
            </tr>
        </table>
                 <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>        
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>                    

                    <telerik:GridBoundColumn DataField="Account" UniqueName="Account" SortExpression="Account" HeaderText="Account"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="AccountName" UniqueName="AccountName" SortExpression="AccountName" HeaderText="AccountName"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="CustomerReference" UniqueName="CustomerReference" SortExpression="CustomerReference" HeaderText="CustomerReference"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="StartDatePeriod" UniqueName="StartDatePeriod" SortExpression="StartDatePeriod" HeaderText="StartDatePeriod"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ProjectNo" UniqueName="ProjectNo" SortExpression="ProjectNo" HeaderText="ProjectNo"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="S/N" UniqueName="S/N" SortExpression="S/N" HeaderText="S/No" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Month" UniqueName="Month" SortExpression="Month" HeaderText="Month"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Week" UniqueName="Week" SortExpression="Week" HeaderText="Week"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Day" UniqueName="Day" SortExpression="Day" HeaderText="Day"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="JobNumber" UniqueName="JobNumber" SortExpression="JobNumber" HeaderText="JobNumber" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Date" UniqueName="Date" SortExpression="Date" HeaderText="Date"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="StartTime" UniqueName="StartTime" SortExpression="StartTime" HeaderText="StartTime"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="EndTime" UniqueName="EndTime" SortExpression="EndTime" HeaderText="EndTime"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="UOM" UniqueName="UOM" SortExpression="UOM" HeaderText="UOM"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ActualQty" UniqueName="ActualQty" SortExpression="ActualQty" HeaderText="ActualQty"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Cargo" UniqueName="Cargo" SortExpression="Cargo" HeaderText="Cargo"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="WBSCode" UniqueName="WBSCode" SortExpression="WBSCode" HeaderText="WBS"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type" HeaderText="Type"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Remarks2" UniqueName="Remarks2" SortExpression="Remarks2" HeaderText="Remarks 2"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="FromServicePoint" UniqueName="FromServicePoint" SortExpression="FromServicePoint" HeaderText="FromServicePoint"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="FromPostalCode" UniqueName="FromPostalCode" SortExpression="FromPostalCode" HeaderText="FromPostalCode"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ToServicePoint" UniqueName="ToServicePoint" SortExpression="ToServicePoint" HeaderText="ToServicePoint"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ToPostalCode" UniqueName="ToPostalCode" SortExpression="ToPostalCode" HeaderText="ToPostalCode"
                        ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
