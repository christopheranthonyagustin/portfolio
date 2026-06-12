<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPackingForm.aspx.cs" Inherits="iWMS.Web.Outbound.OrderPacking.OrderPackingForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OrderPackingForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    <style type="text/css">
        .TotalPKCtn {
            white-space: nowrap;
            line-break: unset;
        }

        .BigCheckBox input {
            width: 30px;
            height: 20px;
            float: left;
            margin-top: 3px;
            margin-left: 3px;
        }

        .RadGridTable {
            width: 30% !important;
            height: 30% !important;
            border: thin;
            background-color: #cce6ff;
            border-radius: 7px;
            margin-right: 10px;
            float: left;
            padding-top: 10px;
            box-shadow: 3px 3px 3px #666666;
            margin-top: 10px;
            overflow: auto;
        }
    </style>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="1000px" Height="600px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="MainRadPageView">
                <asp:Panel runat="server" ID="PackCtnPanel">
                    <table border="0" width="100%">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="NewBtn" CssClass="LongLabelWhite" runat="server" Text="New Pack Unit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="NewBtn_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="EditBtn" CssClass="LongLabelWhite" runat="server" Text="Edit Pack Unit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="EditBtn_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="RemoveBtn" CssClass="LongLabelWhite" runat="server" Text="Remove Pack Unit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" OnClick="RemoveBtn_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="PackListBtn" runat="server" CssClass="blue" Text="PackList" OnClick="PackListBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                        </td>
                                        <td>
                                            <asp:Button ID="DoBtn" runat="server" CssClass="blue" Text="DO" OnClick="DoBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                        </td>
                                        <td>
                                            <asp:Button ID="PULabelbtn" runat="server" CssClass="blue" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" Text="PULabel" OnClick="PULabelbtn_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="ExcelBtn" runat="server" Text="Excel" OnClick="ExcelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="green" ToolTip="Manifest Excel" />
                                        </td>
                                        <td>
                                            <asp:Button ID="PopToTRP" runat="server" Text="Book Transport" OnClick="PopToTPR_Click"
                                                OnClientClick="disableBtn(this.id)"
                                                UseSubmitBehavior="false" CssClass="LongLabelGreen" ToolTip="Populate to Transport" />
                                        </td>
                                        <td>
                                            <asp:Button ID="SelectAllBtn" runat="server" Text="Select All" OnClick="SelectAllBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CssClass="white" ToolTip="Select All" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="LblTotalPKCtn" Font-Bold="true" Font-Size="Large" CssClass="TotalPKCtn"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:PlaceHolder ID="PKCtnPlaceHolder" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="PTDetlPanel" runat="server">
                    <telerik:RadTabStrip runat="server" ID="PTDetlRadTabStrip" CausesValidation="false" MultiPageID="PTDetlRadMultiPage"
                        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                        <Tabs>
                            <telerik:RadTab Text="Items not Packed" Value="0" runat="server">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <br />
                    <telerik:RadMultiPage runat="server" ID="PTDetlRadMultiPage" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" ID="PTDetlRadPageView">
                            <telerik:RadGrid ID="PTDetlResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                                AllowMultiRowSelection="true" OnNeedDataSource="PTDetlResultDG_NeedDataSource" AllowFilteringByColumn="false"
                                AllowPaging="true"
                                ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" AllowFilteringByColumn="false" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="40px" ItemStyle-Wrap="false" ItemStyle-Width="30px">
                                            <HeaderTemplate>
                                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="No" AllowFiltering="false"
                                            HeaderText="No" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OPNo"
                                            AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="exline" UniqueName="exline" SortExpression="exline" HeaderText="ExLine"
                                            AllowFiltering="false" ItemStyle-Wrap="false" ItemStyle-Width="60px" HeaderStyle-Width="60px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="skucode" UniqueName="skucode" SortExpression="skucode" HeaderText="Sku"
                                            ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="skudescr" UniqueName="skudescr" SortExpression="skudescr" HeaderText="Description"
                                            ItemStyle-Wrap="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                            ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc"
                                            ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridNumericColumn DataField="OutstandingQty" HeaderStyle-Width="140px" ItemStyle-Width="140px" HeaderText="Qty"
                                            SortExpression="OutstandingQty" UniqueName="OutstandingQty" DataFormatString="{0:#,0.##}" ItemStyle-HorizontalAlign="Right">
                                        </telerik:GridNumericColumn>
                                        <telerik:GridTemplateColumn DataField="loccheckdigit" UniqueName="loccheckdigit" SortExpression="loccheckdigit"
                                            HeaderText="Checkdigits" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                            <ItemTemplate>
                                                <asp:TextBox ID="checkdigitText" runat="server" Visible="true" Text='<%# Eval("loccheckdigit") %>' Width="140px">
                                                </asp:TextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="uomdescr" SortExpression="uomdescr" HeaderText="UOM"
                                            ItemStyle-Wrap="false" FilterControlWidth="60px" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn DataField="paloccode" UniqueName="paloccode" HeaderText="PALoc" SortExpression="paloccode"
                                            ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn DataField="paloccheckdigit" UniqueName="paloccheckdigit" SortExpression="paloccheckdigit"
                                            HeaderText="PaLocCheckDigits" ItemStyle-Wrap="false" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="paqty" UniqueName="paqty" HeaderText="PaQty" SortExpression="paqty"
                                            ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="pauom" UniqueName="pauom" HeaderText="Pa Uom" SortExpression="pauom"
                                            ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="pastatus" UniqueName="pastatus" HeaderText="PaStatus" SortExpression="pastatus"
                                            ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="skupackpackedqty" SortExpression="skupackpackedqty"
                                            HeaderText="PackedQty" DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-Width="120px" HeaderStyle-Width="120px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot4" DataField="Lot4" AllowFiltering="true"
                                            SortExpression="Lot4" UniqueName="Lot4" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot1" DataField="Lot1" AllowFiltering="true"
                                            SortExpression="Lot1" UniqueName="Lot1" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot5" DataField="Lot5" AllowFiltering="true"
                                            SortExpression="Lot5" UniqueName="Lot5" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot6" DataField="Lot6" AllowFiltering="true"
                                            SortExpression="Lot6" UniqueName="Lot6" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot7" DataField="Lot7" AllowFiltering="true"
                                            SortExpression="Lot7" UniqueName="Lot7" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot2" DataField="Lot2" AllowFiltering="true"
                                            SortExpression="Lot2" UniqueName="Lot2" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot3" DataField="Lot3" AllowFiltering="true"
                                            SortExpression="Lot3" UniqueName="Lot3" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot8" DataField="Lot8" AllowFiltering="true"
                                            SortExpression="Lot8" UniqueName="Lot8" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot9" DataField="Lot9" AllowFiltering="true"
                                            SortExpression="Lot9" UniqueName="Lot9" Reorderable="true" DataFormatString="&nbsp;{0}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot10" DataField="Lot10" AllowFiltering="true"
                                            SortExpression="Lot10" UniqueName="Lot10" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot11" DataField="Lot11" AllowFiltering="true"
                                            SortExpression="Lot11" UniqueName="Lot11" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot12" DataField="Lot12" AllowFiltering="true"
                                            SortExpression="Lot12" UniqueName="Lot12" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot13" DataField="Lot13" AllowFiltering="true"
                                            SortExpression="Lot13" UniqueName="Lot13" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot14" DataField="Lot14" AllowFiltering="true"
                                            SortExpression="Lot14" UniqueName="Lot14" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot15" DataField="Lot15" AllowFiltering="true"
                                            SortExpression="Lot15" UniqueName="Lot15" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot16" DataField="Lot16" AllowFiltering="true"
                                            SortExpression="Lot16" UniqueName="Lot16" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot17" DataField="Lot17" AllowFiltering="true"
                                            SortExpression="Lot17" UniqueName="Lot17" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot18" DataField="Lot18" AllowFiltering="true"
                                            SortExpression="Lot18" UniqueName="Lot18" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot19" DataField="Lot19" AllowFiltering="true"
                                            SortExpression="Lot19" UniqueName="Lot19" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot20" DataField="Lot20" AllowFiltering="true"
                                            SortExpression="Lot20" UniqueName="Lot20" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot21" DataField="Lot21" AllowFiltering="true"
                                            SortExpression="Lot21" UniqueName="Lot21" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot22" DataField="Lot22" AllowFiltering="true"
                                            SortExpression="Lot22" UniqueName="Lot22" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot23" DataField="Lot23" AllowFiltering="true"
                                            SortExpression="Lot23" UniqueName="Lot23" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot24" DataField="Lot24" AllowFiltering="true"
                                            SortExpression="Lot24" UniqueName="Lot24" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot25" DataField="Lot25" AllowFiltering="true"
                                            SortExpression="Lot25" UniqueName="Lot25" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot26" DataField="Lot26" AllowFiltering="true"
                                            SortExpression="Lot26" UniqueName="Lot26" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot27" DataField="Lot27" AllowFiltering="true"
                                            SortExpression="Lot27" UniqueName="Lot27" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot28" DataField="Lot28" AllowFiltering="true"
                                            SortExpression="Lot28" UniqueName="Lot28" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot29" DataField="Lot29" AllowFiltering="true"
                                            SortExpression="Lot29" UniqueName="Lot29" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot30" DataField="Lot30" AllowFiltering="true"
                                            SortExpression="Lot30" UniqueName="Lot30" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot31" DataField="Lot31" AllowFiltering="true"
                                            SortExpression="Lot31" UniqueName="Lot31" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot32" DataField="Lot32" AllowFiltering="true"
                                            SortExpression="Lot32" UniqueName="Lot32" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot33" DataField="Lot33" AllowFiltering="true"
                                            SortExpression="Lot33" UniqueName="Lot33" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot34" DataField="Lot34" AllowFiltering="true"
                                            SortExpression="Lot34" UniqueName="Lot34" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot35" DataField="Lot35" AllowFiltering="true"
                                            SortExpression="Lot35" UniqueName="Lot35" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot36" DataField="Lot36" AllowFiltering="true"
                                            SortExpression="Lot36" UniqueName="Lot36" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot37" DataField="Lot37" AllowFiltering="true"
                                            SortExpression="Lot37" UniqueName="Lot37" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot38" DataField="Lot38" AllowFiltering="true"
                                            SortExpression="Lot38" UniqueName="Lot38" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot39" DataField="Lot39" AllowFiltering="true"
                                            SortExpression="Lot39" UniqueName="Lot39" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot40" DataField="Lot40" AllowFiltering="true"
                                            SortExpression="Lot40" UniqueName="Lot40" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot41" DataField="Lot41" AllowFiltering="true"
                                            SortExpression="Lot41" UniqueName="Lot41" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot42" DataField="Lot42" AllowFiltering="true"
                                            SortExpression="Lot42" UniqueName="Lot42" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot43" DataField="Lot43" AllowFiltering="true"
                                            SortExpression="Lot43" UniqueName="Lot43" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot44" DataField="Lot44" AllowFiltering="true"
                                            SortExpression="Lot44" UniqueName="Lot44" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot45" DataField="Lot45" AllowFiltering="true"
                                            SortExpression="Lot45" UniqueName="Lot45" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot46" DataField="Lot46" AllowFiltering="true"
                                            SortExpression="Lot46" UniqueName="Lot46" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot47" DataField="Lot47" AllowFiltering="true"
                                            SortExpression="Lot47" UniqueName="Lot47" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot48" DataField="Lot48" AllowFiltering="true"
                                            SortExpression="Lot48" UniqueName="Lot48" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot49" DataField="Lot49" AllowFiltering="true"
                                            SortExpression="Lot49" UniqueName="Lot49" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot50" DataField="Lot50" AllowFiltering="true"
                                            SortExpression="Lot50" UniqueName="Lot50" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot51" DataField="Lot51" AllowFiltering="true"
                                            SortExpression="Lot51" UniqueName="Lot51" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot52" DataField="Lot52" AllowFiltering="true"
                                            SortExpression="Lot52" UniqueName="Lot52" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot53" DataField="Lot53" AllowFiltering="true"
                                            SortExpression="Lot53" UniqueName="Lot53" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot54" DataField="Lot54" AllowFiltering="true"
                                            SortExpression="Lot54" UniqueName="Lot54" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot55" DataField="Lot55" AllowFiltering="true"
                                            SortExpression="Lot55" UniqueName="Lot55" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot56" DataField="Lot56" AllowFiltering="true"
                                            SortExpression="Lot56" UniqueName="Lot56" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot57" DataField="Lot57" AllowFiltering="true"
                                            SortExpression="Lot57" UniqueName="Lot57" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot58" DataField="Lot58" AllowFiltering="true"
                                            SortExpression="Lot58" UniqueName="Lot58" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot59" DataField="Lot59" AllowFiltering="true"
                                            SortExpression="Lot59" UniqueName="Lot59" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Lot60" DataField="Lot60" AllowFiltering="true"
                                            SortExpression="Lot60" UniqueName="Lot60" Reorderable="true" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="TotalNetWt" DataField="totnetwt" AllowFiltering="true"
                                            SortExpression="totnetwt" UniqueName="totnetwt" Reorderable="true" DataFormatString="{0:#,0.##}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="rcdate" UniqueName="rcdate" SortExpression="rcdate" HeaderText="RcvDate"
                                            DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="tuno2" UniqueName="tuno2" SortExpression="tuno2" HeaderText="TU#2" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Lotid" UniqueName="Lotid" SortExpression="Lotid" HeaderText="LotID" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ZoneCode" UniqueName="ZoneCode" SortExpression="ZoneCode" HeaderText="Zone"
                                            ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser"
                                            ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate"
                                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Width="160px" HeaderStyle-Width="160px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" ItemStyle-Wrap="false" ItemStyle-Width="140px" HeaderStyle-Width="140px"
                                            HeaderText="EditUser">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </asp:Panel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
