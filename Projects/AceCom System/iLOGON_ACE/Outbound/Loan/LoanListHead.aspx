<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanListHead.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanListHead" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <title>LoanListHead</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

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
    </style>
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") 
                    myElement.checked = invoker.checked;
                else 
                    myElement.checked = invoker.UnChecked
            }
        }
    </script>
</head>

<body>
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="div1">
            <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></td></tr>
                <tr><td align="right"></td></tr>
            </table>
        </div>

        <br />
        &nbsp;<asp:Button ID="LVBtn" runat="server" Text="Loan Voucher" Visible="True" OnClientClick="disableBtn(this.id,false)" 
            UseSubmitBehavior="false" CssClass="white" OnClick="LVBtn_Click" Width="100px"></asp:Button>
        <br /><br />

        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevAndNumeric" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                            <asp:ImageButton runat="server" Visible="True" ID="LoanHeadEdit" ImageUrl="..\..\image\pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Loan Head"
                                    OnClick="loanheadEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="LoanHeadDelete" ImageUrl="..\..\image\bin.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Delete Loan Head"
                                    OnClick="loanheadDelete_Click" OnClientClick="return confirm('Confirm delete?')" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="ID" DataField="id" AllowFiltering="true"
                        ColumnGroupName="id" SortExpression="id" UniqueName="Id" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Number" DataField="number" AllowFiltering="true"
                        ColumnGroupName="number" SortExpression="number" UniqueName="Number" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SiteCode" DataField="sitecode" AllowFiltering="true"
                        ColumnGroupName="sitecode" SortExpression="sitecode" UniqueName="SiteCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Exref2" DataField="exref2" AllowFiltering="true"
                        ColumnGroupName="exref2" SortExpression="exref2" UniqueName="Exref2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Name" DataField="name" AllowFiltering="true"
                        ColumnGroupName="name" SortExpression="name" UniqueName="Name" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NRIC" DataField="nric" AllowFiltering="true"
                        ColumnGroupName="nric" SortExpression="nric" UniqueName="NRIC" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Tel" DataField="contactno" AllowFiltering="true"
                        ColumnGroupName="contactno" SortExpression="contactno" UniqueName="ContactNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Email" DataField="email" AllowFiltering="true"
                        ColumnGroupName="email" SortExpression="email" UniqueName="Email" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OpenLoan" DataField="OpenLoanCount" AllowFiltering="true" DataFormatString="{0:N0}" 
                        ColumnGroupName="OpenLoanCount" SortExpression="OpenLoanCount" UniqueName="OpenLoanCount" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Closed" DataField="ClosedLoanCount" AllowFiltering="true" DataFormatString="{0:N0}" 
                        ColumnGroupName="ClosedLoanCount" SortExpression="ClosedLoanCount" UniqueName="ClosedLoanCount" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Outstanding" DataField="OutstandingQty" AllowFiltering="true" DataFormatString="{0:N0}"
                        ColumnGroupName="OutstandingQty" SortExpression="OutstandingQty" UniqueName="OutstandingQty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExpiredLoan" DataField="ExpiredLoanCount" AllowFiltering="true" DataFormatString="{0:N0}"
                        ColumnGroupName="ExpiredLoanCount" SortExpression="ExpiredLoanCount" UniqueName="ExpiredLoanCount" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rem1" DataField="rem1" AllowFiltering="true"
                        ColumnGroupName="rem1" SortExpression="rem1" UniqueName="Rem1"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Rem2" DataField="rem2" AllowFiltering="true"
                        ColumnGroupName="rem2" SortExpression="rem2" UniqueName="Rem2"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="type" AllowFiltering="true"
                        ColumnGroupName="type" SortExpression="type" UniqueName="Type"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" AllowFiltering="true"
                        ColumnGroupName="StatusDescr" SortExpression="StatusDescr" UniqueName="StatusDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="AddDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="AddUser"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="Editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="EditUser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="status" DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="acid" Display="false" DataField="acid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" HeaderText="LoanNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>