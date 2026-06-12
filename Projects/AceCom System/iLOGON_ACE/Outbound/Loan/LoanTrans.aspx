<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanTrans.aspx.cs" Inherits="iWMS.Web.Outbound.Loan.LoanTrans" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>LoanTrans</title>
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
                        <telerik:GridBoundColumn HeaderText="ID" Display="false" DataField="Id" AllowFiltering="true"
                            ColumnGroupName="id" SortExpression="id" UniqueName="Id" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoanID" Display="false" DataField="LoanId" AllowFiltering="true"
                            ColumnGroupName="LoanId" SortExpression="LoanId" UniqueName="LoanId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="LoandtId" Display="false" DataField="LoandtId" AllowFiltering="true"
                            ColumnGroupName="LoandtId" SortExpression="LoandtId" UniqueName="LoandtId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Src" Display="false" DataField="Src" AllowFiltering="true"
                            ColumnGroupName="Src" SortExpression="Src" UniqueName="Src" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SrcID" Display="false" DataField="SrcId" AllowFiltering="true"
                            ColumnGroupName="SrcId" SortExpression="SrcId" UniqueName="SrcId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SrcdtID" Display="false" DataField="SrcdtId" AllowFiltering="true"
                            ColumnGroupName="SrcdtId" SortExpression="SrcdtId" UniqueName="SrcdtId" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Line" DataField="Line" AllowFiltering="true"
                            ColumnGroupName="Line" SortExpression="Line" UniqueName="Line" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ISNumber" DataField="ISNumber" AllowFiltering="true"
                            ColumnGroupName="ISNumber" SortExpression="ISNumber" UniqueName="ISNumber" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="skucode" DataField="skucode" AllowFiltering="true"
                            ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="skudescr" DataField="skudescr" AllowFiltering="true"
                            ColumnGroupName="skudescr" SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Qty" DataField="Qty" AllowFiltering="true"
                            ColumnGroupName="Qty" SortExpression="Qty" UniqueName="Qty" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="FromSLoc" DataField="FrLot12" AllowFiltering="true"
                            ColumnGroupName="FrLot12" SortExpression="FrLot12" UniqueName="FrLot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ToSLoc" DataField="ToLot12" AllowFiltering="true"
                            ColumnGroupName="ToLot12" SortExpression="ToLot12" UniqueName="ToLot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="StatusDescr" AllowFiltering="true" Display="false"
                            ColumnGroupName="StatusDescr" SortExpression="StatusDescr" UniqueName="StatusDescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" AllowFiltering="true"
                            ColumnGroupName="loccode" SortExpression="loccode" UniqueName="loccode"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Rem1" DataField="rem1" AllowFiltering="true"
                            ColumnGroupName="rem1" SortExpression="rem1" UniqueName="Rem1"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Rem2" DataField="rem2" AllowFiltering="true"
                            ColumnGroupName="rem2" SortExpression="rem2" UniqueName="Rem2"
                            Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" AllowFiltering="true"
                            ColumnGroupName="adddate" SortExpression="adddate" UniqueName="Adddate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" AllowFiltering="true"
                            ColumnGroupName="adduser" SortExpression="adduser" UniqueName="AddUser" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" AllowFiltering="true"
                            ColumnGroupName="editdate" SortExpression="editdate" UniqueName="Editdate" Reorderable="true"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" AllowFiltering="true"
                            ColumnGroupName="edituser" SortExpression="edituser" UniqueName="EditUser" Reorderable="true">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>            
        </form>
    </body>
</html>
