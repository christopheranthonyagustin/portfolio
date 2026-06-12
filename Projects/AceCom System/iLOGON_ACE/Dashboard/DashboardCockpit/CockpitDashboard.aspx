<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CockpitDashboard.aspx.cs" Inherits="iWMS.Web.Dashboard.DashboardCockpit.CockpitDashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WavePickingWorkbenchDashboard</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <meta runat="server" id="RefreshMeta" http-equiv="Refresh">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/Dashboard.css">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
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

        function ShowModalPopup() {
            $('#Modalpopup').modal('show');
        }

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
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
        <script type="text/javascript">
            function ConfirmDeleteBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmDeleteBtn.UniqueID %>", "");
                }
            }

        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <div class="modal fade" runat="server" id="Modalpopup" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Label runat="server" ID="HeaderLbl" Font-Bold="true" Font-Size="Large"></asp:Label>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                           <iframe id="Frame" runat="server" width="100%" height="400" frameborder="0"></iframe>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">&nbsp;Close&nbsp;</button>
                        </div>
                    </div>
                </div>
            </div>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="DashboardRadPageView">
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" CausesValidation="false" MultiPageID="RadMultiPage2"
                    AutoPostBack="true" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip2_TabClick">
                    <Tabs>
                        <telerik:RadTab Id="CockpitViewTab" Text="Cockpit View" Value="0" runat="server">
                        </telerik:RadTab>
                        <telerik:RadTab Id="ManageCickpitTab" Text="Manage Cockpit" Value="100" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage">
                    <telerik:RadPageView runat="server" Height="700px" ID="CockpitViewRadPageView">
                        <table>
                            <tr>
                                <td>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                                <td>
                                    <asp:Label ID="ColorHeaderLbl" runat="server" />
                                    <div id="ColorDiv" runat="server">
                                    </div>
                                </td>
                                <td>
                                    <asp:Timer ID="Refreshtmr" Interval="300000" runat="server" OnTick="Refreshtmr_Tick" Enabled="true"></asp:Timer>
                                    <asp:Timer ID="Airtimetmr" Interval="300000" runat="server" OnTick="AirtimeTmr_Tick" Enabled="true"></asp:Timer>
                                </td>
                             </tr>      
                        </table>

                        <table>
                            <tr>
                                <td>
                                    &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="Button3" class="white" runat="server" OnClick="RefreshBtn_Click"
                                        Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                </td>
                                <td><asp:Button ID="Button2" class="white" runat="server" OnClick="ConfigureBtn_Click"
                                    Text="Configure" OnClientClick="GetCheckBoxIdForConBtn(this.id)" UseSubmitBehavior="false" />

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
                                    <asp:HiddenField runat="server" ID="HiddenCockpitId" />
                                    <asp:Panel ID="DashboardPanel" runat="server" Width="100%" HorizontalAlign="Left">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div id="EachDashboard"></div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                        <telerik:RadWindowManager ID="WindowManager" runat="server" VisibleOnPageLoad="true" Modal="true" Width="950px" Height="620px" Left="170px" Top="15px" Behaviors="Move, Close" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="false"></telerik:RadWindowManager>
                                        <script type="text/javascript">
                                            var DashboardCount = document.getElementById('DashboardCountHiddenField').value;
                                            var DashboardJsonObject = JSON.parse(document.getElementById('DashboardHiddenField').value);
                                            for (var i = 0; i < DashboardCount; i++) {
                                                var Div = document.createElement('div'); //Create Dashboard
                                                var divName = DashboardJsonObject[i][0];
                                                Div.className = "WPWDashboard";
                                                Div.id = "Div_" + i;
                                                Div.style.backgroundColor = DashboardJsonObject[i][6]; //Create DashBordColour AS dyanmic
                                                Div.style.cursor = "pointer";
                                                Div.addEventListener("click", ReopenRadwindow);
                                                document.getElementById("EachDashboard").appendChild(Div);

                                                var IndicatorDescrLbl = document.createElement("span");  //Create IndicatorDescr
                                                IndicatorDescrLbl.className = "DashBoardlb";
                                                IndicatorDescrLbl.id = "IndicatorDescr_" + divName;
                                                IndicatorDescrLbl.innerHTML = DashboardJsonObject[i][1];
                                                document.getElementById("Div_" + i).appendChild(IndicatorDescrLbl);

                                                var CHK = document.createElement("INPUT"); //Create Checkbox
                                                CHK.setAttribute("type", "checkbox");
                                                CHK.id = divName;
                                                CHK.className = "BigCheckBox";
                                                document.getElementById("Div_" + i).appendChild(CHK);
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br")); //For Line Break
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br"));
                                                /*document.getElementById("Div_" + i).appendChild(document.createElement("br"));*/ // Currently crash with modal popup and move dashboard label / To adjust dashboard label

                                                var AcCodeLbl = document.createElement("span");  //Create AcCodeLbl
                                                AcCodeLbl.className = "DashBoardlb";
                                                AcCodeLbl.id = "AcCode_" + divName;
                                                AcCodeLbl.innerHTML = DashboardJsonObject[i][2];
                                                document.getElementById("Div_" + i).appendChild(AcCodeLbl);
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br"));
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br"));
                                                /*document.getElementById("Div_" + i).appendChild(document.createElement("br"));*/

                                                var IndicatorGivenNameLbl = document.createElement("span"); //Create IndicatorGivenName
                                                IndicatorGivenNameLbl.className = "DashBoardlb";
                                                IndicatorGivenNameLbl.id = "IndicatorGivenName_" + divName;;
                                                IndicatorGivenNameLbl.innerHTML = DashboardJsonObject[i][3];
                                                document.getElementById("Div_" + i).appendChild(IndicatorGivenNameLbl);
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br"));
                                   /*             document.getElementById("Div_" + i).appendChild(document.createElement("br"));*/
                                                /*document.getElementById("Div_" + i).appendChild(document.createElement("br"));*/

                                                var PolicySettingsLbl = document.createElement("span"); //Create PolicySettingsLbl
                                                PolicySettingsLbl.className = "DashBoardlb";
                                                PolicySettingsLbl.id = "PolicySettings_" + divName;
                                                PolicySettingsLbl.innerHTML = DashboardJsonObject[i][4];
                                                document.getElementById("Div_" + i).appendChild(PolicySettingsLbl);
                                                document.getElementById("Div_" + i).appendChild(document.createElement("br"));

                                                var PolicyCandidateCountLbl = document.createElement("span"); //Create PolicyCandidateCountLbl
                                                PolicyCandidateCountLbl.className = "CandidateCount";
                                                PolicyCandidateCountLbl.id = "PolicyCandidateCount_" + divName;
                                                PolicyCandidateCountLbl.innerHTML = DashboardJsonObject[i][5];
                                                document.getElementById("Div_" + i).appendChild(PolicyCandidateCountLbl);
                                                /*document.getElementById("Div_" + i).appendChild(document.createElement("br"));*/

                                                var HiddenLbl = document.createElement("span"); //Create hidden field coz we need to pass data when call RadWindow open
                                                HiddenLbl.setAttribute("style", "display:none");
                                                HiddenLbl.id = "HiddenLbl_" + divName;
                                              
                                                if (DashboardJsonObject[i].length == 9)//This  is for sp_DashboardIndicator_101 because we need to pass RobotId column to itemzied pop-up.
                                                {
                                                    HiddenLbl.innerHTML = DashboardJsonObject[i][0] + "|" + DashboardJsonObject[i][1] + "|" + DashboardJsonObject[i][2] + "|" + DashboardJsonObject[i][3] + "|" + DashboardJsonObject[i][7] + "|" + DashboardJsonObject[i][8]
                                                }
                                                else if (DashboardJsonObject[i].length == 12)//This  is for sp_DashboardIndicator_149 //sp_DashboardIndicator_31 // sp_DashboardIndicator_17
                                                {
                                                    HiddenLbl.innerHTML = DashboardJsonObject[i][0] + "|" + DashboardJsonObject[i][1] + "|" + DashboardJsonObject[i][2] + "|" + DashboardJsonObject[i][3] + "|" + DashboardJsonObject[i][7] + "|" + DashboardJsonObject[i][8] + "|" + DashboardJsonObject[i][9] + "|" + DashboardJsonObject[i][10] + "|" + DashboardJsonObject[i][11]
                                                }
                                                else if (DashboardJsonObject[i].length == 11)//This  is for sp_DashboardIndicator_191
                                                {
                                                    HiddenLbl.innerHTML = DashboardJsonObject[i][0] + "|" + DashboardJsonObject[i][1] + "|" + DashboardJsonObject[i][2] + "|" + DashboardJsonObject[i][3] + "|" + DashboardJsonObject[i][7] + "|" + DashboardJsonObject[i][8] + "|" + DashboardJsonObject[i][9] + "|" + DashboardJsonObject[i][10] 
                                                }
                                                else//this is default code , if u add new column and it is not for sp_DashboardIndicator_101 , we can use this "else" block.
                                                {
                                                    HiddenLbl.innerHTML = DashboardJsonObject[i][0] + "|" + DashboardJsonObject[i][1] + "|" + DashboardJsonObject[i][2] + "|" + DashboardJsonObject[i][3] + "|" + DashboardJsonObject[i][7] + "|" + DashboardJsonObject[i][4]
                                                }

                                                document.getElementById("Div_" + i).appendChild(HiddenLbl);

                                                var HiddenCockpitId = document.getElementById('HiddenCockpitId').value;
                                            }

                                            //Call RadWindowManager
                                            function GetRadWindowManager() {
                                                return $find("<%=RadWindowManager1.ClientID%>");
                                            }

                                            function ReopenRadwindow(e) {
                                                var spans = e.target.getElementsByTagName('span');
                                                var WindowManager = GetRadWindowManager();
                                               
                                                if (WindowManager) {
                                                    var RadWindow = WindowManager.open("../DashboardCockpit/CockpitDashboardItemizedRecords.aspx?HiddenLbl=" + spans[5].textContent + "&CockpitId=" + HiddenCockpitId);
                                                    if (RadWindow) {
                                                        RadWindow.set_initialBehaviors(Telerik.Web.UI.WindowBehaviors.None);
                                                        RadWindow.set_behaviors(Telerik.Web.UI.WindowBehaviors.Move + Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Resize);
                                                        RadWindow.setActive(true);
                                                        RadWindow.SetModal(true);
                                                        RadWindow.set_visibleStatusbar(false);
                                                        RadWindow.set_keepInScreenBounds(true);
                                                        RadWindow.moveTo(10, 10);
                                                        RadWindow.set_minWidth(1100);
                                                        RadWindow.set_minHeight(450);
                                                        RadWindow.setSize(1100, 450);
                                                        RadWindow.set_destroyOnClose(true);
                                                    }
                                                }
                                            }

                                            function GetCheckBoxId(Id) {
                                                var Btn = document.getElementById(Id);
                                                Btn.disabled = true;
                                                Btn.value = "Processing...";
                                                var count = 0;

                                                var CheckBoxId = "";
                                                for (var i = 0; i < DashboardCount; i++) {
                                                    CheckBoxId = DashboardJsonObject[i][0];
                                                    var CheckBox = document.getElementById(CheckBoxId);//Get Checkbox Id
                                                    if (CheckBox != null && CheckBox != "") {
                                                        if (CheckBox.checked) // Check Checkbox is ticked or no
                                                        {
                                                            count++;
                                                        }
                                                    }
                                                }
                                                if (count == 0) {
                                                    alert("Please select a record to Build.");
                                                    CheckBoxId = "";
                                                }
                                                else if (count > 1) {
                                                    alert("Please select only one record to Build.");
                                                    CheckBoxId = "";
                                                }
                                                else {
                                                    CheckBoxId;
                                                }
                                                document.getElementById('ChekBoxIdHiddenField').value = CheckBoxId;
                                            }

                                            function GetCheckBoxIdForConBtn(Id) {
                                                var Btn = document.getElementById(Id);
                                                Btn.disabled = true;
                                                Btn.value = "Processing...";
                                                var count = 0;
                                                var SelectedCheckBoxId = "";

                                                var CheckBoxId = "";
                                                for (var i = 0; i < DashboardCount; i++)
                                                {
                                                    if (DashboardJsonObject[i][8] == "sp_DashboardIndicator_149" || DashboardJsonObject[i][8] == "sp_DashboardIndicator_31" || DashboardJsonObject[i][8] == "sp_DashboardIndicator_17")
                                                    {
                                                        for (var i = 0; i < DashboardCount; i++) {
                                                            CheckBoxId = DashboardJsonObject[i][0];
                                                            var CheckBox = document.getElementById(CheckBoxId);//Get Checkbox Id

                                                            if (CheckBox != null && CheckBox != "") {
                                                                if (CheckBox.checked) // Check Checkbox is ticked or no
                                                                {
                                                                    count++;
                                                                }

                                                            }
                                                        }
                       
                                                        if (count > 0) {

                                                            alert("This is a special dashboard indicator that cannot be configured using this button. Configure using the Manage Deck function instead.");
                                                          /*  return;*/
                                                        }
                                                    }

                                                    else
                                                    {
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
                                                }
                                                if (count == 0)
                                                {
                                                    alert("Please select a record to Configure.");
                                                    return;
                                                }
                                                else
                                                {
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

                    <telerik:RadPageView ID="ManageCickpitRadPageView" runat="server">
                        <telerik:RadMultiPage runat="server" ID="RadMultiPage3" SelectedIndex="0" CssClass="outerMultiPage">
                            <telerik:RadPageView runat="server" Height="700px" ID="CockpitMasterRadPageView">
                                <table cellspacing="10" cellpadding="10" border="0" width="100%">
                                    <tr>
                                        <td>
                                            <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="New"
                                                OnClick="CreateNewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                                           <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                                               OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />

                                            <asp:Button ID="CopyBtn" runat="server" CssClass="white" Text="Copy"
                                                OnClick="CopyBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                            <asp:Button ID="ResequenceBtn" runat="server" CssClass="white" Text="Resequence"
                                                OnClick="ResequenceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="false"
                                    EnableLinqExpressions="false" AllowPaging="true"
                                    Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                                    OnItemDataBound="ResultDG_ItemDataBound">
                                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50"
                                        DataKeyNames="id" Name="ParentGrid">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                    &nbsp;&nbsp;
                                    <asp:ImageButton runat="server" Visible="True" ID="WPWedit" ImageUrl="../../image/pencil.gif"
                                        BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Wave Picking Workbench Templater Manager"
                                        OnClick="WPWedit_Click" CausesValidation="False"></asp:ImageButton>
                                                    <asp:ImageButton runat="server" Visible="True" ID="WPWdelete"
                                                        ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                        OnClick="WPWdelete_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="SequenceNo" SortExpression="SequenceNo" HeaderText="Sequence No"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CockpitName" SortExpression="CockpitName" HeaderText="Cockpit Name"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CockpitModule" SortExpression="CockpitModule" HeaderText="Cockpit Module"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MakePrivate" SortExpression="MakePrivate" HeaderText="Make Private"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="RestrictEditing" SortExpression="RestrictEditing" HeaderText="Restrict Editing"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Notes" SortExpression="Notes" HeaderText="Notes"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusDescr" SortExpression="StatusDescr" HeaderText="Status"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ModifiedOn" SortExpression="ModifiedOn" HeaderText="Modified On"
                                                ItemStyle-Wrap="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="id" SortExpression="id" Display="false" />
                                            <telerik:GridBoundColumn DataField="CockpitId" SortExpression="CockpitId" Display="false" />
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
        </telerik:RadMultiPage>
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmDeleteBtn" Text="" Style="display: none;" OnClick="ConfirmDeleteBtn_Click" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
