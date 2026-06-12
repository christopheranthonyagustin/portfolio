<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvCountV3</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    
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
<body leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    Inventory&nbsp;CountV2&nbsp;(Step&nbsp;2 of&nbsp;2)</div>
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                <asp:Button ID="YesBtn" runat="server" Text=" Yes " Visible="False" CssClass="detailButton"
                    OnClick="YesBtn_Click"></asp:Button>
                <asp:Button Style="z-index: 0" ID="BackBtn" runat="server" CssClass="detailButton"
                    Text=" Back " OnClick="BackBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="SaveBtn" runat="server" CssClass="detailButton"
                    Text=" Save " OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                <asp:Button Style="z-index: 0" ID="CancelBtn" runat="server" CssClass="detailButton"
                    Text="Cancel" CausesValidation="False" OnClick="CancelBtn_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-ClientEvents-OnScroll="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender = "ResultDG_PreRender"            
        OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkbox" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Location" DataField="loccode" SortExpression="loccode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TUNO1" DataField="tuno1" SortExpression="tuno1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TUNO2" DataField="tuno2" SortExpression="tuno2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SKUCode" DataField="skucode" SortExpression="skucode">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SKUDescr" DataField="skudescr" SortExpression="skudescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot" DataField="lotid" SortExpression="lotid">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="OnHandQty" DataField="onhandqty" SortExpression="onhandqty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AllocatedQty" DataField="allocatedqty" SortExpression="allocatedqty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="PickedQty" DataField="pickedqty" SortExpression="pickedqty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="HeldQty" DataField="heldqty" SortExpression="heldqty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AvailQty" DataField="availqty" SortExpression="availqty">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ReceiveDate" DataField="rcdate" SortExpression="rcdate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot1" DataField="lot1" SortExpression="lot1"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot2" DataField="lot2" SortExpression="lot2"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot3" DataField="lot3" SortExpression="lot3"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot4" DataField="lot4" SortExpression="lot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot5" DataField="lot5" SortExpression="lot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot6" DataField="lot6" SortExpression="lot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot7" DataField="lot7value" SortExpression="lot7value">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot8" DataField="lot8value" SortExpression="lot8value">
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
              </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>