<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="UserDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.User.UserDetl" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ProfileDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Windows7" AutoPostBack="true" CausesValidation="false" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main Info" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Account*" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Site*" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Bank" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="CashBookBank" Value="330" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="PerDept" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Team" Value="370" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Personnel" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Entity" Value="500" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Branch" Value="900" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Department" Value="900" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Partner" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Vehicle" Value="800" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SkuType" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="LocCat" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Salesman" Value="950" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="FMSTransportMode" Value="670" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="DirectPrint" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="GridMemory" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Dashboard" Value="750" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="AnalysisFormat" Value="850" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Master" Value="900" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="WMS Storage" Value="1000" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="450" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
            RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView" DefaultButton="UpdateUserBtn">
                <table>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                    <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;
                <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="UpdateUserBtn" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateUserBtn_Click"
                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" />
                &nbsp;
                <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enabled="true" />
                <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                <br />
                <table border="0" cellpadding="2" cellspacing="1" width="100%">
                    <tr>
                        <td align="right">
                            <telerik:RadButton ID="BackButton" Skin="WebBlue" runat="server" CausesValidation="False"
                                CssClass="detailButton" OnClick="BackButton_Click" Text="&lt; Search Results"
                                Visible="false" Width="120px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="AccountRadPageView" DefaultButton="UpdateAccountBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdateAccountBtn" runat="server" Text="Update" OnClick="UpdateAccountBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailAccList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailAccList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedAccList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="SiteRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="BankRadPageView" DefaultButton="UpdateImgBtnForBank">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForBank" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailBankList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedBankList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailBankList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedBankList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="CashBookBankRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="DeptRadPageView" DefaultButton="UpdateImgBtnForDept">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForDept" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailDeptList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDeptList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailDeptList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedDeptList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="TeamRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="PersonnelRadPageView" DefaultButton="UpdateImgBtnForPersonnel">
                &nbsp;
                <br />
                <asp:Button ID="UpdateImgBtnForPersonnel" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td style="width: 700px" valign="top">
                            <telerik:RadListBox runat="server" ID="AvailPerList" Height="120px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPerList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailPerList_Transferred">
                            </telerik:RadListBox>
                            <telerik:RadListBox runat="server" ID="SelectedPerList" Height="120px" Width="200px"
                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                Skin="WebBlue" AllowDelete="false">
                            </telerik:RadListBox>
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="EntityRadPageView" DefaultButton="UpdateImgBtnForEntity">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForEntity" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                &nbsp;
                <asp:Button ID="AssignAccountByEntityBtn" runat="server" Text="AssignAccountByEntity" ToolTip="assign" OnClick="AssignAccountByEntityBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="AssignAccountByEntity" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailEntityList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedEntityList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailEntityList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedEntityList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                                        </td>
                                        <td>
                                            <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="BranchRadPageView" DefaultButton="UpdateImgBtnForBranch">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForBranch" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailBranchList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedBranchList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailBranchList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedBranchList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>


            <telerik:RadPageView runat="server" Height="700px" ID="DepartmentRadPageView" DefaultButton="UpdateImgBtnForBranch">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForDepartment" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailDepartmentList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedDepartmentList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailDepartmentList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedDepartmentList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="PartnerRadPageView" DefaultButton="UpdatePartnerBtn">
                <br />
                &nbsp;
                <asp:Button ID="UpdatePartnerBtn" runat="server" Text="Update" ToolTip="Update" OnClick="UpdatePartnerBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailPartnerList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedPartnerList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailPartnerList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedPartnerList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="VehicleRadPageView" />

            <telerik:RadPageView runat="server" Height="700px" ID="SkuGrpRadPageView" DefaultButton="UpdateImgBtnForSkuType">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForSkuType" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailSkuTypeList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSkuTypeList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailSkuTypeList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedSkuTypeList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="LocCatRadPageView" DefaultButton="UpdateImgBtnForLocCat">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForLocCat" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailLocCatList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailLocCatList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="SalesmanRadPageView">
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true" OnItemCommand="ResultDG_ItemCommand"
                                                        AllowFilteringByColumn="false" Skin="Metro" OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit"
                                                        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                                                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                                            <Selecting AllowRowSelect="True" />
                                                        </ClientSettings>
                                                        <SortingSettings EnableSkinSortStyles="false" />
                                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                                        <ItemStyle Wrap="false"></ItemStyle>
                                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="100%"
                                                            CommandItemDisplay="Top" DataKeyNames="id" EditMode="InPlace">
                                                            <CommandItemSettings ShowRefreshButton="false" />
                                                            <Columns>
                                                                <telerik:GridTemplateColumn UniqueName="icon">
                                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                                            BorderWidth="0"></asp:ImageButton>
                                                                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                                            onserverclick="ResultDG_Delete" runat="server">
                                                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                                                title="Delete" runat="server" /></a>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                                            BorderWidth="0"></asp:ImageButton>
                                                                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                                        <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="Name" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "refvalue")%>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadDropDownList ID="SalesmanDDL" runat="server" DataTextField="descr" DataValueField="item"
                                                                            DataSource='<%# SalesmanDS%>' Skin="Sunset" Width="150px" DropDownWidth="150px"
                                                                            RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(SalesmanDS, DataBinder.Eval(Container.DataItem, "refvalue").ToString())%>'
                                                                            AutoPostBack="true" Enabled="true">
                                                                        </telerik:RadDropDownList>
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="Disallow Manager Approver" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Usrdef01")%>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox ID="SalesmanManagerTxt" runat="server"
                                                                            Text='<%# DataBinder.Eval(Container.DataItem, "Usrdef01") %>' Width="155px">
                                                                        </telerik:RadTextBox>
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="Authorized Salesman Approver" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Usrdef02")%>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox ID="ManagerTxt" runat="server"
                                                                            Text='<%# DataBinder.Eval(Container.DataItem, "Usrdef02") %>' Width="155px">
                                                                        </telerik:RadTextBox>

                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="Status" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Status")%>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="AddDate" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("AddDate")) %>
                                                                        <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="AddUser" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("AddDate")) %>
                                                                        <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="EditDate" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                                                        <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn HeaderText="EditUser" ItemStyle-Wrap="false">
                                                                    <ItemTemplate>
                                                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("EditDate")) %>
                                                                        <%# DataBinder.Eval(Container.DataItem, "EditUser")%>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="FMSTransportModeRadPageView" DefaultButton="UpdateImgBtnForFMSTransportMode">
                <br />
                &nbsp;
                <asp:Button ID="UpdateImgBtnForFMSTransportMode" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailFMSTransportModeList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedFMSTransportModeList"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailFMSTransportModeList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedFMSTransportModeList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="DirectPrintRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="GridMemoryRadPageView" />

            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView" DefaultButton="UpdateBtnForDashboard">
                <br />
                &nbsp;
                <asp:Button ID="UpdateBtnForDashboard" runat="server" Text="Update" ToolTip="Update" OnClick="UpdateBtn_Click"
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" />
                <br />
                <br />
                <table>
                    <tr valign="top">
                        <td>
                            <table border="0">
                                <tbody>

                                    <tr>
                                        <td>Inbound Dashboards</td>
                                        <td>Outbound Dashboards</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 500px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailInboundDashboardList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedInboundDashboard"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailInboundDashboardList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedInboundDashboard" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                        <td style="width: 500px" valign="left">
                                            <telerik:RadListBox runat="server" ID="AvailOutboundDashboardList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedOutboundDashboard"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailOutboundDashboardList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedOutboundDashboard" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Resource Dashboards </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 700px" valign="top">
                                            <telerik:RadListBox runat="server" ID="AvailResourceDashboardList" Height="120px" Width="250px"
                                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedResourceDashboard"
                                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                                OnTransferred="AvailResourceDashboardList_Transferred">
                                            </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedResourceDashboard" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="UserAnalysisFormatRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="MasterRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="WMSStorageRadPageView">
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>

    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmApproveCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmApproveBtn.UniqueID %>", "");
                }
            }
            function ConfirmNoneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmNoneApproveBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>

</body>
</html>
