<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOTORegisterForm.aspx.cs" Inherits="iWMS.Web.Outbound.HOTORegister.HOTORegisterForm" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>HOTORegister</title> 
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">    
    <script type="text/javascript" src="../../js/Script.js"></script>

    <script type="text/javascript">           
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx").checked = false; // for unchecking the checkboxes
                    }
                }
            }
            
        function selectAll2(id) {
                var masterTable = $find("<%= ResultDG2.ClientID %>").get_masterTableView();
                var row = masterTable.get_dataItems();
                if (id.checked == true) {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx2").checked = true; // for checking the checkboxes
                    }
                }
                else {
                    for (var i = 0; i < row.length; i++) {
                        masterTable.get_dataItems()[i].findElement("MassChangeChkbx2").checked = false; // for unchecking the checkboxes
                    }
                }
            }
    </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    &nbsp;
    <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" /> 
    <br />
    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>  
    <br />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <td align="left">
            <div class="NewModuleTitle">
                &nbsp;<asp:Label ID="TitelLbl" labelclass="NewModuleTitle" runat="server">Add DN</asp:Label>
            </div>
        </td>
        <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>  
    </table>
    <br />        
    <asp:Panel ID="scanPanel" runat="server" Visible="false">
        
        <asp:Button ID="BuildHOBtn" CssClass="white" runat="server" OnClick="BuildHOBtn_Click" 
            Text="Build" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 

        <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" 
            Text="Cancel" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 

        <br /><asp:Label id="MRLbl" runat="server" Visible="false"></asp:Label>
        <telerik:RadGrid ID="ScanGrid" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="false" AllowSorting="true" Skin="Office2007" OnNeedDataSource="ScanGrid_NeedDataSource"
            AllowAutomaticInserts="True" Width="100%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="sivno" Name="ParentGrid"
                EditMode="InPlace" Width="100%" HierarchyLoadMode="Client">
                <Columns>
                    <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="isid" DataField="isid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="acid" DataField="acid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SIVNo" DataField="sivno" 
                        ColumnGroupName="sivno" SortExpression="sivno" UniqueName="sivno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" 
                        ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NoOfSIV" DataField="NoOfSIV" 
                        ColumnGroupName="NoOfSIV" SortExpression="NoOfSIV" UniqueName="NoOfSIV" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="MRZone" DataField="route" 
                        ColumnGroupName="route" SortExpression="route" UniqueName="route" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" 
                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PackedQty" DataField="packedqty" 
                        ColumnGroupName="packedqty" SortExpression="packedqty" UniqueName="packedqty"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" 
                        ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>
    <br />
    <asp:Button ID="delBtn" class="white" runat="server" OnClick="delBtn_Click" Text="Delete" UseSubmitBehavior="false" />
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowSorting="true"
        Skin="Office2007" AllowPaging="true" OnNeedDataSource="ResultDG_NeedDataSource">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <nobr>
                        <asp:CheckBox ID="MassChangeChkbx" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="acid" SortExpression="acid" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acname" SortExpression="acname" HeaderText="Account">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Number">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="MRZone">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno" SortExpression="tuno" HeaderText="Tuno">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="reasoncode" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>               
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" Skin="Office2007"
        OnNeedDataSource="ResultDG2_NeedDataSource" OnDetailTableDataBind="ResultDG2_DetailTableDataBind">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid" DataKeyNames="id" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <label id="completelbl">
                        </label>
                        &nbsp;<input id="cbSelectAll2" name="cbSelectAll" type="checkbox" onclick="selectAll2(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <nobr>
                        <asp:CheckBox ID="MassChangeChkbx2" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="id"  UniqueName="id"
                    Reorderable="true" Display="false" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="acid"  UniqueName="acid"
                    Reorderable="true" Display="false" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="number"  UniqueName="number"
                    HeaderText="IssueNumber" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="noofsiv"  UniqueName="noofsiv"
                    HeaderText="NoOfSIV" Reorderable="true" Display="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status"
                    ItemStyle-Wrap="false" ReadOnly="True" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                    ItemStyle-Wrap="false" ReadOnly="True">
                </telerik:GridBoundColumn>
            </Columns>
            <DetailTables>
                <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                    Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                    <HeaderStyle Wrap="false" />
                    <ItemStyle Wrap="false" />
                    <AlternatingItemStyle Wrap="false" />                    
                    <Columns>
                        <telerik:GridBoundColumn DataField="id"  UniqueName="id"
                            HeaderText="SIV No" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>         
                        <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" 
                            ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SkuDescr" DataField="skudescr" 
                            ColumnGroupName="SkuDescr" SortExpression="SkuDescr" UniqueName="SkuDescr" Reorderable="true">
                        </telerik:GridBoundColumn>               
                        <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                            Display="false" Reorderable="true" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" UniqueName="qty"
                            Reorderable="true" DataFormatString="{0:#.##}" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocCat" HeaderText="LocCat" SortExpression="LocCat"
                            UniqueName="LocCat" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="ExpiryDate"
                            ReadOnly="true" UniqueName="lot1" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="ProductionDate"
                            ReadOnly="true" UniqueName="lot2" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="MaintenanceDate"
                            ReadOnly="true" UniqueName="lot3" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="SerialNo "
                            ReadOnly="true" UniqueName="lot4" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="BatchNo"
                            ReadOnly="true" UniqueName="lot5" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="ManufacturerLotNo"
                            ReadOnly="true" UniqueName="lot6" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="lot7"
                            ReadOnly="true" UniqueName="lot7" Reorderable="true" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="returnFlagDescr" SortExpression="returnFlagDescr"
                            HeaderText="ReturnFlag" ReadOnly="true" UniqueName="returnFlagDescr" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8"
                            ReadOnly="true" UniqueName="lot8" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Status"
                            ReadOnly="true" UniqueName="lot9" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10"
                            ReadOnly="true" UniqueName="lot10" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11"
                            ReadOnly="true" UniqueName="lot11" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="SLoc"
                            ReadOnly="true" UniqueName="lot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                            UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno1" HeaderText="TU1" SortExpression="tuno1"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" HeaderText="TU2" SortExpression="tuno2"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                <%--<telerik:GridBoundColumn DataField="ITF_Src" HeaderText="ITF_Src" UniqueName="ITF_Src" Display="false">
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
                </telerik:GridBoundColumn>--%>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
