<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SerializedSIVSearch.aspx.cs"
    Inherits="iWMS.Web.Outbound.PickTask.SerializedSIVSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>SIVSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/row.js"></script>

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
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;">
                </a>
            </td>
            <td class="NewModuleTitle" align="left">
                <div class="NewModuleTitle">
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Serialized SIV</asp:Label>
                </div>
            </td>
        </tr>
    </table>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    <asp:ImageButton ID="NewSearchBtn" runat="server" ImageUrl="../../Image/NewSearch.png"
                            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                            OnClick="NewSearchBtn_Click" />
                        &nbsp;
                        <asp:ImageButton ID="PrintBtn" runat="server" ImageUrl="../../Image/Print.png"
                            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                            OnClick="PrintBtn_Click" />
                        &nbsp;
                        <asp:ImageButton ID="ReleaseBtn" runat="server" ImageUrl="../../Image/Release.png"
                            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle" />
                        &nbsp;
                        <asp:ImageButton ID="ConfirmPABtn" runat="server" ImageUrl="../../Image/Confirm.png"
                            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle" OnClick="ConfirmBtn_Click" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="newPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
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
                        <tr>
                            <td>
                                &nbsp;LocCat
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 400px" valign="top">
                                &nbsp;<telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="190px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="LocCatListList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="120px" Width="160px"
                                    Skin="WebBlue" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="20" DataKeyNames="id"  Name="ParentGrid" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemStyle Wrap="false" />
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <%--<asp:Label ID="ChooseLotLbl" runat="server"></asp:Label>--%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="printcount" AllowFiltering="false" UniqueName="printcount"
                        HeaderText="PrintCount" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="sivno"
                        HeaderText="SIV No" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="isid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                        ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" AllowFiltering="true"
                        ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                        UniqueName="skucode" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="rcsskudescr" HeaderText="SKU Descr"
                        UniqueName="rcsskudescr" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn DataField="paloccat" SortExpression="paloccat" HeaderText="LocCat"
                        UniqueName="paloccat" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>                 
                    <telerik:GridBoundColumn DataField="uomqty" SortExpression="uomqty" HeaderText="Qty" UniqueName="uomqty"
                        Reorderable="true" DataFormatString="{0:#.##}" ReadOnly="True">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                       Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn HeaderText="IssueStatus" DataField="ishstatusdescr" AllowFiltering="true"
                        ColumnGroupName="ishstatusdescr" SortExpression="ishstatusdescr" UniqueName="ishstatusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="status" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastPrintUser" SortExpression="LastPrintUser" HeaderText="LastPrintBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastPrintDate" SortExpression="LastPrintDate" HeaderText="LastPrintDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                        InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="isid" AllowFiltering="true" UniqueName="isid"
                                Reorderable="true" Display="false" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ptid" AllowFiltering="true" UniqueName="ptid"
                                Reorderable="true" Display="false" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="acid" AllowFiltering="true" UniqueName="acid"
                                Reorderable="true" Display="false" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skuid" AllowFiltering="true" UniqueName="skuid"
                                Reorderable="true" Display="false" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="sivno"
                        HeaderText="SIV No" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="isno" AllowFiltering="true" UniqueName="isno"
                        HeaderText="IssueNumber" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofsiv" AllowFiltering="true" UniqueName="noofsiv"
                        HeaderText="NoOfSIV" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                        UniqueName="skucode" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="masterskudescr" SortExpression="masterskudescr" HeaderText="SKU Descr"
                        UniqueName="masterskudescr" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>                   
                    <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Qty" UniqueName="expecteduomqty" AllowFiltering="false"
                        Reorderable="true" DataFormatString="{0:#.##}" ReadOnly="True">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                       Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4"
                        ReadOnly="true" UniqueName="lot4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LocCat" HeaderText="LocCat" SortExpression="LocCat"
                        UniqueName="LocCat" ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="shtocode" HeaderText="DeliverTo" SortExpression="shtocode"
                        UniqueName="shtocode" ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MRZone" HeaderText="MRZONE" SortExpression="MRZone"
                        UniqueName="mrzone" ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                        ReadOnly="true" UniqueName="lot1" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                        ReadOnly="true" UniqueName="lot2" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                        ReadOnly="true" UniqueName="lot3" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5"
                        ReadOnly="true" UniqueName="lot5" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6"
                        ReadOnly="true" UniqueName="lot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7"
                        ReadOnly="true" UniqueName="lot7" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="returnFlagDescr" SortExpression="returnFlagDescr"
                        HeaderText="Lot7" ReadOnly="true" UniqueName="returnFlagDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8"
                        ReadOnly="true" UniqueName="lot8" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9"
                        ReadOnly="true" UniqueName="lot9" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10"
                        ReadOnly="true" UniqueName="lot10" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11"
                        ReadOnly="true" UniqueName="lot11" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12"
                        ReadOnly="true" UniqueName="lot12" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ishexref2" HeaderText="DocNo" SortExpression="ishexref2"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ishexref3" HeaderText="RsvNo" SortExpression="ishexref3"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ishexref4" HeaderText="STONo" SortExpression="ishexref4   "
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn> 
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                        UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" HeaderText="TU1" SortExpression="tuno1"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="ishrem1" HeaderText="Remarks" SortExpression="ishrem1"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" HeaderText="TU2" SortExpression="tuno2"
                        ItemStyle-Wrap="false" Display="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status"
                        ItemStyle-Wrap="false" ReadOnly="True" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                        ItemStyle-Wrap="false" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_Src" HeaderText="ITF_Src" UniqueName="ITF_Src" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_SrcDtId" HeaderText="ITF_SrcDtId" UniqueName="ITF_SrcDtId" Display="false">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="ITF_WMS_Dts" HeaderText="ITF_WMS_Dts" UniqueName="ITF_WMS_Dts"
                        SortExpression="ITF_WMS_Dts" ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_MTS_Tran_Dts" HeaderText="ITF_MTS_Tran_Dts" UniqueName="ITF_MTS_Tran_Dts"
                        SortExpression="ITF_MTS_Tran_Dts" ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_Status" HeaderText="ITF_Status" UniqueName="ITF_Status"
                        SortExpression="ITF_Status" ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
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
