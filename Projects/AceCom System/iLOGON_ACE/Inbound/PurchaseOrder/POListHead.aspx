<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POListHead.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.POListHead" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head id="Head1" runat="server">
		<title>SkuListHead</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
        <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">	
		<form id="Form1" method="post" runat="server">
		 <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <div id="div-datagrid">
                   <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            BorderStyle="Solid" Skin="Office2007" AllowSorting="true" 
                       onitemdatabound="ResultDG_ItemDataBound" 
                       onneeddatasource="ResultDG_NeedDataSource">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
              <%--  <Scrolling ScrollHeight="400px" AllowScroll="true" />--%>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
					<Columns>
					    <telerik:GridTemplateColumn>
							<ItemTemplate>
								<asp:Label ID="DetailLbl" runat="server"></asp:Label>
							</ItemTemplate>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
						</telerik:GridTemplateColumn>
						<telerik:GridBoundColumn DataField="phid" SortExpression="phid" Display="false" />
						<telerik:GridBoundColumn DataField="pono" SortExpression="pono" Display="false" />	
					    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="sucode" SortExpression="sucode" HeaderText="Supplier Code">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="Supplier Name">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU Code">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKU Descr">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="orderedqty" SortExpression="orderedqty" HeaderText="OrderedQty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="intransitqty" SortExpression="intransitqty" HeaderText="IntransitQty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="receivedqty" SortExpression="receivedqty" HeaderText="ReceivedQty">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="OSQty" DataFormatString="{0:#,0}">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PO No">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="grp" SortExpression="grp" HeaderText="PO Group">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
							<HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3" DataFormatString="{0:dd/MMM/yyyy}">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot7" HeaderText="Lot7" SortExpression="lot7">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot8" HeaderText="Lot8" SortExpression="lot8">
							<HEADERSTYLE Wrap="False"></HEADERSTYLE>
							<ITEMSTYLE Wrap="False"></ITEMSTYLE>
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10" HeaderText="Lot10" SortExpression="lot10">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot13" HeaderText="Lot13" SortExpression="lot13">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot14" HeaderText="Lot14" SortExpression="lot14">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot15" HeaderText="Lot15" SortExpression="lot15">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot16" HeaderText="Lot16" SortExpression="lot16">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot17" HeaderText="Lot17" SortExpression="lot17">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot18" HeaderText="Lot18" SortExpression="lot18">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot19" HeaderText="Lot19" SortExpression="lot19">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot20" HeaderText="Lot20" SortExpression="lot20">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot21" HeaderText="Lot21" SortExpression="lot21">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot22" HeaderText="Lot22" SortExpression="lot22">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot23" HeaderText="Lot23" SortExpression="lot23">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot24" HeaderText="Lot24" SortExpression="lot24">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot25" HeaderText="Lot25" SortExpression="lot25">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot26" HeaderText="Lot26" SortExpression="lot26">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot27" HeaderText="Lot27" SortExpression="lot27">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot28" HeaderText="Lot28" SortExpression="lot28">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot29" HeaderText="Lot29" SortExpression="lot29">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot30" HeaderText="Lot30" SortExpression="lot30">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot31" HeaderText="Lot31" SortExpression="lot31">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot32" HeaderText="Lot32" SortExpression="lot32">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot33" HeaderText="Lot33" SortExpression="lot33">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot34" HeaderText="Lot34" SortExpression="lot34">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot35" HeaderText="Lot35" SortExpression="lot35">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot36" HeaderText="Lot36" SortExpression="lot36">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot37" HeaderText="Lot37" SortExpression="lot37">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot38" HeaderText="Lot38" SortExpression="lot38">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot39" HeaderText="Lot39" SortExpression="lot39">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot40" HeaderText="Lot40" SortExpression="lot40">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot41" HeaderText="Lot41" SortExpression="lot41">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot42" HeaderText="Lot42" SortExpression="lot42">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot43" HeaderText="Lot43" SortExpression="lot43">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot44" HeaderText="Lot44" SortExpression="lot44">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot45" HeaderText="Lot45" SortExpression="lot45">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot46" HeaderText="Lot46" SortExpression="lot46">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot47" HeaderText="Lot47" SortExpression="lot47">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot48" HeaderText="Lot48" SortExpression="lot48">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot49" HeaderText="Lot49" SortExpression="lot49">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot50" HeaderText="Lot50" SortExpression="lot50">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot51" HeaderText="Lot51" SortExpression="lot51">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot52" HeaderText="Lot52" SortExpression="lot52">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot53" HeaderText="Lot53" SortExpression="lot53">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot54" HeaderText="Lot54" SortExpression="lot54">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot55" HeaderText="Lot55" SortExpression="lot55">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot56" HeaderText="Lot56" SortExpression="lot56">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot57" HeaderText="Lot57" SortExpression="lot57">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot58" HeaderText="Lot58" SortExpression="lot58">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot59" HeaderText="Lot59" SortExpression="lot59">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot60" HeaderText="Lot60" SortExpression="lot60">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
					</MasterTableView>
			</telerik:RadGrid>
        </div>
        </form>
    </body>
</html>
