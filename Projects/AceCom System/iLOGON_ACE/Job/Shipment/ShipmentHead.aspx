<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<%@ Page Language="c#" CodeBehind="ShipmentHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Shipment.ShipmentHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeclarationHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="SearchResults" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Outbox" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SubmitStatus" Value="110" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Permit" Value="120" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Others" Value="130" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="CustomsExchRate" Value="140" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="ExchangeRate" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </p>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" OnPreRender="MsgPopup_OnOkayImgBtn_Click">
            <telerik:RadPageView runat="server" Height="0px" ID="MainInfoRadPageView">
                <table id="report" runat="server" style="width: 100%; height: 30px">
                    <tr>
                        <td align="left" class="style1">
                            <asp:Button ID="submitImgBtn" runat="server" CssClass="green" Text="Submit"
                                OnClick="submitImgBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                    OnClick="CopyBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="TIBtn" runat="server" CssClass="LongLabelBlue" Text="Trucking Instruction"
                    OnClick="TIBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="NonBillableBtn" runat="server" CssClass="White" Text="Non Billable"
                    OnClick="NonBillableBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td align="right">
                            <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                    OnItemDataBound="ResultDG_ItemDataBound" Height="460px">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="number" SortOrder="Descending" />
                        </SortExpressions>
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false">

                                <HeaderTemplate>
                                    <label id="completelbl">
                                    </label>
                                    &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>

                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="DetailLbl" runat="server"></asp:Label>                                                                  
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>                                                         
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="False" ID="DeclarationCancel" ImageUrl="../../image/bin.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Cancel Declaration"
                                    OnClick="DeclarationCancel_Click" CausesValidation="False"></asp:ImageButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>                                                                                                                                      
                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="JobNo"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="msgtypedescr" SortExpression="msgtypedescr" HeaderText="Msg"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="dectypedescr" SortExpression="dectypedescr" HeaderText="Dec"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="PermitNo"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lotsvalues" SortExpression="lotsvalues" HeaderText="Lots"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cntctnritem" SortExpression="cntctnritem" HeaderText="Items"
                                ItemStyle-HorizontalAlign="Right" ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="GRGI" SortExpression="GRGI"
                                HeaderText="GRGI" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="Inv"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="receiptloc" SortExpression="receiptloc" HeaderText="Rec"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="releaseloc" SortExpression="releaseloc" HeaderText="Rel"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="invslvoydescr" SortExpression="invslvoydescr"
                                HeaderText="InVslVoy" ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="outvslvoydescr" SortExpression="outvslvoydescr"
                                HeaderText="OutVslVoy" ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                ItemStyle-Wrap="false" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="acid">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="status" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <iWMS:MsgPopup ID="MsgPopup" runat="server" OnOnOkayImgBtn_Click="MsgPopup_OnOkayImgBtn_Click"></iWMS:MsgPopup>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="OutBoxRadPageView" Height="400px" ContentUrl="ShipmentOutbox.aspx" />
            <telerik:RadPageView runat="server" ID="SubmitStatusRadPageView" Height="400px" ContentUrl="SubmitStatus.aspx" />
            <telerik:RadPageView runat="server" ID="PermitRadPageView" Height="400px" ContentUrl="Permit.aspx"/>
            <telerik:RadPageView runat="server" ID="OthersRadPageView" Height="400px" ContentUrl="Others.aspx"/>
            <telerik:RadPageView runat="server" ID="CustomsExchRateRadPageView" Height="500px" ContentUrl="CustomsExchRate.aspx"/>
            <telerik:RadPageView runat="server" ID="ExchangeRateRadPageView" Height="500px" ContentUrl="ShipmentExchangeRate.aspx"/>
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlAlertBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="AlertBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlAlertBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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
