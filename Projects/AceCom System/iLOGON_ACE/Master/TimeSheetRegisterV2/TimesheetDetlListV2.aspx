<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="TimesheetDetlListV2.aspx.cs" Inherits="iWMS.Web.Master.TimeSheetRegisterV2.TimeSheetRegisterV2HeadDetl" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self" />
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
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Summary" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="WhatsNew" Value="150" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab Text="Upload" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainInfoRadPageView" Height="0px">
                <br />
                <table border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <asp:Label ID="ddllbl" runat="server" Text="Personnel"> 
                            </asp:Label>
                            <br />
                            <telerik:RadTextBox ID="PersonnelTxt" runat="server" Width="155px" Skin="WebBlue" Enabled="false" > 
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="PrevBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Label ID="frdatelbl" runat="server" Text="Date"> 
                            </asp:Label>
                            <br />
                            <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="NextBtn" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                                Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>ShowUntilDate
                            <br />
                            <telerik:RadDatePicker ID="ShowUntilDateTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="CopyBtn" CssClass="white" runat="server" OnClick="CopyBtn_Click"
                                Text="Copy" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td width="100%" align="right">
                            <br />
                            <asp:Label ID="Totallbl" runat="server" Text="" ForeColor="Red" Font-Size="XX-Large"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" />
                <%--Copy popup area end--%>
                <ajaxToolkit:ModalPopupExtender ID="mpeCopyCodeFunctionPopup" runat="server" PopupControlID="pnlFunctionBox"
                    TargetControlID="Button1" CancelControlID="btnFunctionCancel" BackgroundCssClass="StatusBackground" Y="60">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlFunctionBox" BackColor="LAVENDER" Width="220px" Style="display: none; border: 2px solid #859DD4;">
                    <div class="popupHeader" style="width: 220px;">
                        <asp:Label ID="Label3" Text="Close Job" runat="server" Style="size: 15px">Copy Time Sheet Records</asp:Label>
                        <asp:LinkButton ID="btnFunctionCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
                    </div>
                    <div style="height: 170px; width: 220px;">
                        <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                            <tr>
                                <td>Copy Start Date 
                                      <asp:Label ID="lblCopyStartDate" runat="server" Text="*" Visible="false"></asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="CopyStartDateTxt" runat="server" Width="155"
                                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td>Copy End Date 
                                      <asp:Label ID="lblCopyEndDate" runat="server" Text="*" Visible="false"></asp:Label>
                                    <br />
                                    <telerik:RadDatePicker ID="CopyEndDateTxt" runat="server" Width="155"
                                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                                        <Calendar runat="server">
                                            <SpecialDays>
                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                            </SpecialDays>
                                        </Calendar>
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="CopyOkayBtn" CssClass="white" runat="server" OnClick="CopyOkayBtn_Click" Text="Okay"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                    <iWMS:iForm ID="formCtl" runat="server" Visible="false"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <%--End Copy popup area end--%>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" Height="420px"
                    BorderStyle="None" CellPadding="2" DataKeyField="id" AllowSorting="True" AllowMultiRowSelection="true"
                    UseAccessibleHeader="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                    </ClientSettings>
                    <AlternatingItemStyle></AlternatingItemStyle>
                    <ItemStyle></ItemStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                            </telerik:GridClientSelectColumn>
                            <telerik:GridTemplateColumn>
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="TimesheetDetlDelete" runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete timesheetDetl"
                                            runat="server"></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Id" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" HeaderText="Personnel" SortExpression="name">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="account" SortExpression="account" HeaderText="Account">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="application" SortExpression="application" HeaderText="Application">
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="module" SortExpression="module" HeaderText="Module">
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="Date"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="noofhours" SortExpression="noofhours" HeaderText="NoOfHours">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ticketno" SortExpression="ticketno" HeaderText="TicketNo">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ticketdescr" SortExpression="ticketdescr" HeaderText="TicketDescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TypeDescr" SortExpression="TypeDescr" HeaderText="Type">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChargeableDescr" SortExpression="ChargeableDescr" HeaderText="Chargeable">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="RecurrenceDescr" SortExpression="RecurrenceDescr" HeaderText="Recurrence">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False" Font-Italic="False"
                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                        </Columns>
                        <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="SummaryRadPageView" />
            <telerik:RadPageView runat="server" ID="WhatsNewRadPageView" Height="700px" />
             <telerik:RadPageView runat="server" ID="UploadRadPageView" Height="700px" />
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
