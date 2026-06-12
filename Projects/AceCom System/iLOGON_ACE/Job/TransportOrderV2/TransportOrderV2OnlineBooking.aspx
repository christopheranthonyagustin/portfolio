<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportOrderV2OnlineBooking.aspx.cs" Inherits="iWMS.Web.Job.TransportOrderV2.TransportOrderV2OnlineBooking" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookingOrderHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function SelectAll(invoker) {
            var InputElements = document.getElementsByTagName('input');
            for (var i = 0; i < InputElements.length; i++) {
                var MyElement = InputElements[i];
                if (MyElement.type === "checkbox") {
                    MyElement.checked = invoker.checked;
                }
                else {
                    MyElement.checked = invoker.UnChecked
                }
            }
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="AcceptBtn" CssClass="white" runat="server" OnClick="AcceptBtn_Click"
                        Text="Accept" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="RejectBtn" CssClass="white" runat="server" OnClick="RejectBtn_Click"
                        Text="Reject" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JBId" Name="MainGrid" AllowFilteringByColumn="false">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="SelectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="AcCode" UniqueName="AcCode" SortExpression="AcCode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JobNo" UniqueName="JobNo" SortExpression="JobNo" HeaderText="JobNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CustReference" UniqueName="CustReference" SortExpression="CustReference" HeaderText="CustomerRef">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="InvoiceNo" UniqueName="InvoiceNo" SortExpression="InvoiceNo" HeaderText="InvoiceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DoNo" UniqueName="DoNo" SortExpression="DoNo" HeaderText="DoNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DeliveryDateNonBillableJbRemarks" UniqueName="DeliveryDateNonBillableJbRemarks"
                        SortExpression="DeliveryDateNonBillableJbRemarks" HeaderText="Date<br>NonBillable<br>Remarks" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fraddr" UniqueName="FromAddress" SortExpression="FromAddress" HeaderText="FromAddress">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="toaddr" UniqueName="ToAddress" SortExpression="ToAddress" HeaderText="ToAddress">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="QUNo" UniqueName="QUNo" SortExpression="QUNo" HeaderText="QuotationNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ShipmentTypeDescr" UniqueName="ShipmentTypeDescr" SortExpression="ShipmentTypeDescr" HeaderText="ShipmentType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JobTypeDescr" UniqueName="JobTypeDescr" SortExpression="JobTypeDescr" HeaderText="JobType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TransportTypeDescr" UniqueName="TransportTypeDescr" SortExpression="TransportTypeDescr" HeaderText="TransportType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BillSizeType" UniqueName="BillSizeType" SortExpression="BillSizeType" HeaderText="BillSizeType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="JobSpecialInstruction" UniqueName="JobSpecialInstruction" SortExpression="JobSpecialInstruction" HeaderText="SpecialInstruction">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="AddUser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="EditUser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                    <telerik:GridBoundColumn DataField="acid" UniqueName="acid" Display="false" />
                    <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>