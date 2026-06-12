<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRVSearch.aspx.cs" Inherits="iWMS.Web.Inbound.PutAwayTask.SRVSearch" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>SRVSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
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
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Panel ID="BtnPanel" runat="server">
                        <asp:Button ID="NewSearchBtn" class="white" runat="server" OnClick="NewSearchBtn_Click" Text="NewSearch" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="PrintBtn" class="blue" runat="server" OnClick="PrintBtn_Click" Text="Print" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="ReleaseBtn" class="green" runat="server" OnClick="ReleaseBtn_Click" Text="Release" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="ConfirmPABtn" class="white" runat="server" OnClick="ConfirmPABtn_Click" Text="Confirm" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        &nbsp;
                        <asp:Button ID="MassChangeBtn" class="white" runat="server" OnClick="MassChangeBtn_Click" Text="Change" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="true" AllowSorting="true" 
            Skin="Office2007" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"  
            OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderStyle-Width="15px" ItemStyle-Width="15px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelect" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="SkuEdit"
                                ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            <asp:Label ID="EDILbl" runat="server" Visible="false"></asp:Label>
                            <asp:LinkButton ID="ExplodeUOMLnkBtn" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="SRVExplode_Click">
                                <img id="ExplodeImg" src="..\..\image\bomb.png" width="15" height="15" border="0" alt="Explode" runat="server"/>
                            </asp:LinkButton>
                            <asp:Label ID="SrvPrinted" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="SkuUpdate" ImageUrl="..\..\image\floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="SkuUpdate" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="SkuCancel" ImageUrl="..\..\image\arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="SkuCancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="rcid" AllowFiltering="true" UniqueName="rcid" 
                        Reorderable="true" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acid" AllowFiltering="true" UniqueName="acid" 
                        Reorderable="true" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuid" AllowFiltering="true" UniqueName="skuid" 
                        Reorderable="true" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" AllowFiltering="true" UniqueName="lotid" 
                        Reorderable="true" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="accode" AllowFiltering="true" UniqueName="accode" HeaderText="Account"
                        Reorderable="true" Display="true" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="paLocCat" HeaderText="PALocCat" SortExpression="paLocCat"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderText="Location/Tuno1" DataField="LocTuno1" AllowFiltering="true" ItemStyle-CssClass="break-word"
                        ColumnGroupName="LocTuno1" SortExpression="paloccode" UniqueName="LocTuno1" Reorderable="true"
                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "LocTuno1")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox runat="server" ID="paloccodeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "LocTuno1") %>'
                            TextMode="SingleLine" Enabled="true">
                        </telerik:RadTextBox>
                    </EditItemTemplate>
                    </telerik:GridTemplateColumn>  
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU1" ReadOnly="true" Display="false"  
                        UniqueName="tuno1" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="SRVNo"
                        UniqueName="rcsid" Reorderable="true" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="SrcDtId" AllowFiltering="true" UniqueName="SrcDtId" 
                        Reorderable="true" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                        UniqueName="skucode" Reorderable="true" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcsskudescr" SortExpression="rcsskudescr" HeaderText="SKUDescription"
                        UniqueName="rcsskudescr" Reorderable="true" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="Uom"  AllowFiltering="false"
                        UniqueName="uomdescr" Reorderable="true" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="uomqty" SortExpression="uomqty" HeaderText="Qty"  AllowFiltering="false" 
                        UniqueName="uomqty" Reorderable="true" DataFormatString="{0:0.###}" ReadOnly="True" >
                    </telerik:GridBoundColumn> 
                     <telerik:GridBoundColumn DataField="status" Display="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>      
                     <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>    
                     <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" 
                        ItemStyle-Wrap="false" ReadOnly="True" Display="false" >
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn DataField="loccode" HeaderText="RecLoc" SortExpression="loccode"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>            
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="ReceivedDate"  
                        UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="PAloc" HeaderStyle-HorizontalAlign="Center"
                        Display="false">
                        <ItemTemplate>
                            <asp:Label ID="paLocLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="PAlocType" HeaderStyle-HorizontalAlign="Center"
                        Display="false">
                        <ItemTemplate>
                            <asp:Label ID="paLocTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paloctype") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridBoundColumn DataField="PrintCount" HeaderText="PrintCount" SortExpression="PrintCount" AllowFiltering="false"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>   
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="GRNo"
                        UniqueName="number" Reorderable="true" ReadOnly="True" >
                    </telerik:GridBoundColumn>             
                    <telerik:GridBoundColumn DataField="exref1" HeaderText="DocNo" SortExpression="exref1"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" HeaderText="DocLine" SortExpression="exref2"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref3" HeaderText="RsvNo" SortExpression="exref3" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pono" HeaderText="STONo" SortExpression="pono" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref4" HeaderText="MoNo" SortExpression="exref4" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1" ReadOnly="true"
                        UniqueName="lot1" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" ReadOnly="true"
                        UniqueName="lot2" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" ReadOnly="true"
                        UniqueName="lot3" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4" ReadOnly="true"  
                        UniqueName="lot4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5" ReadOnly="true"  
                        UniqueName="lot5" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6" ReadOnly="true"  
                        UniqueName="lot6" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridTemplateColumn HeaderText="Lot7" >
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="reFlagDDL" Enabled="True" DataTextField="Descr" DataValueField="Item"
                                runat="server" DataSource='<%# reFlagDS%>' Skin="WebBlue" />
                            <asp:Label ID="reFlagLbl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "returnFlag") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "returnFlagDescr")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                    <telerik:GridBoundColumn DataField="returnFlagDescr" SortExpression="returnFlagDescr" HeaderText="Lot7" ReadOnly="true"  
                        UniqueName="returnFlagDescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8" ReadOnly="true"  
                        UniqueName="lot8" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9" ReadOnly="true"  
                        UniqueName="lot9" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10" ReadOnly="true"  
                        UniqueName="lot10" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11" ReadOnly="true"  
                        UniqueName="lot11" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12" ReadOnly="true"  
                        UniqueName="lot12" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem3" HeaderText="EqNo" SortExpression="rem3" 
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="true"  
                        UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" ReadOnly="true"  
                        UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" >
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="rhrem1" HeaderText="Remarks" SortExpression="rhrem1"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rhrem2" HeaderText="Remarks2" SortExpression="rhrem2"
                        ItemStyle-Wrap="false" ReadOnly="True" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_id" Display="false" UniqueName="ITF_id" SortExpression="ITF_id">
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
                    <telerik:GridBoundColumn DataField="ITF_Src" HeaderText="ITF_Src" UniqueName="ITF_Src"
                        SortExpression="ITF_Src" ItemStyle-Wrap="false" ReadOnly="True" Display="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ITF_SrcDtId" HeaderText="ITF_SrcDtId" UniqueName="ITF_SrcDtId"
                        SortExpression="ITF_SrcDtId" ItemStyle-Wrap="false" ReadOnly="True" Display="false" >
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        </div>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
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
