<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Variance.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Variance" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>InvCountV3Detl2</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" href="../../css/iWMSTelerik.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onkeydown="javascript:if(window.event.keyCode == 13) window.event.keyCode = 9;">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <table id="tb1" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="IcIdLbl" runat="server"></asp:Label>
                    </div>
                </td>
                <td>
                    <asp:UpdatePanel ID="SelectUpnl" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Visible="False" Text="Select"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp; 
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>&nbsp;&nbsp;
                    <asp:Label ID="LineLbl" runat="server" Text="Line" Font-Bold="true" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Totallbl" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" CausesValidation="false" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="RecountBtn" CssClass="LongLabelWhite" runat="server" OnClick="RecountBtn_Click" Text="Mark for Recount"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="PopulateAdjustmentBtn" CssClass="LongLabelWhite" runat="server" OnClick="PopulateAdjustmentBtn_Click" Text="Populate Adjustment"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td align="right" style="padding-right: 25px">
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:Label ID="FromLineIdLbl" runat="server" Text="From LineID"></asp:Label>
                    <br />
                    <telerik:RadTextBox ID="ICDetlIdTxt" runat="server" Width="140px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="ICDetlIdTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="ToLineIdLbl" runat="server" Text="To LineID"></asp:Label><br />
                    <telerik:RadTextBox ID="ToICDetlIdTxt" runat="server" Width="140px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="ToICDetlIdTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="RecountLbl" runat="server" Text="Recount"></asp:Label><br />
                    <telerik:RadTextBox ID="ReCntNoTxt" runat="server" Width="140px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="ReCntNoVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="ReCntNoTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="SkuCodeLbl" runat="server" Text="SKU"></asp:Label><br />
                    <telerik:RadTextBox ID="SkuCodeTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="SkuCodeVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="SkuCodeTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="LocationLbl" runat="server" Text="Location"></asp:Label><br />
                    <telerik:RadTextBox ID="LocationTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="LocationTxtVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="LocationTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="PalletNoLbl" runat="server" Text="PalletNo"></asp:Label><br />
                    <telerik:RadTextBox ID="PalletNoTxt" runat="server" Width="100px">
                    </telerik:RadTextBox>
                    <asp:CompareValidator ID="PalletNoVal" runat="server" CssClass="errorLabelBig" ForeColor="Red"
                        ErrorMessage="#" ControlToValidate="PalletNoTxt" Operator="DataTypeCheck"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnPreRender="ResultDG_PreRender"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" ScrollHeight="450" />
            </ClientSettings>
            <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
                FileName="InventoryCount">
                <Excel Format="Html" />
            </ExportSettings>
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="Id" AllowFilteringByColumn="false" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:CheckBox ID="LineChkBox" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="LineId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno2" HeaderText="TUNo1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TUNo2">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="CountQty" UniqueName="countedqty" DataField="countedqty">
                        <ItemTemplate>
                            <br />
                            <asp:TextBox ID="CountQtyTxt" CssClass="text" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "countedqty", "{0:0.###}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                ErrorMessage="#" ControlToValidate="CountQtyTxt" Operator="GreaterThanEqual" ValueToCompare="0" Type="Double"></asp:CompareValidator>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Remarks" UniqueName="rem1" DataField="rem1">
                        <ItemTemplate>
                            <asp:TextBox ID="RemarkTxt" CssClass="text" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "rem1") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SkuDescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="recntno" SortExpression="recntno" HeaderText="Recount" ItemStyle-HorizontalAlign="Center">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="onhandqty" SortExpression="onhandqty" HeaderText="OnHandQty"
                        ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.###}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="varuomqty" SortExpression="varuomqty" HeaderText="Variance"
                        ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.###}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="alien" SortExpression="alien" HeaderText="Alien" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcDate"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" SortExpression="lot9">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" SortExpression="lot10">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" SortExpression="lot11">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" SortExpression="lot12">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" Display="false" />
                    <telerik:GridBoundColumn DataField="skuid" Display="false" />
                    <telerik:GridBoundColumn DataField="countuser" Display="false" />
                    <telerik:GridBoundColumn DataField="accode" Display="false" />
                    <telerik:GridBoundColumn DataField="skupckqty" Display="false" />
                    <telerik:GridBoundColumn DataField="statuscolour" Display="false" />
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
    </form>
</body>
</html>
