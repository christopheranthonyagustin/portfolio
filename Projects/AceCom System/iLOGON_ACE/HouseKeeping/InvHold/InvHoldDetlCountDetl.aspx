<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvHoldDetlCountDetl.aspx.cs"
    Inherits="iWMS.Web.HouseKeeping.InvHold.InvHoldDetlCountDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>Inventory Hold Count Details</title>
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

    <style type="text/css">
        .style1
        {
            width: 7%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td align="left">
                <asp:ImageButton ID="DelImgBtn" runat="server" ImageUrl="../../Image/dustbin.png"
                    OnClick="DeleteAllBtn_Click" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" Width="40" Height="40"
                    ToolTip="Delete ALL CountedRecords" OnClientClick="return confirm('Confirm to delete all CountedRecords?')" />
                &nbsp;&nbsp; <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/msexcel.png"
                        width="40" height="40" runat="server"></a>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="height: 92%">
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        OnNeedDataSource="ResultDG_NeedDataSource" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" >
        
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
   
            <Columns>
                  <telerik:GridTemplateColumn>
                    <HeaderStyle HorizontalAlign="Center" Wrap="false" />
                    <HeaderTemplate>
                        <input id="SelectALLCB" type="checkbox" onclick="CheckAllDataGridCheckBoxes('lineChkbx',this.checked)" />
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="lineChkbx" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU1" >
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                 </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU2" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description" >
                 <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" DataFormatString="{0:#,0.##}">
                       <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9" >
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10" >
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"  DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                      <ItemStyle Wrap="False"></ItemStyle>

                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"  >
                      <HeaderStyle Wrap="False"></HeaderStyle>
                   <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    
                
             
            </Columns>
          <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
        </telerik:RadGrid></div>
    </form>
</body>
</html>
