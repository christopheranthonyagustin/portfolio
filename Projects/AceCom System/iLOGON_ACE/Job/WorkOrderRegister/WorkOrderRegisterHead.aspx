<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderRegisterHead.aspx.cs" Inherits="iWMS.Web.Job.WorkOrderRegister.WorkOrderRegisterHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>WorkOrderRegisterHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet"/>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
     <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .StatusBackground {
            background-color: black;
            opacity: 0.001;
        }
    </style>
    <style type="text/css">
        .style1 {
            width: 95%;
        }
    </style>

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
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="LblPanel" runat="server" Visible="false">
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </asp:Panel>
        <table>
            <tr>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" AutoPostBack="true"
					CausesValidation="false" SelectedIndex="0" Skin="Windows7">
					<Tabs>
						<telerik:RadTab Text="Search Results" Value="0" runat="server">
						</telerik:RadTab>
					</Tabs>
				</telerik:RadTabStrip>
            </tr>
        </table>
        <table style="width: 100%; height: 30px">
           <tr>
                <td class="style1">
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click"
                        Text="Cancel" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                      &nbsp;&nbsp;
                    <asp:Button ID="CompleteBtn" class="white" runat="server" OnClick="CompleteBtn_Click"
                        Text="Complete" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                      &nbsp;
                   <asp:button ID="nonbillablebtn" class="white" runat="server" OnClick="NonBillablebtn_Click" 
                        Text="NonBill" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"/>
                    &nbsp;
                    <asp:Button ID="ChargeSheetBtn" class="blue" runat="server" OnClick="ChargesSheetBtn_Click" Text="Charge"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                    &nbsp;
                    <asp:Button ID="ReopenBtn" CssClass="white" runat="server" OnClick="ReopenBtn_Click"
                        Text="Reopen" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Reopen" />
                </td> 
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
           </tr>
        </table>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" Height="80%" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting EnableDragToSelectRows="false" AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false" Width="150px"></ItemStyle>
                    <HeaderStyle Wrap="false" Width="150px" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"  HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="accode" UniqueName="accode" SortExpression="accode"
                                HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" UniqueName="number" SortExpression="number"
                                HeaderText="Job Number">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" UniqueName="expdate" SortExpression="expdate"
                                HeaderText="Exp Date" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderby" UniqueName="orderby" SortExpression="orderby"
                                HeaderText="Ordeby">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="releaseloc" UniqueName="releaseloc" SortExpression="releaseloc"
                                HeaderText="Site">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" UniqueName="Type" SortExpression="Type"
                                HeaderText="Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" UniqueName="statusdescr" SortExpression="statusdescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" UniqueName="remarks" SortExpression="remarks"
                                HeaderText="Remarks">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" UniqueName="acid" HeaderText="Acid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" UniqueName="status" HeaderText="Status" Display="false">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="number" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
         <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <%--Message popup 2 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
        <%--Status popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeJobClosePopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="225px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 225px;">
                <asp:Label ID="Label2" Text="Close Job" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 240px; width: 225px;">
                <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                    <tr>
                        <td>JobNo<br />
                            <telerik:RadTextBox ID="JobNotxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Account<br />
                            <telerik:RadTextBox ID="Accounttxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>CloseCompleteDate
                      <telerik:RadDatePicker ID="CloseJobDateTxt" runat="server" Width="155"
                          DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                          <Calendar runat="server">
                              <SpecialDays>
                                  <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                              </SpecialDays>
                          </Calendar>
                      </telerik:RadDatePicker>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CloseImg" class="white" runat="server" OnClick="CancelImg_Click" Text="Close"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <%--Status popup area end--%>
        <%--Cancel popup area start--%>
        <asp:Button runat="server" ID="Button1" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeStatusPopup" runat="server" PopupControlID="pnlCancelBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlCancelBox" BackColor="LAVENDER" Width="285px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 285px;">
                <asp:Label ID="lblCoseJobTitle" Text="" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 350px; width: 285px;">
                <table style="margin-top: 10px; margin-left: 7px;" cellpadding="7px">
                    <tr>
                        <td colspan="2">Account<br />
                            <telerik:RadTextBox ID="txtAccount" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">JobNo<br />
                            <telerik:RadTextBox ID="txtJobNo" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Status<br />
                            <telerik:RadTextBox ID="txtStatus" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Reason<asp:Label ID="lbltxtReq" runat="server" Text="*" Visible="false"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="Reasontxt" runat="server" Height="90px" Width="249px"
                                TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CancelBtn1" class="white" runat="server" OnClick="CancelBtn1_Click" Text="Cancel"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Style="float: right;" />
                        </td>
                        <td>
                            <asp:Button ID="OkayBtn1" class="white" runat="server" OnClick="OkayBtn1_Click"
                                Text="Okay" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Okay" />

                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </form>
</body>
</html>