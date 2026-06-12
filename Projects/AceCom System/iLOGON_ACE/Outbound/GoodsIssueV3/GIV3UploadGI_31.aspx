<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIV3UploadGI_31.aspx.cs" Inherits="iWMS.Web.Outbound.GoodsIssueV3.GIV3UploadGI_31" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>GoodIssueV3UploadGI_31</title>
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="50%" runat="server" style="float: left">
            <tr>
                <td colspan="2" style="height: 10px;" valign="top" align="left">
                    <b>UPL Interface Upload</b>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <iWMS:iform ID="formCtl" runat="server"></iWMS:iform>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" RenderMode="Lightweight"
                        MaxFileInputsCount="1" HideFileInput="true" AllowedFileExtensions=".xls,.xlsx" Skin="Outlook" />

                    <asp:Label ID="lblnote" Text="Note : Only Excel files can be uploaded." runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style1">&nbsp;
                <asp:DropDownList ID="excelssDDL" runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="uploadBtn" CssClass="white" runat="server" OnClick="uploadBtn_Click" Visible="true"
                        Text="Upload" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    <div id="DIV_ResultGrid" style="height: 92%" runat="server" visible="false">
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="25%"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007">
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <Columns>
                                     <telerik:GridBoundColumn DataField="Number" SortExpression="Number" HeaderText="GINumber">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </td>
            </tr>
        </table>
        <table style="float: left; margin-left: -30%">
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:ImageButton runat="server" ID="DownloadExcelImgBtn" ImageUrl="../../image/Excel_file.png"
                        BorderWidth="0" BackColor="Transparent" Width="50" Height="50" AlternateText="DownLoad Excel"
                        OnClick="DownloadExcelImgBtn_Click" CausesValidation="False" ToolTip="DownLoad Excel"></asp:ImageButton>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
