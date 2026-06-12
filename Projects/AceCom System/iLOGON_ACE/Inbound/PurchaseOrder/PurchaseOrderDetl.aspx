<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="PurchaseOrderDetl.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Inbound.PurchaseOrder.PurchaseOrderDetl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>PurchaseOrder</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script src="../../js/Script.js" type="text/javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <br />
                            &nbsp;&nbsp;<asp:Label ID="POIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                            <br />
                            <br />
                            &nbsp;<iWMS:iPopup style="z-index: 0" ID="InputPopup" runat="server" ButtonText="New"
                                InputBoxWidth="850" InputBoxHeight="460" PageUrl="DetailInput.aspx" Mode="ADD"
                                Type="BTN" Visible="False"></iWMS:iPopup>
                            &nbsp;
                            <asp:Button ID="ChangeAccountandSiteBtn" runat="server" Text="Change Account" OnClick="ChangeAccountandSiteBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)"
                                    UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                             &nbsp;
                            <asp:Button ID="SplitLineBtn" runat="server" Text="Line Split" OnClick="SplitLineBtn_Click"
                                    OnClientClick="disableBtn(this.id,false)"
                                    UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                             &nbsp;
                            <asp:Button ID="PopulateGRBtn" runat="server" Text="Populate GR" OnClick="PopulateGRBtn_Click"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="LongLabelWhite" />
                             &nbsp;
                            <asp:Button ID="CloseDetailBtn" class="white" runat="server" OnClick="CloseDetailBtn_Click" Text="Close" Visible="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            &nbsp;
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" AllowFilteringByColumn ="true" GridLines="None"
                    Skin="Metro" AllowSorting="true" OnItemDataBound="ResultDG_ItemDataBound"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling ScrollHeight="400px" UseStaticHeaders="True" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server"/>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false"  AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <%--<asp:Label ID="DetailLbl" runat="server"></asp:Label>--%>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="Edit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="RCDetail" ImageUrl="../../image/pickdetail.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="RC Detail"
                                        OnClick="RCDetail_Click" CausesValidation="False"></asp:ImageButton>
                                    <a id="lnkDelete" onclick="return confirm('Confirm delete?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        runat="server" onserverclick="PODetail_Delete">
                                        <img id="delImg" border="0" alt="Delete PO Detail" src="../../image/bin.gif" width="15"
                                            height="15" runat="server" /></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Visible="False" DataField="id" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="line" HeaderText="Line" SortExpression="line"  AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="poline" HeaderText="PoLine" SortExpression="poline">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PODTAcCode" UniqueName="PODTAcCode" HeaderText="Account" SortExpression="PODTAcCode">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skucode" HeaderText="Sku" SortExpression="skucode">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="skuid" />
                            <telerik:GridBoundColumn DataField="skudescr" HeaderText="SKU Descr" SortExpression="skudescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="statuscolor">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="uomdescr" HeaderText="UOM" SortExpression="uomdescr" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Visible="False" DataField="ordereduomqty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ordereduomqty" HeaderText="Ordered" SortExpression="ordereduomqty" AllowFiltering="false"
                                DataFormatString="{0:#,0.##}">
                                <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Visible="False" DataField="intransitqty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="intransituomqty" HeaderText="In Transit" SortExpression="intransituomqty" AllowFiltering="false"
                                DataFormatString="{0:#,0.##}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="receivedqty">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="receiveduomqty" HeaderText="Received" SortExpression="receiveduomqty" AllowFiltering="false"
                                DataFormatString="{0:#,0.##}">
                                <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="sitedescr" HeaderText="SiteCode" SortExpression="sitedescr">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
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
                            <telerik:GridBoundColumn DataField="hullno" HeaderText="HullNo" SortExpression="hullno">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expdate" HeaderText="ExpDate" SortExpression="expdate"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" HeaderText="Add Date" SortExpression="adddate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" HeaderText="Add User" SortExpression="adduser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" HeaderText="Edit Date" SortExpression="editdate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" HeaderText="Edit User" SortExpression="edituser">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PODTAcId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
