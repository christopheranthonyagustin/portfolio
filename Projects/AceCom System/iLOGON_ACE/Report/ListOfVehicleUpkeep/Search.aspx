<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.ListOfVehicleUpkeep.Search" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ListOfVehicleUpkeep</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            height: 30px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="50%">
                    <tr>
                        <td width="15%">
                            &nbsp;</td>
                        <td width="25%">
                            &nbsp;</td>
                        <td width="10%" align="center">
                            &nbsp;</td>
                        <td width="25%">
                            &nbsp;</td>
                        <td width="25%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="15%">
                            Upkeep Type
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="AvailList" runat="server" Rows="8" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="10%" align="center">
                            <br />
                            <br />
                            <asp:Button ID="SelectBtn" runat="server" CssClass="detailbutton" OnClick="SelectBtn_Click"
                                Text=" >> " />
                            <br />
                            <br />
                            <asp:Button ID="RemoveBtn" runat="server" CssClass="detailbutton" OnClick="RemoveBtn_Click"
                                Text=" << " />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="25%">
                            <asp:ListBox ID="SelectedList" runat="server" Rows="8" SelectionMode="Multiple" Width="100%"
                                Style="background-color: Yellow;" />
                            <%--<asp:RequiredFieldValidator id="rqf1" ControlToValidate="SelectedEqrList" runat="server" ErrorMessage="*" style="z-index: 0; vertical-align: top" />--%>
                        </td>
                        <td width="25%">
                        </td>
                    </tr>
                </table>
                <tr>
                    <td width="11%">
                        &nbsp;
                    </td>
                </tr>
                <table border="0" cellpadding="0" cellspacing="0" width="50%">
                    <tr>
                        <td width="15%">
                            &nbsp;Vendor
                        </td>
                        <td width="50%">
                            <asp:ListBox ID="VendorTypeList" runat="server" Rows="10" SelectionMode="Multiple" Width="100%" />
                        </td>
                        <td width="10%" align="center">
                            <br />
                            <br />
                            <asp:Button ID="SelectVendorBtn" runat="server" CssClass="detailbutton" OnClick="SelectVendorBtn_Click"
                                Text=" >> " />
                            <br />
                            <br />
                            <asp:Button ID="RemoveVendorBtn" runat="server" CssClass="detailbutton" OnClick="RemoveVendorBtn_Click"
                                Text=" << " />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td width="50%">
                            <asp:ListBox ID="SelectedVendorTypeList" runat="server" Rows="10" SelectionMode="Multiple"
                                Width="200%" Style="background-color: Yellow;" />
                        </td>
                    </tr>
                </table>
                <tr>
                    <td width="11%">
                        &nbsp;
                    </td>
                </tr>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="CompileBtn" runat="server" CssClass="detailbutton" OnClick="CompileBtn_Click"
                    Text="Compile" OnClientClick="return busyBox.Show();" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
