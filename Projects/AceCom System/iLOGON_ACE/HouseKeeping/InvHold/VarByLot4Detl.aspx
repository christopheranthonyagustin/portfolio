<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VarByLot4Detl.aspx.cs" Inherits="iWMS.Web.HouseKeeping.InvHold.VarByLot4Detl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>VarianceByLot4</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
        function CheckAllDataGridCheckBoxes(aspCheckBoxID, checkVal) {
            re = new RegExp(':' + aspCheckBoxID + '$')  //generated control name starts with a colon
            for (i = 0; i < Form1.elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'checkbox') {
                    if (re.test(elm.name))
                        elm.checked = checkVal
                }
            }
        }
    </script>
    </head>
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="Form1" method="post" runat="server">
      <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
		        <td align="left">
		            &nbsp;<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/msexcel.png"
					    width="40" height="40" runat="server"></A>
                    <br />
                    <br />       
		        </td>
		    </tr>
        </table>
         <div id="div-datagrid" style="HEIGHT:92%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" 
            OnNeedDataSource="ResultDG_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                 <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="tuno1" HeaderText="TU1" SortExpression="tuno1">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="tuno2" HeaderText="TU2" SortExpression="tuno2">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="skucode" HeaderText="SKU" SortExpression="skucode">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="skudescr" HeaderText="Description" SortExpression="skudescr">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="qty" HeaderText="Qty" SortExpression="qty" DataFormatString="{0:#,0.##}">
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="ihvarstatusdescr" HeaderText="Status" SortExpression="ihvarstatusdescr" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="rem1" HeaderText="Remarks" SortExpression="rem1" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="rem2" HeaderText="Remarks2" SortExpression="rem2" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="adddate" HeaderText="AddDate" SortExpression="adddate" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="adduser" HeaderText="AddUser" SortExpression="adduser" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                 <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                 
        
        
        
        
                </Columns>
			</MasterTableView>
			</telerik:RadGrid>
        </div>
    </form>
</body>
</html>
