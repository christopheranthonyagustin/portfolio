<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceLineDetl.aspx.cs" Inherits="iWMS.Web.Job.DebitNote.InvoiceLineDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceLineDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />      
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="InvoiceLineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />  
        <div style="height: 95%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" BorderStyle="Solid"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <Columns>
                        <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false">
                            <HeaderTemplate>
                                S/N
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" SortExpression="accode">                             
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="ChargeCode" SortExpression="ChargeCode">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="BillingQTY" DataField="BillingQTY" SortExpression="BillingQTY">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="UnitRate" DataField="UnitRate" SortExpression="UnitRate">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="UnitRateUOM" DataField="UnitRateUOM" SortExpression="UnitRateUOM">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="BillingAmt" DataField="BillingAmt" SortExpression="BillingAmt">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="TaxType" DataField="TaxType" SortExpression="TaxType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ChargeDescription" DataField="chargedescr" SortExpression="chargedescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Remarks" DataField="remarks" SortExpression="remarks" ItemStyle-Wrap="true" Reorderable="true">
                        </telerik:GridBoundColumn>                       
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
