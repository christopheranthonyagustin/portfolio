<%@ Page Language="c#" CodeBehind="TransferDetl.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.HouseKeeping.Transfer.TransferDetl" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ListDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab ID="LineTab" Text="Line" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="SerialNo" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td align="left">
                    <asp:Button ID="AddDetailBtn" runat="server" Text="New" Visible="False" CssClass="white" OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"></asp:Button>
                    <%--&nbsp;&nbsp;--%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <a name="#AddDetailBtn"></a>
                        <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td colspan="8" nowrap align="right">&nbsp;
                                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text="Save" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                                <asp:Button ID="ClosePanelBtn" runat="server" CssClass="detailButton" Text="- Hide"
                                    CausesValidation="False" OnClick="ClosePanelBtn_Click"></asp:Button>&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td nowrap>From Account<br>
                                    To Account
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrAcCodeTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:DropDownList ID="ToAccountList" runat="server">
                                </asp:DropDownList>
                                </td>
                                <td nowrap>From SKU<br>
                                    To SKU
                                <asp:RequiredFieldValidator ID="ToSkuReq" runat="server" ControlToValidate="ToSkuTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrSkuTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToSkuTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>Transfer&nbsp;Qty
                                <asp:RequiredFieldValidator ID="QtyReq" runat="server" ControlToValidate="QtyTxt"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="QtyCompVal" runat="server" ControlToValidate="QtyTxt" ErrorMessage="#"
                                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="QtyTxt" runat="server"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td nowrap>From Site<br>
                                    To Site
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrSiteTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:DropDownList ID="ToSiteList" runat="server">
                                </asp:DropDownList>
                                </td>
                                <td nowrap>From Location<br>
                                    To Location
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLocTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLocTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From TU#1<br>
                                    To TU#1
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrTu1Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToTu1Txt" runat="server"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td nowrap>From TU#2<br>
                                    To TU#2
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrTu2Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToTu2Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Rcv Date<br>
                                    To Rcv Date
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrRcvDateTxt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToRcvDateTxt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 1<br>
                                    To Lot 1
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot1Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot1Txt" runat="server"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td nowrap>From Lot 2<br>
                                    To Lot 2
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot2Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot2Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 3<br>
                                    To Lot 3
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot3Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot3Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 4<br>
                                    To Lot 4
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot4Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot4Txt" runat="server"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td nowrap>From Lot 5<br>
                                    To Lot 5
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot5Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot5Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 6<br>
                                    To Lot 6
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot6Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot6Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 7<br>
                                    To Lot 7
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot7Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot7Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 8<br>
                                    To Lot 8
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot8Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot8Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 9<br>
                                    To Lot 9
                                </td>
                                <td nowrap>:
                                <asp:TextBox ID="FrLot9Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :
                                <asp:TextBox ID="ToLot9Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 10<br>
                                    To Lot 10
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot10Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot10Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 11<br>
                                    To Lot 11
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot11Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot11Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 12<br>
                                    To Lot 12
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot12Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot12Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 13<br>
                                    To Lot 13
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot13Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot13Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 14<br>
                                    To Lot 14
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot14Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot14Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 15<br>
                                    To Lot 15
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot15Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot15Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 16<br>
                                    To Lot 16
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot16Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot16Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 17<br>
                                    To Lot 17
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot17Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot17Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 18<br>
                                    To Lot 18
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot18Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot18Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 19<br>
                                    To Lot 19
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot19Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot19Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 20<br>
                                    To Lot 20
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot20Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot20Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 21<br>
                                    To Lot 21
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot21Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot21Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 22<br>
                                    To Lot 22
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot22Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot22Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 23<br>
                                    To Lot 23
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot23Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot23Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 24<br>
                                    To Lot 24
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot24Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot24Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 25<br>
                                    To Lot 25
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot25Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot25Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 26<br>
                                    To Lot 26
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot26Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot26Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 27<br>
                                    To Lot 27
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot27Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot27Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 28<br>
                                    To Lot 28
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot28Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot28Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 29<br>
                                    To Lot 29
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot29Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot29Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 30<br>
                                    To Lot 30
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot30Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot30Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 31<br>
                                    To Lot 31
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot31Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot31Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 32<br>
                                    To Lot 32
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot32Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot32Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 33<br>
                                    To Lot 33
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot33Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot33Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 34<br>
                                    To Lot 34
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot34Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot34Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 35<br>
                                    To Lot 35
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot35Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot35Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 36<br>
                                    To Lot 36
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot36Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot36Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 37<br>
                                    To Lot 37
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot37Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot37Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 38<br>
                                    To Lot 38
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot38Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot38Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 39<br>
                                    To Lot 39
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot39Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot39Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 40<br>
                                    To Lot 40
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot40Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot40Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 41<br>
                                    To Lot 41
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot41Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot41Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 42<br>
                                    To Lot 42
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot42Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot42Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 43<br>
                                    To Lot 43
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot43Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot43Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 44<br>
                                    To Lot 44
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot44Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot44Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 45<br>
                                    To Lot 45
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot45Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot45Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 46<br>
                                    To Lot 46
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot46Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot46Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 47<br>
                                    To Lot 47
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot47Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot47Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 48<br>
                                    To Lot 48
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot48Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot48Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 49<br>
                                    To Lot 49
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot49Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot49Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 50<br>
                                    To Lot 50
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot50Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot50Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 51<br>
                                    To Lot 51
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot51Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot51Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 52<br>
                                    To Lot 52
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot52Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot52Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 53<br>
                                    To Lot 53
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot53Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot53Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 54<br>
                                    To Lot 54
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot54Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot54Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 55<br>
                                    To Lot 55
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot55Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot55Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 56<br>
                                    To Lot 56
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot56Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot56Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 57<br>
                                    To Lot 57
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot57Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot57Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 58<br>
                                    To Lot 58
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot58Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot58Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 59<br>
                                    To Lot 59
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot59Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot59Txt" runat="server"></asp:TextBox>
                                </td>
                                <td nowrap>From Lot 60<br>
                                    To Lot 60
                                </td>
                                <td nowrap>:<asp:TextBox ID="FrLot60Txt" runat="server" ReadOnly="True"></asp:TextBox><br>
                                    :<asp:TextBox ID="ToLot60Txt" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br>
        <%--<asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
                    BorderStyle="None" GridLines="Both" CellPadding="2" PageSize="16" OnItemCommand="TFDetail_Item"
                    UseAccessibleHeader="True">--%>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">

                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowFilteringByColumn="false" EnableLinqExpressions="false" AllowSorting="true"
                    OnItemCommand="TFDetail_Item" OnItemDataBound="ResultDG_ItemDataBound"
                    Skin="Metro" AllowPaging="true" GroupPanelPosition="Top" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>

                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <%--   <asp:TemplateColumn>
                            <ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <ItemTemplate>
                                <a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Finalize Transfer?')"
                                    onserverclick="FinalizeTFDetl" runat="server">
                                    <img id="finalizeImg" src="../../image/finalize.gif" width="15" height="15" border="0"
                                        alt="Finalize Transfer" runat="server"></a>
                                <asp:ImageButton runat="server" Visible="True" ID="TFEdit" ImageUrl="../../image/pencil.gif"
                                    Width="15" BackColor="Transparent" BorderWidth="0" Height="15" AlternateText="Edit Transfer Detail"
                                    CommandName="EditDetail" CausesValidation="False"></asp:ImageButton>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete transfer detail?')"
                                    onserverclick="TFDetail_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Transfer Detail"
                                        runat="server"></a>
                            </ItemTemplate>
                        </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="lineChkbx" runat="server" />

                                    <a id="lnkFinalize" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm Finalize Transfer?')"
                                        onserverclick="FinalizeTFDetl" runat="server">
                                        <img id="finalizeImg" src="../../image/finalize.gif" width="15" height="15" border="0"
                                            alt="Finalize Transfer" runat="server"></a>
                                    <asp:ImageButton runat="server" Visible="True" ID="TFEdit" ImageUrl="../../image/pencil.gif"
                                        Width="15" BackColor="Transparent" BorderWidth="0" Height="15" AlternateText="Edit Transfer Detail"
                                        CommandName="EditDetail" CausesValidation="False"></asp:ImageButton>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete transfer detail?')"
                                        onserverclick="TFDetail_Delete" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Transfer Detail"
                                            runat="server"></a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="status" SortExpression="status" Display="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--<asp:BoundColumn DataField="line" SortExpression="line" HeaderText="Line#">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="line" SortExpression="line" HeaderText="Line#" AllowFiltering="false">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="">
                        <itemtemplate>
                                From :<br>
                                To :<br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderText="">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    From :<br>
                                    To :<br>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Account">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromaccode") %>'
                                    ID="FromAcCodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toaccode") %>'
                                    ID="ToAcCodeLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Account" Visible="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromaccode") %>'
                                        ID="FromAcCodeLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toaccode") %>'
                                        ID="ToAcCodeLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="SKU">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromskucode") %>'
                                    ID="FromSkuCodeLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toskucode") %>'
                                    ID="ToSkuCodeLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="SKU">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromskucode") %>'
                                        ID="FromSkuCodeLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toskucode") %>'
                                        ID="ToSkuCodeLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn HeaderText="Sku Description">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromskudescr") %>'
                                        ID="FrSkuDescr">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toskudescr") %>'
                                        ID="ToSkuDescr">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:BoundColumn DataField="transferedqty" SortExpression="transferedqty" HeaderText="Qty"
                        DataFormatString="{0:#,###}">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False" horizontalalign="Center"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="transferedqty" SortExpression="transferedqty"
                                HeaderText="Qty" DataFormatString="{0:#,###}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Site">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromsitedescr") %>'
                                    ID="FrSiteLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tositedescr") %>'
                                    ID="ToSiteLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Site">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromsitedescr") %>'
                                        ID="FrSiteLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tositedescr") %>'
                                        ID="ToSiteLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Location">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromLoccode")%>'
                                    ID="FrLocLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toloccode") %>'
                                    ID="ToLocLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Location" >
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromLoccode")%>'
                                        ID="FrLocLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toloccode") %>'
                                        ID="ToLocLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="TU#1">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno1") %>'
                                    ID="FrTu1Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno1") %>'
                                    ID="ToTu1Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Pallet No">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno1") %>'
                                        ID="FrTu1Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno1") %>'
                                        ID="ToTu1Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="TU#2">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno2") %>'
                                    ID="FrTu2Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno2") %>'
                                    ID="ToTu2Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Carton No">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromtuno2") %>'
                                        ID="FrTu2Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "totuno2") %>'
                                        ID="ToTu2Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Receive Date">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromrcdate","{0:dd/MMM/yyyy}") %>'
                                    ID="FrRcDateLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "torcdate","{0:dd/MMM/yyyy}") %>'
                                    ID="ToRcDateLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Receive Date">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromrcdate","{0:dd/MMM/yyyy}") %>'
                                        ID="FrRcDateLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "torcdate","{0:dd/MMM/yyyy}") %>'
                                        ID="ToRcDateLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot4">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot4") %>'
                                    ID="FrLot4Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot4") %>'
                                    ID="ToLot4Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot4">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot4") %>'
                                        ID="FrLot4Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot4") %>'
                                        ID="ToLot4Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot1">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot1","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot1Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot1","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot1Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot1">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot1","{0:dd/MMM/yyyy}") %>'
                                        ID="FrLot1Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot1","{0:dd/MMM/yyyy}") %>'
                                        ID="ToLot1Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot5">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot5") %>'
                                    ID="FrLot5Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot5") %>'
                                    ID="ToLot5Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot5">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot5") %>'
                                        ID="FrLot5Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot5") %>'
                                        ID="ToLot5Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot6">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot6") %>'
                                    ID="FrLot6Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot6") %>'
                                    ID="ToLot6Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot6">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot6") %>'
                                        ID="FrLot6Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot6") %>'
                                        ID="ToLot6Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot7">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot7") %>'
                                    ID="FrLot7Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot7") %>'
                                    ID="ToLot7Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot7">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot7") %>'
                                        ID="FrLot7Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot7") %>'
                                        ID="ToLot7Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot2">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot2","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot2Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot2","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot2Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot2">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot2","{0:dd/MMM/yyyy}") %>'
                                        ID="FrLot2Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot2","{0:dd/MMM/yyyy}") %>'
                                        ID="ToLot2Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot3">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot3","{0:dd/MMM/yyyy}") %>'
                                    ID="FrLot3Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot3","{0:dd/MMM/yyyy}") %>'
                                    ID="ToLot3Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot3">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot3","{0:dd/MMM/yyyy}") %>'
                                        ID="FrLot3Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot3","{0:dd/MMM/yyyy}") %>'
                                        ID="ToLot3Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot8">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot8") %>'
                                    ID="FrLot8Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot8") %>'
                                    ID="ToLot8Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot8">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot8") %>'
                                        ID="FrLot8Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot8") %>'
                                        ID="ToLot8Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot9">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot9") %>'
                                    ID="FrLot9Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot9") %>'
                                    ID="ToLot9Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot9">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot9") %>'
                                        ID="FrLot9Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot9") %>'
                                        ID="ToLot9Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot10">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot10") %>'
                                    ID="FrLot10Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot10") %>'
                                    ID="ToLot10Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot10">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot10") %>'
                                        ID="FrLot10Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot10") %>'
                                        ID="ToLot10Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot11">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot11") %>'
                                    ID="FrLot11Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot11") %>'
                                    ID="ToLot11Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot11">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot11") %>'
                                        ID="FrLot11Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot11") %>'
                                        ID="ToLot11Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot12">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot12") %>'
                                    ID="FrLot12Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot12") %>'
                                    ID="ToLot12Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot12">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot12") %>'
                                        ID="FrLot12Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot12") %>'
                                        ID="ToLot12Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot13">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot13") %>'
                                    ID="FrLot13Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot13") %>'
                                    ID="ToLot13Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot13">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot13") %>'
                                        ID="FrLot13Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot13") %>'
                                        ID="ToLot13Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot14">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot14") %>'
                                    ID="FrLot14Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot14") %>'
                                    ID="ToLot14Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot14">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot14") %>'
                                        ID="FrLot14Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot14") %>'
                                        ID="ToLot14Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot15">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot15") %>'
                                    ID="FrLot15Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot15") %>'
                                    ID="ToLot15Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot15">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot15") %>'
                                        ID="FrLot15Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot15") %>'
                                        ID="ToLot15Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot16">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot16") %>'
                                    ID="FrLot16Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot16") %>'
                                    ID="ToLot16Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot16">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot16") %>'
                                        ID="FrLot16Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot16") %>'
                                        ID="ToLot16Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot17">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot17") %>'
                                    ID="FrLot17Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot17") %>'
                                    ID="ToLot17Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot17">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot17") %>'
                                        ID="FrLot17Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot17") %>'
                                        ID="ToLot17Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot18">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot18") %>'
                                    ID="FrLot18Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot18") %>'
                                    ID="ToLot18Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot18">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot18") %>'
                                        ID="FrLot18Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot18") %>'
                                        ID="ToLot18Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot19">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot19") %>'
                                    ID="FrLot19Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot19") %>'
                                    ID="ToLot19Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot19">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot19") %>'
                                        ID="FrLot19Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot19") %>'
                                        ID="ToLot19Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot20">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot20") %>'
                                    ID="FrLot20Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot20") %>'
                                    ID="ToLot20Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot20">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot20") %>'
                                        ID="FrLot20Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot20") %>'
                                        ID="ToLot20Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot21">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot21") %>'
                                    ID="FrLot21Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot21") %>'
                                    ID="ToLot21Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot21">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot21") %>'
                                        ID="FrLot21Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot21") %>'
                                        ID="ToLot21Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot22">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot22") %>'
                                    ID="FrLot22Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot22") %>'
                                    ID="ToLot22Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot22">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot22") %>'
                                        ID="FrLot22Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot22") %>'
                                        ID="ToLot22Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot23">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot23") %>'
                                    ID="FrLot23Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot23") %>'
                                    ID="ToLot23Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot23">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot23") %>'
                                        ID="FrLot23Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot23") %>'
                                        ID="ToLot23Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot24">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot24") %>'
                                    ID="FrLot24Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot24") %>'
                                    ID="ToLot24Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot24">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot24") %>'
                                        ID="FrLot24Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot24") %>'
                                        ID="ToLot24Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot25">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot25") %>'
                                    ID="FrLot25Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot25") %>'
                                    ID="ToLot25Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot25">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot25") %>'
                                        ID="FrLot25Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot25") %>'
                                        ID="ToLot25Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot26">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot26") %>'
                                    ID="FrLot26Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot26") %>'
                                    ID="ToLot26Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot26">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot26") %>'
                                        ID="FrLot26Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot26") %>'
                                        ID="ToLot26Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot27">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot27") %>'
                                    ID="FrLot27Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot27") %>'
                                    ID="ToLot27Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot27">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot27") %>'
                                        ID="FrLot27Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot27") %>'
                                        ID="ToLot27Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot28">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot28") %>'
                                    ID="FrLot28Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot28") %>'
                                    ID="ToLot28Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot28">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot28") %>'
                                        ID="FrLot28Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot28") %>'
                                        ID="ToLot28Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot29">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot29") %>'
                                    ID="FrLot29Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot29") %>'
                                    ID="ToLot29Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot29">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot29") %>'
                                        ID="FrLot29Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot29") %>'
                                        ID="ToLot29Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot30">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot30") %>'
                                    ID="FrLot30Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot30") %>'
                                    ID="ToLot30Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot30">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot30") %>'
                                        ID="FrLot30Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot30") %>'
                                        ID="ToLot30Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot31">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot31") %>'
                                    ID="FrLot31Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot31") %>'
                                    ID="ToLot31Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot31">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot31") %>'
                                        ID="FrLot31Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot31") %>'
                                        ID="ToLot31Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot32">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot32") %>'
                                    ID="FrLot32Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot32") %>'
                                    ID="ToLot32Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot32">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot32") %>'
                                        ID="FrLot32Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot32") %>'
                                        ID="ToLot32Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot33">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot33") %>'
                                    ID="FrLot33Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot33") %>'
                                    ID="ToLot33Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot33">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot33") %>'
                                        ID="FrLot33Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot33") %>'
                                        ID="ToLot33Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot34">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot34") %>'
                                    ID="FrLot34Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot34") %>'
                                    ID="ToLot34Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot34">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot34") %>'
                                        ID="FrLot34Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot34") %>'
                                        ID="ToLot34Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot35">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot35") %>'
                                    ID="FrLot35Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot35") %>'
                                    ID="ToLot35Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot35">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot35") %>'
                                        ID="FrLot35Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot35") %>'
                                        ID="ToLot35Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot36">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot36") %>'
                                    ID="FrLot36Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot36") %>'
                                    ID="ToLot36Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot36">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot36") %>'
                                        ID="FrLot36Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot36") %>'
                                        ID="ToLot36Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot37">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot37") %>'
                                    ID="FrLot37Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot37") %>'
                                    ID="ToLot37Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot37">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot37") %>'
                                        ID="FrLot37Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot37") %>'
                                        ID="ToLot37Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot38">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot38") %>'
                                    ID="FrLot38Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot38") %>'
                                    ID="ToLot38Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot38">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot38") %>'
                                        ID="FrLot38Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot38") %>'
                                        ID="ToLot38Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot39">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot39") %>'
                                    ID="FrLot39Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot39") %>'
                                    ID="ToLot39Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot39">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot39") %>'
                                        ID="FrLot39Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot39") %>'
                                        ID="ToLot39Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot40">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot40") %>'
                                    ID="FrLot40Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot40") %>'
                                    ID="ToLot40Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot40">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot40") %>'
                                        ID="FrLot40Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot40") %>'
                                        ID="ToLot40Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot41">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot41") %>'
                                    ID="FrLot41Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot41") %>'
                                    ID="ToLot41Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot41">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot41") %>'
                                        ID="FrLot41Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot41") %>'
                                        ID="ToLot41Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot42">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot42") %>'
                                    ID="FrLot42Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot42") %>'
                                    ID="ToLot42Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot42">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot42") %>'
                                        ID="FrLot42Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot42") %>'
                                        ID="ToLot42Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot43">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot43") %>'
                                    ID="FrLot43Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot43") %>'
                                    ID="ToLot43Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot43">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot43") %>'
                                        ID="FrLot43Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot43") %>'
                                        ID="ToLot43Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot44">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot44") %>'
                                    ID="FrLot44Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot44") %>'
                                    ID="ToLot44Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot44">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot44") %>'
                                        ID="FrLot44Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot44") %>'
                                        ID="ToLot44Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot45">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot45") %>'
                                    ID="FrLot45Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot45") %>'
                                    ID="ToLot45Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot45">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot45") %>'
                                        ID="FrLot45Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot45") %>'
                                        ID="ToLot45Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot46">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot46") %>'
                                    ID="FrLot46Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot46") %>'
                                    ID="ToLot46Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot46">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot46") %>'
                                        ID="FrLot46Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot46") %>'
                                        ID="ToLot46Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot47">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot47") %>'
                                    ID="FrLot47Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot47") %>'
                                    ID="ToLot47Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot47">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot47") %>'
                                        ID="FrLot47Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot47") %>'
                                        ID="ToLot47Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot48">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot48") %>'
                                    ID="FrLot48Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot48") %>'
                                    ID="ToLot48Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot48">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot48") %>'
                                        ID="FrLot48Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot48") %>'
                                        ID="ToLot48Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot49">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot49") %>'
                                    ID="FrLot49Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot49") %>'
                                    ID="ToLot49Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot49">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot49") %>'
                                        ID="FrLot49Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot49") %>'
                                        ID="ToLot49Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot50">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot50") %>'
                                    ID="FrLot50Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot50") %>'
                                    ID="ToLot50Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot50">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot50") %>'
                                        ID="FrLot50Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot50") %>'
                                        ID="ToLot50Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot51">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot51") %>'
                                    ID="FrLo51tLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot51") %>'
                                    ID="ToLot51Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot51">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot51") %>'
                                        ID="FrLo51tLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot51") %>'
                                        ID="ToLot51Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot52">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot52") %>'
                                    ID="FrLot52Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot52") %>'
                                    ID="ToLot52Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot52">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot52") %>'
                                        ID="FrLot52Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot52") %>'
                                        ID="ToLot52Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot53">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot53") %>'
                                    ID="FrLot53Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot53") %>'
                                    ID="ToLot53Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot53">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot53") %>'
                                        ID="FrLot53Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot53") %>'
                                        ID="ToLot53Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot54">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot54") %>'
                                    ID="FrLot54Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot54") %>'
                                    ID="ToLot54Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot54">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot54") %>'
                                        ID="FrLot54Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot54") %>'
                                        ID="ToLot54Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot55">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot55") %>'
                                    ID="FrLot55Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot55") %>'
                                    ID="ToLot55Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot55">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot55") %>'
                                        ID="FrLot55Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot55") %>'
                                        ID="ToLot55Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot56">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot56") %>'
                                    ID="FrLot56Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot56") %>'
                                    ID="ToLot56Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot56">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot56") %>'
                                        ID="FrLot56Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot56") %>'
                                        ID="ToLot56Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot57">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot57") %>'
                                    ID="FrLot57Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot57") %>'
                                    ID="ToLot57Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot57">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot57") %>'
                                        ID="FrLot57Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot57") %>'
                                        ID="ToLot57Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot58">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot58") %>'
                                    ID="FrLot58Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot58") %>'
                                    ID="ToLot58Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot58">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot58") %>'
                                        ID="FrLot58Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot58") %>'
                                        ID="ToLot58Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot59">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot59") %>'
                                    ID="FrLot59Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot59") %>'
                                    ID="ToLot59Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot59">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot59") %>'
                                        ID="FrLot59Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot59") %>'
                                        ID="ToLot59Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Lot60">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot60") %>'
                                    ID="FrLot60Lbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot60") %>'
                                    ID="ToLot60Lbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Lot60">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlot60") %>'
                                        ID="FrLot60Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolot60") %>'
                                        ID="ToLot60Lbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="LotUOM">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlotuom") %>'
                                    ID="FrLotUomLbl" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolotuom") %>'
                                    ID="ToLotUomLbl" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="LotUOM">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlotuom") %>'
                                        ID="FrLotUomLbl">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolotuom") %>'
                                        ID="ToLotUomLbl">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="LotID">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlotid") %>'
                                    ID="FrLotId" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolotid") %>'
                                    ID="ToLotId" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="LotID">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlotid") %>'
                                        ID="FrLotId">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolotid") %>'
                                        ID="ToLotId">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Length">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlength") %>'
                                    ID="FrLength" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolength") %>'
                                    ID="ToLength" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Length">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromlength") %>'
                                        ID="FrLength">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tolength") %>'
                                        ID="ToLength">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--<asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Width">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromwidth") %>'
                                    ID="FrWidth" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "towidth") %>'
                                    ID="ToWidth" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Width">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromwidth") %>'
                                        ID="FrWidth">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "towidth") %>'
                                        ID="ToWidth">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Height">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromheight") %>'
                                    ID="FrHeight" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toheight") %>'
                                    ID="ToHeight" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Height">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromheight") %>'
                                        ID="FrHeight">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toheight") %>'
                                        ID="ToHeight">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Vol">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromvol") %>'
                                    ID="FrVol" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tovol") %>'
                                    ID="ToVol" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Vol">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromvol") %>'
                                        ID="FrVol">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tovol") %>'
                                        ID="ToVol">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Wt">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromwt") %>'
                                    ID="FrWt" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "towt") %>'
                                    ID="ToWt" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Wt">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromwt") %>'
                                        ID="FrWt">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "towt") %>'
                                        ID="ToWt">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%--  <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Net Wt">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromnetwt") %>'
                                    ID="FrNetWt" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tonetwt") %>'
                                    ID="ToNetWt" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>
                            <telerik:GridTemplateColumn HeaderText="Net Wt">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromnetwt") %>'
                                        ID="FrNetWt">
                                    </telerik:RadLabel>
                                    <br />
                                    <telerik:RadLabel runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tonetwt") %>'
                                        ID="ToNetWt">
                                    </telerik:RadLabel>
                                    <br />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <%-- <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="Sku Description">
                        <itemtemplate>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fromskudescr") %>'
                                    ID="FrSkuDescr" /><br>
                                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "toskudescr") %>'
                                    ID="ToSkuDescr" /><br>
                            </itemtemplate>
                    </asp:TemplateColumn>--%>

                            <%--<asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--<asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--   <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                DataFormatString="{0:dd/MMM/yyyy}">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <%--<asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        <headerstyle wrap="False"></headerstyle>
                        <itemstyle wrap="False"></itemstyle>
                    </asp:BoundColumn>--%>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="SerialNoRadPageView" Height="700px" />
        </telerik:RadMultiPage>

    </form>
</body>
</html>
