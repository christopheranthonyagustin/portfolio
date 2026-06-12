<%@ Page Language="c#" CodeBehind="VehUpkeepList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Master.VehUpkeep.VehUpkeepList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<html>
<head id="Head1" runat="server">
    <title>VehUpkeep</title>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js"></script>
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
    </script>
    <style type="text/css">
        html {
            overflow: hidden;
        }

        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="PopulateBtn" class="white" runat="server" OnClick="PopulateBtn_Click"
                                Text="Populate" Visible="false" ToolTip="Populate" />
                            &nbsp;
                    <asp:Button ID="PrintPRBtn" class="blue" runat="server" OnClick="PrintPRBtn_Click"
                        Text="PR" Visible="true" />
                            &nbsp;
                    <asp:Button ID="PrintPOBtn" class="blue" runat="server" OnClick="PrintPOBtn_Click"
                        Text="PO" />
                            &nbsp;
                          <asp:Button ID="ApproveBtn" class="white" runat="server" OnClick="ApproveBtn_Click" ToolTip="Approve"
                              Text="Approve" Visible="true" />
                            &nbsp;
                    <asp:Button ID="UndoPRBtn" class="white" runat="server" OnClick="UndoPRBtn_Click" ToolTip="UndoPR"
                        Text="Reopen" Visible="true" />&nbsp;                    
                        </td>
                        <td style="width: 50px">&nbsp;<asp:Button ID="ExcelBtn" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel" CausesValidation="false" Visible="false" />&nbsp;                 
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" style="margin:4px" />
                        </td>
                    </tr>
                </table>
                <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="90%"
                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                        OnEditCommand="ResultDG_EditCommand" OnItemDataBound="ResultDG_ItemDataBound">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="true" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                                        <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                                        <asp:Label ID="POLbl" runat="server" />
                                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                            onserverclick="VehUpkeepDelete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete incidentDetl"
                                                runat="server"></a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo"
                                    ItemStyle-Wrap="false" Reorderable="true" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="upkeepdate" SortExpression="upkeepdate" HeaderText="Date"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false" Reorderable="true" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="amount" SortExpression="amount" HeaderText="Amount"
                                    ItemStyle-Wrap="false" DataFormatString="{0:#,0.00}" ItemStyle-HorizontalAlign="Right" Reorderable="true" Display="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="Vehicle" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="extrefno" SortExpression="extrefno" HeaderText="VendorDocNo" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="extrefdate" SortExpression="extrefdate" HeaderText="VendorDocDate" Reorderable="true" Display="true"
                                    DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vendorcode" SortExpression="vendorcode" HeaderText="VendorCode" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vendorname" SortExpression="vendorname" HeaderText="VendorName" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="materialamt" SortExpression="materialamt" HeaderText="MaterialAmt" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="labouramt" SortExpression="labouramt" HeaderText="LabourAmt" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="othersamt" SortExpression="othersamt" HeaderText="OthersAmt" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks1" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Statusdescr" SortExpression="Statusdescr" HeaderText="Status" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" Reorderable="true" Display="true"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false" Reorderable="true" Display="true"
                                    HeaderText="EditUser">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID"
                                    ItemStyle-Wrap="false" Display="false" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                                    ItemStyle-Wrap="false" Display="false" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="StatusColor"
                                    ItemStyle-Wrap="False" Display="false" Reorderable="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="imagetype" Display="False" ItemStyle-Wrap="false" Reorderable="true">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>
                <%--Message popup area start--%>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                    DefaultButton="btnOk">
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
                                    <td style="width: 2%;"></td>
                                    <td style="text-align: left; vertical-align: top; width: 87%;">
                                        <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; vertical-align: top;" colspan="3">
                                        <div style="margin-right: 0px; float: right; width: auto;">
                                            <asp:Button ID="btnOk" runat="server" Style="text-decoration: none;" Text="OK" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                <%--Message popup area end--%>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
