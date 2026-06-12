<%@ Page language="c#" Codebehind="AdjDetl2.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.Adjustment.AdjDetl2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>AdjDetl2</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="C#" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<LINK href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet"/>
  	   <script type="text/javascript" src="../../js/row.js"></script>
	</head>
	<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			  <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
      <div id="div1">
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="AjIdLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                </td>
            </tr>
        </table>
    </div>
			 <div id="div-datagrid"   style="height: 380px;">
 
			<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" AllowSorting="True"
            AllowFilteringByColumn="True" EnableLinqExpressions="False" AllowPaging="True"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            GroupPanelPosition="Top">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                
                     <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="System Remark">
                      
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
                    
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                     
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SkuDescription">
                     
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot ID">
                   
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                   
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                       
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adjusteduomqty" SortExpression="adjusteduomqty" HeaderText="Adj.Qty">
                    
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM">
                  
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
             
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv.Date" DataFormatString="{0:dd/MMM/yyyy}">
                 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot 4" >
                
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot 1" DataFormatString="{0:dd/MMM/yyyy}">
                  
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot 5" >
                  
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot 6" >
                   
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot 7" >
                 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot 2" DataFormatString="{0:dd/MMM/yyyy}">
                
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot 3" DataFormatString="{0:dd/MMM/yyyy}">
                    
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot 8" >
                    
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="reasondescr" SortExpression="reasondescr" HeaderText="Reason" >
                   
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                      
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User" >
             
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" >
                
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User" >
                      
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                    </telerik:GridBoundColumn>
					
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
        </telerik:RadGrid></div>
		</form>
	</body>
</html>
