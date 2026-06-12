<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DNRegisterForm.aspx.cs" Inherits="iWMS.Web.Outbound.DNRegister.DNRegisterForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>TransferForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />
    <script type="text/javascript" src="../../js/row.js"></script>  
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">  

    <style type="text/css">
        .style1 {
            width: 540px;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">           
            function selectAll(id) {
                var masterTable = $find("<%= ResultDG2.ClientID %>").get_masterTableView();
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
        </script>

    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007" CausesValidation="false"
            AutoPostBack="true">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>&nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>            
                <asp:Panel ID="dbPanel" runat="server" Visible="true">
                    <asp:Button ID="delBtn" class="white" runat="server" OnClick="delBtn_Click" Text="Delete" OnClientClick="disableBtn(this.id,true)"  UseSubmitBehavior="false"/>
                <%--<asp:ImageButton ID="delBtn" runat="server" ImageUrl="~/Image/delete.png" 
                    BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
                    ImageAlign="AbsMiddle" ToolTip="Delete"  OnClick="delBtn_Click" />--%>
                <br />
                    <br />
                <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG2_ItemDataBound" OnDetailTableDataBind="ResultDG2_DetailTableDataBind"
                    OnNeedDataSource="ResultDG2_NeedDataSource" AllowAutomaticInserts="True" Width="80%">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid" EditMode="InPlace" Width="100%"
                        AllowFilteringByColumn="true" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
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
                            <telerik:GridBoundColumn DataField="isid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                                ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" AllowFiltering="true"
                                ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DONumber" DataField="dono" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="DocNo" DataField="custref" AllowFiltering="true"
                                ColumnGroupName="custref" SortExpression="custref" UniqueName="custref" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="STO/PONo" DataField="pono" AllowFiltering="true"
                                ColumnGroupName="pono" SortExpression="pono" UniqueName="pono" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MOno" DataField="mono" AllowFiltering="true"
                                ColumnGroupName="mono" SortExpression="mono" UniqueName="mono" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                                ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SkuDescr" DataField="skudescr" AllowFiltering="true"
                                ColumnGroupName="SkuDescr" SortExpression="SkuDescr" UniqueName="SkuDescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="UOM" DataField="uom" AllowFiltering="true"
                                ColumnGroupName="uom" SortExpression="uom" UniqueName="uom" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Qty" DataField="ttqty" AllowFiltering="true"
                                ColumnGroupName="ttqty" SortExpression="ttqty" UniqueName="ttqty" DataFormatString="{0:0.###}"
                                Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                                Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                                <HeaderStyle Wrap="false" />
                                <ItemStyle Wrap="false" />
                                <AlternatingItemStyle Wrap="false" />
                                <%--<ParentTableRelation>
                        <telerik:GridRelationFields DetailKeyField="isid" MasterKeyField="isid" />
                    </ParentTableRelation>--%>
                                <Columns>

                                    <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="isid" DataField="isid" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SIVNo" DataField="ptdtid" AllowFiltering="true"
                                        ColumnGroupName="ptdtid" SortExpression="ptdtid" UniqueName="ptdtid" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" AllowFiltering="true"
                                        ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                                        ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="SkuDescr" DataField="skudescr" AllowFiltering="true"
                                        ColumnGroupName="skudescr" SortExpression="skudescr" UniqueName="skudescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="PackedQty" DataField="packeduomqty" AllowFiltering="true" DataFormatString="{0:0.###}"
                                        ColumnGroupName="packeduomqty" SortExpression="packeduomqty" UniqueName="packeduomqty" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Status" DataField="pkstatusdescr" AllowFiltering="true"
                                        ColumnGroupName="pkstatusdescr" SortExpression="pkstatusdescr" UniqueName="pkstatusdescr" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
                </asp:Panel>
                <asp:Panel ID="scanPanel" runat="server" Visible="false">
                    <asp:ImageButton ID="BuildDNBtn" runat="server" ImageUrl="../../Image/Build.png"
                        BackColor="Transparent" BorderWidth="0" Style="z-index: 0" CausesValidation="false"
                        ImageAlign="AbsMiddle" OnClick="BuildDNBtn_Click" />
                    <br /><asp:Label id="MRLbl" runat="server" Visible="false"></asp:Label>
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
                        OnNeedDataSource="ResultDG_NeedDataSource"
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
                            EditMode="InPlace" Width="100%" AllowFilteringByColumn="true" HierarchyLoadMode="Client">
                            <Columns>
                                <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="isid" DataField="isid" UniqueName="isid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="acid" DataField="acid" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="SIVNo" DataField="sivno" AllowFiltering="true"
                                    ColumnGroupName="sivno" SortExpression="sivno" UniqueName="sivno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" AllowFiltering="true"
                                    ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="NoOfSIV" DataField="NoOfSIV" AllowFiltering="true"
                                    ColumnGroupName="NoOfSIV" SortExpression="NoOfSIV" UniqueName="NoOfSIV" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="MRZone" DataField="route" AllowFiltering="true"
                                    ColumnGroupName="route" SortExpression="route" UniqueName="route" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                                    ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="PackedQty" DataField="packedqty" AllowFiltering="true"
                                    ColumnGroupName="packedqty" SortExpression="packedqty" UniqueName="packedqty"
                                    Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
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
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="480px" ID="AttcRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
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
                            <td style="width: 2%;"></td>
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

