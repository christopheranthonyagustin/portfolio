<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanDetl.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanDetl" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>LoanDetl</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
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
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <br />
            <asp:Button ID="LoanReturnBtn" runat="server" Text="LoanReturn" OnClientClick="disableBtn(this.id)" 
                UseSubmitBehavior="false" CssClass="white" OnClick="LoanReturnBtn_Click"></asp:Button>
            <br />
            <br />
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
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="Line" DataField="Line" AllowFiltering="true"
                            SortExpression="Line" UniqueName="Line" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExLine" DataField="ExLine" AllowFiltering="true"
                            SortExpression="ExLine" UniqueName="ExLine" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="IssueNumber" DataField="ISNumber" AllowFiltering="true"
                            SortExpression="ISNumber" UniqueName="ISNumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKU" DataField="skucode" AllowFiltering="true"
                            SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKUCode2" DataField="skucode2" AllowFiltering="true"
                            SortExpression="skucode2" UniqueName="skucode2" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKUDescription" DataField="skudescr" AllowFiltering="true"
                            SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Src" DataField="Src" AllowFiltering="true"
                            SortExpression="Src" UniqueName="Src" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SrcID" DataField="SrcId" AllowFiltering="true"
                            SortExpression="SrcId" UniqueName="SrcId" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SrcdtID" DataField="SrcdtId" AllowFiltering="true"
                            SortExpression="SrcdtId" UniqueName="SrcdtId" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ExpectedQty" DataField="ExpectedQty" AllowFiltering="true"
                            SortExpression="ExpectedQty" UniqueName="ExpectedQty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoanedQty" DataField="Qty" AllowFiltering="true"
                            SortExpression="Qty" UniqueName="Qty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ReturnedQty" DataField="ReturnedQty" AllowFiltering="true"
                            SortExpression="ReturnedQty" UniqueName="ReturnedQty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="OutstandingQty" DataField="AvailReturnQty" AllowFiltering="true"
                            SortExpression="AvailReturnQty" UniqueName="AvailReturnQty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FromSLoc" DataField="FrLot12" AllowFiltering="true"
                            SortExpression="FrLot12" UniqueName="FrLot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToSLoc" DataField="ToLot12" AllowFiltering="true"
                            SortExpression="ToLot12" UniqueName="ToLot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoanDate" DataField="LoanDate" AllowFiltering="true"
                            SortExpression="LoanDate" UniqueName="LoanDate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoanDueDate" DataField="LoanDueDate" AllowFiltering="true"
                            SortExpression="LoanDueDate" UniqueName="LoanDueDate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" AllowFiltering="true"
                            SortExpression="StatusDescr" UniqueName="StatusDescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Rem1" DataField="rem1" AllowFiltering="true"
                            SortExpression="rem1" UniqueName="Rem1"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Rem2" DataField="rem2" AllowFiltering="true"
                            SortExpression="rem2" UniqueName="Rem2"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                            SortExpression="adddate" UniqueName="Adddate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                            SortExpression="adduser" UniqueName="AddUser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                            SortExpression="editdate" UniqueName="Editdate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                            SortExpression="edituser" UniqueName="EditUser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ID" DataField="Id" AllowFiltering="true"
                            SortExpression="id" UniqueName="Id" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoanID" DataField="LoanId" SortExpression="LoanId" 
                            UniqueName="LoanId" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="Status" SortExpression="Status" 
                            UniqueName="Status" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>            
    </form>
</body>
</html>
