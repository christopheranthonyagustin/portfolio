<%@ Page Language="c#" CodeBehind="AdjustmentList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Audit.Adjustment.AdjustmentList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>AdjMoveList</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    	<asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle">Adjustment (Step 2 of 3)</asp:Label>
            </td>
            <td align="right">
                <asp:Button ID="NextBtn" runat="server" Text=" Next " CssClass="detailButton" OnClick="NextBtn_Click">
                </asp:Button>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel"></asp:Label>
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
    
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource"  Skin="Metro" >
        
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
           <Columns>
            <telerik:GridTemplateColumn >
             <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick ="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="accode" SortExpression="accode"  HeaderText="Account"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr"  HeaderText="Site"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="zonedescr" SortExpression="zonedescr"  HeaderText="Zone"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode"  HeaderText="SKU"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lotskudescr" SortExpression="lotskudescr"  HeaderText="Description"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid"  HeaderText="Lot"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode"  HeaderText="Location"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1"  HeaderText="TU#1"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2"  HeaderText="TU#2"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty"  HeaderText="On Hand"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="allocatedqty" SortExpression="allocatedqty"  HeaderText="Allocated"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="pickedqty" SortExpression="pickedqty"  HeaderText="Picked"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="heldqty" SortExpression="heldqty"  HeaderText="Held"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="availqty" SortExpression="availqty"  HeaderText="Held"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate"  HeaderText="Receive Date"  DataFormatString="{0:dd/MMM/yyyy}"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4"  HeaderText="Lot 4"    >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1"  HeaderText="Lot 1"  DataFormatString="{0:dd/MMM/yyyy}"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5"  HeaderText="Lot 5"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6"  HeaderText="Lot 6"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7"  HeaderText="Lot 7"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2"  HeaderText="Lot 2"  DataFormatString="{0:dd/MMM/yyyy}"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3"  HeaderText="Lot 3"  DataFormatString="{0:dd/MMM/yyyy}"  >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8"  HeaderText="Lot 8"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9"  HeaderText="Lot 9"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10"  HeaderText="Lot 10"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11"  HeaderText="Lot 11"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12"  HeaderText="Lot 12"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot13" SortExpression="lot13"  HeaderText="Lot 13"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot14" SortExpression="lot14"  HeaderText="Lot 14"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot15" SortExpression="lot15"  HeaderText="Lot 15"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot16" SortExpression="lot16"  HeaderText="Lot 16"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot17" SortExpression="lot17"  HeaderText="Lot 17"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot18" SortExpression="lot18"  HeaderText="Lot 18"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot19" SortExpression="lot19"  HeaderText="Lot 19"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot20" SortExpression="lot20"  HeaderText="Lot 20"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot21" SortExpression="lot21"  HeaderText="Lot 21"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot22" SortExpression="lot22"  HeaderText="Lot 22"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot23" SortExpression="lot23"  HeaderText="Lot 23"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot24" SortExpression="lot24"  HeaderText="Lot 24"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot25" SortExpression="lot25"  HeaderText="Lot 25"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot26" SortExpression="lot26"  HeaderText="Lot 26"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot27" SortExpression="lot27"  HeaderText="Lot 27"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot28" SortExpression="lot28"  HeaderText="Lot 28"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot29" SortExpression="lot29"  HeaderText="Lot 29"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot30" SortExpression="lot30"  HeaderText="Lot 30"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot31" SortExpression="lot31"  HeaderText="Lot 31"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot32" SortExpression="lot32"  HeaderText="Lot 32"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot33" SortExpression="lot33"  HeaderText="Lot 33"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot34" SortExpression="lot34"  HeaderText="Lot 34"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot35" SortExpression="lot35"  HeaderText="Lot 35"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot36" SortExpression="lot36"  HeaderText="Lot 36"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot37" SortExpression="lot37"  HeaderText="Lot 37"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot38" SortExpression="lot38"  HeaderText="Lot 38"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot39" SortExpression="lot39"  HeaderText="Lot 39"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot40" SortExpression="lot40"  HeaderText="Lot 40"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot41" SortExpression="lot41"  HeaderText="Lot 41"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot42" SortExpression="lot42"  HeaderText="Lot 42"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot43" SortExpression="lot43"  HeaderText="Lot 43"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot44" SortExpression="lot44"  HeaderText="Lot 44"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot45" SortExpression="lot45"  HeaderText="Lot 45"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot46" SortExpression="lot46"  HeaderText="Lot 46"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot47" SortExpression="lot47"  HeaderText="Lot 47"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot48" SortExpression="lot48"  HeaderText="Lot 48"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot49" SortExpression="lot49"  HeaderText="Lot 49"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot50" SortExpression="lot50"  HeaderText="Lot 50"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot51" SortExpression="lot51"  HeaderText="Lot 51"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot52" SortExpression="lot52"  HeaderText="Lot 52"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot53" SortExpression="lot53"  HeaderText="Lot 53"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot54" SortExpression="lot54"  HeaderText="Lot 54"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot55" SortExpression="lot55"  HeaderText="Lot 55"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lot56" SortExpression="lot56"  HeaderText="Lot 56"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot57" SortExpression="lot57"  HeaderText="Lot 57"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot58" SortExpression="lot58"  HeaderText="Lot 58"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot59" SortExpression="lot59"  HeaderText="Lot 59"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot60" SortExpression="lot60"  HeaderText="Lot 60"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="length" SortExpression="length"  HeaderText="Length" DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="width" SortExpression="width"  HeaderText="Width" DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="height" SortExpression="height"  HeaderText="Height" DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="vol" SortExpression="vol"  HeaderText="Vol." DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="wt" SortExpression="wt"  HeaderText="Wt." DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="netwt" SortExpression="netwt"  HeaderText="Net Wt." DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="lotskudescr" SortExpression="lotskudescr"  HeaderText="SKU Descr." DataFormatString="{0:#,0.####}"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotuom" SortExpression="lotuom"  HeaderText="Lot UOM"   >
                            <HeaderStyle Wrap="False"></HeaderStyle>
							<ItemStyle Wrap="False" ></ItemStyle>
                    </telerik:GridBoundColumn>
 
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
    </MasterTableView>
        </telerik:RadGrid></div>
  
    </form>
</body>
</html>
