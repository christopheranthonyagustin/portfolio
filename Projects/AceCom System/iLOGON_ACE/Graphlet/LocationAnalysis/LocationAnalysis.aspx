<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocationAnalysis.aspx.cs" Inherits="iWMS.Web.Graphlet.LocationAnalysis.LocationAnalysis" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Location Analysis</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script src="../../js/jquery.hoverflow.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <style type="text/css">
        .style1 {
            width: 5%;
        }

        a:link {
            color: black;
        }

        a:visited {
            color: black;
        }

        .errorLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 8pt;
            color: Red;
        }

        .aisleLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 20pt;
            color: DarkBlue;
        }

        .remarksLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 12pt;
            color: DarkBlue;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:Panel ID="Panel13" runat="server">
            <panel13template>
        <br />
        <div id="content">
           <table border="0" cellpadding="0" cellspacing="0" width="80%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="80%">
                            <tr>
                                <td width="8%">
                                    <asp:Label ID="Label2" runat="server" Text="Site" />
                                </td>
                                <td width="92%" colspan="3">
                                    <telerik:RadDropDownList ID="SiteDDL" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="SiteList_SelectedIndexChanged" AutoPostBack="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" height="3px">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="8%">
                                    <asp:Label ID="Zonelbl" runat="server" Text="Zone" />
                                </td>
                                <td width="92%" colspan="3">
                                    <telerik:RadDropDownList ID="ZoneDDL" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="ZoneList_SelectedIndexChanged" AutoPostBack="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" height="3px">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="8%">
                                    <asp:Label ID="Label3" runat="server" Text="Category" />
                                </td>
                                <td width="92%" colspan="3">
                                    <telerik:RadDropDownList ID="LocationCatList" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="LocCatList_SelectedIndexChanged" AutoPostBack="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="8%" align="left" valign="top">
                                    <asp:Label ID="Aislelbl" runat="server" Text="Aisle" />
                                </td>
                                <td width="15%">
                                    <telerik:RadListBox runat="server" ID="AvailAisleList" Height="100px" Width="180px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAisleList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="AvailAisleList_Transferred">
                                    </telerik:RadListBox>
                                </td>
                                <td width="25%">
                                    <telerik:RadListBox runat="server" ID="SelectedAisleList" Height="100px" Width="160px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false" BackColor="Yellow">
                                    </telerik:RadListBox>
                                </td>
                                <td width="25%"></td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:Button ID="btnGetGraphlet" CssClass="white" runat="server" OnClick="btnGetGraphlet_Click"
                                        Text="Submit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    <br />
                                    <br />
                                    <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>                   
                    </td>
                    <td></td>                   
                    <td valign="top" align="left">
                        <table>
                            <tr>
                                <td class="style1">
                                    <br />
                                    &nbsp;<asp:Label ID="Label4" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Label ID="Label5" Text="1. Locations with Flag='Inactive' will be excluded" Font-Size="15px" runat="server"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Label ID="Label6" Text="2. Legends" Font-Size="15px" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <table style="width: 100%; text-align: left; border-collapse: collapse; border: 1px solid black">
                                        <tr>
                                            <td style="border: 1px solid black; background-color: red; width: 50px"></td>
                                            <td style="border: 1px solid black">Occupied</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: green; width: 50px"></td>
                                            <td style="border: 1px solid black">Empty</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: Gray; width: 50px"></td>
                                            <td style="border: 1px solid black">Unavailable</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: orange; width: 50px"></td>
                                            <td style="border: 1px solid black">Occupied and pending putaway</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: blue; width: 50px"></td>
                                            <td style="border: 1px solid black">Empty and pending putaway</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <div class="padding25" style="border-bottom: 1px solid #ccc;">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <br />
            </div>
        </div>
        </panel13template>
        </asp:Panel>
        <asp:UpdatePanel ID="UpdButton" runat="server">
            <ContentTemplate>
                <div>
                    <table>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                &nbsp;<telerik:RadListBox runat="server" ID="SiteList" Height="100px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSiteList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                    OnTransferred="SelectedSiteList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedSiteList" Height="100px" Width="180px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                                &nbsp;&nbsp;                                 
                        <telerik:RadListBox runat="server" ID="ZoneListBox" Height="100px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectZoneListBox"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                            OnTransferred="ZoneList_Transferred">
                        </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectZoneListBox" Height="100px" Width="180px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="WebBlue" AllowDelete="false">
                                </telerik:RadListBox>
                                &nbsp;&nbsp;                                 
                        <telerik:RadListBox runat="server" ID="LocCatList" Height="100px" Width="200px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedLocCatList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                            OnTransferred="LocCatList_Transferred">
                        </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedLocCatList" Height="100px" Width="180px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="WebBlue" AllowDelete="false">
                                </telerik:RadListBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;<iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            <asp:Button ID="Compilebtn" CssClass="white" runat="server" OnClick="Compilebtn_Click" Text="Run" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel19" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel19" runat="server" Visible="false">
                    <table width="50%">
                        <tr>
                            <td colspan="2">
                                <iWMS:iForm ID="formCtl19" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;
                                <asp:Label ID="AisleLbl19" runat="server" Text="Aisle" />
                            </td>
                        </tr>
                        <tr>
                            <td width="5%">
                                <telerik:RadListBox runat="server" ID="AvailAisleList19" Height="100px" Width="180px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAisleList19"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                    Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                    OnTransferred="AvailAisleList19_Transferred">
                                </telerik:RadListBox>
                            </td>
                            <td>
                                <telerik:RadListBox runat="server" ID="SelectedAisleList19" Height="100px" Width="160px"
                                    Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    AllowDelete="false" BackColor="Yellow">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                &nbsp;
                                <asp:Button ID="RunBtn19" CssClass="white" runat="server" OnClick="RunBtn19_Click" Text="Run"
                                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel23" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel23" runat="server" Visible="false">
                    <table width="50%">
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl23" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                &nbsp;
                                <asp:Button ID="RunBtn23" CssClass="white" runat="server" OnClick="RunBtn23_Click" Text="Run"
                                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel29" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel29" runat="server" Visible="false">
                    <table width="50%">
                        <tr>
                            <td colspan="2">
                                <iWMS:iForm ID="formCtl29" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                &nbsp;
                                <asp:Button ID="RunBtn29" CssClass="white" runat="server" OnClick="RunBtn29_Click" Text="Run"
                                    OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
              <Triggers>
                                    <asp:PostBackTrigger ControlID="RunBtn29" />
                                </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
