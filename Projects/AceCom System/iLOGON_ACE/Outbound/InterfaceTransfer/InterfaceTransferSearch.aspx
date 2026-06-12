<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfaceTransferSearch.aspx.cs" Inherits="iWMS.Web.Outbound.InterfaceTransfer.InterfaceTransferSearch" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
<head runat="server">
    <title>InterfaceTransferSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function selectAll(invoker)
        {
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
                        <asp:Button ID="NewSearchBtn" class="white" runat="server" Visible="true" OnClick="NewSearchBtn_Click" Text="NewSearch"
                            UseSubmitBehavior="false" /> 
                        &nbsp;
                        <asp:Button ID="TransferBtn" class="white" runat="server" OnClick="TransferBtn_Click" Text="Transfer" 
                            OnClientClick="return confirm('Once transfer unable to reverse process, confirm proceed?');" />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="newPanel" runat="server" Visible="False">
                        <table border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td>
                                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    &nbsp;
                                    <asp:Button ID="HideSearchBtn" class="white" runat="server" OnClick="HideSearchBtn_Click" Text="Hide"
                                        UseSubmitBehavior="false" /> 
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
                                <td style="width: 400px" valign="top">
                                &nbsp;
                                <telerik:RadListBox runat="server" ID="LocCatList" Height="120px" Width="190px"
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
                AllowPaging="true" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
                OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand"
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
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderStyle-Width="15px" ItemStyle-Width="15px">
                            <ItemTemplate>
                            <asp:Label ID="EdiLbl" runat="server" Visible="false"></asp:Label>
                            <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="lnkEdit_Click">
                                <img id="EditImg" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Delete" runat="server">
                            </asp:LinkButton>
                            <asp:Label ID="SivPrinted" runat="server"></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
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
                        <telerik:GridBoundColumn DataField="accode" AllowFiltering="true" UniqueName="accode" HeaderText="Account"
                            Reorderable="true" Display="true" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocCat" HeaderText="LocCat" SortExpression="LocCat"
                            UniqueName="LocCat" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shtocode" HeaderText="DeliverTo" SortExpression="shtocode"
                            UniqueName="shtocode" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" AllowFiltering="true" UniqueName="sivno"
                            HeaderText="SIV No" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                            UniqueName="skucode" Reorderable="true" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocTuno1" SortExpression="LocTuno1" HeaderText="Location/Tuno1"
                            UniqueName="LocTuno1" Reorderable="true" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loccode" HeaderText="Location" SortExpression="loccode"
                            ItemStyle-Wrap="false" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno1" HeaderText="TU1" SortExpression="tuno1"
                            ItemStyle-Wrap="false" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expecteduomqty" SortExpression="qty" HeaderText="Qty" UniqueName="expecteduomqty"
                            Reorderable="true" DataFormatString="{0:0.###}" ReadOnly="True" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="Uom" UniqueName="uom"
                            Reorderable="true" ReadOnly="True" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MRZone" HeaderText="MRZONE" SortExpression="MRZone"
                            UniqueName="mrzone" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lot12" SortExpression="lot12" HeaderText="Lot12"
                            ReadOnly="true" UniqueName="lot12" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="skudescr" SortExpression="rcsskudescr" HeaderText="SKU Descr"
                            UniqueName="rcsskudescr" Reorderable="true" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" AllowFiltering="true" UniqueName="isno"
                            HeaderText="IssueNumber" Reorderable="true" Display="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofsiv" AllowFiltering="false" UniqueName="noofsiv"
                            HeaderText="NoOfSIV" Reorderable="true" Display="true" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="printcount" AllowFiltering="false" UniqueName="printcount" HeaderText="PrintCount"
                            Reorderable="true" Display="true" ReadOnly="True">
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
                            ReadOnly="true" UniqueName="lot7" Reorderable="true" Display="false">
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
                        <telerik:GridBoundColumn DataField="ishexref2" HeaderText="DocNo" SortExpression="ishexref2"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="type" HeaderText="Type" SortExpression="type"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ishexref3" HeaderText="RsvNo" SortExpression="ishexref3"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pono" HeaderText="STONo" SortExpression="pono"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ishexref4" HeaderText="MOno" SortExpression="ishexref4"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                            UniqueName="rcdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ishrem1" HeaderText="Remarks" SortExpression="ishrem1"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="tuno2" HeaderText="TU2" SortExpression="tuno2"
                            ItemStyle-Wrap="false" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="DNnumber" HeaderText="DNnumber" SortExpression="DNnumber"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="ISHeadStatus" HeaderText="IssueStatus" SortExpression="ISHeadStatus"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="Recipient" HeaderText="Recipient" SortExpression="Recipient"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" HeaderText="Status" SortExpression="status"
                            ItemStyle-Wrap="false" ReadOnly="True" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr"
                            ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lastprintuser" SortExpression="lastprintuser" HeaderText="LastPrintBy" AllowFiltering="false"
                            ReadOnly="true" UniqueName="lastprintuser" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="lastprintdate" SortExpression="lastprintdate" HeaderText="LastPrint" AllowFiltering="false"
                            ReadOnly="true" UniqueName="lastprintdate" DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sivedituser" SortExpression="sivedituser" HeaderText="EditUser" ReadOnly="true"  
                        UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="siveditdate" SortExpression="siveditdate" HeaderText="EditDate" ReadOnly="true"  
                        UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm}" >
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_id" HeaderText="ITF_id" UniqueName="ITF_id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_Src" HeaderText="ITF_Src" UniqueName="ITF_Src" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_SrcDtId" HeaderText="ITF_SrcDtId" UniqueName="ITF_SrcDtId" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_WMS_Dts" HeaderText="ITF_WMS_Dts" UniqueName="ITF_WMS_Dts"
                            SortExpression="ITF_WMS_Dts" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_MTS_Tran_Dts" HeaderText="ITF_MTS_Tran_Dts" UniqueName="ITF_MTS_Tran_Dts"
                            SortExpression="ITF_MTS_Tran_Dts" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITF_Status" HeaderText="ITF_Status" UniqueName="ITF_Status"
                            SortExpression="ITF_Status" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ISHadddate" HeaderText="InterfaceDate" UniqueName="InterfaceDate"
                            SortExpression="InterfaceDate" ItemStyle-Wrap="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="loctype" AllowFiltering="false" UniqueName="loctype" HeaderText="loctype"
                            Reorderable="true" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="route" AllowFiltering="false" UniqueName="route" HeaderText="route"
                            Reorderable="true" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ISHStatus" AllowFiltering="false" UniqueName="ISHStatus" HeaderText="ISHStatus"
                            Reorderable="true" Display="false" ReadOnly="True">
                        </telerik:GridBoundColumn>
                    </Columns>
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
