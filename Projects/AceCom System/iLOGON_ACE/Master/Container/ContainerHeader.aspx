<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerHeader.aspx.cs"
    Inherits="iWMS.Web.Master.Container.ContainerHeader" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ContinerRegister</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
        <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <div id="div1">
                    <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"></td>
                        </tr>
                    </table>
                </div>
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="DelImgBtn" CssClass="white" runat="server" OnClick="DeleteAllBtn_Click"
                                Visible="true" Text="Delete" ToolTip="Delete Selected SKU(s)" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;   
            <asp:Button ID="CopyBtn" CssClass="white" runat="server" OnClick="CopyBtn_Click"
                Visible="true" Text="Copy" ToolTip="Copy Selected Container" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;      
            <asp:Button ID="ChangeNoBtn" CssClass="white" runat="server" OnClick="ChangeContainerNo_Click"
                Visible="true" Text="ChangeNo" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
            <asp:Button ID="DecommissionContainerBtn" CssClass="white" runat="server" OnClick="DecommissionContainerBtn_Click"
                Visible="true" Text="Decom" ToolTip="Decommission" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
             <asp:Button ID="MassAttacBtn" CssClass="white" runat="server" OnClick="MassAttacBtn_Click"
                 Visible="true" Text="Attc" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
            <asp:Button ID="SwitchStatusBtn" CssClass="white" runat="server" OnClick="SwitchStatusBtn_Click"
                Visible="true" Text="Status" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true" OnGridExporting="ResultDG_GridExporting"
                    AllowFilteringByColumn="true" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    <label id="completelbl" visible="false">
                                    </label>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" visible="true" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" Visible="true" />
                                    <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                    <asp:Label ID="PhotoLbl" runat="server"></asp:Label>
                                    <asp:Label ID="AttachmentLbl" runat="server"></asp:Label>

                                    <%--<a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="SkuDelete" runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete SKU"
                                title="Delete SKU" runat="server" /></a>--%>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="Account" DataField="accode" AllowFiltering="false"
                                ColumnGroupName="accode" SortExpression="accode" UniqueName="Account" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid" />
                            <telerik:GridBoundColumn HeaderText="Container No" DataField="code" AllowFiltering="true"
                                ColumnGroupName="code" SortExpression="Code" UniqueName="Code" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                                ColumnGroupName="statusdescr" SortExpression="Statusdescr" UniqueName="Statusdescr" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="LastKnownDepot" DataField="LastKnownDepot" AllowFiltering="true"
                                ColumnGroupName="LastKnownDepot" SortExpression="LastKnownDepot" UniqueName="LastKnownDepot" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" ColumnGroupName="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SizeType" DataField="SizeType" AllowFiltering="true"
                                ColumnGroupName="SizeType" SortExpression="SizeType" UniqueName="SizeType" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MfgDate" DataField="MfgDate" AllowFiltering="true"
                                ColumnGroupName="MfgDate" SortExpression="MfgDate" UniqueName="MfgDate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Age(Years)" DataField="mfgageingyears" AllowFiltering="true"
                                ItemStyle-HorizontalAlign="Center" ColumnGroupName="mfgageingyears" SortExpression="mfgageingyears"
                                UniqueName="mfgageingyears" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="OwnershipType(Lease or Own)" DataField="OwnershipType" AllowFiltering="true"
                                ColumnGroupName="OwnershipType" SortExpression="OwnershipType" UniqueName="OwnershipType" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="LeaseStartDate" DataField="LeaseStartDate" AllowFiltering="true"
                                ColumnGroupName="LeaseStartDate" SortExpression="LeaseStartDate" UniqueName="LeaseStartDate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="LeaseEndDate" DataField="LeaseEndDate" AllowFiltering="true"
                                ColumnGroupName="LeaseEndDate" SortExpression="LeaseEndDate" UniqueName="LeaseEndDate" Reorderable="true"
                                DataFormatString="{0:dd/MMM/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="GrossWT" DataField="GrossWt" AllowFiltering="true"
                                ItemStyle-HorizontalAlign="Right" ColumnGroupName="GrossWt" SortExpression="GrossWt"
                                UniqueName="GrossWT" Reorderable="true" DataFormatString="{0:N}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="TAREWT" DataField="TareWt" AllowFiltering="true"
                                ColumnGroupName="TareWt" SortExpression="TareWt" UniqueName="TareWt" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Type" DataField="typedescr" AllowFiltering="true"
                                ColumnGroupName="typedescr" SortExpression="typedescr" UniqueName="Type" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MachineryType" DataField="MachineryType" AllowFiltering="true"
                                ColumnGroupName="MachineryType" SortExpression="MachineryType" UniqueName="MachineryType" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="MachineryYearBuilt" DataField="MachineryYearBuilt" AllowFiltering="true"
                                ColumnGroupName="MachineryYearBuilt" SortExpression="MachineryYearBuilt" UniqueName="MachineryYearBuilt" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="LeaseSoldTo" DataField="LeaseSoldTo" AllowFiltering="true"
                                ColumnGroupName="LeaseSoldTo" SortExpression="LeaseSoldTo" UniqueName="LeaseSoldTo" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="PrevCtnrNo" DataField="prevctnrno" AllowFiltering="true"
                                ColumnGroupName="prevctnrno" SortExpression="prevctnrno" UniqueName="prevctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Remarks" DataField="rem1" AllowFiltering="true"
                                ColumnGroupName="rem1" SortExpression="rem1" UniqueName="rem1" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="SpecialInstruction" DataField="rem2" AllowFiltering="true"
                                ColumnGroupName="rem2" SortExpression="rem2" UniqueName="rem2" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
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
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
