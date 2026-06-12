<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PutawayPlanPickingReadyToPick.aspx.cs" Inherits="iWMS.Web.Inbound.PutawayWorkbench.PutawayPlanPickingReadyToPick" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Putaway Plan</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/Dashboard.css">
    <style type="text/css">
        .BigCheckBox {
            float: right;
            margin-right: 12px;
            width: 30px;
            height: 20px;
            text-align: right;
        }

        .form {
            margin-top: 1px;
            padding-top: 1px;
        }
    </style>
    <script type="text/javascript">
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
<body>
    <form id="form1" runat="server">
        <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="DeckViewTab" Text="Deck View" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="ManageDeckTab" Text="Manage Deck" Value="50" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MasterListRadPageView">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <table>
                    <tr>
                        <td>&nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="ConfigureBtn" class="white" runat="server" OnClick="ConfigureBtn_Click"
                            Text="Configure" OnClientClick="GetCheckBoxIdForConBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:HiddenField runat="server" ID="DashboardHiddenField" />
                            <asp:HiddenField runat="server" ID="DashboardCountHiddenField" />
                            <asp:HiddenField runat="server" ID="ChekBoxIdHiddenField" />
                            <asp:HiddenField runat="server" ID="SelectedDashBoardCount" />
                            <asp:HiddenField runat="server" ID="HiddenDeckId" />
                            <asp:Panel ID="DashboardPanel" runat="server" Width="100%" HorizontalAlign="Left">
                                <div id="EachDashboard"></div>
                                <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="750px" Height="620px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
                                <script type="text/javascript">
                                    var DashboardCount = document.getElementById('DashboardCountHiddenField').value;
                                    var DashboardJsonObject = JSON.parse(document.getElementById('DashboardHiddenField').value);
                                    for (var i = 0; i < DashboardCount; i++) {
                                        var Div = document.createElement('div'); //Create Dashboard
                                        var divName = DashboardJsonObject[i][0];
                                        Div.className = "WPWDashboard";
                                        Div.id = "Div_" + divName;
                                        Div.style.backgroundColor = DashboardJsonObject[i][6]; //Create DashBordColour AS dyanmic
                                        Div.style.cursor = "pointer";
                                        Div.addEventListener("click", ReopenRadwindow);
                                        document.getElementById("EachDashboard").appendChild(Div);

                                        var PolicySystemNameLbl = document.createElement("span");  //Create PolicySystemName
                                        PolicySystemNameLbl.className = "DashBoardlb";
                                        PolicySystemNameLbl.id = "PolicySystemName_" + divName;
                                        PolicySystemNameLbl.innerHTML = DashboardJsonObject[i][1];
                                        document.getElementById("Div_" + divName).appendChild(PolicySystemNameLbl);

                                        var CHK = document.createElement("INPUT"); //Create Checkbox
                                        CHK.setAttribute("type", "checkbox");
                                        CHK.id = divName;
                                        CHK.className = "BigCheckBox";
                                        document.getElementById("Div_" + divName).appendChild(CHK);
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br")); //For Line Break

                                        var AcCodeLbl = document.createElement("span");  //Create AcCodeLbl
                                        AcCodeLbl.className = "DashBoardlb";
                                        AcCodeLbl.id = "AcCode_" + divName;
                                        AcCodeLbl.innerHTML = DashboardJsonObject[i][2];
                                        document.getElementById("Div_" + divName).appendChild(AcCodeLbl);
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));

                                        var PolicyGivenNameLbl = document.createElement("span"); //Create PolicyGivenNameLbl
                                        PolicyGivenNameLbl.className = "DashBoardlb";
                                        PolicyGivenNameLbl.id = "PolicyGivenName_" + divName;;
                                        PolicyGivenNameLbl.innerHTML = DashboardJsonObject[i][3];
                                        document.getElementById("Div_" + divName).appendChild(PolicyGivenNameLbl);
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));

                                        var PolicySettingsLbl = document.createElement("span"); //Create PolicySettingsLbl
                                        PolicySettingsLbl.className = "DashBoardlb";
                                        PolicySettingsLbl.id = "PolicySettings_" + divName;
                                        PolicySettingsLbl.innerHTML = DashboardJsonObject[i][4];
                                        document.getElementById("Div_" + divName).appendChild(PolicySettingsLbl);
                                        document.getElementById("Div_" + divName).appendChild(document.createElement("br"));

                                        var PolicyCandidateCountLbl = document.createElement("span"); //Create PolicyCandidateCountLbl
                                        PolicyCandidateCountLbl.className = "CandidateCount";
                                        PolicyCandidateCountLbl.id = "PolicyCandidateCount_" + divName;
                                        PolicyCandidateCountLbl.innerHTML = DashboardJsonObject[i][5];
                                        document.getElementById("Div_" + divName).appendChild(PolicyCandidateCountLbl);

                                        var HiddenLbl = document.createElement("span"); //Create hidden field coz we need to pass data when call RadWindow open
                                        HiddenLbl.setAttribute("style", "display:none");
                                        HiddenLbl.id = "HiddenLbl_" + divName;
                                        HiddenLbl.innerHTML = DashboardJsonObject[i][0] + "|" + DashboardJsonObject[i][1] + "|" + DashboardJsonObject[i][2] + "|" + DashboardJsonObject[i][3]
                                        document.getElementById("Div_" + divName).appendChild(HiddenLbl);

                                        var HiddenDeckId = document.getElementById('HiddenDeckId').value;
                                    }

                                    function ReopenRadwindow(e) {
                                        var spans = e.target.getElementsByTagName('span');
                                        window.radopen("../PutawayWorkbench/PutawayWorkbenchItemizedRecords.aspx?HiddenLbl=" + spans[5].textContent + "&DeckId=" + HiddenDeckId);

                                    }

                                    function GetCheckBoxId(Id) {
                                        var Btn = document.getElementById(Id);
                                        Btn.disabled = true;
                                        Btn.value = "Processing...";
                                        var count = 0;

                                        var CheckBoxId = "";
                                        var SelectedPolicyId = "";
                                        for (var i = 0; i < DashboardCount; i++) {
                                            CheckBoxId = DashboardJsonObject[i][0];
                                            var CheckBox = document.getElementById(CheckBoxId);//Get Checkbox Id
                                            if (CheckBox != null && CheckBox != "") {
                                                if (CheckBox.checked) // Check Checkbox is ticked or no
                                                {
                                                    SelectedPolicyId = DashboardJsonObject[i][0];
                                                    count++;
                                                }
                                            }
                                        }
                                        if (count == 0) {
                                            alert("Please select a record to Proceed.");
                                            CheckBoxId = "";
                                        }
                                        else if (count > 1) {
                                            alert("Please select only one record to Proceed.");
                                            CheckBoxId = "";
                                        }

                                        document.getElementById('ChekBoxIdHiddenField').value = SelectedPolicyId;
                                    }

                                    function GetCheckBoxIdForConBtn(Id) {
                                        var Btn = document.getElementById(Id);
                                        Btn.disabled = true;
                                        Btn.value = "Processing...";
                                        var count = 0;
                                        var SelectedCheckBoxId = "";

                                        var CheckBoxId = "";
                                        for (var i = 0; i < DashboardCount; i++) {
                                            CheckBoxId = DashboardJsonObject[i][0];
                                            var CheckBox = document.getElementById(CheckBoxId);//Get Checkbox Id
                                            if (CheckBox != null && CheckBox != "") {
                                                if (CheckBox.checked) // Check Checkbox is ticked or no
                                                {
                                                    if (SelectedCheckBoxId == "") {
                                                        SelectedCheckBoxId = CheckBoxId;
                                                    }

                                                    else {
                                                        SelectedCheckBoxId = SelectedCheckBoxId + "," + CheckBoxId;

                                                    }
                                                    count++;

                                                }
                                            }
                                        }
                                        if (count == 0) {
                                            alert("Please select a record to Configure.");
                                            return;
                                        }
                                        else {

                                            document.getElementById('ChekBoxIdHiddenField').value = SelectedCheckBoxId;
                                            document.getElementById('SelectedDashBoardCount').value = count;

                                        }
                                    }

                                </script>            
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="100%" ID="ManageDeckRadpageview">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
