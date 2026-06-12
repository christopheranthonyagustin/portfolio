<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterForm.aspx.cs" Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ManifestRegisterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Office2007">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>  
            <telerik:RadTab Text="Items" Value="100" runat="server" Visible="false">
            </telerik:RadTab>     
        </Tabs>
    </telerik:RadTabStrip>  
    
     <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
            <table>
                <tr>
                    <td>
                        &nbsp;<asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<asp:Button ID="UpdateBtn" CssClass="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />         
                        &nbsp;<iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
            </table>
        
            <br />
            &nbsp;<asp:Button ID="PackBtn" class="white" runat="server" OnClick="PackBtn_Click" Text="Pack"  
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            &nbsp;&nbsp;<asp:Button ID="DeleteBtn" class="white" runat="server" OnClick="DeleteBtn_Click" Text="Delete"  
                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            <br />
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowMultiRowSelection="true"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound" OnDetailTableDataBind="ResultDG_DetailTableDataBind">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderStyle-Width="15px" ItemStyle-Width="15px">
                            <ItemTemplate>
                            <asp:Label ID="EdiLbl" runat="server" Visible="false"></asp:Label>
                            <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>' OnClick="lnkEdit_Click">
                                <img id="EditImg" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Delete" runat="server">
                            </asp:LinkButton>
                            <a id="lnkDelete" onclick="return confirm('Confirm Delete?')" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                runat="server" onserverclick="MRDetl_Delete">
                                <img id="delImg" border="0" alt="Delete MRDetl" src="..\..\image\bin.gif" width="15" height="15" runat="server">
                            </a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="BoxNo" DataField="BoxNo" AllowFiltering="true"
                            ColumnGroupName="BoxNo" SortExpression="BoxNo" UniqueName="BoxNo" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Length" DataField="length" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="length" SortExpression="length" UniqueName="length" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Width" DataField="width" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="width" SortExpression="width" UniqueName="width" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Height" DataField="height" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="height" SortExpression="height" UniqueName="height" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="WT" DataField="wt" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="wt" SortExpression="wt" UniqueName="wt" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Vol" DataField="vol" AllowFiltering="true" DataFormatString="{0:0.###}"
                            ColumnGroupName="vol" SortExpression="vol" UniqueName="vol" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Content" DataField="Content" AllowFiltering="true"
                            ColumnGroupName="Content" SortExpression="Content" UniqueName="Content" Reorderable="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                            AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PKId" SortExpression="PKId" HeaderText="PKId" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PKCtnId" SortExpression="PKCtnId" HeaderText="PKCtnId" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="mrdpkctnid" DataField="mrdpkctnid" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                            Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="false" />
                            <AlternatingItemStyle Wrap="false" />
                            <Columns>
                                <telerik:GridClientSelectColumn UniqueName="ChildClientSelectColumn"></telerik:GridClientSelectColumn>
                                <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="pkctnid" DataField="pkctnid" Display="false">
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
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="90%" ID="ItemsRadPageView">
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
