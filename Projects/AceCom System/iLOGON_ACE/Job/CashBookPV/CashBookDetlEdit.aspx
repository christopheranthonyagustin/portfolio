<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashBookDetlEdit.aspx.cs"
    Inherits="iWMS.Web.Job.CashBookPV.CashBookDetlEdit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CashBookDetlEdit</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <base target="_self">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
     <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .style1
        {
            width: 72px;
        }
        .style2
        {
            width: 196px;
        }
        .style3
        {
            width: 92px;
        }
        .style4
        {
            width: 72px;
            height: 22px;
        }
        .style5
        {
            width: 196px;
            height: 22px;
        }
        .style6
        {
            width: 92px;
            height: 22px;
        }
        .style7
        {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="style1">
                &nbsp;
                <asp:HiddenField ID="JBCtnrTripIDTxt" runat="server" />
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                Charge
            </td>
            <td class="style2">
                <telerik:RadComboBox ID="ChargeDDL" runat="server" Width="190px" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                    AutoPostBack="true" RenderMode = "Lightweight" filter = "Contains" CausesValidation="false" SkinID="RAD_SKIN_WEBBLUE"
                    AllowCustomText="false" DropDownWidth="500px">
                </telerik:RadComboBox>
                <asp:HiddenField ID="ChargeCodeTxt" runat="server" />
            </td>
            <td class="style3">
                Description
            </td>
            <td>
                <asp:TextBox ID="ChargeDescrTxt" runat="server" Width="184px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;&nbsp;&nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                CtnrNo
            </td>
            <td class="style2">
                <asp:TextBox ID="CtnrNoTxt" runat="server" Width="184px" OnTextChanged="ContainerTxt_TextChanged"
                    AutoPostBack="true"></asp:TextBox>
            </td>
            <td class="style3">
                JobNo
            </td>
            <td>
                <asp:TextBox ID="JobNoTxt" runat="server" Width="184px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                EqpNo
            </td>
            <td class="style2">
                <asp:DropDownList ID="EqpNoDDL" runat="server" Height="16px" Width="190px" OnSelectedIndexChanged="EquipmentNo_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </td>
            <td class="style3">
                Personnel
            </td>
            <td>
                <asp:DropDownList ID="PersDDL" runat="server" Height="16px" Width="190px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                Vendor
            </td>
            <td class="style2">
                <asp:DropDownList ID="VendorDDL" runat="server" Height="16px" Width="190px" OnSelectedIndexChanged="VdList_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
                <asp:HiddenField ID="VdCodeTxt" runat="server" />
            </td>
            <td class="style3">
                Vendorname
            </td>
            <td>
                <asp:TextBox ID="VendorNameTxt" runat="server" Width="184px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                Invoice
            </td>
            <td class="style2">
                <asp:TextBox ID="InvoiceTxt" runat="server" Width="184px"></asp:TextBox>
            </td>
            <td class="style3">
                InvoiceDate
            </td>
            <td>
                <asp:TextBox ID="InvoiceDateTxt" runat="server" Width="184px"></asp:TextBox>
                <asp:CalendarExtender ID="InvoiceDateTxt_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="InvoiceDateTxt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                    Format="dd/MMM/yyyy">
                </asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="InvoiceDate1Req" runat="server" ErrorMessage="*"
                    ControlToValidate="InvoiceDateTxt" Enabled="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style4">
                Qty
            </td>
            <td class="style5">
                 <asp:TextBox ID="QtyTxt" runat="server" Width="100px" OnTextChanged="QtyRate_TextChanged"
                    AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Qty1TxtReqVal" runat="server" ControlToValidate="QtyTxt"
                    ErrorMessage="*" /><asp:CompareValidator ID="Qty1TxtCompVal" runat="server" ControlToValidate="QtyTxt"
                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator
                            ID="Qty1TxtZeroVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                            ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
            <td class="style6">
                Rate($)
            </td>
            <td class="style7">
              <asp:TextBox ID="RateTxt" runat="server" Width="100px" OnTextChanged="QtyRate_TextChanged"
                    AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator
                                    ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="RateTxtZeroVal"
                                            runat="server" ControlToValidate="RateTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                FcAmt
            </td>
            <td class="style2">
                <asp:TextBox ID="FcAmtTxt" runat="server" Width="100px" OnTextChanged="FCAmt_TextChanged"
                    AutoPostBack="true"></asp:TextBox>
                    <asp:RequiredFieldValidator
                                    ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                        ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True"
                                        ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="FcAmtTxtZeroVal"
                                            runat="server" ControlToValidate="FcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                            Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
            <td class="style3">
                LcAmt
            </td>
            <td>
                <asp:TextBox ID="LcAmtTxt" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator
                                ID="LcAmtTxtReqVal" runat="server" ControlToValidate="LcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="LcAmtTxtCompVal" runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="LcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="LcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                TaxType
            </td>
            <td class="style2">
                <asp:DropDownList ID="TaxTypeDDL" runat="server" Height="16px" Width="190px" OnSelectedIndexChanged="QtyRate_TextChanged" AutoPostBack="true">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeDDL"
                                ErrorMessage="*" />
            </td>
            <td class="style3">
                IsRecoverable</td>
            <td>
                &nbsp;
                <asp:CheckBox ID="RecCHK" runat="server" Checked="true"  />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                TaxFcAmt
            </td>
            <td class="style2">
                <asp:TextBox ID="TaxFcAmtTxt" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator
                                ID="TaxFcAmtTxtReqVal" runat="server" ControlToValidate="TaxFcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="TaxFcAmtTxtCompVal" runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxFcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="TaxFcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
            <td class="style3">
                TaxLcAmt
            </td>
            <td>
                <asp:TextBox ID="TaxLcAmtTxt" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator
                                ID="TaxLcAmtTxtReqVal" runat="server" ControlToValidate="TaxLcAmtTxt" ErrorMessage="*" /><asp:CompareValidator
                                    ID="TaxLcAmtTxtCompVal" runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True"
                                    ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="TaxLcAmtTxtZeroVal"
                                        runat="server" ControlToValidate="TaxLcAmtTxt" EnableClientScript="True" ErrorMessage="#"
                                        Operator="GreaterThanEqual" ValueToCompare="0" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                Remarks1
            </td>
            <td class="style2">
                <asp:TextBox ID="Remarks1Txt" runat="server" Width="184px" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style3">
                Remarks2
            </td>
            <td>
                <asp:TextBox ID="Remarks2Txt" runat="server" Width="184px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
            </td>
            <td class="style3">
                <asp:Button ID="AddBtn" runat="server" Text="Update" OnClick="AddBtn_Click" 
                    Height="27px" Width="64px"></asp:Button>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
