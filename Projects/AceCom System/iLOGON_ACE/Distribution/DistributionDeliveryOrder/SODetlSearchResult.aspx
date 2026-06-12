<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SODetlSearchResult.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionDeliveryOrder.SODetlSearchResult" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SOSearchResult</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="StepLbl" runat="server"></asp:Label><br />
                    </div>
                </td>
                <td align="right">
                    <asp:Button ID="NextBtn" runat="server" Text=" Next " CssClass="white" OnClick="NextBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                </td>&nbsp;&nbsp;
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <asp:Label ID="poNoLbl" runat="server">SONo</asp:Label>
                    &nbsp;
                <telerik:RadTextBox ID="SONo" runat="server" Width="120px"></telerik:RadTextBox>
                    &nbsp;
                     <telerik:RadDropDownList ID="SalesOrderTypeDDL" runat="server" Skin="WebBlue" CausesValidation="false" Filter="Contains"
                                                                        DataValueField="Item" DataTextField="Descr" DataSource='<%# SalesOrderTypeDS%>' Width="140px"/> 
                    &nbsp;
                <asp:Button ID="searchBtn" runat="server" Text="Search" CssClass="white" OnClick="searchBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            Skin="Office2007" AllowPaging="true" OnNeedDataSource="ResultDG1_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="No" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    
                    <telerik:GridBoundColumn DataField="SalesOrderNo" SortExpression="SalesOrderNo" HeaderText="SalesOrderNo" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderDate" SortExpression="SalesOrderDate" HeaderText="SalesOrderDate" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LineNo" SortExpression="LineNo" HeaderText="LineNo"  AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="ItemCode"  AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemDescription" SortExpression="ItemDescription" HeaderText="ItemDescription" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemOutstandingDeliveredQty" SortExpression="ItemOutstandingDeliveredQty" HeaderText="ItemQty"  AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" HeaderText="ItemUnitPrice"  AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Notes" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SalesOrderStatusDescr" SortExpression="SalesOrderStatus" HeaderText="SalesOrderStatus" AllowFiltering="false">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="Id" Display="false">
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn DataField="SalesOrderItemId" Display="false">
                    </telerik:GridBoundColumn>                                                
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
