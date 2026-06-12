<%@ Page Language="c#" CodeBehind="InvCountDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Audit.InvCount.InvCountDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>InvCountDetl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
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
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
              <%--  &nbsp;
                <asp:Button ID="AddDetailBtn" runat="server" Visible="False" Text="Add Candidate"
                    CssClass="detailButton" OnClick="AddDetailBtn_Click"></asp:Button>
                &nbsp;&nbsp;
                <asp:ImageButton ID="DeleteLineBtn" runat="server" ImageUrl="../../Image/Delete.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="DeleteLineBtn_Click" />&nbsp;&nbsp;
                <asp:ImageButton ID="ButtonExcel" runat="server" ImageUrl="../../Image/Excel.png"
                    ToolTip="Export To Excel" OnClick="ButtonExcel_Click" BackColor="Transparent"
                    BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle" />
                &nbsp;&nbsp;--%>
                     <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" 
                    Visible="False"  Text="+ Candidate" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                     <asp:Button ID="DeleteLineBtn" class="white" runat="server" OnClick="DeleteLineBtn_Click" 
                    Visible="true"  Text="Delete" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 &nbsp;
                  <asp:Button ID="ButtonExcel" class="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" 
                     />
            </td>
        </tr>
    </table>
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
        OnPreRender="ResultDG_PreRender" OnPageIndexChanged="ResultDG_PageIndexChanged"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Scrolling AllowScroll="true" ScrollHeight="300px" SaveScrollPosition="true" />
            <ClientEvents OnGridCreated="GridCreated" />
        </ClientSettings>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
            FileName="InventoryCount">
            <Excel Format="Html" />
        </ExportSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" Reorderable="false">
                    <HeaderTemplate>
                        <%--No need to lock Record for this version : 4396 %>
                                <%--<a id="lnkLock" href='#' onclick="return confirm('Confirm Lock Inventory Count?')" onserverclick="LockInvCount"
									    runat="server"><img id="lockImg" src="..\..\image\holdinv.gif" Width="15" Height="15" border="0" alt="Lock Inv.Count"
										    runat="server"></a>--%>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="lineChkbx" runat="server" />
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete inv.count detail?')"
                            onserverclick="ICDetl_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Inv.Count Detail"
                                title="Delete Inv.Count Detail" runat="server" /></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="status" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="line" SortExpression="line" HeaderText="Line#"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SkuDescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skugroupdescr" SortExpression="skugroupdescr"
                    HeaderText="SkuGroup">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno2" HeaderText="TU#1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="OnHandQty"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" SortExpression="lot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" SortExpression="lot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" SortExpression="lot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" SortExpression="lot12">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" SortExpression="lot13">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" SortExpression="lot14">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" SortExpression="lot15">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" SortExpression="lot16">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" SortExpression="lot17">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" SortExpression="lot18">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" SortExpression="lot19">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" SortExpression="lot20">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" SortExpression="lot21">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" SortExpression="lot22">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" SortExpression="lot23">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" SortExpression="lot24">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" SortExpression="lot25">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" SortExpression="lot26">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" SortExpression="lot27">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" SortExpression="lot28">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" SortExpression="lot29">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" SortExpression="lot30">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" SortExpression="lot31">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" SortExpression="lot32">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" SortExpression="lot33">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" SortExpression="lot34">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" SortExpression="lot35">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" SortExpression="lot36">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" SortExpression="lot37">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" SortExpression="lot38">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" SortExpression="lot39">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" SortExpression="lot40">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" SortExpression="lot41">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" SortExpression="lot42">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" SortExpression="lot43">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" SortExpression="lot44">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" SortExpression="lot45">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" SortExpression="lot46">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" SortExpression="lot47">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" SortExpression="lot48">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" SortExpression="lot49">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" SortExpression="lot50">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" SortExpression="lot51">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" SortExpression="lot52">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" SortExpression="lot53">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" SortExpression="lot54">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" SortExpression="lot55">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" SortExpression="lot56">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" SortExpression="lot57">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" SortExpression="lot58">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" SortExpression="lot59">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" SortExpression="lot60">
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
