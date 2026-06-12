<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeRequestHead.aspx.cs" Inherits="iWMS.Web.Management.ChangeRequest.ChangeRequestHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Change Request Search Results</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/checkbox.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="600px" ID="SearchResultRadPageView">
                <table width="100%" style="margin-top:10px !important">
                    <tr>
                        <td>
                            <asp:Button ID="ApproveBtn" runat="server" Text="Approve" OnClick="ApproveBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                            &nbsp;
                            <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                        </td>
                        <td align="right">
                            <asp:Button ID="GridMemoryBtn" CssClass="CircleBtn" runat="server" OnClick="GridMemoryBtn_Click" Text="M"
                                OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                         <td>
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowPaging="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="520px" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView DataKeyNames="Id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" PageSizes="50" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="CheckBoxIcon" AllowFiltering="false" Reorderable="false">
                                <HeaderTemplate>
                                    <input id="CnkSelectAll" name="CnkSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="ChkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Icon" AllowFiltering="false" Reorderable="false">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="EditImgBtn" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Change Request"
                                        OnClick="EditImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn UniqueName="AcCode" HeaderText="Customer" DataField="AcCode" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EntCode" HeaderText="Entity" DataField="EntCode" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ChangeRequestNo" HeaderText="ChangeRequestNo" DataField="ChangeRequestNo" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="RequestDate" HeaderText="ChangeRequestDate" DataField="RequestDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="BranchCode" HeaderText="BranchCode" DataField="BranchCode" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="DepartmentCode" HeaderText="Department" DataField="DepartmentCode" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PersonnelName" HeaderText="Staff" DataField="PersonnelName" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ProjectName" HeaderText="ProjectName" DataField="ProjectName" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="TotalMandays" HeaderText="TotalMandays" DataField="TotalMandays" AllowFiltering="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="DiscountMandays" HeaderText="DiscountMandays" DataField="DiscountMandays" AllowFiltering="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PIC" HeaderText="Requestor" DataField="PIC" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="RequestorName" HeaderText="RequestorName" DataField="RequestorName" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Type" HeaderText="Type" DataField="Type" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Billable" HeaderText="IsBillable" DataField="Billable" AllowFiltering="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ReferenceNo" HeaderText="ReferenceNo" DataField="ReferenceNo" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="SalesQuotationNo" HeaderText="SalesQuotationNo" DataField="SalesQuotationNo" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ApprovedBy" HeaderText="ApprovedBy" DataField="ApprovedBy" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ApprovedDate" HeaderText="ApprovedDate" DataField="ApprovedDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="RequestDeliveryDate" HeaderText="ChangeRequestDeliveryDate" DataField="RequestDeliveryDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PlannedStartDate" HeaderText="PlannedStartDate" DataField="PlannedStartDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PlannedUATDate" HeaderText="PlannedUATDate" DataField="PlannedUATDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PlannedEndDate" HeaderText="PlannedEndDate" DataField="PlannedEndDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="PlannedGoLiveDate" HeaderText="PlannedGoLiveDate" DataField="PlannedGoLiveDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ChangeRequestStatusDescr" HeaderText="ChangeRequestStatus" DataField="ChangeRequestStatusDescr" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AddDate" HeaderText="AddDate" DataField="AddDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AddUser" HeaderText="AddUser" DataField="AddUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EditDate" HeaderText="EditDate" DataField="EditDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy hh:mm:ss}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EditUser" HeaderText="EditUser" DataField="EditUser" AutoPostBackOnFilter="true"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="ChangeRequestStatusColourCode" DataField="ChangeRequestStatusColourCode" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="AcId" DataField="AcId" Display="false"></telerik:GridBoundColumn>
                             <telerik:GridBoundColumn UniqueName="ChangeRequestStatus" DataField="ChangeRequestStatus" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
