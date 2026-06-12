<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSTripQueueOrder.aspx.cs" Inherits="iWMS.Web.Job.TMSTripQueue.TMSTripQueueOrder" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Booking @ TMS Trip Queue</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <base target="_self" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
        function callbackFn(arg) //the value indicates how the dialog was closed
        {
            GetRadWindow().close();
        }
    </script>


<%--    </script>--%>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IncentiveTab" Text="Incentive" Value="25" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QRCodeTab" Text="QRCode" Value="50" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="75" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <div style="height: 5px"></div>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="GeneralRadPageView">
                <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
                    width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true" CssClass="white"
                                OnClick="OpenBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            <asp:Button ID="AssignBtn" runat="server" Text="Assign" Visible="true" CssClass="white"
                                OnClick="AssignBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            <asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                                CssClass="white" OnClick="CompletedBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            <asp:Button ID="VoidBtn" runat="server" Text="Void" Visible="true" CssClass="white"
                                OnClick="VoidBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            <asp:Button ID="CancelledBtn" runat="server" Text="Cancelled" Visible="true"
                                CssClass="white" OnClick="CancelledBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                             <asp:Button ID="DetourBtn" runat="server" Text="Detour" CausesValidation="false"
                    CssClass="white" OnClick="DetourBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        </td>
                    </tr>
                    <tr style="height: 5px"></tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="UpdateFeaturePanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" Visible="True" Text="Prev"
                                                OnClick="PrevItemBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update"
                                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                            <asp:Button ID="CancelBtn" CssClass="LongLabelWhite" runat="server" Text="Close Window" CausesValidation="false"
                                                OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink"
                                                OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="ChkPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="SaveOnPanCheckBox" ToolTip="SaveOnPan" runat="server" />
                                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 70px;">
                                            <asp:CheckBox ID="SMSCheckBox" ToolTip="SMS" runat="server" />
                                            <asp:Label ID="SMSchkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SMS" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 35px;">
                                            <asp:CheckBox ID="CrossDayJobChkBox" runat="server" Enabled="false" />
                                            <asp:Label ID="CrossDayJobLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="CrossDayJob" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 85px;">
                                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>

                <table style="z-index: 0" id="Table2" border="0" cellspacing="2" cellpadding="2"
                    width="100%">
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_JBCtnr" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_SpecialInstruction" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>
                                    </table>
                                    <telerik:RadGrid ID="TripInfoResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                        AllowPaging="false" Skin="Metro" OnNeedDataSource="TripInfoResultDG_NeedDataSource">
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle Wrap="true"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBTripId">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridBoundColumn UniqueName="ShipmentType" HeaderText="ShipmentType" DataField="ShipmentTypeDescr"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="TransportType" HeaderText="TransportType" DataField="TptTypeDescr"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="JobType" HeaderText="JobType" DataField="JobTypeDescr"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="BillSizeType" HeaderText="BillSizeType" DataField="BillSizeTypeDescr"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="FrExpDate" HeaderText="Date" DataField="FrExpDate" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="Vehicle" HeaderText="Vehicle" DataField="VehNo"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="Driver" HeaderText="Driver" DataField="Name"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="FromAddress" HeaderText="FromAddress" DataField="FrAddr"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="ToAddress" HeaderText="ToAddress" DataField="ToAddr"></telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                    <br />
                                    <br />
                                    <telerik:RadGrid ID="RadGrid_JBPT" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                        AllowPaging="false" Skin="Metro" OnNeedDataSource="RadGrid_JBPT_NeedDataSource">
                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                        <ItemStyle Wrap="true"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBPId">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridBoundColumn UniqueName="Activity" HeaderText="Activity" DataField="Activity"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="Date" HeaderText="Date" DataField="Date" DataFormatString="{0:dd/MMM/yyyy}"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="FromAddress" HeaderText="FromAddress" DataField="FromAddress"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="ToAddress" HeaderText="ToAddress" DataField="ToAddress"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn UniqueName="Status" HeaderText="Status" DataField="Status"></telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                    <br />
                                    <br />
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" Width="700px"
                                        OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand"
                                        OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
                                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" Name="IncentiveAdd" EditMode="InPlace">
                                            <CommandItemSettings ShowRefreshButton="false" />
                                            <Columns>
                                                <telerik:GridTemplateColumn UniqueName="icon">
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
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
                                                <telerik:GridBoundColumn DataField="INCTMethodDescr" SortExpression="INCTMethodDescr" ItemStyle-Wrap="false"
                                                    HeaderText="Method" ReadOnly="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn HeaderText="Type" UniqueName="type">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTTypeDescr")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadDropDownList ID="IncentiveTypeList" runat="server" Width="120px" DropDownHeight="150px" Skin="Sunset"
                                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(INCTTypeListDS,DataBinder.Eval(Container.DataItem, "INCTType").ToString())%>'
                                                            DataSource='<%# INCTTypeListDS%>' DataTextField="IncentiveTypedescr" DataValueField="IncentiveType" OnSelectedIndexChanged="IncentiveTypeIndex_Changed" AutoPostBack="true">
                                                        </telerik:RadDropDownList>
                                                        <telerik:RadDropDownList ID="EditINCTDTIdList" runat="server" Width="120px" DropDownHeight="150px" Skin="Sunset" Visible="false"
                                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(INCTTypeListDS,DataBinder.Eval(Container.DataItem, "INCTDTId").ToString())%>'
                                                            DataSource='<%# INCTTypeListDS%>' DataTextField="INCTDTId" DataValueField="INCTDTId" AutoPostBack="true">
                                                        </telerik:RadDropDownList>
                                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="IncentiveTypeList"
                                                            ErrorMessage="*" ForeColor="Red" />
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn HeaderText="Amount" UniqueName="Amt">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTAmt")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox runat="server" ID="amt" Text='<%# DataBinder.Eval(Container.DataItem, "INCTAmt") %>'
                                                            TextMode="MultiLine" Rows="1" Width="150px">
                                                        </telerik:RadTextBox>
                                                        <asp:CompareValidator ID="amtCompVal" runat="server" ControlToValidate="amt"
                                                            EnableClientScript="true" ErrorMessage="*" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn HeaderText="Remarks" UniqueName="REM">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTRemarks")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox runat="server" ID="Rem" Text='<%# DataBinder.Eval(Container.DataItem, "INCTRemarks") %>'
                                                            TextMode="MultiLine" Rows="2" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="sno" HeaderText="AddUser <br/> AddDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("adduser"), Eval("adddate")) %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("adduser"), Eval("adddate")) %>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="sno" HeaderText="EditUser <br/> EditDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("edituser"), Eval("editdate")) %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("edituser"), Eval("editdate")) %>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="IncentiveRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QRCodeRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="AttcRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
