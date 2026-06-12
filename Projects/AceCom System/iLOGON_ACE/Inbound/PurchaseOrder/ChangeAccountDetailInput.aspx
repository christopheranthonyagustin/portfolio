<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAccountDetailInput.aspx.cs" Inherits="iWMS.Web.Inbound.PurchaseOrder.ChangeAccountDetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PurchaseOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self">
    <%--    <meta http-equiv="Pragma" content="no-cache">--%>

    <script type="text/javascript">
        function CheckEmptyBox() {
            var TextBox1 = document.getElementById('INTEGER_RecQty');
            var TextBox2 = document.getElementById('INTEGER_Qty');
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
    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            top: 5px;
            width: 33px;
            height: 17px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                display: none;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #A8A8A8;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 11px;
                width: 14px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #393;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #393;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(13px);
            -ms-transform: translateX(13px);
            transform: translateX(13px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td class="pagetitle">
                    <asp:Label ID="IdLbl" runat="server"></asp:Label>
                    <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                    <asp:Label ID="DetailLbl" Text="Account" runat="server"></asp:Label>&nbsp;<br />
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="FormCtl_Account" runat="server" Visible="false"></iWMS:iForm>
                            </td>
                            <td>
                                <asp:Label ID="SiteCode" runat="server">SiteCode</asp:Label><br />
                                <telerik:RadDropDownList ID="TEXT_SiteCodeList" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                    ErrorMessage="*" ControlToValidate="TEXT_SiteCodeList"></asp:RequiredFieldValidator>
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="UpdateBtn" runat="server" Text=" Update " CssClass="White" OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
