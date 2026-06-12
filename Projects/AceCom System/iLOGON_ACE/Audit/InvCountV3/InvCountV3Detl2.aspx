<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Detl2.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Detl2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>InvCountV3Detl2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
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

        .text {
            text-align: center;
        }

        .tab9 {
            position: absolute;
            left: 1010px;
        }
    </style>
    <script language="javascript" type="text/javascript">
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onkeydown="javascript:if(window.event.keyCode == 13) window.event.keyCode = 9;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        &nbsp;
        <asp:Label ID="LineLbl" runat="server" Font-Bold="true" Font-Size="Large" Text="Line"></asp:Label>
        <span class="tab9">
            <asp:Label ID="Totallbl" runat="server" ForeColor="Black" Font-Size="X-Large"></asp:Label>
            &nbsp;
            <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" class="tab9" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
        </span>
        <table id="tb1" cellspacing="0" cellpadding="0" border="0">
            <tr style="height: 7px">
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="SelectUpnl" runat="server">
                        <ContentTemplate>
                            &nbsp;<asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Visible="False" Text="Select"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp; 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>&nbsp;
                    <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel"
                        OnClientClick="disableBtn(this.id)" CausesValidation="false" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="RefreshBtn" CssClass="white" runat="server" OnClick="RefreshBtn_Click" Text="Refresh"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="UpdateBtn" CssClass="LongLabelWhite" runat="server" OnClick="UpdateBtn_Click" Text="Update Quantity"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CountedBtn" CssClass="LongLabelWhite" runat="server" OnClick="CountedBtn_Click" Text="Set as Counted"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="RecountBtn" class="LongLabelWhite" runat="server" OnClick="RecountBtn_Click" Text="Mark for Recount"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="GenerateRecountBtn" CssClass="LongLabelWhite" runat="server" OnClick="GenerateRecountBtn_Click" Text="Generate Recount"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CountSheetBtn" class="blue" runat="server" OnClick="CountSheetBtn_Click" Text="Count Sheet"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CountSheet2Btn" CssClass="LongLabelBlue" runat="server" OnClick="CountSheet2Btn_Click" Text="Count Sheet 2"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="AddAlienBtn" CssClass="white" runat="server" OnClick="AddAlienBtn_Click" Text="AddAlien"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CausesValidation="true" />
                    &nbsp;
                    <asp:Button ID="EditAlienBtn" CssClass="white" runat="server" OnClick="EditAlienBtn_Click" Text="EditAlien"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CausesValidation="true" />
                    &nbsp;
                    <asp:Button ID="DelAlienBtn" CssClass="white" runat="server" OnClick="DelAlienBtn_Click" Text="DelAlien"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CausesValidation="true" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <table>
            <tr style="height: 7px">
            </tr>
            <tr>
                <td>&nbsp;
                    From LineID
                    <br />
                    &nbsp;
                    <telerik:RadTextBox ID="ICDetlIdTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                        ErrorMessage="#" ControlToValidate="ICDetlIdTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>To LineID<br />
                    <telerik:RadTextBox ID="ToICDetlIdTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" "
                        ErrorMessage="#" ControlToValidate="ToICDetlIdTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>RecountNo<br />
                    <telerik:RadTextBox ID="ReCntNoTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="ReCntNoVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                        ErrorMessage="#" ControlToValidate="ReCntNoTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>SKU<br />
                    <telerik:RadTextBox ID="SkuCodeTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="SkuCodeVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="SkuCodeTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>Location<br />
                    <telerik:RadTextBox ID="LocationTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="LocationTxtVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="LocationTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>PalletNo<br />
                    <telerik:RadTextBox ID="PalletNoTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="PalletNoVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="PalletNoTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>Alien<br />
                    <telerik:RadDropDownList ID="AlienDDL" runat="server" Skin="WebBlue" Enabled="True"
                        DataValueField="item" DataTextField="Descr">
                    </telerik:RadDropDownList>
                    <asp:CompareValidator ID="AlienDDLVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="AlienDDL" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CausesValidation="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnPreRender="ResultDG_PreRender" OnPageIndexChanged="ResultDG_PageIndexChanged"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" ScrollHeight="400px" />
            </ClientSettings>
            <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
                FileName="InventoryCount">
                <Excel Format="Html" />
            </ExportSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false" Reorderable="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="lineChkbx" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="LineId"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="PalletNo" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno1" HeaderText="CartonNo" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExternalLineId1" SortExpression="ExternalLineId1" HeaderText="ExtEntryId" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ExternalLineId2" SortExpression="ExternalLineId2" HeaderText="ExtInterfaceId" AutoPostBackOnFilter="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ApprovalDate" SortExpression="ApprovalDate" HeaderText="ApprovedDate" AutoPostBackOnFilter="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="CountQty" AllowFiltering="false" UniqueName="countedqty" DataField="countedqty">
                        <ItemTemplate>
                            <asp:TextBox ID="CountQtyTxt" CssClass="text" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "countedqty", "{0:0.###}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                ErrorMessage="#" ControlToValidate="CountQtyTxt" Operator="GreaterThanEqual" ValueToCompare="0" Type="Double"></asp:CompareValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Remarks" AllowFiltering="false" UniqueName="rem1" DataField="rem1">
                        <ItemTemplate>
                            <asp:TextBox ID="RemarkTxt" CssClass="text" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku" AutoPostBackOnFilter="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SkuDescr" AutoPostBackOnFilter="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="recntno" SortExpression="recntno" HeaderText="Recount" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="OnHandQty"
                        AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.###}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Variance" SortExpression="Variance" HeaderText="Variance(Y/N)" AutoPostBackOnFilter="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="varuomqty" SortExpression="varuomqty" HeaderText="Variance"
                        AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.###}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" Display="true" AutoPostBackOnFilter="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="alien" SortExpression="alien" HeaderText="Alien" Display="true" AutoPostBackOnFilter="true" AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcDate" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3" AllowFiltering="false"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" SortExpression="lot9" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" SortExpression="lot10" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" SortExpression="lot11" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" SortExpression="lot12" AllowFiltering="false">
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
                    <telerik:GridBoundColumn DataField="status" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skuid" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="countuser" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skupckqty" SortExpression="skupckqty" HeaderText="skupckqty" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolour" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <%--Message popup area start--%>
        <%--Message popup 2 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 2 area end--%>
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
        <asp:UpdateProgress ID="SelectProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
