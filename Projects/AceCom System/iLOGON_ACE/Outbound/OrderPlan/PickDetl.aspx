<%@ Page Language="c#" CodeBehind="PickDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.OrderPlan.PickDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PickDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script>
			location.href="#AddPanel";
    </script>
     <script type="text/javascript">
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
    <div style="height: 100%" id="div1">
    <table cellspacing="0" cellpadding="0" border="0" width="100%" visible="false">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="IdLbl" runat="server" Visible="false"></asp:Label>
                </div> <br />
                 <asp:Button ID="UnallocateBtn" CssClass="white" runat="server" OnClick="UnallocateBtn_Click" Visible="true"  
                    Text="Unallocate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />             
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
       <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging ="true"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" 
                OnItemDataBound="ResultDG_ItemDataBound" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50"  
                DataKeyNames="id" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                         <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                         <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="DeletePickDetail"
                            onclick="return confirm('Confirm delete?')" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete From Order Plan"
                                runat="server"></a>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridTemplateColumn AllowFiltering ="false">
                       <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                     </telerik:GridTemplateColumn>
                      <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" SortExpression="isid" HeaderText="ISNo" Display="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="IssueNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="line" SortExpression="line" HeaderText="Line" AllowFiltering ="false"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="status" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skupackqty" SortExpression="skupackqty" HeaderText="Qty"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty" HeaderText="Packed Qty"
                    DataFormatString="{0:#,0.##}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn  DataField="lot8" SortExpression="lot8" HeaderText="Lot8"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" AllowFiltering="true"
                            SortExpression="lot9" UniqueName="lot9" Reorderable="true"  DataFormatString="&nbsp;{0}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" AllowFiltering="true"
                            SortExpression="lot10" UniqueName="lot10" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" AllowFiltering="true"
                            SortExpression="lot11" UniqueName="lot11" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" AllowFiltering="true"
                            SortExpression="lot12" UniqueName="lot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" AllowFiltering="true"
                            SortExpression="lot13" UniqueName="lot13" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" AllowFiltering="true"
                            SortExpression="lot14" UniqueName="lot14" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" AllowFiltering="true"
                            SortExpression="lot15" UniqueName="lot15" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" AllowFiltering="true"
                            SortExpression="lot16" UniqueName="lot16" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" AllowFiltering="true"
                            SortExpression="lot17" UniqueName="lot17" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" AllowFiltering="true"
                            SortExpression="lot18" UniqueName="lot18" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" AllowFiltering="true"
                            SortExpression="lot19" UniqueName="lot19" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" AllowFiltering="true"
                            SortExpression="lot20" UniqueName="lot20" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" AllowFiltering="true"
                            SortExpression="lot21" UniqueName="lot21" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" AllowFiltering="true"
                            SortExpression="lot22" UniqueName="lot22" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" AllowFiltering="true"
                            SortExpression="lot23" UniqueName="lot23" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" AllowFiltering="true"
                            SortExpression="lot24" UniqueName="lot24" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" AllowFiltering="true"
                            SortExpression="lot25" UniqueName="lot25" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" AllowFiltering="true"
                            SortExpression="lot26" UniqueName="lot26" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" AllowFiltering="true"
                            SortExpression="lot27" UniqueName="lot27" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" AllowFiltering="true"
                            SortExpression="lot28" UniqueName="lot28" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" AllowFiltering="true"
                            SortExpression="lot29" UniqueName="lot29" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" AllowFiltering="true"
                            SortExpression="lot30" UniqueName="lot30" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" AllowFiltering="true"
                            SortExpression="lot31" UniqueName="lot31" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" AllowFiltering="true"
                            SortExpression="lot32" UniqueName="lot32" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" AllowFiltering="true"
                            SortExpression="lot33" UniqueName="lot33" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" AllowFiltering="true"
                            SortExpression="lot34" UniqueName="lot34" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" AllowFiltering="true"
                            SortExpression="lot35" UniqueName="lot35" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" AllowFiltering="true"
                            SortExpression="lot36" UniqueName="lot36" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" AllowFiltering="true"
                            SortExpression="lot37" UniqueName="lot37" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" AllowFiltering="true"
                            SortExpression="lot38" UniqueName="lot38" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" AllowFiltering="true"
                            SortExpression="lot39" UniqueName="lot39" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" AllowFiltering="true"
                            SortExpression="lot40" UniqueName="lot40" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" AllowFiltering="true"
                            SortExpression="lot41" UniqueName="lot41" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" AllowFiltering="true"
                            SortExpression="lot42" UniqueName="lot42" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" AllowFiltering="true"
                            SortExpression="lot43" UniqueName="lot43" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" AllowFiltering="true"
                            SortExpression="lot44" UniqueName="lot44" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" AllowFiltering="true"
                            SortExpression="lot45" UniqueName="lot45" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" AllowFiltering="true"
                            SortExpression="lot46" UniqueName="lot46" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" AllowFiltering="true"
                            SortExpression="lot47" UniqueName="lot47" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" AllowFiltering="true"
                            SortExpression="lot48" UniqueName="lot48" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" AllowFiltering="true"
                            SortExpression="lot49" UniqueName="lot49" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" AllowFiltering="true"
                            SortExpression="lot50" UniqueName="lot50" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" AllowFiltering="true"
                            SortExpression="lot51" UniqueName="lot51" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" AllowFiltering="true"
                            SortExpression="lot52" UniqueName="lot52" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" AllowFiltering="true"
                            SortExpression="lot53" UniqueName="lot53" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" AllowFiltering="true"
                            SortExpression="lot54" UniqueName="lot54" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" AllowFiltering="true"
                            SortExpression="lot55" UniqueName="lot55" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" AllowFiltering="true"
                            SortExpression="lot56" UniqueName="lot56" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" AllowFiltering="true"
                            SortExpression="lot57" UniqueName="lot57" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" AllowFiltering="true"
                            SortExpression="lot58" UniqueName="lot58" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" AllowFiltering="true"
                            SortExpression="lot59" UniqueName="lot59" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" AllowFiltering="true"
                            SortExpression="lot60" UniqueName="lot60" Reorderable="true">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Rcv Date"
                    DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="Lot"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                          
                         <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn  DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        
                         <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="statuscolor" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    </form>
</body>
</html>
