<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkOrderRegisterHeadDetl.aspx.cs"
    Inherits="iWMS.Web.VAS.WorkOrderRegister.WorkOrderRegisterHeadDetl" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>WorkOrder</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });

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

    <style type="text/css">
        html
        {
            overflow: hidden;
        }
    </style>
    <style type="text/css">
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <table id="tbl1" border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
                <td align="right">
                    <div class="pagetitle">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1" Width="100%" Skin="Office2007">
            <Items>
                <telerik:RadPanelItem Expanded="True" Text="Hide/Show Filters" runat="server" Value="main"
                    Style="text-align: center; font-size: 15px; font-weight: bold;">
                    <Items>
                        <telerik:RadPanelItem runat="server" Value="Panel">
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr style="height: 15px">
                                    </tr>
                                    <tr>
                                        <td>
                                            <td>
                                                &nbsp;<asp:Label ID="WONoLbl" runat="server">WONumber</asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadTextBox ID="WONoTxt" runat="server" Width="150px">
                                                </telerik:RadTextBox>
                                            </td>
                                            <td>
                                                &nbsp;<asp:Label ID="TypeLbl" runat="server">Type</asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDropDownList ID="TypeDDL" runat="server" Enabled="True" DataTextField="descr"
                                                    DataValueField="item" Width="150px" Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                            <td>
                                                &nbsp;<asp:Label ID="StatusLbl" runat="server">Status</asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDropDownList ID="StatusDDL" runat="server" Enabled="True" DataTextField="descr"
                                                    DataValueField="item" Width="150px" Skin="WebBlue">
                                                </telerik:RadDropDownList>
                                            </td>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;<telerik:RadButton Style="z-index: 0" ID="SearchBtn" runat="server" Text="Search"
                                                OnClick="SearchBtn_Click" Skin="WebBlue">
                                            </telerik:RadButton>
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                    </tr>
                                    <tr style="height: 15px">
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
            <ExpandAnimation Type="None" />
            <CollapseAnimation Type="None" />
        </telerik:RadPanelBar>
    </div>
    <asp:Panel ID="finalisedPanel" runat="server">
        <table border="0" cellspacing="4" cellpadding="4" width="100%">
            <tr>
<%--                <td >
                    <asp:ImageButton ID="SendEDIBtn" runat="server" ImageUrl="../../Image/SendEDI.png"
                        Visible="true" OnClick="SendEDIBtn_Click" BackColor="Transparent" BorderWidth="0"
                        Style="z-index: 0" ImageAlign="AbsMiddle" />
                    &nbsp;
                    <asp:ImageButton ID="CPVBtn" runat="server" ImageUrl="../../Image/CPV.png" Visible="true"
                        OnClick="CPVBtn_Click" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
                        ImageAlign="AbsMiddle" />
                    &nbsp;
                    <asp:ImageButton ID="DuesSurplusBtn" runat="server" AutoPostBack="true" ImageUrl="../../Image/DuesOut.png"
                        BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="DuesSurplusBtn_Click" />
                    &nbsp;
                     <asp:ImageButton ID="SORBtn" runat="server" AutoPostBack="true" ImageUrl="../../Image/SORRpt.png"
                        BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="SORBtn_Click" />
                     &nbsp;
                    <asp:ImageButton ID="CloseBtn" runat="server" ImageUrl="../../Image/Close.png" Visible="true"
                        OnClick="CloseBtn_Click" BackColor="Transparent" BorderWidth="0" Style="z-index: 0"
                        ImageAlign="AbsMiddle" />
                    &nbsp;
                    <asp:ImageButton ID="CancelBtn" runat="server" AutoPostBack="true" ImageUrl="../../Image/Cancel.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="CancelBtn_Click"></asp:ImageButton>
                </td>--%>
                <td>
                    <asp:Button ID="SendEDIBtn" class="green" runat="server" OnClick="SendEDIBtn_Click" Text="SendEDI" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CPVBtn" class="blue" runat="server" OnClick="CPVBtn_Click" Text="CPV" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="DuesSurplusBtn" class="blue" runat="server" OnClick="DuesSurplusBtn_Click" Text="DuesOut" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="SORBtn" class="blue" runat="server" OnClick="SORBtn_Click" Text="SOR" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CloseBtn" class="white" runat="server" OnClick="CloseBtn_Click" Text="Close" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        Width="100%" Height="77%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" GroupPanelPosition="Top" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
        AllowAutomaticInserts="True">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling UseStaticHeaders="true" />
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-Width="50px" ItemStyle-Width="50px">
                    <ItemStyle Wrap="False"></ItemStyle>
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-Width="25px" ItemStyle-Width="25px">
                    <ItemTemplate>
                        &nbsp;<asp:ImageButton runat="server" Visible="True" ID="WorkOrderEdit" ImageUrl="..\..\image\pencil.gif"
                            BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit WorkOrder"
                            OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="id" DataField="id" UniqueName="id" AllowFiltering="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="bhid" DataField="bhid" UniqueName="bhid" AllowFiltering="true"
                    Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="WONumber" DataField="number" UniqueName="number"
                    SortExpression="number" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Type" DataField="type" UniqueName="type" SortExpression="type"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="BOMNo" DataField="BOMNo" UniqueName="BOMNo"
                    SortExpression="BOMNo" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SKU" DataField="SKUCode" UniqueName="SKUCode"
                    SortExpression="SKUCode" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Description" DataField="SKUDescr" UniqueName="Description"
                    SortExpression="Description" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="status" UniqueName="status"
                    SortExpression="status" Display="false" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" UniqueName="statusdescr"
                    SortExpression="statusdescr" AllowFiltering="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" SortExpression="adddate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" SortExpression="adduser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" SortExpression="editdate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" SortExpression="edituser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="StatusColor" DataField="statuscolor" UniqueName="statuscolor"
                    SortExpression="statuscolor" Display="false" AllowFiltering="true">
                </telerik:GridBoundColumn>
            </Columns>
            <DetailTables>
                     <telerik:GridTableView DataKeyNames="BHId" Name="ChildGrid" Width="100%" SkinID="Telerik" AllowPaging="true" PageSize="50"    
                        AllowFilteringByColumn="false" TableLayout="Fixed" BackColor="White">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="true" />
                        <AlternatingItemStyle Wrap="true" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="bdnumber" SortExpression="bdnumber" HeaderText="BagNumber"
                                HeaderStyle-Width="20px" ItemStyle-Width="20px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKUCode"
                                HeaderStyle-Width="20px" ItemStyle-Width="20px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKUDescr"
                                HeaderStyle-Width="20px" ItemStyle-Width="20px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="inqty" SortExpression="inqty" HeaderText="InQty"
                                HeaderStyle-Width="20px" ItemStyle-Width="20px">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
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
