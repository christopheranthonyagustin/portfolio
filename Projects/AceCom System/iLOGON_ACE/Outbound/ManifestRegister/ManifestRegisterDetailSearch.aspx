<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManifestRegisterDetailSearch.aspx.cs"
    Inherits="iWMS.Web.Outbound.ManifestRegister.ManifestRegisterDetailSearch" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ManifestRegisterDetailSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    
     <style type="text/css">
         .style1
         {
             width: 540px;
         }
         .popupHeader
         {
             padding: 5px 0px 0px 0px;
             width: 420px;
             font-family: tahoma;
             font-weight: bold;
             height: 25px;
             text-decoration: none;
             background-color: #859DD4;
         }
         .popupHeader span
         {
             color: #fff;
             text-decoration: none;
             line-height: 15px;
             text-decoration: none;
             float: left;
             margin-left: 10px;
         }
         .popupHeader a
         {
             color: #fff !important;
             text-decoration: none !important;
             line-height: 15px;
             text-decoration: none;
             float: right;
             margin-right: 10px;
         }
     </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                <asp:Label ID="mrNoLbl" runat="server" CssClass="pagetitle"></asp:Label>&nbsp;&nbsp;
            </td>
            <td>
                <asp:Label ID="PageTitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
            <br />
        </tr>
    </table>
    <table border="0" cellspacing="1" cellpadding="1" width="100%">
        <tr>
            <td>
                <asp:Panel ID="BtnPanel" runat="server">
                    <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="../../Image/PopulateButton.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="SaveBtn_Click" />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="CancelBtn" runat="server" ImageUrl="../../Image/CancelImage.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="CancelBtn_Click" />
                    
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="SearchPanel" runat="server" Visible="False">
                    <table border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td>
                                <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png"
                                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                                    OnClick="SearchBtn_Click" />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
   
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
        AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        <label id="completelbl">
                            </label>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--<asp:CheckBox ID="SelectCB" runat="server" />
                        </ItemTemplate>--%>
                        <%-- <ItemTemplate>--%>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="#" UniqueName="sno" Reorderable="false" AllowFiltering="false">
                    <ItemTemplate>
                        <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="status" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Number" SortExpression="Number" HeaderText="Number">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="length" SortExpression="Width" HeaderText="LotID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Width" SortExpression="Width" HeaderText="Width">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Height" SortExpression="Height" HeaderText="Height">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Vol" SortExpression="Vol" HeaderText="Vol">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
    </telerik:RadWindowManager>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
