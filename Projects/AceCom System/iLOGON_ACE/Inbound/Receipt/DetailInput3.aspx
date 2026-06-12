<%@ Page Language="c#" CodeBehind="DetailInput3.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.Receipt.DetailInput3" %>

<%@ Register TagPrefix="iWMS" TagName="iInput3" Src="../../Control/iInputCtl3.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Receipt Detail Input</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache">

    <script type="text/javascript">
		  function CheckEmptyBox() {
		    var TextBox1 = document.getElementById('iInput_INTEGER_RecQty');
		    var TextBox2 = document.getElementById('iInput_INTEGER_Qty');
		    var num1 = parseInt(TextBox1.getAttribute('value'));
		    var num2 = parseInt(TextBox2.getAttribute('value'));
    if (num1 > num2) {
      return confirm('Proceed to Over-Receive this SKU Line?');
    }
    else {
      return true;
    }
  }
    </script>

</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                &nbsp;<asp:Label ID="DetailLbl" runat="server">Detail</asp:Label>&nbsp;
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <iWMS:iInput3 ID="iInput" runat="server"></iWMS:iInput3>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp &nbsp
                <asp:Label ID="lblDimensionWt" runat="server" Text="Note : "></asp:Label><br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="2" cellpadding="2">
                    <tr>
                        <td class="style1">
                            &nbsp &nbsp
                            <asp:Label ID="EqpNoLbl" runat="server">EquipmentNo</asp:Label><br>
                            &nbsp &nbsp
                            <asp:DropDownList ID="TEXT_EqpNo" runat="server" DataTextField="Descr" DataValueField="item"
                                AutoPostBack="True" OnSelectedIndexChanged="TEXT_EpqNo_SelectedIndexChanged"
                                Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td class="style1">
                            &nbsp &nbsp
                            <asp:Label ID="PerIdLbl" runat="server">Personnel</asp:Label><br>
                            &nbsp &nbsp
                            <asp:DropDownList ID="INTEGER_PerId" runat="server" DataTextField="Descr" DataValueField="item"
                                Width="150px">
                            </asp:DropDownList>
                        </td>
                        <td colspan="5" class="style1">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <asp:Button Style="z-index: 0" ID="SaveNextBtn" runat="server" CssClass="detailbutton"
                    Text="Save &amp; Next" OnClick="SaveNextBtn_Click" OnClientClick="return CheckEmptyBox();">
                </asp:Button>&nbsp;&nbsp;<asp:Button ID="SaveBtn" runat="server" Text="Save &amp; Close"
                    CssClass="detailbutton" OnClick="SaveBtn_Click" OnClientClick="return CheckEmptyBox();">
                </asp:Button>&nbsp;
                <asp:Button ID="CloseBtn" runat="server" Text="Close" CssClass="detailbutton" OnClick="CloseBtn_Click">
                </asp:Button>&nbsp;
                <asp:CheckBox Style="z-index: 0" ID="RefreshChkBox" runat="server" Text="Clear Fields On Save"
                    Checked="True"></asp:CheckBox>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
