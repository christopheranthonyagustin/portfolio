<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripStatusQueryList.aspx.cs" Inherits="iWMS.Web.Job.TripStatusQuery.TripStatusQueryList" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        /*.....+/- button Design......*/

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
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip><br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainInfoRadPageView" Height="0px">
                <table border="0" cellpadding="2" cellspacing="2" runat="server" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="ddllbl" runat="server" Text="Account"> 
                            </asp:Label>
                            <br />
                            <telerik:RadComboBox ID="AccountCombo" ZIndex="15000" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains" OnSelectedIndexChanged="AccountCombo_SelectedIndexChanged" AutoPostBack="true">
                            </telerik:RadComboBox>
                        </td>
                         <td>
                            <asp:Label ID="ddlshiptype" runat="server" Text="ShipmentType"> 
                            </asp:Label>
                            <br />
                            <telerik:RadComboBox ID="ShipmentCombo" ZIndex="15000" runat="server" Width="155px" Skin="WebBlue" AllowCustomText="false" RenderMode="Lightweight" Filter="Contains" OnSelectedIndexChanged="ShipmentCombo_SelectedIndexChanged" AutoPostBack="true">
                            </telerik:RadComboBox>
                        </td>
                   <%--     <td style="padding-left: 2px;">
                            <br />
                            <asp:Button ID="PrevBtn1" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="-" OnClick="PrevBtn_Click"
                                UseSubmitBehavior="false" />
                        </td>--%>
                        <td>
                            <asp:Label ID="frdatelbl" runat="server" Text="Expected DateRange"> 
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
                                 <telerik:RadDatePicker ID="ToDateTxt" runat="server" Width="155"
                                DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007"
                                OnSelectedDateChanged="FromDateTxt_SelectedDateChanged" AutoPostBack="true">
                                <Calendar runat="server">
                                    <SpecialDays>
                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                    </SpecialDays>
                                </Calendar>
                            </telerik:RadDatePicker>

                        </td>
                    <%--    <td>
                            <br />
                            <asp:Button ID="NextBtn1" runat="server" CssClass="btn1" Font-Bold="true" Font-Size="Large" Text="+" OnClick="NextBtn_Click"
                                UseSubmitBehavior="false" />

                        </td>--%>
                        <td>&nbsp;
                            <asp:Label ID="lblcusref" runat="server" Text="Customer Reference"> 
                            </asp:Label>
                            <br />
                            <telerik:RadTextBox ID="txtCusref" runat="server" Width="155px" OnTextChanged="Radcusref_TextChanged" AutoPostBack="true">
                            </telerik:RadTextBox>
                        </td>
                           <td>&nbsp;
                            <asp:Label ID="CusrefLbl" runat="server" Text="Customer"> 
                            </asp:Label>
                            <br />
                            <telerik:RadTextBox ID="txtCusAddr" runat="server" Width="155px" OnTextChanged="Radcusref_TextChanged" AutoPostBack="true" >
                            </telerik:RadTextBox>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="RefereshBtn" class="white" runat="server" OnClick="RefereshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="excelImg" runat="server" CssClass="green" Text="Excel" OnClick="ExportExcel"
                                UseSubmitBehavior="false" />
                        </td>
                        <td width="100%" align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" />
                        </td>

                    </tr>
                </table><br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" Height="460px"
                    CellPadding="2" AllowSorting="True" AllowMultiRowSelection="false"
                    UseAccessibleHeader="True" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnGridExporting="ResultDG_GridExporting" AllowFilteringByColumn="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                        <Selecting AllowRowSelect="true" />
                        <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <ExportSettings UseItemStyles="True">
                    </ExportSettings>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="attc" AllowFiltering="false" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <a id="A1" href='<%#DataBinder.Eval(Container,"DataItem.trpid")%>' onserverclick="Attachment" runat="server">
                                        <img id="Img2" src="../../image/attachment.png" width="15" height="15" border="0" alt="Attachment"
                                            title="Attachment" runat="server" /></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="Account" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="Account" SortExpression="Account" UniqueName="Account"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn HeaderText="ShipmentType" DataField="JBCShTypeDescr" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="JBCShTypeDescr" SortExpression="JBCShTypeDescr" UniqueName="JBCShTypeDescr"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Job No" DataField="JobNo" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="JobNo" SortExpression="JobNo" UniqueName="JobNo"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CustRef" DataField="CustRef" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="CustRef" SortExpression="CustRef" UniqueName="CustRef"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn HeaderText="CustRef2" DataField="CustRef2" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="CustRef2" SortExpression="CustRef2" UniqueName="CustRef2"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                                 </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Addr" DataField="Addr" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="Addr" SortExpression="Addr" UniqueName="Addr"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDate" HeaderText="JobAddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="frexpdate" SortExpression="frexpdate" HeaderText="Trip Expected Date"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Route" DataField="Route" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="Route" SortExpression="Route" UniqueName="Route"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="Remarks" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="Remarks" SortExpression="Remarks" UniqueName="Remarks"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActPKG" DataField="ActPKG" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="ActPKG" SortExpression="ActPKG" UniqueName="ActPKG"
                                Reorderable="true" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActPLT" DataField="ActPLT" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="ActPLT" SortExpression="ActPLT" UniqueName="ActPLT"
                                Reorderable="true" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActWT" DataField="ActWT" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="ActWT" SortExpression="ActWT" UniqueName="ActWT"
                                Reorderable="true" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="ActVol" DataField="ActVol" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="ActVol" SortExpression="ActVol" UniqueName="ActVol"
                                Reorderable="true" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="VehNo" DataField="VehNo" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="VehNo" SortExpression="VehNo" UniqueName="VehNo"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Driver" DataField="Driver" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="Driver" SortExpression="Driver" UniqueName="Driver"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Payment Type" DataField="PaymentTerms" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="PaymentTerms" SortExpression="PaymentTerms" UniqueName="PaymentTerms"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Cheque Reference" DataField="CODRef" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="CODRef" SortExpression="CODRef" UniqueName="CODRef"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="COD" DataField="CODAmt" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="CODAmt" SortExpression="CODAmt" UniqueName="CODAmt"
                                Reorderable="true" ItemStyle-HorizontalAlign="Right">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="COD Collected" DataField="CODCollectedAmt" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="CODCollectedAmt" SortExpression="CODCollectedAmt" UniqueName="CODCollectedAmt"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="CODRemarks" DataField="CODRemarks" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="CODRemarks" SortExpression="CODRemarks" UniqueName="CODRemarks"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="Status" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="Status" SortExpression="Status" UniqueName="Status"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Reason" DataField="reasoncode" AllowFiltering="true"
                                ReadOnly="True" ColumnGroupName="reasoncode" SortExpression="reasoncode" UniqueName="reasoncode"
                                Reorderable="true" ItemStyle-HorizontalAlign="Left">
                            </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn HeaderText="frexpdate" DataField="frexpdate" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="frexpdate" SortExpression="frexpdate" UniqueName="frexpdate"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="StatusColor" DataField="StatusColor" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="StatusColor" SortExpression="StatusColor" UniqueName="StatusColor"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="trpid" DataField="trpid" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="trpid" SortExpression="trpid" UniqueName="trpid"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="jbid" SortExpression="jbid" UniqueName="jbid"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="expdate" DataField="expdate" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="expdate" SortExpression="expdate" UniqueName="expdate"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                         
                            <telerik:GridBoundColumn HeaderText="jbcshtype" DataField="jbcshtype" AllowFiltering="false"
                                ReadOnly="True" ColumnGroupName="jbcshtype" SortExpression="jbcshtype" UniqueName="jbcshtype"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
               <telerik:RadPageView runat="server" Height="700px" ID="TaskRadPageViewAttc" />
        </telerik:RadMultiPage>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        <%--Attached Photo Popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeAttachedPhotoPopup" runat="server" PopupControlID="pnlAttachedPhotoBox"
            TargetControlID="btnStatusButton" RepositionMode="RepositionOnWindowScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="Panel1" runat="server" Width="100%" Height="100%" Style="background-color: transparent;">
            <asp:Panel runat="server" ID="pnlAttachedPhotoBox" BackColor="white" Width="600" Style="display: none; border: 2px solid  #859DD4; background-color: transparent;">
                <div class="popupHeader" style="width: 600px;">
                    <asp:Label ID="lblMessagePopupHeading" runat="server" Style="size: 15px">Trip Status Query Attc</asp:Label>
                    <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
                </div>
                <div style="max-height: 380px; width: 600px; overflow: hidden; background-color: transparent;">
                    <iframe id="AttachedPhotoIFrame" scrolling="no" width="800px" style="border: none;" height="380px" runat="server"></iframe>
                </div>
            </asp:Panel>
        </asp:Panel>
        <%--Attached Photo Popup area end--%>
    </form>
</body>
</html>
