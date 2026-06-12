<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TranshipmentRegisterForm.aspx.cs" Inherits="iWMS.Web.Job.TranshipmentRegister.TranshipmentRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TranshipmentRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function ShowHideBtn_Click() {
                var Grid = $find("<%= ResultDG.ClientID %>");
                var MasterTable = Grid.get_masterTableView();

                for (var i = 0; i < MasterTable.get_dataItems().length; i++) {
                    var row = MasterTable.get_dataItems()[i];
                    if (row.get_expanded() == false) {
                        row.set_expanded(true);
                    }
                    else
                        row.set_expanded(false);
                }
            }
            function OnRowDragStarted(sender, eventArgs) {
                var tableView = eventArgs.get_tableView();
                if (eventArgs.get_tableView().get_name() != "ChildGrid") {
                    eventArgs.set_cancel(true)
                }
            }

            function CheckCtnrNoDigit(sender, eventArgs, index) {
                var grid = $find("<%=ResultDG1.ClientID %>");
                var MasterTable = grid.get_masterTableView();
                var dataItems = MasterTable.get_dataItems();
                var ctnrno = dataItems[index].findControl("ContainerNoTxt").get_textBoxValue();

                if (ctnrno != "") {
                    var returnstr = ContainerNoCheckDigit(ctnrno);
                    if (returnstr != "Valid") {
                        alert(returnstr + " - [ " + ctnrno + " ]");
                        dataItems[index].findControl("ContainerNoTxt").focus();
                    }
                }
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
            masterTable.rebind();
        }
        </script>
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
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <%-- *** to check in code side for Tab SelectedIndex if we will add more Tabs *** --%>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Party" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="ContainerTab" Text="Container" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab ID="TripTab" Text="Trip" Value="750" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Charge" Value="600" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Payable" Value="650" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="P&L" Value="700" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="400" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

                                    <iWMS:iForm ID="formCtlBKO" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td valign="top" align="center">
                            <asp:PlaceHolder ID="JbId_QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
                <br />
                <table width="100%">
                    <tr>
                        <td>&nbsp;
                            <asp:Button ID="UpdatePartyBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <iWMS:iForm ID="formCtl_Party" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView">
                <br />
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true" OnTabClick="RadTabStrip2_TabClick"
                    CausesValidation="false" SelectedIndex="0" Skin="Office2007" RenderMode="Lightweight">
                    <Tabs>
                        <telerik:RadTab Id="GeneralTab" Text="General" Value="10" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="CargoTab" Text="Cargo" Value="20" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="LogDetlTab" Text="Log" Value="30" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="700px" ID="GeneralRadPageView">
                        <br />
                        <asp:Panel ID="NewBtnPanel" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="NewCont" CausesValidation="false"
                                            OnClick="NewCont_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <%--<asp:Button ID="NewTripBtn" runat="server" CssClass="white" Text="NewTrip" CausesValidation="false"
                                        OnClick="NewTripBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="DischargeBtn" runat="server" CssClass="white" Text="Discharge" CausesValidation="false"
                                        OnClick="DischargeBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="ESNBtn" runat="server" CssClass="white" Text="ESN" CausesValidation="false"
                                        OnClick="ESNBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="PregateBtn" runat="server" CssClass="white" Text="Pregate" CausesValidation="false"
                                        OnClick="PregateBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                        <asp:Button ID="ShowHideBtn" runat="server" CssClass="white" Text="Show/Hide"
                                        OnClick="ShowHideBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="DelContBtn" runat="server" CssClass="white" Text="DelCont" OnClientClick="disableBtn(this.id)"
                                            OnClick="DelContBtn_Click" UseSubmitBehavior="false" />
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="MassChangeBtn" runat="server" CssClass="white" Text="Change" OnClick="MassChangeBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" />
                                        &nbsp;
                                    </td>
                                    <td>
                                       <asp:Button ID="OpenCtnrBtn" runat="server" CssClass="white" Text="Open" CausesValidation="false"
                                            OnClick="OpenCtnrBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="DetlPanel" runat="server">
                            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                        <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                            OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                            <br />
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td valign="top">
                                                <br />
                                                <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                                                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Width="100%"
                                                    AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG1_NeedDataSource">
                                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                        <Selecting AllowRowSelect="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="CtnrNoGrid" Width="100%">
                                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="ConatinerNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="ContainerNoTxt" runat="server" Width="100" Skin="WebBlue"
                                                                        ClientEvents-OnValueChanged='<%# "function (s,a){CheckCtnrNoDigit(s,a," + Container.ItemIndex + ");}" %>'>
                                                                    </telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="SealNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="SealNoTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="LoadVessel" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <telerik:RadTextBox ID="LoadVesselTxt" runat="server" Width="140px" Skin="WebBlue"></telerik:RadTextBox>
                                                                            </td>
                                                                            <td width="3px">
                                                                                <asp:RequiredFieldValidator ID="LoadVesselReqVal" runat="server" Width="3px" ControlToValidate="LoadVesselTxt" ErrorMessage="*" ForeColor="Red" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="LoadVoyage" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <telerik:RadTextBox ID="LoadVoyageTxt" runat="server" Width="140px" Skin="WebBlue"></telerik:RadTextBox>
                                                                            </td>
                                                                            <td width="3px">
                                                                                <asp:RequiredFieldValidator ID="LoadVoyageTxtReqVal" runat="server" Width="3px" ControlToValidate="LoadVoyageTxt" ErrorMessage="*" ForeColor="Red" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="ETA" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <telerik:RadDateTimePicker ID="ETADatePicker" Width="160px" runat="server"
                                                                                    DateInput-DateFormat="dd/MMM/yyyy HH:mm" Skin="Sunset" PopupDirection="TopRight">
                                                                                </telerik:RadDateTimePicker>
                                                                            </td>
                                                                            <td width="3px">
                                                                                <asp:RequiredFieldValidator ID="ETADatePickerReqVal" runat="server" Width="3px" ControlToValidate="ETADatePicker" ErrorMessage="*" ForeColor="Red" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="BerthNo" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="BerthNoTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="DischargeCell" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="DischargeCellTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="LoadingCell" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="LoadingCellTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="VGM(KG)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="VGMTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="O/H" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="OHTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="O/W-(L)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="OWLTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="O/W-(R)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="OWRTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="O/L-(F)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="OLFTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn HeaderText="O/L-(R)" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                                                <ItemTemplate>
                                                                    <telerik:RadTextBox ID="OLRTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                <ItemStyle Wrap="False"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="AddCtnr" ValidationGroup="NA"
                                                                        ImageUrl="../../image/add.png" Width="15" Height="15" AlternateText="Edit" CausesValidation="true" UseSubmitBehavior="false"
                                                                        OnClick="AddCtnr_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Panel ID="NewTripPanel" runat="server">
                            <asp:Button ID="AddNewTripBtn" runat="server" CssClass="white" Text="Add"
                                OnClick="AddNewTripBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CancelNewTrip" runat="server" CssClass="white" Text="Cancel"
                                OnClick="CancelNewTripBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <br />
                        <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                                    AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                                    OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
                                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel"
                                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <HeaderStyle Wrap="false" />
                                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCId" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center"
                                        EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="100px">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                    &nbsp; &nbsp; 
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                                        Width="15" Height="15" AlternateText="Update" CommandName="ParentUpdate" BackColor="Transparent"
                                                        BorderWidth="0"></asp:ImageButton>
                                                    &nbsp; &nbsp; 
                                        <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="ParentCancel" BackColor="Transparent"
                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="JobType" ItemStyle-HorizontalAlign="Center" HeaderText="JobType" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("jobtype")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="JobTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# JobTypeDS%>' Skin="WebBlue" Width="140px" Enabled="false"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(JobTypeDS,DataBinder.Eval(Container.DataItem, "jobtype").ToString())%>'
                                                        DropDownWidth="140px">
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="TransportType" ItemStyle-HorizontalAlign="Center" HeaderText="TransportType" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("tpttype")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="TransportTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# TransportTypeDS%>' Skin="Sunset" Width="140px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TransportTypeDS,DataBinder.Eval(Container.DataItem, "tpttype").ToString())%>'
                                                        DropDownWidth="140px">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="TransportTypeReqVal" runat="server" ControlToValidate="TransportTypeDDL" ErrorMessage="*" ForeColor="Red" />
                                                    <br></br>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="BillSizeType" HeaderText="BillSizeType" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("billsizetype")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="Sunset" Width="140px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                                        DropDownWidth="140px">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="BillSizeTypeReqVal" runat="server" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="BillOption1" HeaderText="BillOption1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("billoption1")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="WebBlue" Width="140px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'
                                                        DropDownWidth="140px">
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ContainerNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ctnrno")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="StartDate" ItemStyle-HorizontalAlign="Center" HeaderText="StartDate" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# DataBinder.Eval(Container.DataItem, "expdate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="StartDateTimePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "expdate")%>' DateInput-Display="true" Skin="Sunset">
                                                    </telerik:RadDateTimePicker>
                                                    <asp:RequiredFieldValidator ID="StartDateTimePickerReqVal" runat="server" Width="3px" ControlToValidate="StartDateTimePicker" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="EndDate" ItemStyle-HorizontalAlign="Center" HeaderText="EndDate" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# DataBinder.Eval(Container.DataItem, "enddate", "{0:dd/MMM/yyyy HH:mm}")%>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="EndDateTimePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "enddate")%>' DateInput-Display="true" Skin="Sunset">
                                                    </telerik:RadDateTimePicker>
                                                    <asp:RequiredFieldValidator ID="EndDateTimePickerReqVal" runat="server" Width="3px" ControlToValidate="EndDateTimePicker" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="StatusDescr" ItemStyle-HorizontalAlign="Center" HeaderText="Status" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("StatusDescr")) %>
                                                    <br />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="SealNo" ItemStyle-HorizontalAlign="Center" HeaderText="SealNo" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ctnrsealno")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="SealNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrsealno") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                             <telerik:GridTemplateColumn UniqueName="LoadVessel" ItemStyle-HorizontalAlign="Center" HeaderText="LoadVessel" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ConnVessel")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ConnVesselTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ConnVessel") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="ConnVesselReqVal" runat="server" Width="3px" ControlToValidate="ConnVesselTxt" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                             <telerik:GridTemplateColumn UniqueName="LoadVoyage" ItemStyle-HorizontalAlign="Center" HeaderText="LoadVoyage" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ConnVoyage")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ConnVoyageTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ConnVoyage") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="ConnVoyageReqVal" runat="server" Width="3px" ControlToValidate="ConnVoyageTxt" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                             <telerik:GridTemplateColumn UniqueName="ETA" ItemStyle-HorizontalAlign="Center" HeaderText="ETA" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# DataBinder.Eval(Container.DataItem, "ConnETA", "{0:dd/MMM/yyyy HH:mm}")%>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="ETADateTimePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "ConnETA")%>' DateInput-Display="true" Skin="Sunset">
                                                    </telerik:RadDateTimePicker>
                                                    <asp:RequiredFieldValidator ID="ETADateTimePickerReqVal" runat="server" Width="3px" ControlToValidate="ETADateTimePicker" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="BerthNo" ItemStyle-HorizontalAlign="Center" HeaderText="BerthNo" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("BerthNo")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="BerthNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BerthNo") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="DischargeCell" ItemStyle-HorizontalAlign="Center" HeaderText="DischargeCell" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("DischargeCell")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="DischargeCellTxt" Text='<%# DataBinder.Eval(Container.DataItem, "DischargeCell") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="LoadingCell" ItemStyle-HorizontalAlign="Center" HeaderText="LoadingCell" ItemStyle-Width="15%">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("LoadingCell")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="LoadingCellTxt" Text='<%# DataBinder.Eval(Container.DataItem, "LoadingCell") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="110px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="VerifiedGrossMass" HeaderText="VerifiedGrossMass(VGM)" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("VerifiedGrossMass")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="VerifiedGrossMassTxt" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedGrossMass") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                    <asp:CompareValidator ID="VerifiedGrossMassCompVal" runat="server" ControlToValidate="VerifiedGrossMassTxt" EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="OverHT" HeaderText="O/H" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("OverHT")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="OverHTTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OverHT") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="OverWidthLeft" HeaderText="O/W-(L)" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("OverWidthLeft")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="OverWidthLeftTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OverWidthLeft") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="OverWidthRight" HeaderText="O/W-(R)" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("OverWidthRight")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="OverWidthRightTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OverWidthRight") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="OverLengthFront" HeaderText="O/L-(F)" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("OverLengthFront")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="OverLengthFrontTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OverLengthFront") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="OverLengthRear" HeaderText="O/L-(R)" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("OverLengthRear")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="OverLengthRearTxt" Text='<%# DataBinder.Eval(Container.DataItem, "OverLengthRear") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="100px">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn UniqueName="Blank" HeaderText="" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="jbcid" UniqueName="jbcid" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="False">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <DetailTables>
                                            <telerik:GridTableView DataKeyNames="JBTripId" Name="ChildGrid" SkinID="Telerik" Width="100%"
                                                HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace" RetainExpandStateOnRebind="true"
                                                InsertItemDisplay="Bottom" AllowAutomaticInserts="true">
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle Wrap="true" />
                                                <AlternatingItemStyle Wrap="true" />
                                                <Columns>
                                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="90px">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                                            &nbsp; &nbsp; 
                                                             <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                                 Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                                 BorderWidth="0"></asp:ImageButton>
                                                            &nbsp; &nbsp; 
                                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DeleteTrip"
                                                                ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                                CommandName="DeleteTrip" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:ImageButton runat="server" Visible="True" ID="DetailUpdate" ImageUrl="../../image/floppy.gif"
                                                                Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                                BorderWidth="0"></asp:ImageButton>
                                                            &nbsp; &nbsp; 
                                                            <asp:ImageButton runat="server" Visible="True" ID="DetailCancel" ImageUrl="../../image/arrow6.gif"
                                                                Width="15" Height="15" AlternateText="Cancel" CommandName="DetailCancel" BackColor="Transparent"
                                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="60px">
                                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                                        <HeaderTemplate>
                                                            TripNo
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%#Container.ItemIndex+1%>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn HeaderText="Start" UniqueName="Start" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
                                                            &nbsp;&nbsp;
                                                            <%# string.Format("{0:}",Eval("TripFrDOW")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDatePicker ID="StartDatePicker" Width="115px" runat="server"
                                                                SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripFrDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripFrDate") : DateTime.Now %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                                <Calendar>
                                                                    <SpecialDays>
                                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                    </SpecialDays>
                                                                </Calendar>
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="StartDatePickerReqVal" runat="server" ControlToValidate="StartDatePicker" ErrorMessage="*" ForeColor="Red" />
                                                            <asp:Label runat="server" ID="TripFrDOWLbl" Width="1px" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrDOW")%>' />
                                                            <br />
                                                            <br />
                                                            <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="70px"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                                DropDownWidth="70px">
                                                            </telerik:RadDropDownList>
                                                            <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server" ControlToValidate="TripFrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="End" UniqueName="End" HeaderStyle-Width="145px" ItemStyle-Width="145px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripToDate")) %>
                                                            &nbsp;&nbsp;
                                                            <%# string.Format("{0:}",Eval("TripToDOW")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("TripToTime")) %>
                                                            <br />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDatePicker ID="EndDatePicker" Width="115px" runat="server"
                                                                SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripToDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripToDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripToDate") : DateTime.Now %>'
                                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                                <Calendar>
                                                                    <SpecialDays>
                                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                                    </SpecialDays>
                                                                </Calendar>
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="EndDatePickerReqVal" runat="server" ControlToValidate="EndDatePicker" ErrorMessage="*" ForeColor="Red" />
                                                            <asp:Label runat="server" ID="TripToDOWLbl" Width="1px" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToDOW")%>' />
                                                            <br />
                                                            <br />
                                                            <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="70px"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripToTime").ToString())%>'
                                                                DropDownWidth="70px">
                                                            </telerik:RadDropDownList>
                                                            <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server" ControlToValidate="TripToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TripType" HeaderText="TripType <br/> TripOption" ItemStyle-Wrap="true" ItemStyle-Width="110px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("Type")) %>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("Sector")) %>
                                                            <br />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="TripTypeList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# TripTypeDS%>' Skin="Sunset" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TripType"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeDS,DataBinder.Eval(Container.DataItem, "Type").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                            <asp:RequiredFieldValidator ID="TripTypeListReqVal" runat="server" ControlToValidate="TripTypeList" ErrorMessage="*" ForeColor="Red" />
                                                            <br />
                                                            <telerik:RadComboBox ID="TripOptionList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# TripOptionDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TripOption"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionDS,DataBinder.Eval(Container.DataItem, "Sector").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br> Driver <br/> Trailer" ItemStyle-Wrap="true" ItemStyle-Width="110px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("VehNo")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("Code")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("TrailerNo")) %>
                                                            <br />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# vehListDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                                                OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true" EmptyMessage="Vehicle">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <br />
                                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# driverListDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="Driver"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <br />
                                                            <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# TrailerNoDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TrailerNo"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerNoDS,DataBinder.Eval(Container.DataItem, "TrailerNo").ToString())%>'>
                                                            </telerik:RadComboBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="Trip" HeaderText="Double <br/> Status" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>
                                                            <br></br>
                                                            <br></br>
                                                            <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>
                                                            <br></br>
                                                            <br></br>
                                                            <telerik:RadLabel runat="server" ID="StatusTxt" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr") %>'
                                                                TextMode="SingleLine" Width="140px" Enabled="false">
                                                            </telerik:RadLabel>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" ItemStyle-Wrap="true" ItemStyle-Width="170px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("FrServicePtDescr")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("fraddr")) %>
                                                            <br />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <br />
                                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                                                TextMode="MultiLine" Enabled="true">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" ItemStyle-Wrap="true" ItemStyle-Width="170px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("ToServicePtDescr")) %>
                                                            <br />
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("toaddr")) %>
                                                            <br />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="140px"
                                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                                            </telerik:RadComboBox>
                                                            <br />
                                                            <br />
                                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                                                TextMode="MultiLine" Enabled="true">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" ItemStyle-Width="120px">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr") %>'
                                                                TextMode="MultiLine" Enabled="true" Width="140px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction">
                                                        <ItemTemplate>
                                                            <br />
                                                            <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                                TextMode="MultiLine" Enabled="true" Width="140px">
                                                            </telerik:RadTextBox>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                                    <telerik:GridBoundColumn DataField="type" UniqueName="type" Display="False" />
                                                    <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" Display="False" />
                                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                                </Columns>
                                            </telerik:GridTableView>
                                        </DetailTables>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="700px" ID="CargoRadPageView">
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" Height="700px" ID="LogDetlRadPageView">
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TripRadPageView">
                <asp:Panel ID="TripNewBtnPanel" runat="server">
                    <br />
                    <asp:Button ID="TripOpenBtn" runat="server" CssClass="white" OnClick="TripOpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripCancelBtn" runat="server" CssClass="white" OnClick="TripCancelBtn_Click"
                            Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripAssignedBtn" runat="server" CssClass="white" OnClick="TripAssignBtn_Click"
                            Text="Assign" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripCompletedBtn" runat="server" CssClass="white" OnClick="TripCompletedBtn_Click"
                            Text="Complete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripPODBtn" runat="server" CssClass="white" OnClick="TripPODBtn_Click"
                            Text="POD" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                        <asp:Button ID="TripDelTripBtn" runat="server" CssClass="white" Text="Delete" OnClientClick="disableBtn(this.id)"
                            OnClick="TripDelTripBtn_Click" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="TripDOBtn" CssClass="Blue" runat="server" OnClick="TripDOBtn_Click"
                            Text="DO" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                </asp:Panel>
                <br />

                <asp:UpdatePanel ID="OuterUpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="TripResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight"
                            AllowMultiRowSelection="true" OnNeedDataSource="TripResultDG_NeedDataSource"
                            OnItemDataBound="TripResultDG_ItemDataBound" OnItemCommand="TripResultDG_ItemCommand"
                            OnUpdateCommand="TripResultDG_Update" OnEditCommand="TripResultDG_Edit" OnCancelCommand="TripResultDG_Cancel"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="true" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" PageSize="50" HeaderStyle-HorizontalAlign="Center"
                                EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="7%" ItemStyle-Width="7%">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            &nbsp; &nbsp; 
                                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>&nbsp;
                                               <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DeleteTrip"
                                                   ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                   CommandName="DeleteTrip" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                        <%--<EditItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ID="DetailUpdate" ImageUrl="../../image/floppy.gif"
                                                        Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                        BorderWidth="0"></asp:ImageButton>
                                                    &nbsp; &nbsp; 
                                                            <asp:ImageButton runat="server" Visible="True" ID="DetailCancel" ImageUrl="../../image/arrow6.gif"
                                                                Width="15" Height="15" AlternateText="Cancel" CommandName="DetailCancel" BackColor="Transparent"
                                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                </EditItemTemplate>--%>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ContainerNo" ItemStyle-HorizontalAlign="Center" HeaderText="ContainerNo <br/> SealNo" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ContainerNo")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("SealNo")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ContainerNo")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("SealNo")) %>
                                            <br />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="JBCTNRId" UniqueName="JBCTNRId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDateTime" HeaderText="Planned Date Time" ItemStyle-HorizontalAlign="Center" AllowFiltering="false"
                                        SortExpression="TripDateTime" AllowSorting="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("TripDateTime")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripFrDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripFrDate") : DateTime.Now %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <br />
                                            <asp:Label runat="server" ID="TripFrDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrDOW")%>' />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            <asp:Label runat="server" ID="TripToDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToDOW")%>' />
                                            <br />
                                            <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripFrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                            <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripToTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                   
                                    <telerik:GridTemplateColumn UniqueName="TptType" HeaderText="TripType <br/> TripOption" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("Type")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripOption")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TripTypeList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# TripTypeDS%>' Skin="Sunset" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TripType"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeDS,DataBinder.Eval(Container.DataItem, "Type").ToString())%>'>
                                            </telerik:RadComboBox>
                                            <asp:RequiredFieldValidator ID="TripTypeListReqVal" runat="server" ControlToValidate="TripTypeList" ErrorMessage="*" ForeColor="Red" />
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="TripOptionList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# TripOptionDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TripOption"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionDS,DataBinder.Eval(Container.DataItem, "TripOption").ToString())%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br> Driver <br/> Trailer" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("VehNo")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("Code")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TrailerNo")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# vehListDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                                OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true" EmptyMessage="Vehicle">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# driverListDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="Driver"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="TrailerNoList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# TrailerNoDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" EmptyMessage="TrailerNo"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerNoDS,DataBinder.Eval(Container.DataItem, "TrailerNo").ToString())%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Trip" HeaderText="Double <br/> Status" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>
                                            <br></br>
                                            <br></br>
                                            <%# DataBinder.Eval(Container.DataItem, "StatusDescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "DoubleMountCode")%>
                                            <br></br>
                                            <br></br>
                                            <telerik:RadLabel runat="server" ID="StatusTxt" Text='<%# DataBinder.Eval(Container.DataItem, "statusdescr") %>'
                                                TextMode="SingleLine" Width="140px" Enabled="false">
                                            </telerik:RadLabel>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp" HeaderStyle-Width="140px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrServicePtDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("fraddr")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "fraddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff" HeaderStyle-Width="140px" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToServicePtDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("toaddr")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="140px"
                                                DropDownWidth="140px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "toaddr") %>'
                                                TextMode="MultiLine" Enabled="true" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr") %>'
                                                TextMode="MultiLine" Enabled="true" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripSpecialInstruction" HeaderText="SpecialInstruction">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                TextMode="MultiLine" Enabled="true" Width="140px">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="trailerno" UniqueName="trailerno" Display="False" />
                                    <telerik:GridBoundColumn DataField="sector" UniqueName="sector" Display="False" />
                                    <telerik:GridBoundColumn DataField="type" UniqueName="type" Display="False" />
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <iWMS:MsgPopup ID="MsgP1" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="70%" ID="ChargeRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="PayableRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="PAndLRadPadeView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
