<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="iWMS.Web.Report.ContainerAnalysis.Search" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ContainerAnalysis</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" OnTabClick="TabClick"
            CausesValidation="false" AutoPostBack="true" SelectedIndex="50" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Format" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Criteria" Value="50" runat="server" Enabled="false">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <asp:Label ID="FormatTitle" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <table border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>&nbsp;&nbsp;                  
                     <asp:Button ID="CompileBtn" runat="server" Text="Run" CausesValidation="false" ToolTip="Run" OnClick="CompileBtn_Click"
                         CssClass="white" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"  />
                    &nbsp;
                    <asp:Button ID="ResetBtn" runat="server" Text="Reset" CausesValidation="false" OnClick="ResetBtn_Click" CssClass="white" Visible="false" />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <table width="50%" border="0">
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="Pnl_29" runat="server" Visible="false">
                                    <table border="0" cellspacing="2" cellpadding="2" width="80%">
                                        <tr>
                                            <td>
                                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                                                    MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                                                <asp:Label ID="Label" Text="Note : Select File - EMOS Record " runat="server"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:Button ID="OpenExcelBtn" runat="server" Text="Sample" CausesValidation="false" OnClick="OpenExcel_Click"
                                                    CssClass="white" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload2" RenderMode="Lightweight"
                                                    MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                                                <asp:Label ID="Label2" Text="Note : Select File - ETA PASS" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:Button ID="OpenExcel2Btn" runat="server" Text="Sample" CausesValidation="false" OnClick="OpenExcel2Btn_Click"
                                                    CssClass="white" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload3" RenderMode="Lightweight"
                                                    MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                                                <asp:Label ID="Label3" Text="Note : Select File - Transfer to JLT" runat="server"></asp:Label>
                                            </td>
                                            <td valign="top">
                                                <asp:Button ID="OpenExcel3Btn" runat="server" Text="Sample" CausesValidation="false" OnClick="OpenExcel3Btn_Click"
                                                    CssClass="white" />
                                            </td>
                                        </tr>  
                                         <tr>
                                            <td width="50%">
                                                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>                                     
                                    </table>
                                   <table border="0" cellspacing="2" cellpadding="2" width="200%">
                                         <tr>
                                            <td>
                                                <br />
                                                &nbsp;<asp:Label ID="Label1" Text="Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                                <br />
                                                &nbsp;<asp:Label ID="Label4" Text="1. Only trips with job types 'EXPORT%' will be considered." Font-Size="15px" runat="server"></asp:Label>
                                                <br />
                                                &nbsp;<asp:Label ID="Label5" Text="2 All considered trips' From & To Service Points must be classified as one of these types 'Container Depot', 'Transit Hub', 'Warehouse' or 'Port'." Font-Size="15px" runat="server"></asp:Label>
                                                <br />
                                                &nbsp;<asp:Label ID="Label6" Text="3. Damaged Containers are denoted by Trip Type = 'R/E'." Font-Size="15px" runat="server"></asp:Label>
                                                <br />
                                                 &nbsp;<asp:Label ID="Label7" Text="4. Common Sanity Check Exception errors = 'R/E'." Font-Size="15px" runat="server"></asp:Label>
                                                <br />
                                                 &nbsp;<asp:Label ID="Label9" Text="a. Each Container has a Booking Reference and an Original Booking Reference in iTMS. Sometimes these values do not match up with those provided in the upload files. " Font-Size="15px" runat="server"></asp:Label>
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
