<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingManagementReceipt.aspx.cs" Inherits="iWMS.Web.Job.BookingManagement.BookingManagementReceipt" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingManagementReceipt</title>
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
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <asp:Panel ID="NewPanel" runat="server">
            &nbsp;
            <asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New"
                OnClick="NewBtn_Click" UseSubmitBehavior="false" CausesValidation="false" />
            &nbsp;
            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                OnClick="Cancel_Click" UseSubmitBehavior="false" CausesValidation="false" />
        </asp:Panel>
        <asp:Panel ID="AddPanel" runat="server">
             &nbsp;
            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                OnClick="AddBtn_Click" UseSubmitBehavior="false" />
            &nbsp;
            <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
                OnClick="CloseBtn_Click" UseSubmitBehavior="false" CausesValidation="false" />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            &nbsp;
            <asp:Button ID="CancelBtn2" runat="server" CssClass="white" Text="Cancel"
                OnClick="Cancel_Click" UseSubmitBehavior="false" CausesValidation="false" />
        </asp:Panel>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="number" UniqueName="number" SortExpression="number"
                        HeaderText="Receipt Number">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="bankdescr" UniqueName="bankdescr" SortExpression="bankdescr"
                        HeaderText="Bank">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="currcode" UniqueName="currcode" SortExpression="currcode"
                        HeaderText="Currency">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Trantype" UniqueName="Trantype" SortExpression="Trantype"
                        HeaderText="Payment Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" SortExpression="perid"
                        HeaderText="Driver">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="chequeno" UniqueName="chequeno" SortExpression="chequeno"
                        HeaderText="ChequeNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="trandate" UniqueName="trandate" SortExpression="trandate"
                        HeaderText="PaymentDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lcamt" UniqueName="lcamt" SortExpression="lcamt"
                        HeaderText="Amount">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
        <%--Status popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeStatusPopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="285px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 285px;">
                <asp:Label ID="Label1" Text="Change Receipt Status" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 350px; width: 285px;">
                <table style="margin-top: 10px; margin-left: 7px;" cellpadding="7px">

                    <tr>
                        <td colspan="2">Reason<asp:Label ID="lbltxtReq" runat="server" Text="*" Visible="false" CssClass="errorLabel"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="Reasontxt" runat="server" Height="90px" Width="249px" Skin="Sunset" BackColor="#ded7c6"
                                TextMode="MultiLine">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="OkayImg" class="white" runat="server" OnClick="OkayImg_Click"
                                Text="Okay" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" ToolTip="Okay" />

                        </td>
                        <td>
                            <asp:Button ID="CancelImg" class="white" runat="server" OnClick="CancelImg_Click" Text="Cancel"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" Style="float: right;" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <%--Status popup area end--%>
    </form>
</body>
</html>
