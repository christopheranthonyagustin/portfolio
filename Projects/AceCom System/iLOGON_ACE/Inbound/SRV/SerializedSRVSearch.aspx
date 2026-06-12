<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SerializedSRVSearch.aspx.cs" Inherits="iWMS.Web.Inbound.SRV.SerializedSRVSearch" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head id="Head1" runat="server">
    <title>SRVSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
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
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td class="NewModuleTitle" align="left">
                    <div class="NewModuleTitle">
                        <asp:Label ID="Label1" labelclass="NewModuleTitle" runat="server">Serialized SRV</asp:Label>
                    </div>
                </td>
            </tr>
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
                            Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                            OnClick="ReleaseBtn_Click" />
                        &nbsp;&nbsp;
                        <telerik:RadButton ID="MassChangeBtn" runat="server" Text="MassChange" CssClass="detailButton"
                            OnClick="MassChangeBtn_Click" Skin="WebBlue"></telerik:RadButton>
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
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;LocCat
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 400px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="190px"
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
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />           
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowMultiRowSelection="true"
                AllowPaging="true" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
                OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
                OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnItemCommand="ResultDG_ItemCommand">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="true"></Selecting>
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="20" DataKeyNames="id" Name="ParentGrid" EditMode="InPlace">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>                        
                        <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn1"></telerik:GridClientSelectColumn>
                        <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="sivno"
                            HeaderText="SRVNo"  Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="true"
                            ColumnGroupName="accode" SortExpression="accode" UniqueName="accode" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ReceiptNumber" DataField="number" AllowFiltering="true"
                            ColumnGroupName="number" SortExpression="number" UniqueName="number" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="PaLocCat" DataField="paloccat" AllowFiltering="true"
                            ColumnGroupName="paloccat" SortExpression="paloccat" UniqueName="paloccat" >
                        </telerik:GridBoundColumn>                      
                        <telerik:GridBoundColumn HeaderText="PALoctype" DataField="PALoctype" AllowFiltering="true"
                            ColumnGroupName="PALoctype" SortExpression="PALoctype" UniqueName="PALoctype" >
                        </telerik:GridBoundColumn>                    
                        <telerik:GridBoundColumn HeaderText="SKU" DataField="skucodelist" AllowFiltering="true"
                            ColumnGroupName="skucodelist" SortExpression="skucodelist" UniqueName="skucodelist" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="SKUDescription" DataField="skudescrlist" AllowFiltering="true"
                            ColumnGroupName="skudescrlist" SortExpression="skudescrlist" UniqueName="skudescrlist" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="TotalQty" DataField="totallhuqty" AllowFiltering="true" DataFormatString="{0:#.##}"
                            ColumnGroupName="totallhuqty" SortExpression="totallhuqty" UniqueName="totallhuqty" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" HeaderText="DocNo" SortExpression="exref1"
                            UniqueName="exref1" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type"
                            UniqueName="type" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref3" HeaderText="RsvNo" SortExpression="exref3"
                            UniqueName="exref3" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref4" HeaderText="STONo" SortExpression="exref4"
                            UniqueName="exref4" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem1" HeaderText="Remarks1" SortExpression="rem1"
                            UniqueName="rem1" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rem2" HeaderText="Remarks2" SortExpression="rem2"
                            UniqueName="rem2" ItemStyle-Wrap="false" ReadOnly="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                            ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_id" Display="false" UniqueName="ITF_id" SortExpression="ITF_id">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" Width="100%" 
                            AllowPaging="false" AllowFilteringByColumn="false" RetainExpandStateOnRebind="true" EditMode="InPlace">
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="false" />
                            <AlternatingItemStyle Wrap="false" />
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="rcid" MasterKeyField="id" />
                            </ParentTableRelation>
                            <Columns>                                
                                <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"></telerik:GridClientSelectColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="SkuEdit"
                                            ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                            CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="SRVUpdate" ImageUrl="..\..\image\floppy.gif"
                                            Width="15" Height="15" AlternateText="Update" CommandName="SRVUpdate" BackColor="Transparent"
                                            BorderWidth="0"></asp:ImageButton>
                                        <asp:ImageButton runat="server" Visible="True" ID="SRVCancel" ImageUrl="..\..\image\arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="SRVCancel" BackColor="Transparent"
                                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    </EditItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="paLocCat" HeaderText="PALocCat" SortExpression="paLocCat"
                                    ItemStyle-Wrap="false" ReadOnly="True">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="SRVNo" AllowFiltering="true" 
                                    Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="SRVLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="acid" AllowFiltering="true" UniqueName="acid"
                                     Display="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="skuid" AllowFiltering="true" UniqueName="skuid"
                                     Display="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                                    UniqueName="skucode"  ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rcsskudescr" SortExpression="rcsskudescr" HeaderText="SKUDescription"
                                    UniqueName="rcsskudescr"  ReadOnly="true">
                                </telerik:GridBoundColumn>                               
                                <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="expecteduomqty" HeaderText="Qty"
                                    UniqueName="expecteduomqty"  DataFormatString="{0:#.##}" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="ReceievedDate"
                                    UniqueName="rcdate"  DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1" UniqueName="lot1"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" ReadOnly="true">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" UniqueName="lot2"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" ReadOnly="true">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" UniqueName="lot3"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" ReadOnly="true">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4" UniqueName="lot4"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5" UniqueName="lot5"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6" UniqueName="lot6"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7" UniqueName="lot7"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8" UniqueName="lot8"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9" UniqueName="lot9"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10" UniqueName="lot10"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11" UniqueName="lot11"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12" UniqueName="lot12"
                                     ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="loccode" HeaderText="RecLoc" SortExpression="loccode"
                                    ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Suggest" DataField="paloccode" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                    ColumnGroupName="paloccode" SortExpression="paloccode" UniqueName="paloccode" 
                                    HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "paloccode")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox runat="server" ID="paloccodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'
                                            TextMode="SingleLine" Enabled="true">
                                        </telerik:RadTextBox>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="tuno1" HeaderText="TUno1" SortExpression="tuno1"
                                    UniqueName="tuno1" ItemStyle-Wrap="false" ReadOnly="true">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="status" Display="false" ReadOnly="True" >
                                 </telerik:GridBoundColumn> 
                                <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="rcdstatusdescr"
                                    ItemStyle-Wrap="false" ReadOnly="true">
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
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
