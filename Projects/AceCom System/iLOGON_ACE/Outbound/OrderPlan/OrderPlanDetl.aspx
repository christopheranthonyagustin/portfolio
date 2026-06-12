<%@ Page Language="c#" CodeBehind="OrderPlanDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.OrderPlan.OrderPlanDetl" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OrderPlanDetl</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    
    <style type="text/css">
        .center {
                display: block;
                margin-left: auto;
                margin-right: auto;
                }
    </style>
</head>

<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
       <br />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="OrderSummaryTab" Text="OrderSummary" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                 <telerik:RadTab  Id="OrderLineTab" Text="OrderLine" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab  Id="OrderLogTab" Text="OrderLog" Value="100"  runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <table cellspacing="10" cellpadding="0" border="0" width="100%">
                <tr>
                    <td>
                        <asp:Button ID="AllocateBtn" runat="server" Text="Allocate" CssClass="white" OnClick="AllocateBtn_Click" Visible="false" />
                        &nbsp;
                        <asp:Button ID="UnallocateBtn" runat="server" Text="Unallocate" CssClass="white" OnClick="UnallocateBtn_Click" Visible="true"
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="PickTix" class="blue" runat="server" OnClick="PickTixBtn_Click"
                            Text="Pick Ticket" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="DComTix" CssClass="LongLabelBlue" runat="server" OnClick="DConTixBtn_Click"
                            Text="Deconsolidated Pick Ticket" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                         &nbsp;
                        <asp:Button ID="BookTransportBtn" CssClass="LongLabelGreen" runat="server" OnClick="BookTransportBtn_Click"
                            Text="&nbsp;&nbsp;&nbsp;Book&nbsp;&nbsp;&nbsp; Transport" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="ReleaseToOpsBtn" CssClass="LongLabelWhite" runat="server" OnClick="ReleaseToOpsBtn_Click"
                            Text="Release To Ops" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging="true"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                    DataKeyNames="id" Name="ParentGrid">
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
                                <a id="lnkDeletePD" href='<%#DataBinder.Eval(Container,"DataItem.isid")%>' onclick="return confirm('Confirm delete ALL Pick Detail?')"
                                    onserverclick="OPDetail_DeletePD" runat="server">
                                    <img id="delPDImg" src="../../image/deletepickdetail.gif" width="12" height="13"
                                        border="0" alt="Delete ALL Pick Detail" runat="server"></a> <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            onclick="return confirm('Confirm delete?')" onserverclick="OPDetail_Delete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete From Order Plan"
                                                runat="server"></a>&nbsp;
                                <asp:ImageButton ID="LightingImg" runat="server" Visible="False" ImageUrl="../../image/lightning.png"
                                    Width="15" Height="15" AlternateText="BookTransportDone" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn AllowFiltering="false">
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="BookTransportDone" AllowFiltering="false" HeaderText="&nbsp;&nbsp; Book &nbsp; <br/>Transport" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="acId" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="IssueNo "
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" HeaderText="Priority"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Grp" SortExpression="Grp" HeaderText="Group"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="routedescr" SortExpression="routedescr" HeaderText="Route"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                            DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Csgn"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="Consignee"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate"
                            DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRefNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ExtRef1"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="ExtDate 1"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="shcountrycode" SortExpression="shcountrycode" HeaderText="Country"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vsl.Voy"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn
                            DataField="etd" SortExpression="etd" HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark 1"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark 2"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="picktoclear" SortExpression="picktoclear" HeaderText="Pick-To-Clear"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="statuscolor" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false" />
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
            <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                
        
    </form>
</body>
</html>
