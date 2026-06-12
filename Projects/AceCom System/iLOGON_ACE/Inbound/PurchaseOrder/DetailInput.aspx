<%@ Page Language="c#" CodeBehind="DetailInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.PurchaseOrder.DetailInput" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PurchaseOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self">
    <%--    <meta http-equiv="Pragma" content="no-cache">--%>

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
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function CloseModalPopup() {
            // Get the URL from ViewState
            var url = "../PurchaseOrder/PurchaseOrderForm.aspx?mode=" + '<%= ViewState["mode"].ToString() %>' + "&pageIndex=2&poId=" + '<%= ViewState["poId"].ToString() %>';

            // Replace the current history entry without reloading the page
            window.parent.history.replaceState(null, null, url);

            // Optionally, add a delay before closing the modal
            setTimeout(function () {
                // Get a reference to the modal element
                var modal = window.parent.document.getElementById("Modalpopup");

                // Check if the modal element exists
                if (modal) {
                    // Dispatch a click event to the modal's close button or any close element
                    var closeButton = modal.querySelector('.close');
                    if (closeButton) {
                        closeButton.click();
                    } else {
                        // If there is no close button, you can hide the modal directly
                        modal.style.display = "none";
                    }
                }
            }, 1); // Adjust the delay (in milliseconds) as needed
        }
    </script>
</telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" Width="200px">
                </telerik:RadTab>
                <telerik:RadTab Text="Extra Lots" Value="1" Width="200px">
                </telerik:RadTab>
                <telerik:RadTab Text="Remark1" Value="2" Width="200px">
                </telerik:RadTab>
                <telerik:RadTab Text="Remark2" Value="3" Width="200px">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1" DefaultButton="SaveNextBtn">
                <table cellspacing="2" cellpadding="2" width="100%" id="table1" border="0" runat="server">
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="IdLbl" runat="server"></asp:Label>
                            <asp:Label ID="ModeLbl" runat="server"></asp:Label>
                            <asp:Label ID="DetailLbl" Text="SKU Line" runat="server"></asp:Label>&nbsp;<br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <tr align="center">
                                    <td>
                                        <asp:ImageButton ID="AlertImgBtn" BorderWidth="0" BackColor="Transparent" Visible="False"
                                            ImageUrl="~/Image/alert.gif" runat="server"></asp:ImageButton><asp:Label ID="DescrLbl"
                                                runat="server" Font-Bold="True"></asp:Label><input id="HIDDEN_SkuId" type="hidden"
                                                    runat="server">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellspacing="2" cellpadding="2">
                                            <tr>
                                                <td style="height: 35px">
                                                    <asp:Label ID="SkuUpcLbl" runat="server">SKU/UPC</asp:Label><asp:RequiredFieldValidator
                                                        ID="SkuReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                        ControlToValidate="TEXT_SkuCode"></asp:RequiredFieldValidator><br>
                                                    <telerik:RadTextBox ID="TEXT_SkuCode" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155" OnTextChanged="TEXT_SkuCode_TextChanged" AutoPostBack="True"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="SkuDescrLbl" runat="server">SKU Description</asp:Label><br>
                                                    <telerik:RadTextBox ID="TEXT_SkuDescr" runat="server" Width="155"></telerik:RadTextBox>
                                                </td>
                                                <td style="height: 35px">
                                                    <asp:Label ID="QtyLbl" runat="server">Ordered Quantity</asp:Label><asp:RequiredFieldValidator
                                                        ID="QtyReq" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="*"
                                                        ControlToValidate="INTEGER_Qty"></asp:RequiredFieldValidator><asp:CompareValidator
                                                            ID="QtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                            ControlToValidate="INTEGER_Qty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><asp:CompareValidator
                                                                ID="QtyValueVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                                ControlToValidate="INTEGER_Qty" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator><br>
                                                    <telerik:RadTextBox ID="INTEGER_Qty" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                                                </td>
                                                <td style="height: 35px">
                                                    <asp:Label ID="RecQtyLbl" runat="server">Received Quantity</asp:Label><asp:CompareValidator
                                                        ID="RecQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" " ErrorMessage="#"
                                                        ControlToValidate="INTEGER_RecQty" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br>

                                                    <telerik:RadTextBox ID="INTEGER_RecQty" runat="server" Skin="WebBlue" Width="155" Enabled="false"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="UomLbl" runat="server">UOM</asp:Label>&nbsp;<input id="HIDDEN_Uom"
                                                        type="hidden" name="HIDDEN_Uom" runat="server">
                                                    <asp:RequiredFieldValidator ID="UomReq" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                                        ErrorMessage="*" ControlToValidate="TEXT_Uom"></asp:RequiredFieldValidator>
                                                    <br>
                                                    <telerik:RadDropDownList ID="TEXT_Uom" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadDropDownList>
                                                    <telerik:RadTextBox ID="UomTxt" runat="server" ReadOnly="True" Skin="WebBlue" Width="155"></telerik:RadTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="SiteCode" runat="server">SiteCode</asp:Label><br />
                                                                <telerik:RadDropDownList ID="TEXT_SiteCodeList" runat="server" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadDropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="errorLabelBig" ForeColor=" "
                                                                    ErrorMessage="*" ControlToValidate="TEXT_SiteCodeList"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>
                                                <td>
                                                    <iWMS:iForm ID="FormCtl_Account" runat="server" Visible="false"></iWMS:iForm>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">&nbsp;
                            <asp:Button ID="SaveNextBtn" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save & Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="SaveBtn" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;                       
                            <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <label id="SwitchLbl" runat="server" class="switch">
                                <input id="switchcb" runat="server" type="checkbox" name="switch">
                                <div class="slider round"></div>
                            </label>
                            <asp:Label ID="SwitchLbl2" for="switch1" runat="server" Text="Clear Fields On Save"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView2">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="titleLbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl1" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">&nbsp;
                            <asp:Button ID="Button1" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save & Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>&nbsp;
                            <asp:Button ID="Button2" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;
                            <asp:Button ID="Button3" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;
                        <asp:CheckBox Style="z-index: 0" ID="CheckBox1" runat="server" Text="Clear Fields On Save"
                            Checked="True"></asp:CheckBox>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView3">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">&nbsp;
                             <asp:Button ID="Button4" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save & Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;                            
                             <asp:Button ID="Button5" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;                      
                            <asp:Button ID="Button6" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close"></asp:Button>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView4">
                <table>
                    <tr>
                        <td class="pagetitle">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">&nbsp;
                             <asp:Button ID="Button7" class="white" runat="server" OnClick="SaveNextBtn_Click" Text="Save & Next" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;                            
                            <asp:Button ID="Button8" class="white" runat="server" OnClick="SaveBtn_Click" Text="Save" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"></asp:Button>
                            &nbsp;                        
                            <asp:Button ID="Button9" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close"></asp:Button>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
