<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="UserAdd.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Adm.User.UserAdd" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html>
<head runat="server">
    <title>UserSetup</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1 {
            height: 107px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="RadButton1">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td>
                            <asp:Button ID="RadButton1" runat="server" Text="Add" ToolTip="Add" OnClick="CreateBtn_Click"
                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" class="white" />
                            &nbsp;
			                <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellspacing="1" cellpadding="2" width="100%" border="0">
                                <%--<tr>
								<td class="subtabletitle" bgColor="#eeeeee" colSpan="2">
									&nbsp;<asp:Label id="UserSetupLbl" runat="server">User Information</asp:Label></td>
							</tr>
							<tr >
								<td colspan="2">&nbsp;<asp:Label id="InfoLbl" runat="server">Password will default as login id. User have to change the password 
									during the first login.</asp:Label></td>
							</tr>--%>
                                <tr>
                                    <td class="style2">
                                        <br />

                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                        &nbsp;
                                    </td>
                                </tr>

                                <%--<tr bgColor="#ffffff">
								<td width="25%" style="HEIGHT: 22px">
									<asp:Label id="UserIdLbl" runat="server" style="Z-INDEX: 0">User ID</asp:Label></td>
								<td style="HEIGHT: 22px">:
									<telerik:RadTextBox id="UserIdTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox>
									<asp:RequiredFieldValidator style="Z-INDEX: 0" id="SkuReq" runat="server" EnableClientScript="True" ErrorMessage="*"
										ControlToValidate="UserIdTxt"></asp:RequiredFieldValidator></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="NameLbl" runat="server" style="Z-INDEX: 0">User Name</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="UserNameTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox></td>
							</tr>
								<tr bgColor="#ffffff">
								<td>
									<asp:Label id="Label1" runat="server" style="Z-INDEX: 0">IC No</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="ICnoTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox></td>
							</tr>
									<tr bgColor="#ffffff">
								<td>
									<asp:Label id="Label2" runat="server" style="Z-INDEX: 0">Type</asp:Label></td>
								<td>:
									<telerik:RadDropDownList id="TypeList" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadDropDownList></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="DeclarantCodeLbl" runat="server" style="Z-INDEX: 0">Declarant Code</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="DeclarantCodeTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="EmailLbl" runat="server">Email</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="EmailTxt" Skin="WebBlue" runat="server" Width="300px"></telerik:RadTextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="TelLbl" runat="server">Tel</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="TelTxt" runat="server" Skin="WebBlue" style="Z-INDEX: 0"></telerik:RadTextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="HpLbl" runat="server">Hp</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="HpTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="ProfileLbl" runat="server">Profile</asp:Label></td>
								<td>:
									<telerik:RadDropDownList id="ProfileList" Skin="WebBlue"  runat="server" OnSelectedIndexChanged="Profile_OnSelectedIndexChanged"></telerik:RadDropDownList></td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="LanguageLbl" runat="server">UI Language</asp:Label></td>
								<td>:
									<telerik:RadDropDownList id="LanguageList" Skin="WebBlue" runat="server"></telerik:RadDropDownList>
								</td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="Label3" runat="server">PasswordValidDays</asp:Label></td>
								<td>:
									<telerik:RadTextBox id="PwdVdaysTxt" Skin="WebBlue" runat="server" style="Z-INDEX: 0"></telerik:RadTextBox>
									 <asp:CompareValidator ID="PwdVdaysTxtCompVal" Runat="server" ControlToValidate="PwdVdaysTxt" EnableClientScript="true"
									  ErrorMessage="*" Operator="DataTypeCheck"  Type="Integer"></asp:CompareValidator>
								</td>
							</tr>
							<tr bgColor="#ffffff">
								<td>
									<asp:Label id="Label4" runat="server">PasswordDate</asp:Label></td>
								<td>:
								
								<telerik:RadDatePicker ID="PwdDateTxt" runat="server" DateInput-DateFormat="dd/MMM/yyyy"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" Skin="Office2007">
                                                        <Calendar>
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
								</td>
							</tr>--%>
                                <tr valign="top">
                                    <td valign="top">
                                        <table border="0">
                                        <td>&nbsp;<asp:Label ID="Label1" runat="server">Account</asp:Label></td>
                                    <tr>
                                        <td style="width: 700px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="AvailAccList" Height="120px" Width="250px"
                                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAccList"
                                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                            Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                            OnTransferred="AvailAccList_Transferred">
                                        </telerik:RadListBox>
                                            <telerik:RadListBox runat="server" ID="SelectedAccList" Height="120px" Width="200px"
                                                ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                                Skin="WebBlue" AllowDelete="false">
                                            </telerik:RadListBox>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                            </table>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td valign="top">
                            <table border="0">
                            <td>&nbsp;<asp:Label ID="Label2" runat="server">Site</asp:Label></td>
                        <tr>
                            <td style="width: 700px" valign="top">&nbsp;<telerik:RadListBox runat="server" ID="AvailSiteList" Height="120px" Width="250px"
                                ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedSiteList"
                                TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                OnTransferred="AvailSiteList_Transferred">
                            </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedSiteList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                    Skin="WebBlue" AllowDelete="false">
                                </telerik:RadListBox>
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                </table>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
