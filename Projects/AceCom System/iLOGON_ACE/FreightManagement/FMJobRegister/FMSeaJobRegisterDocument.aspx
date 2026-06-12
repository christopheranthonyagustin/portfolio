<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaJobRegisterDocument.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMJobRegister.FMSeaJobRegisterDocument" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaJobRegisterDocument</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Billl Of Lading" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" Width="100%">
                        <telerik:RadPageView runat="server" ID="BOLRadPageView">
                            <asp:Panel ID="Panel1" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <telerik:RadMenu ID="RadMenu_New" runat="server" ShowToggleHandle="false" ClickToOpen="true" CssClass="mainMenu" Width="83px"
                                                OnItemClick="RadMenuNew_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                <Items>
                                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;New" PostBack="false" Value="New" CssClass="WrappingItem" Font-Bold="true">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="HBL" Text="HBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="MasterBL" Text="MasterBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="SwitchHBL" Text="SwitchHBL"
                                                                Visible="true" BackColor="White" />
                                                        </Items>
                                                    </telerik:RadMenuItem>
                                                </Items>
                                            </telerik:RadMenu>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <br />
                                            <telerik:RadMenu ID="RadMenu_Print" runat="server" ShowToggleHandle="false" ClickToOpen="true" CssClass="mainMenu" Width="90px"
                                                OnItemClick="RadMenu_Print_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                <Items>
                                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;Print" PostBack="false" CssClass="WrappingItem" BackColor="#b0e0e6" Font-Bold="true">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DraftBL" Text="DraftBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExcelBL" Text="ExcelBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="FFWCertofReceipt" Text="FFW Cert of Receipt"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PrintBL" Text="PrintBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="EAWB" Text="E-AWB"
                                                                BackColor="White" />
                                                        </Items>
                                                    </telerik:RadMenuItem>
                                                </Items>
                                            </telerik:RadMenu>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <br />
                                            <telerik:RadMenu ID="EmailRadMenu_Print" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                                Width="90px" OnItemClick="EmailRadMenu_Print_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                <Items>
                                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;Email" PostBack="false" BackColor="#88fd64"
                                                        Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DraftBL" Text="DraftBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="ExcelBL" Text="ExcelBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="FFWCertofReceipt" Text="FFW Cert of Receipt"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PrintBL" Text="PrintBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="EAWB" Text="E-AWB"
                                                                BackColor="White" />
                                                        </Items>
                                                    </telerik:RadMenuItem>
                                                </Items>
                                            </telerik:RadMenu>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <br />
                                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel" CausesValidation="false"
                                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                        <td>
                                            <br />
                                            <asp:Button ID="UnlockBtn" runat="server" CssClass="white" Text="Unlock" CausesValidation="false"
                                                OnClick="UnlockBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                        <td>
                                            <br />
                                            <asp:Button ID="PrintAttcBtn" runat="server" CssClass="LongLabelBlue" Text="Attach Print" CausesValidation="false"
                                                Visible="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                        <td>
                                            <br />
                                            <telerik:RadMenu ID="PrintAttcRadMenuBtn" runat="server" ExpandAnimation-Type="None" ClickToOpen="true" CssClass="mainMenu"
                                                Width="150px" OnItemClick="PrintAttcRadMenu_Print_ItemClick" OnClientItemClicked="RadMenuClientOnClick">
                                                <Items>
                                                    <telerik:RadMenuItem runat="server" Text="&nbsp;&nbsp;Attc Document" PostBack="false" BackColor="#b0e0e6"
                                                        Value="Print" CssClass="WrappingItem" Font-Bold="true">
                                                        <Items>
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="DraftBL" Text="DraftBL"
                                                                Visible="true" BackColor="White" />
                                                            <telerik:RadMenuItem runat="server" ExpandAnimation-Type="None" Value="PrintBL" Text="PrintBL"
                                                                Visible="true" BackColor="White" />
                                                        </Items>
                                                    </telerik:RadMenuItem>
                                                </Items>
                                            </telerik:RadMenu>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    OnNeedDataSource="ResultDG1_NeedDataSource" AllowPaging="true" AllowSorting="true"
                                    AllowFilteringByColumn="true" Skin="Metro" Height="600px">
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true"></Selecting>
                                        <Scrolling AllowScroll="True"></Scrolling>
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                    <ItemStyle Wrap="true"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="200" HierarchyLoadMode="Client">
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    &nbsp;
                                                <asp:ImageButton runat="server" ID="CopyIconBtn" ImageUrl="../../image/copy.png" ToolTip="Copy Line"
                                                    Width="15" Height="15" AlternateText="Copy" BackColor="Transparent" OnClick="CopyIconBtn_Click"
                                                    BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn HeaderText="MasterBLNo" DataField="mblno" AllowFiltering="true"
                                                ColumnGroupName="mblno" SortExpression="mblno" UniqueName="mblno"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="BLNo" DataField="blno" AllowFiltering="true"
                                                ColumnGroupName="blno" SortExpression="blno" UniqueName="blno"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="SONo" DataField="sono" Display="false">
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn HeaderText="SurrenderBL" DataField="surrenderbl" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="PrintFlag" DataField="printflag" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpackages" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="BLType" DataField="bltype" AllowFiltering="true"
                                                ColumnGroupName="bltype" SortExpression="bltype" UniqueName="bltype"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="PrintedBLType" DataField="PrintedBLType" AllowFiltering="false"
                                                ColumnGroupName="PrintedBLType" SortExpression="PrintedBLType" UniqueName="PrintedBLType"
                                                Reorderable="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="jbId" DataField="jbid" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Shipper" DataField="ShipperName" AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Importer" DataField="ConsigneeName" AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="DeliveryAgent" DataField="deliveryagentname" AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="NetWt" DataField="netwt" AllowFiltering="false"
                                                Reorderable="true" DataFormatString="{0:#,0.00}">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="GrossWt" DataField="GrossWt" AllowFiltering="false"
                                                Reorderable="true" DataFormatString="{0:#,0.00}">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Measurement" DataField="Measurement" AllowFiltering="false"
                                                Reorderable="true" DataFormatString="{0:#,0.00}">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="AddDate <br/> AddUser" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("adddate"), Eval("adduser")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="AddDate" HeaderText="EditDate <br/> EditUser" AllowFiltering="false">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss} <br/> {1}", Eval("editdate"), Eval("edituser")) %>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="NoOfOriginalBL" UniqueName="NoOfOriginalBL" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="NoOfCopyBL" UniqueName="NoOfCopyBL" Display="false">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Button ID="NextBtn" runat="server" CssClass="white" Text="Next"
                                                OnClick="NextBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                <asp:Button ID="BackBtn" runat="server" CssClass="white" Text="Back"
                                    OnClick="BackBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG2_NeedDataSource">
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Width="100%">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Number" UniqueName="Number" SortExpression="Number" ShowFilterIcon="false" AllowFiltering="false"
                                                HeaderText="ContainerNo">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrpacks" UniqueName="ctnrpacks" SortExpression="ctnrpacks" ShowFilterIcon="false" AllowFiltering="false"
                                                HeaderText="NoOfPacks">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrWT" UniqueName="ctnrWT" SortExpression="ctnrWT" ShowFilterIcon="false" AllowFiltering="false"
                                                HeaderText="NetWt">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrGrossWT" UniqueName="GrossWT" SortExpression="GrossWT" ShowFilterIcon="false" AllowFiltering="false"
                                                HeaderText="GrossWt">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrvol" UniqueName="ctnrvol" SortExpression="ctnrvol" ShowFilterIcon="false" AllowFiltering="false"
                                                HeaderText="Measurement">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrGrossWT" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrWT" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrvol" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ctnrpacks" Display="false"></telerik:GridBoundColumn>

                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Button ID="ADDBtn" runat="server" CssClass="white" Text=""
                                                OnClick="ADDBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />

                                            <asp:Button ID="CancelAddBtn" runat="server" CssClass="white" Text="Cancel" CausesValidation="false"
                                                OnClick="CancelAddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <asp:UpdatePanel runat="server" ID="RadGridBLCtnr_UpdatePanel">
                                    <ContentTemplate>
                                        <table width="80%">
                                            <br />
                                            <tr>
                                                <td valign="top">
                                                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                                    <br />
                                                    <telerik:RadGrid ID="RadGridBLCtnr" runat="server" AutoGenerateColumns="false" RenderMode="Lightweight"
                                                        EnableLinqExpressions="False" AllowPaging="True" Skin="Metro" OnNeedDataSource="RadGridBLCtnr_NeedDataSource" AllowAutomaticDeletes="true"
                                                        OnBatchEditCommand="ResultDG_BatchEditCommand">
                                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                            <Selecting AllowRowSelect="true" />
                                                        </ClientSettings>
                                                        <SortingSettings EnableSkinSortStyles="false" />
                                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                                        <MasterTableView AllowMultiColumnSorting="true" Name="RadGridBLCtnrGrid" PageSize="50" DataKeyNames="Id"
                                                            EditMode="Batch" CommandItemDisplay="TopAndBottom" TableLayout="Auto">
                                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                            <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                                                            <CommandItemSettings ShowAddNewRecordButton="true" />
                                                            <Columns>
                                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px" HeaderStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton runat="server" Visible="True" ID="ChargeDelete" ImageUrl="../../image/Deleted.png"
                                                                            Width="15" Height="15" AlternateText="Update" OnClick="ChargeDelete_Click" BackColor="Transparent"
                                                                            BorderWidth="0"></asp:ImageButton>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="Number" ItemStyle-HorizontalAlign="Center" HeaderText="Container" HeaderStyle-Width="200px" ItemStyle-Width="200px">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="ContainerLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Number")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadDropDownList ID="ContainerDDL" runat="server" Skin="WebBlue" Width="140px" DropDownWidth="140px"
                                                                            OnLoad="ContainerDDL_Load" DataTextField="Descr" DataValueField="Item">
                                                                        </telerik:RadDropDownList>
                                                                        <asp:RequiredFieldValidator runat="server" ID="ContainerDDLRFV" ControlToValidate="ContainerDDL"
                                                                            ErrorMessage="#" ForeColor="Red">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn UniqueName="SealNo1" ItemStyle-HorizontalAlign="Center" HeaderText="Seal">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="SealNo1Lbl" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo1")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="SealTxt" Width="140px"></telerik:RadTextBox>
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="vol" ItemStyle-HorizontalAlign="Center" HeaderText="Vol">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="VolLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Vol")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="volTxt" Width="140px"></telerik:RadTextBox>
                                                                        <asp:CompareValidator ID="volTxtCompVal" runat="server" ControlToValidate="volTxt"
                                                                            EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="GrossWT" ItemStyle-HorizontalAlign="Center" HeaderText="GrossWT">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="GrossWTLbl" Text='<%# DataBinder.Eval(Container.DataItem, "GrossWT")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="GrossWTTxt" Width="140px"></telerik:RadTextBox>
                                                                        <asp:CompareValidator ID="GrossWTTxtCompVal" runat="server" ControlToValidate="GrossWTTxt"
                                                                            EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="Packs" ItemStyle-HorizontalAlign="Center" HeaderText="Packs">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="PacksLbl" Text='<%# DataBinder.Eval(Container.DataItem, "Packs")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="PacksTxt" Width="140px"></telerik:RadTextBox>
                                                                        <asp:CompareValidator ID="PacksTxtCompVal" runat="server" ControlToValidate="PacksTxt"
                                                                            EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                                    </EditItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridBoundColumn DataField="FMJobBLId" Display="false"></telerik:GridBoundColumn>
                                                            </Columns>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </td>
                                                <td rowspan="9" colspan="9" valign="top">
                                                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                                    <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmApproveBtn" Text="" Style="display: none;" OnClick="ConfirmApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
                <td>
                    <asp:Button ID="ConfirmNoneApproveBtn" Text="" Style="display: none;" OnClick="ConfirmNoneApproveBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
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
