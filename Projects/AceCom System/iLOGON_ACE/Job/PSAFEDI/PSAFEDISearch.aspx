<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSAFEDISearch.aspx.cs"
    Inherits="iWMS.Web.Job.PSAFEDI.PSAFEDISearch" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PSAFEDISearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
    <%--<script language="javascript" type="text/javascript">
        function disableBtn(id) {
            var btn = document.getElementById(id);
            btn.disabled = true;
        }
    </script>--%>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:Panel ID="SearchPanel" runat="server">
            <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
                AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Dashboard" Value="10" readonly="readonly" runat="server">
                    </telerik:RadTab>
                    <telerik:RadTab Text="Records not posted" Value="20" readonly="readonly" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                <telerik:RadPageView runat="server" Height="100%" ID="HeaderRadPageView">
                    <br />
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                     <asp:Button ID="excelImgBtn" runat="server" Text="Export Excel" OnClick="ExportExcel"
                                  CssClass="LongLabelGreen" ToolTip="Export To Excel" UseSubmitBehavior="false" OnClientClick="disableBtn(this.id,false)" />
                    <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
                        <tr>
                            <td>
                                <br />
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" width="50%">
                                    <tr>
                                        <caption>
                                            &nbsp;&nbsp;<label>Status</label>
                                            <td style="width: 800px" valign="top">&nbsp;&nbsp;<telerik:RadListBox ID="PSAFEDIStatusList" runat="server" AllowDelete="false" AllowReorder="false" AllowTransfer="true" AllowTransferDuplicates="false" AutoPostBackOnTransfer="true" ButtonSettings-AreaWidth="35px" Height="120px" OnTransferred="PSAFEDIStatusList_Transferred" SelectionMode="Multiple" Skin="Sunset" TransferMode="Move" TransferToID="SelectedPSAFEDIStatusList" Width="200px">
                                            </telerik:RadListBox>
                                            </td>
                                            <td>
                                                <telerik:RadListBox ID="SelectedPSAFEDIStatusList" runat="server" AllowDelete="false" AllowReorder="false" ButtonSettings-AreaWidth="35px" Height="120px" SelectionMode="Multiple" Skin="Sunset" Width="200px">
                                                </telerik:RadListBox>
                                                <br />
                                            </td>
                                        </caption>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel" />
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="600px" ID="DashboardRadPageView" />
                <telerik:RadPageView runat="server" Height="600px" ID="RecordsnotpostedRadPageView" />
            </telerik:RadMultiPage>
        </asp:Panel>

        <asp:Panel ID="GridPnl" runat="server">
            <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" CausesValidation="false"
                AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
                <Tabs>
                    <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <div style="height: 92%" id="div1">
                <table>
                    <tr>
                        <td align="left">
                            <asp:Label Style="z-index: 0" ID="ErrMsgLbl" runat="server" CssClass="errorLabel"
                                Visible="False"></asp:Label>
                            &nbsp;
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="CheckBtn" CssClass="white" runat="server" OnClick="CheckBtn_Click" Text="Check" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="ApproveBtn" CssClass="white" runat="server" OnClick="ApproveBtn_Click" Text="Approve" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="PSACfmBtn" CssClass="green" runat="server" OnClick="PSACfmImgBtn_Click" Text="Post" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;&nbsp;              
                            <asp:Label Style="z-index: 0" ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
                    OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnDetailTableDataBind="ResultDG_DetailTableDataBind">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid" AllowPaging="true">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="PSAFEDIEdit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit PSA FEDI Register"
                                        OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                    <asp:Label ID="PSAFEDICfmLbl" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="Number"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="processdate" SortExpression="processdate" HeaderText="ProcessDate"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billnumber" SortExpression="billnumber" HeaderText="BillNumber"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                                ItemStyle-Wrap="False" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billtype" SortExpression="billtype" HeaderText="BillType"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="billdate" SortExpression="billdate" HeaderText="BillDate"
                                DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="accountnumber" SortExpression="accountnumber"
                                HeaderText="AccountNumber" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TaxAmt" SortExpression="TaxAmt" HeaderText="StdRatedAmt"
                                ItemStyle-Wrap="False">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NonTaxAmt" SortExpression="NonTaxAmt" HeaderText="ZeroRatedAmt"
                                ItemStyle-Wrap="False">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GSTAmt" SortExpression="GSTAmt" HeaderText="GSTAmt"
                                ItemStyle-Wrap="False">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalAmt" SortExpression="TotalAmt" HeaderText="PayableAmt"
                                ItemStyle-Wrap="False">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BillableAmt" SortExpression="BillableAmt" HeaderText="BillableAmt"
                                ItemStyle-Wrap="False" Display="true" DataFormatString="{0:N}">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TotalPnLAmt" SortExpression="TotalPnLAmt" HeaderText="P&LAmt"
                                ItemStyle-Wrap="False" Display="true" DataFormatString="{0:N}">
                                <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                ItemStyle-Wrap="False" Display="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="StatusColor"
                                ItemStyle-Wrap="False" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                                ItemStyle-Wrap="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="id" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <DetailTables>
                            <telerik:GridTableView DataKeyNames="billnumber" Name="ChildGrid" Width="100%" SkinID="Telerik" AllowPaging="false"
                                AllowFilteringByColumn="false" TableLayout="Fixed">
                                <HeaderStyle Wrap="false" BackColor="#05538C" ForeColor="White" />
                                <ItemStyle Wrap="true" />
                                <AlternatingItemStyle Wrap="true" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="chargecode" SortExpression="chargecode" HeaderText="Charge"
                                        HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Description"
                                        HeaderStyle-Width="200px" ItemStyle-Width="200px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="containerno" SortExpression="containerno" HeaderText="ContainerNo"
                                        HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="JobNo" SortExpression="JobNo" HeaderText="JobNo"
                                        HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Account" SortExpression="Account" HeaderText="Account"
                                        HeaderStyle-Width="160px" ItemStyle-Width="160px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="payableamt" SortExpression="payableamt" HeaderText="PayableAmt" DataFormatString="{0:N}"
                                        HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="billableamt" SortExpression="billableamt" HeaderText="BillableAmt" DataFormatString="{0:N}"
                                        HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="pnlamt" SortExpression="pnlamt" HeaderText="P&LAmt" DataFormatString="{0:N}">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                    </MasterTableView>
                </telerik:RadGrid>
        </asp:Panel>
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
     </div>
    </form>
</body>
</html>
