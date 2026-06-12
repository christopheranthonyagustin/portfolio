<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV3UploadSKULine.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV3.GRV3UploadSKULine" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>UploadReceipt</title>
    <script src="../../js/CastleBusyBox.js" type="text/javascript"></script>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <style type="text/css">
        .style1 {
            width: 7%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td colspan="2">
                    <br />
                    <br />
                </td>
                <td width="40%"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <iwms:iform ID="formCtl" runat="server"></iwms:iform>
                </td>
                <td rowspan="7" valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 50%;" valign="top">
                                <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText"
                                    ForeColor="#FF0000" Visible="False"></asp:Label>
                                <iwms:iform ID="formCtl1" runat="server"></iwms:iform>
                            </td>
                            <td style="width: 30%;" valign="top">
                                <asp:Label ID="lotmsgLbl" CssClass="BlackText" ForeColor="#FF0000" runat="server" />
                                <br />
                                <asp:Label ID="ImageLbl" runat="server" />
                            </td>
                            <td style="width: 20%;"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="SKUGroup" runat="server">SKUGroup</a>
                    <br />
                    <telerik:RadDropDownList ID="SKUGroupDDL" runat="server" DropDownWidth="150px" Skin="Sunset" Width="150px">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <a id="billgrp" runat="server">Default Billing Group </a>
                    <br />
                    <telerik:RadDropDownList ID="ddlBillingGrp" runat="server" DefaultMessage="Select a Status"
                        DropDownWidth="150px" Skin="Sunset" Width="150px" AutoPostBack="true">
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="excelLbl" runat="server" ForeColor="#FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">File Location&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="excelssLbl" runat="server" Visible="False">Spreadsheet Name:</asp:Label>
                    <asp:Label ID="billgrpLbl" runat="server" Visible="false">Default Billing Group: </asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged" Visible="false" />
                    <br />
                    <asp:Button ID="excelssBtn" Text="Get WorkSheet" runat="server" CssClass="formbtn" Visible="false" />
                    <asp:Label ID="warningLbl" CssClass="BlackText" runat="server" Visible="false">Please close excel file (if still open) before clicking Get Worksheet</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;</td>
                <td>
                    <asp:Button ID="uploadBtn" CssClass="white" Text=" UPLOAD " runat="server"
                        OnClick="uploadBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                    <br />
                    <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False" ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <div id="div-datagrid" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007"
                OnNeedDataSource="ResultDG_NeedDataSource"
                ExportSettings-UseItemStyles="true" AutoGenerateColumns="True" GroupPanelPosition="Top"
                AllowPaging="false" AllowSorting="true" AllowFilteringByColumn="false" CellPadding="2" UseAccessibleHeader="True"
                GridLines="Both">
                <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
                <ClientSettings>
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <MasterTableView AllowMultiColumnSorting="true">
                    <Columns>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <iwms:MsgPopup ID="MsgPopup" runat="server"></iwms:MsgPopup>
    </form>
</body>
</html>
