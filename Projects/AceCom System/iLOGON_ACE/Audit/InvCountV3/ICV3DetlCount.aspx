<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ICV3DetlCount.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.ICV3DetlCount" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ICV3DetlCount</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
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

        function GridCreated() {
            var scrollArea = document.getElementById(this.ClientID + "_GridData");
            if (this.MasterTableView.Control.clientHeight <= parseInt(this.ClientSettings.Scrolling.ScrollHeight))
                scrollArea.style.height = this.MasterTableView.Control.clientHeight + "px";
        } 
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <table>
        <tr>
            <td align="left">
                <asp:Button ID="reconlot4Btn" runat="server" CssClass="detailButton" Text="ReconByLot4"
                    OnClick="reconlot4Btn_Clicked" />
                <asp:Button ID="reconlot5Btn" runat="server" CssClass="detailButton" Text="ReconByLot5"
                    OnClick="reconlot5Btn_Clicked" />
                <asp:Button ID="reconLocTUBtn" runat="server" CssClass="detailButton" Text="ReconByLocTuno1"
                    OnClick="reconLocTUBtn_Clicked" />
                <telerik:RadButton ID="reconSKULOCBtn" runat="server" CssClass="detailButton" Text="ReconBySKULoc"
                    OnClick="reconSKULOCBtn_Clicked" />
                &nbsp;&nbsp;
                <telerik:RadButton ID="DeleteLineBtn" runat="server" CssClass="detailButton" OnClientClick="return confirm('Confirm to Delete the selected InvCount Detail Count?')"
                    Text="DeleteInvDetlCount" OnClick="DeleteLineBtn_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/excel.gif"
        ToolTip="ExportToExcel" OnClick="ButtonExcel_Click" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling AllowScroll="true" ScrollHeight="300px" SaveScrollPosition="true" />
            <ClientEvents OnGridCreated="GridCreated" />
        </ClientSettings>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
            FileName="InventoryDetailCount">
            <Excel Format="Html" />
        </ExportSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevAndNumeric" />
            <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" Reorderable="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="lineChkbx" runat="server" />
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete Inv.Count Detail Count?')"
                            onserverclick="ICDetlCount_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Inv.Count Detail Count"
                                title="Delete Inv.Count Detail Count" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn AllowFiltering="false">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TUNO2">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="CountedQty"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="counter" SortExpression="counter" HeaderText="Counter">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Rem1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Rem2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>