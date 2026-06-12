<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneHealthCheck.aspx.cs" Inherits="iWMS.Web.Master.Zone.ZoneHealthCheck" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VLM Dashboard</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .table-wrapper {
            width: 403.5px;
            height: 200px;
            border-radius: 5px;
            padding-left: 10px;
        }

        .ParentTable {
            border-collapse: collapse;
            width: 100%;
            height: 100%;
        }

        .FirstRow {
            height: 50%;
        }

        .LastRow {
            height: 100px;
        }

        .EachRoom {
            max-width: 30px !important;
            padding: 0 !important;
            border: 1px solid black;
        }

        .SubTable {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -ms-box-sizing: border-box;
            width: 100%;
            height: 100%;
            border: none;
        }

        .SubRow {
            padding: 10px;
            border: 1px solid black;
        }

        .ZoneCodeTxt {
            font-weight: bold;
            font-size: 17px;
        }

        .ColorLegendPanel {
            padding-left: 10px;
        }
    </style>
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function SubDivClickFun(VLMCode) {
                document.getElementById('SelectedVLMCode').value = VLMCode;
                var SubDivBtn = document.getElementById("<%= SubDivBtn.ClientID %>");
                SubDivBtn.click();
            }

            function SubDivZoneClickFun(AccessPointCode, VLMCode) {
                document.getElementById('SelectedVLMCode').value = VLMCode;
                document.getElementById('SelectedAccessPointCode').value = AccessPointCode;

                var SubDivBtn = document.getElementById("<%= SubDivBtn.ClientID %>");
                SubDivBtn.click();
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:HiddenField ID="SelectedVLMCode" runat="server" />
        <asp:HiddenField ID="SelectedAccessPointCode" runat="server" />
        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" OnClick="RefreshBtn_Click"
                        OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" />
                    <asp:Button ID="SubDivBtn" Text="" Style="display: none;" OnClick="SubDivBtn_Click" runat="server" />
                </td>
            </tr>
        </table>
        <br />

        <asp:Panel runat="server">
            <table>
                <tr>
                    <td>
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row612" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row612L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row612').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row612L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row612').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row611" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row611L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row611').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row611L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row611').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row610" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row610L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row610').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row610L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row610').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row609" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row609L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row609').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row609L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row609').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row512" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row512L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row512').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row512L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row512').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row511" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row511L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row511').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row511L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row511').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row510" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row510L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row510').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row510L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row510').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row509" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row509L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row509').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row509L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row509').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row608" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row608L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row608').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row608L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row608').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row607" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row607L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row607').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row607L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row607').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row606" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row606L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row606').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row606L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row606').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row605" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row605L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row605').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row605L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row605').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row508" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row508L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row508').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row508L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row508').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row507" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row507L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row507').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row507L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row507').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row506" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row506L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row506').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row506L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row506').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row505" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row505L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row505').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row505L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row505').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row604" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row604L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row604').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row604L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row604').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row603" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row603L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row603').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row603L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row603').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row602" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row602L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row602').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row602L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row602').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row601" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row601L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row601').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row601L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row601').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row504" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row504L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row504').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row504L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row504').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row503" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row503L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row503').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row503L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row503').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row502" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row502L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row502').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row502L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row502').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row501" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row501L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row501').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row501L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row501').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>

                    <td class="ColorLegendPanel">
                        <br />
                        <br />
                        <asp:Label ID="LegendHeaderLbl" runat="server" Font-Size="Small" />
                        <div id="LegendColorDiv" runat="server" cssclass="ColorLegendPanel">
                        </div>
                        <br />
                        <asp:Label ID="LegendHeaderLbl1" runat="server" Font-Size="Small" />
                        <div id="LegendColorDiv1" runat="server" cssclass="ColorLegendPanel">
                        </div>
                    </td>

                </tr>

                <tr>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row412" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row412L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row412').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row412L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row412').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row411" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row411L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row411').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row411L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row411').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row410" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row410L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row410').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row410L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row410').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row409" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row409L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row409').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row409L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row409').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row312" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row312L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row312').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row312L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row312').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row311" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row311L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row311').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row311L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row311').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row310" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row310L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row310').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row310L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row310').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row309" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row309L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row309').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row309L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row309').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row408" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row408L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row408').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row408L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row408').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row407" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row407L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row407').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row407L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row407').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row406" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row406L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row406').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row406L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row406').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row405" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row405L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row405').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row405L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row405').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row308" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row308L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row308').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row308L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row308').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row307" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row307L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row307').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row307L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row307').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row306" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row306L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row306').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row306L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row306').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row305" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row305L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row305').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row305L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row305').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row404" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row404L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row404').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row404L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row404').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row403" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row403L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row403').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row403L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row403').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row402" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row402L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row402').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row402L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row402').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row401" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row401L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row401').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row401L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row401').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row304" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row304L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row304').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row304L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row304').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row303" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row303L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row303').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row303L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row303').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row302" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row302L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row302').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row302L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row302').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row301" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row301L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row301').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row301L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row301').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row212" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row212L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row212').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row212L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row212').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row211" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row211L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row211').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row211L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row211').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row210" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row210L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row210').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row210L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row210').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row209" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row209L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row209').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row209L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row209').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row112" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row112L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row112').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row112L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row112').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row111" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row111L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row111').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row111L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row111').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row110" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row110L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row110').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row110L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row110').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row109" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row109L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row109').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row109L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row109').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row208" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row208L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row208').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row208L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row208').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row207" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row207L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row207').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row207L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row207').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row206" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row206L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row206').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row206L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row206').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row205" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row205L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row205').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row205L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row205').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row108" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row108L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row108').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row108L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row108').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row107" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row107L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row107').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row107L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row107').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row106" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row106L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row106').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row106L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row106').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row105" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row105L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row105').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row105L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row105').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <br />
                        <div class="table-wrapper">
                            <table class="ParentTable">
                                <tr class="FirstRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row204" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row204L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row204').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row204L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row204').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row203" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row203L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row203').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row203L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row203').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row202" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row202L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row202').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row202L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row202').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row201" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row201L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row201').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row201L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row201').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="LastRow">
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row104" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row104L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row104').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row104L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row104').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row103" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row103L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row103').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row103L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row103').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row102" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row102L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row102').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row102L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row102').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="EachRoom">
                                        <table class="SubTable">
                                            <tr>
                                                <td class="SubRow ZoneCodeTxt" rowspan="2" id="Row101" runat="server" onclick="SubDivClickFun(this.innerText)"></td>
                                                <td class="SubRow" id="Row101L1" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row101').innerText)"></td>
                                            </tr>
                                            <tr>
                                                <td class="SubRow" id="Row101L3" runat="server" onclick="SubDivZoneClickFun(this.innerText, document.getElementById('Row101').innerText)"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
