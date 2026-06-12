<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiptRegisterV2Search.aspx.cs"
    Inherits="iWMS.Web.Inbound.ReceiptRegisterV2.ReceiptRegisterV2Search" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReceiptRegisterV2Search</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <br />
                <asp:ImageButton ID="NewSearchBtn" runat="server" ImageUrl="../../Image/NewSearch.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="NewSearchBtn_Click" />
                &nbsp;&nbsp;
                <asp:ImageButton ID="AddNewBtn" runat="server" ImageUrl="../../Image/CreateNew.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="AddNewBtn_Click" /> 
                <br />
                <br />
            </td>
        </tr>
    </table>
    <asp:Panel ID="SearchPanel" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="SearchBtn_Click" />
                    &nbsp;
                    <asp:ImageButton ID="HideSearchBtn" runat="server" ImageUrl="../../Image/Hide.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="HideSearchBtn_Click" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            Width="120%" Height="86%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            AllowPaging="true" AllowSorting="true" Skin="Office2007" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
            AllowAutomaticInserts="True">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                EditMode="InPlace" HierarchyLoadMode="Client">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <a id="lnkDelete" onclick="return confirm('Confirm Cancel?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                runat="server" onserverclick="RCHead_Cancel">
                                <img id="delImg" border="0" alt="Cancel Receipt" src="..\..\image\bin.gif" width="15"
                                    height="15" runat="server" visible="false"></a>
                            <asp:Label ID="RcFinalizeLbl" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="id" DataField="id" AllowFiltering="true" UniqueName="id"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true"
                        UniqueName="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                        UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo"
                        UniqueName="number" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="suname" SortExpression="suname" HeaderText="Supplier"
                        UniqueName="suname" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustomerRef"
                        UniqueName="exref1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuCodeList" SortExpression="skuCodeList" HeaderText="SKUCode"
                        UniqueName="skuCodeList" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuDescrList" SortExpression="skuDescrList" HeaderText="SKUDescr"
                        UniqueName="skuDescrList" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TotalLHUQty" SortExpression="TotalLHUQty" HeaderText="TotalLHUQty"
                        UniqueName="TotalLHUQty" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="gateindate" SortExpression="gateindate" HeaderText="ReceiveDate"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        UniqueName="statusdescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="status" DataField="status" AllowFiltering="true"
                        UniqueName="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="statuscolor" DataField="statuscolor" AllowFiltering="true"
                        UniqueName="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" Width="100%"
                        AllowPaging="false" AllowFilteringByColumn="false" RetainExpandStateOnRebind="true">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="rcid" MasterKeyField="id" />
                        </ParentTableRelation>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="50px">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                    <asp:Label ID="ExplodeUOMLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="id" Reorderable="true"
                                Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" AllowFiltering="true" UniqueName="acid"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skuid" AllowFiltering="true" UniqueName="skuid"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                                UniqueName="skucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rcsskudescr" SortExpression="rcsskudescr" HeaderText="SKUDescription"
                                UniqueName="rcsskudescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty"
                                HeaderText="Qty" UniqueName="expecteduomqty" Reorderable="true" DataFormatString="{0:#.##}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="ReceievedDate"
                                UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="" UniqueName="lot1"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Display="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="" UniqueName="lot2"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Display="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="" UniqueName="lot3"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Display="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="" UniqueName="lot4"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="" UniqueName="lot5"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="" UniqueName="lot6"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="" UniqueName="lot7"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="" UniqueName="lot8"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="" UniqueName="lot9"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="" UniqueName="lot10"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="" UniqueName="lot11"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="" UniqueName="lot12"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot13" SortExpression="lot13" HeaderText="" UniqueName="lot13"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot14" SortExpression="lot14" HeaderText="" UniqueName="lot14"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot15" SortExpression="lot15" HeaderText="" UniqueName="lot15"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot16" SortExpression="lot16" HeaderText="" UniqueName="lot16"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot17" SortExpression="lot17" HeaderText="" UniqueName="lot17"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot18" SortExpression="lot18" HeaderText="" UniqueName="lot18"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot19" SortExpression="lot19" HeaderText="" UniqueName="lot19"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lot20" SortExpression="lot20" HeaderText="" UniqueName="lot20"
                                Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="loccode" HeaderText="RecLoc" SortExpression="loccode"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="paloccode" HeaderText="PALoc" SortExpression="paloc"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tuno1" HeaderText="TUno1" SortExpression="tuno1"
                                UniqueName="tuno1" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tuno2" HeaderText="TUno2" SortExpression="tuno2"
                                UniqueName="tuno2" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="rcdstatusdescr" HeaderText="Status" SortExpression="rcdstatusdescr"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="10000px" ItemStyle-Width="10000px">
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    </form>
</body>
</html>
