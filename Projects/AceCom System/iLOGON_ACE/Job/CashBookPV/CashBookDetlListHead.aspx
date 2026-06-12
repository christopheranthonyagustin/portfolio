<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookDetlListHead.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV.CashBookDetlListHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookDetlListHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/row.js"></script>

    <script type="text/javascript">
     $(document).ready(function() {
         $(".show_hide_Detail").hide();
         $(".show_hide_Header").show();
         $('.show_hide_Header').click(function() {
             $(".show_hide_Detail").slideToggle();
         });
     });

    
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
       <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="PVLineSearch Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />   
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
        AllowSorting="true" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling ScrollHeight="500px" AllowScroll="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="cbid" SortExpression="cbid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Charge" DataField="chargedescr2" SortExpression="chargedescr2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Description" DataField="chargedescr" SortExpression="chargedescr">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="srcno" DataField="srcno" SortExpression="JobNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ctnrno" DataField="ctnrno" SortExpression="CtnrNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="vehno" DataField="vehno" SortExpression="EqpNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="name" DataField="name" SortExpression="Personnel">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="vdcode" DataField="vdcode" SortExpression="VendorCode">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="vdname" DataField="vdname" SortExpression="VendorName">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Inv/RcDate" DataField="exdate1" SortExpression="exdate1"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Qty" DataField="qty" SortExpression="qty" DataFormatString="{0:#,0.##}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rate($)" DataField="unitrate" SortExpression="unitrate">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Rate($)" DataField="unitrate" SortExpression="unitrate"
                    DataFormatString="{0:#,0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FcAmt" DataField="fcamt" SortExpression="fcamt"
                    DataFormatString="{0:#,0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="LcAmt" DataField="lcamt" SortExpression="lcamt"
                    DataFormatString="{0:#,0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Tax Type" DataField="taxtypedescr" SortExpression="taxtypedescr">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TaxFcAmt" DataField="taxfcamt" SortExpression="taxfcamt"
                    DataFormatString="{0:#,0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TaxLcAmt" DataField="taxlcamt" SortExpression="taxlcamt"
                    DataFormatString="{0:#,0.00}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remark1" DataField="rem1" SortExpression="rem1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Remark2" DataField="rem2" SortExpression="rem2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Add Date" DataField="adddate" SortExpression="adddate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Edit Date" DataField="editdate" SortExpression="editdate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Add User" DataField="adduser" SortExpression="adduser">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Edit User" DataField="edituser" SortExpression="edituser">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
