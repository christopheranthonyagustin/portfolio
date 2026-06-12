<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.InventoryBalance.Search" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>OpenCloseBalanceV2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <style type="text/css">
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 28px;
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
                height: 22px;
                width: 28px;
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
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }

            .slider.round:before {
                border-radius: 20%;
            }

        .auto-style1 {
            width: 97px;
        }

        .auto-style2 {
            width: 500px;
        }
    </style>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">


    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
               
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td valign="top">
                    <table width="50%" border="0">
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellspacing="0" cellpadding="0" width="50%">
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <%--<asp:Panel ID="AccesPnl" runat="server">
            <table id="tblAssigned" runat="server" border="0" cellspacing="1" cellpadding="1" width="70%">
                <tr>
                    <td class="auto-style2">
                        <table id="lot4tbl" runat="server">
                            <tr>
                                <td id="lot4td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot4lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="Lot4cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="lot5tbl" runat="server">
                            <tr>
                                <td id="lot5td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot5lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot5cb" runat="server" type="checkbox" name="switch" class="slider round">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="lot6tbl" runat="server">
                            <tr>
                                <td id="lot6td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot6lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot6cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>

                    <td class="auto-style2">
                        <table>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="loclbl" runat="server" Text="Location"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="loccb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="Table3" runat="server">
                            <tr>
                                <td id="Td2" runat="server" class="auto-style2">
                                    <asp:Label ID="tuno1lbl" runat="server" Text ="TUNo1"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="tuno1cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="Table4" runat="server">
                            <tr>
                                <td id="Td3" runat="server" class="auto-style2">
                                    <asp:Label ID="tuno2lbl" runat="server" Text="TUNo2"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="tuno2cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <table id="Table5" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="Lot4txt" runat="server" TextMode="MultiLine" Skin="WebBlue" Height="100" Width="150"></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="Table6" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="lot5txt" runat="server" TextMode="MultiLine" Skin="WebBlue" Height="100" Width="150"></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="Table7" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="lot6txt" runat="server" TextMode="MultiLine" Skin="WebBlue" Height="100" Width="150"></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="Table8" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="loctxt" runat="server" Skin="WebBlue" Width="150"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <table id="Table2" runat="server">
                                        <tr>
                                            <td id="Td1" runat="server" class="auto-style2">
                                                <asp:Label ID="lot9lb" runat="server"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 2%">
                                                <!-- Rounded switch -->
                                                <label class="switch">
                                                    <input id="lot9cb" runat="server" type="checkbox" name="switch">
                                                    <div class="slider round"></div>
                                                </label>
                                                &nbsp;&nbsp;&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="Table9" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="tuno1txt" runat="server" Width="150"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <table id="Table10" runat="server">
                                        <tr>
                                            <td id="Td4" runat="server" class="auto-style2">
                                                <asp:Label ID="lot10lb" runat="server"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 2%">
                                                <!-- Rounded switch -->
                                                <label class="switch">
                                                    <input id="lot10cb" runat="server" type="checkbox" name="switch">
                                                    <div class="slider round"></div>
                                                </label>
                                                &nbsp;&nbsp;&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table id="Table11" runat="server">
                            <tr>
                                <td class="auto-style2">
                                    <telerik:RadTextBox ID="tuno2txt" runat="server" Skin="WebBlue" Width="150"></telerik:RadTextBox>
                                    <br />
                                    <br />
                                    <table id="Table12" runat="server">
                                        <tr>
                                            <td id="Td5" runat="server" class="auto-style2">
                                                <asp:Label ID="lot11lb" runat="server"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 2%">
                                                <!-- Rounded switch -->
                                                <label class="switch">
                                                    <input id="lot11cb" runat="server" type="checkbox" name="switch">
                                                    <div class="slider round"></div>
                                                </label>
                                                &nbsp;&nbsp;&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <br />
                        <br />
                        <br />
                         <br />
                        <table  runat="server">
                            <tr>
                                <td runat="server" class="auto-style2">
                                    <asp:Label ID="lot12lb"  runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot12cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>

                </tr>

                <tr>
                    <td class="auto-style2">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="GRDate"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="GRDateCB" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>

                    <td class="auto-style2">
                        <table id="lot1tbl" runat="server">
                            <tr>
                                <td id="lot1td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot1lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot1cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="lot2tbl" runat="server">
                            <tr>
                                <td id="lot8td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot2lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot2cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="lot3tbl" runat="server">
                            <tr>
                                <td id="lot3td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot3lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot3cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>

                    <td class="auto-style2">
                        <table id="lot7tbl" runat="server">
                            <tr>
                                <td id="lot10td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot7lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot7cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>

                            </tr>
                        </table>
                    </td>
                    <td class="auto-style2">
                        <table id="lot8tbl" runat="server">
                            <tr>
                                <td id="lot11td" runat="server" class="auto-style2">
                                    <asp:Label ID="lot8lb" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="lot8cb" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>                    
                </tr>
                <tr>
                    <td class="auto-style2">
                        <table id="Table1" runat="server">
                            <tr>
                                <td>
                                    <asp:Label ID="GRNolbl" runat="server" Text="GRNo"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="GRNoCB" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>                    
                    <td class="auto-style2">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="PermitNo"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 2%">
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input id="PermitNoCB" runat="server" type="checkbox" name="switch">
                                        <div class="slider round"></div>
                                    </label>
                                    &nbsp;&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>--%>
        <table>
            <tr>
                <td>
                    <br />
                    <br />
                    &nbsp;
                            <telerik:RadButton ID="CompileBtn" CausesValidation="false" runat="server" Text="   Run   " Skin="WebBlue"
                                CssClass="detailButton" OnClick="CompileBtn_Click" OnClientClick="busyBox.Show();">
                            </telerik:RadButton>
                    &nbsp;
                            
                            <br />
                    <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
