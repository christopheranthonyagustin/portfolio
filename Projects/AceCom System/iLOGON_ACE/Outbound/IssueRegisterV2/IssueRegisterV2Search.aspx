<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueRegisterV2Search.aspx.cs"
    Inherits="iWMS.Web.Outbound.IssueRegisterV2.IssueRegisterV2Search" %>

<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>SkuSearch</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <%--<base target="_self" />--%>

    <script language="javascript" type="text/javascriid">
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
    <table cellspacing="7" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <asp:ImageButton ID="NewSearchBtn" runat="server" ImageUrl="../../Image/NewSearch.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="NewSearchBtn_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="AddNewBtn" runat="server" ImageUrl="../../Image/CreateNew.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="AddNewBtn_Click" />               
            </td>
        </tr>
    </table>
    <asp:Panel ID="SearchPanel" runat="server">
        <table border="0" cellspacing="7" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="SearchBtn_Click" />
                    &nbsp;
                    <asp:ImageButton ID="HideSearchBtn" runat="server" ImageUrl="../../Image/Hide.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="HideSearchBtn_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table cellspacing="7" cellpadding="0" border="0" width="100%">
        <tr>
            <td valign="middle">
                <br />
                <asp:Label ID="IssueIdLbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>
                <asp:ImageButton ID="MassUnAllocateBtn" runat="server" ImageUrl="../../Image/UnallocateButton.png"
                    Skin="WebBlue"  BackColor="Transparent" BorderWidth="0"
                    ImageAlign="AbsMiddle" ToolTip="Unallocated Issue Detail(s)" OnClick="MassUnAllocateBtn_Click"
                    OnClientClick="return confirm('Confirm to Mass Unallocate the selected SKU Lines?')" />
                &nbsp;
                <asp:ImageButton ID="MassAllocateBtn" runat="server" ImageUrl="../../Image/AllocateButton.png"
                    Skin="WebBlue"  BackColor="Transparent" BorderWidth="0"
                    ImageAlign="AbsMiddle" ToolTip="Allocated Issue Detail(s)" OnClick="MassAllocateBtn_Click"
                    OnClientClick="return confirm('Confirm to Mass Allocate the selected SKU Lines?')" />
                &nbsp;
                <asp:ImageButton ID="MassDeleteBtn" runat="server" ImageUrl="../../Image/delete.png"
                    Skin="WebBlue" OnClick="MassDeleteBtn_Click"  Visible="true"
                    BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle" ToolTip="Delete Issue Detail(s)"
                    OnClientClick="return confirm('Confirm to Mass Delete the selected SKU Lines?')" />
            </td>
        </tr>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
        AllowAutomaticInserts="True" Width="100%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" PageSize="50"
            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true" HierarchyLoadMode="Client">
            <%--//----- If you want to add columns ,please add also COL_LOT_4 or COL_LOT_1 in cs page for Lot Header Hide/Show----//--%>
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemStyle Wrap="false" />
                    <ItemTemplate>
                        <asp:CheckBox ID="MassUnallocateChkbx" runat="server" />
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <%--<asp:Label ID="ChooseLotLbl" runat="server"></asp:Label>--%>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn AllowFiltering="false">
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn Display="False" DataField="acid" ColumnGroupName="acid"
                    SortExpression="acid" UniqueName="acid" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="isid" ColumnGroupName="isid"
                    SortExpression="isid" UniqueName="isid" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <%--<telerik:GridBoundColumn Display="False" DataField="ptid">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>--%>
                <telerik:GridBoundColumn Display="False" DataField="isdtid" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="status" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="skuid" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="Issue#"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Issue#"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="typedescr" SortExpression="type" HeaderText="Type"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="expdate" HeaderText="Date" SortExpression="expdate"
                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy}">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerRef"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="exref1" Display="false" SortExpression="exref1"
                    HeaderText="ExternalRef" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="grp" Display="false" SortExpression="grp" HeaderText="Group"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sealno" Display="false" SortExpression="sealno"
                    HeaderText="Sealno" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" ItemStyle-Wrap="false"
                    Display="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="ptdstatusdescr" Display="false" SortExpression="ptdstatusdescr"
                    HeaderText="Picked Status" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="expectedqty" SortExpression="expectedqty" HeaderText="Qty"
                    DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="packedqty" Display="false" SortExpression="packedqty"
                    HeaderText="Packed Qty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" HeaderText="Expected" DataField="expecteduomqty"
                    AllowFiltering="true" SortExpression="expecteduomqty" UniqueName="expecteduomqty"
                    Reorderable="true" DataFormatString="{0:#,0.##}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" HeaderText="Rcv Date" DataField="rcdate"
                    AllowFiltering="true" SortExpression="rcdate" UniqueName="rcdate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot1" HeaderText="Lot1" SortExpression="lot1"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot2" HeaderText="Lot2" SortExpression="lot2"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot3" HeaderText="Lot3" SortExpression="lot3"
                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" HeaderText="Lot4" SortExpression="lot4"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" HeaderText="Lot5" SortExpression="lot5"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot6" HeaderText="Lot6" SortExpression="lot6"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot7" HeaderText="Lot7" SortExpression="lot7"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot8" HeaderText="Lot8" SortExpression="lot8"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot9" HeaderText="Lot9" SortExpression="lot9"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot10" HeaderText="Lot10" SortExpression="lot10"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot11" HeaderText="Lot11" SortExpression="lot11"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot12" HeaderText="Lot12" SortExpression="lot12"
                    ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" Display="false" SortExpression="statusdescr"
                    HeaderText="Issue Status" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                </telerik:GridBoundColumn>
            </Columns>
            <%--//----- If you want to add columns ,please add also COL_LOT_4 or COL_LOT_1 in cs page for Lot Header Hide/Show----//--%>
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />
                    <%--<CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Add Personnel" />--%>
                    <ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="isid" MasterKeyField="id" />
                    </ParentTableRelation>
                    <Columns>
                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="70px">
                            <ItemTemplate>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        runat="server" onserverclick="ldDetailDelete_Click">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" /></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>--%>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            Display="false">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="SIV No" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isdtid" SortExpression="isdtid" HeaderText="isdtid"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" SortExpression="isid" HeaderText="isid"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo"
                            AllowFiltering="false" ItemStyle-Wrap="false" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exline" SortExpression="exline" HeaderText="ExLine"
                            AllowFiltering="false" ItemStyle-Wrap="false" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zonecode" Display="false" SortExpression="zonecode"
                            HeaderText="Zone" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" Display="false" SortExpression="loccode"
                            HeaderText="Loc" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="loccheckdigit" Display="false" UniqueName="loccheckdigit"
                            HeaderText="Checkdigits">
                            <ItemTemplate>
                                <asp:TextBox ID="checkdigitText" runat="server" Visible="true" Text='<%# Eval("loccheckdigit") %>'>
                                </asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="skupackqty" SortExpression="skupackqty" HeaderText="Qty"
                            DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                            ItemStyle-Wrap="false" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc"
                            ItemStyle-Wrap="false" Display="false">
                            <ItemTemplate>
                                <asp:TextBox ID="palocText" runat="server" Visible="true" Text='<%# Eval("paloccode") %>'>                          
                                </asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="paloccheckdigit" Display="false" UniqueName="paloccheckdigit"
                            HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:TextBox ID="pacheckdigitText" runat="server" Visible="true" Text='<%# Eval("paloccheckdigit") %>'>                          
                                </asp:TextBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" Display="false" HeaderText="PaQty"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" Display="false" HeaderText="Pa Uom"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skupackpackedqty" Display="false" SortExpression="skupackpackedqty"
                            HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <%--22--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot4" AllowFiltering="true" SortExpression="lot4"
                            UniqueName="lot4" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot1" AllowFiltering="true" SortExpression="lot1"
                            UniqueName="lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                        </telerik:GridBoundColumn>
                        <%--23--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot5" AllowFiltering="true" SortExpression="lot5"
                            UniqueName="lot5" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <%--24--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot6" AllowFiltering="true" SortExpression="lot6"
                            UniqueName="lot6" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <%--25--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot7" AllowFiltering="true" SortExpression="lot7"
                            UniqueName="lot7" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <%--26--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot2" AllowFiltering="true" SortExpression="lot2"
                            UniqueName="lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                        </telerik:GridBoundColumn>
                        <%--27--%>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot3" AllowFiltering="true" SortExpression="lot3"
                            UniqueName="lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot8" AllowFiltering="true" SortExpression="lot8"
                            UniqueName="lot8" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot9" AllowFiltering="true" SortExpression="lot9"
                            UniqueName="lot9" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot10" AllowFiltering="true" SortExpression="lot10"
                            UniqueName="lot10" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot11" AllowFiltering="true" SortExpression="lot11"
                            UniqueName="lot11" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot12" AllowFiltering="true" SortExpression="lot12"
                            UniqueName="lot12" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot13" AllowFiltering="true" SortExpression="lot13"
                            UniqueName="lot13" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot14" AllowFiltering="true" SortExpression="lot14"
                            UniqueName="lot14" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot15" AllowFiltering="true" SortExpression="lot15"
                            UniqueName="lot15" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot16" AllowFiltering="true" SortExpression="lot16"
                            UniqueName="lot16" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot17" AllowFiltering="true" SortExpression="lot17"
                            UniqueName="lot17" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot18" AllowFiltering="true" SortExpression="lot18"
                            UniqueName="lot18" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot19" AllowFiltering="true" SortExpression="lot19"
                            UniqueName="lot19" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="" DataField="lot20" AllowFiltering="true" SortExpression="lot20"
                            UniqueName="lot20" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true"
                            SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
     <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
