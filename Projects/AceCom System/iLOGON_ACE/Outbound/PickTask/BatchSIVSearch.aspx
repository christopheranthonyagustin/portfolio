<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchSIVSearch.aspx.cs"
    Inherits="iWMS.Web.Outbound.PickTask.BatchSIVSearch" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>BatchSIVSearch</title>
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
     <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
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
                    <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Batch SIV</asp:Label>
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
                    &nbsp;&nbsp;
                    <telerik:RadButton ID="PrintBtn" runat="server" OnClick="PrintBtn_Click" Text="PrintBatchList"
                        Skin="WebBlue">
                    </telerik:RadButton>
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="ConfirmPABtn" runat="server" ImageUrl="../../Image/Confirm.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="ConfirmBtn_Click" />
                        &nbsp;
                    <telerik:RadButton ID="PrintSivBtn" runat="server" OnClick="PrintSivBtn_Click" Text="PrintSIV"
                        Skin="WebBlue">
                    </telerik:RadButton>
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
                                &nbsp;&nbsp;
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
                <br />
            </td>
        </tr>
    </table>
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="false" AllowSorting="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
            OnDetailTableDataBind="ResultDG_DetailTableDataBind" AllowAutomaticInserts="True">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid"
                EditMode="InPlace">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="30px" ItemStyle-Width="30px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="printcount" AllowFiltering="false" UniqueName="printcount"
                        HeaderText="PrintCount" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" ColumnGroupName="id" HeaderText="BatchSIVNo"
                        SortExpression="id" UniqueName="sivno" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="acid" ColumnGroupName="acid"
                        SortExpression="acid" UniqueName="acid" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="isid" ColumnGroupName="isid"
                        SortExpression="isid" UniqueName="isid" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="true" DataField="totalsiv" ColumnGroupName="totalsiv" HeaderText="TotSIV"
                        SortExpression="totalsiv" UniqueName="totalsiv" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="status" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" Display="false" SortExpression="statusdescr"
                        HeaderText="Issue Status" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastPrintUser" SortExpression="LastPrintUser" HeaderText="LastPrintBy" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastPrintDate" SortExpression="LastPrintDate" HeaderText="LastPrintDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm}">
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
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                        InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="ptid" MasterKeyField="id" />
                        </ParentTableRelation>
                        <Columns>                            
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
                            <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="sivno"
                        HeaderText="SIV No" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="isno" AllowFiltering="true" UniqueName="isno"
                        HeaderText="IssueNumber" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="noofsiv" AllowFiltering="true" UniqueName="noofsiv"
                        HeaderText="NoOfSIV" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                        UniqueName="skucode" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="rcsskudescr" HeaderText="SKU Descr"
                        UniqueName="rcsskudescr" Reorderable="true" ReadOnly="True">
                    </telerik:GridBoundColumn>                   
                    <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Qty" UniqueName="expecteduomqty"
                        Reorderable="true" DataFormatString="{0:#.##}" ReadOnly="True">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                       Reorderable="true" ReadOnly="True">
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
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4"
                        ReadOnly="true" UniqueName="lot4" Reorderable="true">
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
                    <telerik:GridBoundColumn DataField="lot13" SortExpression="lot13" HeaderText="lot13"
                        ReadOnly="true" Display="false" UniqueName="lot13" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot14" SortExpression="lot14" HeaderText="Lot14"
                        ReadOnly="true" Display="false" UniqueName="lot14" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot15" SortExpression="lot12" HeaderText="Lot15"
                        ReadOnly="true" Display="false" UniqueName="lot15" Reorderable="true">
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
