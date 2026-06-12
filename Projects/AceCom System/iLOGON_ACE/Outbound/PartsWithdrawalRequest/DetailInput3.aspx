<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailInput3.aspx.cs" Inherits="iWMS.Web.Outbound.PartsWithdrawalRequest.DetailInput3" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>SKU Line @ Goods Issue</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .modalBackground {
            background-color: #E6EAFF;
            filter: alpha(opacity=80);
            -moz-opacity: 0.5;
            -khtml-opacity: 0.5;
            opacity: 0.5;
        }

        .ModalPopup {
            background-color: Gray;
            background: url('media/popup-bg.gif') no-repeat;
            background-position: center;
            padding: 0;
            border: none;
            z-index: 6001;
            width: 450px;
            height: 300px;
            overflow: auto;
        }

        .DropZone1 {
            width: 200px;
            height: 90px;
            background-color: #F2F2F2;
            border-color: #CCCCCC;
            color: #767676;
            text-align: center;
            font-size: 16px;
            color: black;
            left: 5px;
            position: relative;
        }
    </style>
</head>

<script language="javascript" type="text/javascript">
    var launch = false;
    function launchModal() {
        launch = true;
    }
    function hideModal() {
        launch = false;
    }

    function pageLoad() {
        if (launch) {
            $find("mpe1").show();
        }
        else {
            $find("mpe1").hide();
        }
    }

    function GetRadWindow() {
        var oWindow = null; if (window.radWindow)
            oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
    }

    function close() {
        GetRadWindow().close();
    }

    function OnClientClose(sender, args) {
        document.location.href = document.location.href;
    }
</script>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Windows7" CausesValidation="false" OnTabClick="RadTabStrip1_Click">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Extra Lots" Value="1">
                </telerik:RadTab>
                <telerik:RadTab Text="Remarks1" Value="2">
                </telerik:RadTab>
                <telerik:RadTab Text="Remarks2" Value="3">
                </telerik:RadTab>
                <telerik:RadTab Text="External" Value="4" ID="ExternalTab" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Invoice" Value="5" ID="InvoiceTab" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="LotDischarge" Value="6">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="7" ID="AttcTab" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SAPInfo" Value="8">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="IdLbl" runat="server"></asp:Label>
                        </td>
                        <td align="left" style="width: 140px">&nbsp;&nbsp;
                            <asp:CheckBox ID="ChkAdd" ToolTip="ContinuousAdd" runat="server" />
                            <asp:Label ID="ChkAddLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="ContinuousAdd" ForeColor="Black"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ChkClear" ToolTip="Clear Fields for Next Entry" runat="server" Checked="true" />
                            <asp:Label ID="ChkClearLbl" runat="server" Font-Bold="true" Width="250px" Font-Size="Small" Text="Clear Fields for Next Entry" ForeColor="Black"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                            &nbsp;
                            <asp:CheckBox ID="ChkSaveOnPan" ToolTip="SaveOnPan" runat="server" />
                            <asp:Label ID="ChkSaveOnPanLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Panel ID="AddPanel" runat="server">
                    &nbsp;
                    <asp:Button ID="ChooseTU1Btn" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                        CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                    <asp:Button ID="ChooseLotBtn" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </asp:Panel>
                <asp:Panel ID="UpdatePanel" runat="server">
                    &nbsp;
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                        CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" OnClick="SaveBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next"
                        CausesValidation="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />&nbsp;
                    <asp:Button ID="CloseBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseBtn_Click" Text="Close Window"
                        CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    <asp:Button ID="UpdateChooseLotBtn" CssClass="white" runat="server" OnClick="ChooseLotBtn_Click" Text="Choose Lot"
                        CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </asp:Panel>
                <br />
                <table cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <table border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                    <td align="center">&nbsp;<asp:ImageButton ID="AlertImgBtn" runat="server" ImageUrl="../../Image/alert.gif"
                                        Visible="False" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"></asp:ImageButton>
                                        <asp:Label ID="DescrLbl" runat="server" Font-Bold="True"></asp:Label>
                                        <br />
                                        <asp:Label ID="PackingLbl" runat="server">Packing :</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellspacing="2" cellpadding="2">
                                            <tr>
                                                <td>
                                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                </td>
                                                <td>&nbsp;&nbsp;
                                                </td>
                                                <td align="right">
                                                    <asp:Panel ID="AvailQtyPanel" Visible="False" runat="server">
                                                        <table cellspacing="1" cellpadding="1">
                                                            <tr align="center">
                                                                <td colspan="2">
                                                                    <asp:Label Style="z-index: 0" ID="SoftAllocationLbl" runat="server" CssClass="linkLabelBig">Soft Allocation Info</asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="right">
                                                                <td>
                                                                    <asp:Label ID="AvailQtyLbl" runat="server">Available Qty :</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAvailQty" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="right">
                                                                <td>
                                                                    <asp:Label ID="AvailLHULbl" runat="server">LHU :</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAvailLHU" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="right">
                                                                <td>
                                                                    <asp:Label ID="NoOfLocLbl" runat="server">Location :</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblNoOfLoc" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblAllocationStatus" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="right">
                                                                <td>
                                                                    <asp:Label ID="AvailUOMLbl" runat="server">Available UOM :</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAvailUOM" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr align="right">
                                                                <td>
                                                                    <br />
                                                                    <asp:Label ID="AvailSellUnitQtyLbl" runat="server" Visible="false">Avail Qty (SellUnit) :</asp:Label>
                                                                </td>
                                                                <td>
                                                                    <br />
                                                                    <asp:Label ID="AvailSellUnitQtyValue" runat="server" Visible="false"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl_Lots" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <asp:Panel ID="Loc_Vas_Rem1_Panel" runat="server" Visible="true">
                                    <tr>
                                        <td>
                                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtlRCSKU" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">
                            <asp:TextBox ID="slltidTxt" runat="server" AutoPostBack="true" OnTextChanged="slltidTxt_TextChanged"
                                Height="1px" Width="1px" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ExtraLotsRadPageView">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="ExtraLotsTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ChooseTU1Btn2" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                                CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="ChooseLotBtn2" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                            <asp:Button ID="ExtraLotsSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_ExtraLots" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="Rem1RadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="Rem1TitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ChooseTU1Btn3" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                                CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="ChooseLotBtn3" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                            <asp:Button ID="Rem1SaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Rem1" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="Rem2RadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="Rem2TitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ChooseTU1Btn4" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                                CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="ChooseLotBtn4" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                            <asp:Button ID="Rem2SaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Rem2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="ExternalRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="ExternalTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ChooseTU1Btn5" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                                CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="ChooseLotBtn5" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                            <asp:Button ID="ExternalSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_External" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="InvoiceRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="InvoiceTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="ChooseTU1Btn6" runat="server" Text="Choose TU1" OnClick="ChooseTU1Btn_Click" CausesValidation="false"
                                CssClass="white" Visible="False" Enabled="false" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="ChooseLotBtn6" runat="server" CssClass="white" Text="Choose Lot" OnClick="ChooseLotBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" Enabled="false" CausesValidation="false" />&nbsp;
                            <asp:Button ID="InvoiceSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_Invoice" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="LotDischargeRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="LotDischargeTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="LDSaveBtn" runat="server" CssClass="white" Text="Save" OnClick="LDSaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" Enabled="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel runat="server" ID="LotDischargePnl" Visible="false">
                                <table cellspacing="2" cellpadding="2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="SkugrpLbl" runat="server">SKU Group</asp:Label><br />
                                            <telerik:RadComboBox RenderMode="Lightweight" ID="SkugrpList" runat="server" Width="155" AutoPostBack="true"
                                                OnSelectedIndexChanged="SkugrpList_SelectedIndexChanged" EnableVirtualScrolling="false" BackColor="Yellow">
                                            </telerik:RadComboBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lot4Lbl" runat="server"></asp:Label><br />
                                            <telerik:RadTextBox ID="Lot4Txt" runat="server" Width="155"></telerik:RadTextBox>
                                            <telerik:RadDropDownList ID="Lot4DDL" runat="server" Width="155" Visible="false">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lot5Lbl" runat="server"></asp:Label><br />
                                            <telerik:RadTextBox ID="Lot5Txt" runat="server" Width="155"></telerik:RadTextBox>
                                            <telerik:RadDropDownList ID="Lot5DDL" runat="server" Width="155" Visible="false">
                                            </telerik:RadDropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lot6Lbl" runat="server"></asp:Label><br />
                                            <telerik:RadTextBox ID="Lot6Txt" runat="server" Width="155"></telerik:RadTextBox>
                                            <telerik:RadDropDownList ID="Lot6DDL" runat="server" Width="155" Visible="false">
                                            </telerik:RadDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AttcRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="AttcTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:DataList ID="ImageDataList" runat="server" RepeatColumns="0" DataKeyField="id"
                                BorderColor="#999999" BorderStyle="None" BackColor="White" CellPadding="3" GridLines="Vertical"
                                BorderWidth="1px" RepeatDirection="Horizontal">
                                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                                <AlternatingItemStyle BackColor="#DCDCDC"></AlternatingItemStyle>
                                <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="ImageDescrLbl" runat="server"></asp:Label>
                                                <br />
                                                <asp:Label ID="ImageTypeSizeLbl" runat="server"></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                                    OnClick="IssueImageDelete">
                                                    <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Image"
                                                        runat="server" />
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
                                <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
                            </asp:DataList><br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="FileUploadPanel" runat="server">
                                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <iWMS:iForm ID="formCtlAttc" runat="server"></iWMS:iForm>
                                        </td>
                                        <td valign="top">&nbsp;
                                        </td>
                                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                                HideFileInput="true" Skin="Outlook" DropZones=".DropZone1,#DropZone2">
                                                <Localization Select="Select a File" />
                                            </telerik:RadAsyncUpload>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            &nbsp;
                                <telerik:RadButton ID="UploadBtn" runat="server" OnClick="ImageSubmit_ServerClick"
                                    Text="UPLOAD" Skin="WebBlue" CausesValidation="false">
                                </telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td colspan="2">
                            <div class="DropZone1">
                                <p>
                                    Drop Files Here
                                </p>
                            </div>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="SAPInfoRadPageView">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="SAPInfoTitleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            &nbsp;
                            <asp:Button ID="SAPInfoSaveBtn" runat="server" CssClass="white" Text="Add" OnClick="SaveBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl_SAPInfo" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <input id="Test_input2" runat="server" type="hidden" />
                    <asp:Panel ID="ModalPanel2" runat="server" Width="100%" CssClass="ModalPopup">
                        <table width="100%" border="0" cellpadding="2" cellspacing="2">
                            <tr>
                                <td>
                                    <table width="99%" border="0" align="center" cellpadding="4" cellspacing="2" style="font-family: Arial; font-size: 8pt; border-style: solid; border-color: Yellow; background-color: White;">
                                        <tr>
                                            <td valign="top" width="px">
                                                <asp:Label ID="Label20" runat="server" Style="font-size: medium;"><b>Select SKU Lot:</b></asp:Label>
                                                <asp:Label ID="Label5" runat="server" Text="Only up to 200 Lot will be displayed."></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Label ID="ChooseLotLbl" runat="server" Visible="false" />
                                                <asp:DataGrid ID="ResultDG" runat="server" OnItemCommand="ResultDG_ItemCommand" PageSize="5"
                                                    GridLines="Vertical" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                                                    BackColor="White" CellPadding="3" AllowPaging="False" AutoGenerateColumns="False"
                                                    DataKeyField="id" UseAccessibleHeader="True">
                                                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                    <ItemStyle CssClass="DGItem"></ItemStyle>
                                                    <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="wholeqty" SortExpression="wholeqty" HeaderText="Whole Qty">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="wholeuom" SortExpression="wholeuom" HeaderText="Whole UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="looseqty" SortExpression="looseqty" HeaderText="Loose Qty">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="looseuom" SortExpression="looseuom" HeaderText="Loose UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BalanceLooseQty" SortExpression="BalanceLooseQty" HeaderText="Balance LooseQty">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="spavailableqty" SortExpression="spavailableqty" HeaderText="Qty">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="spuom" SortExpression="spuom" HeaderText="UOM">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="lotuom" SortExpression="lotuom" HeaderText="LOT UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="LHU Qty" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem, "availableqty", "{0:#,0.##}")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="lhuuom" SortExpression="lhuuom" HeaderText="LHU UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="Receipt Date"
                                                            DataFormatString="{0:dd/MMM/yyyy}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 4">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>'
                                                                    ID="FrLot4Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot1", "{0:dd/MMM/yyyy}") %>'
                                                                    ID="FrLot1Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 5">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot5") %>'
                                                                    ID="FrLot5Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 6">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot6") %>'
                                                                    ID="FrLot6Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 7">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'
                                                                    ID="FrLot7Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 2">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2", "{0:dd/MMM/yyyy}") %>'
                                                                    ID="FrLot2Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 3">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3") %>'
                                                                    ID="FrLot3Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot 8">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot8") %>'
                                                                    ID="FrLot8Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="SKU Descr">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TU#2">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="length" SortExpression="length" HeaderText="L" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="width" SortExpression="width" HeaderText="W" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="height" SortExpression="height" HeaderText="H" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="vol" SortExpression="vol" HeaderText="Vol" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="wt" SortExpression="wt" HeaderText="Wt" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="netwt" SortExpression="netwt" HeaderText="NWt" DataFormatString="{0:#,0.####}">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot9") %>'
                                                                    ID="FrLot9Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot10") %>'
                                                                    ID="FrLot10Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot11") %>'
                                                                    ID="FrLot11Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot12") %>'
                                                                    ID="FrLot12Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot13") %>'
                                                                    ID="FrLot13Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot14") %>'
                                                                    ID="FrLot14Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot15") %>'
                                                                    ID="FrLot15Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot16") %>'
                                                                    ID="FrLot16Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot17") %>'
                                                                    ID="FrLot17Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot18") %>'
                                                                    ID="FrLot18Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot19") %>'
                                                                    ID="FrLot19Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot20") %>'
                                                                    ID="FrLot20Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot21") %>'
                                                                    ID="FrLot21Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot22") %>'
                                                                    ID="FrLot22Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot23") %>'
                                                                    ID="FrLot23Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot24") %>'
                                                                    ID="FrLot24Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot25") %>'
                                                                    ID="FrLot25Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot26") %>'
                                                                    ID="FrLot26Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot27") %>'
                                                                    ID="FrLot27Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot28") %>'
                                                                    ID="FrLot28Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot29") %>'
                                                                    ID="FrLot29Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot30") %>'
                                                                    ID="FrLot30Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot31") %>'
                                                                    ID="FrLot31Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot32") %>'
                                                                    ID="FrLot32Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot33") %>'
                                                                    ID="FrLot33Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot34") %>'
                                                                    ID="FrLot34Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot35") %>'
                                                                    ID="FrLot35Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot36") %>'
                                                                    ID="FrLot36Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot37") %>'
                                                                    ID="FrLot37Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot38") %>'
                                                                    ID="FrLot38Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot39") %>'
                                                                    ID="FrLot39Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot40") %>'
                                                                    ID="FrLot40Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot41") %>'
                                                                    ID="FrLot41Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot42") %>'
                                                                    ID="FrLot42Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot43") %>'
                                                                    ID="FrLot43Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot44") %>'
                                                                    ID="FrLot44Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot45") %>'
                                                                    ID="FrLot45Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot46") %>'
                                                                    ID="FrLot46Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot47") %>'
                                                                    ID="FrLot47Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot48") %>'
                                                                    ID="FrLot48Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot49") %>'
                                                                    ID="FrLot49Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot50") %>'
                                                                    ID="FrLot50Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot51") %>'
                                                                    ID="FrLot51Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot52") %>'
                                                                    ID="FrLot52Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot53") %>'
                                                                    ID="FrLot53Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot54") %>'
                                                                    ID="FrLot54Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot55") %>'
                                                                    ID="FrLot55Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot56") %>'
                                                                    ID="FrLot56Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot57") %>'
                                                                    ID="FrLot57Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot58") %>'
                                                                    ID="FrLot58Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot59") %>'
                                                                    ID="FrLot59Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot60") %>'
                                                                    ID="FrLot60Lbl" /><br>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                                <asp:DataGrid ID="Datagrid1" runat="server" AutoGenerateColumns="True" BorderStyle="None"
                                                    GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
                                                    <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                                                    <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Label ID="TU1SelectLbl" runat="server" Visible="false" />
                                                <asp:DataGrid ID="TU1DG" runat="server" OnItemCommand="TU1DG_ItemCommand" GridLines="Vertical"
                                                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="White"
                                                    CellPadding="3" AllowPaging="False" AutoGenerateColumns="False" DataKeyField="tuno1"
                                                    UseAccessibleHeader="True">
                                                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                                                    <ItemStyle CssClass="DGItem"></ItemStyle>
                                                    <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="Select" CommandName="Select"></asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Loc">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="TotalQty" SortExpression="TotalQty" HeaderText="Qty">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="spuom" SortExpression="spuom" HeaderText="UOM">
                                                            <HeaderStyle Wrap="true"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="skudescr2" SortExpression="skudescr2" HeaderText="SKU Descr">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TU#1">
                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                            <ItemStyle Wrap="False"></ItemStyle>
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblerror" runat="server" ForeColor="Red">

                                    </asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="center" style="width: 25%;">
                                                <asp:Button ID="Close_btn" runat="server" OnClick="ModalPopupEventHandler" Font-Names="Arial"
                                                    Text="Close" CssClass="detailButton" CausesValidation="false" />
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="Test_input2" PopupControlID="ModalPanel2"
                        BackgroundCssClass="modalBackground" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
