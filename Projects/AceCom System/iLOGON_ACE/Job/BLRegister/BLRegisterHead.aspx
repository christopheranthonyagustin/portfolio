<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BLRegisterHead.aspx.cs" Inherits="iWMS.Web.Job.BLRegister.BLRegisterHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>BLRegister</title>

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <script language="javascript" type="text/javascript">
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

    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>

    <style type="text/css">
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table>
            <tr>
                <td align="left">
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="pagetitle">&nbsp;
                <asp:Button ID="SwitchHBLBtn" class="white" runat="server" OnClick="SwitchHBLBtn_Click" Text="SwitchHBL"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="AddMasterBtn" class="white" runat="server" OnClick="AddMasterBtn_Click" Text="NewMaster"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="BLDraftBtn" class="blue" runat="server" OnClick="BLDraftBtn_Click" Text="PrintBLDraft"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="BLBtn" class="blue" runat="server" OnClick="BLBtn_Click" Text="PrintBL"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="BLCBtn" class="blue" runat="server" OnClick="BLCBtn_Click" Text="BLDraftCarrier" Width="130px"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="ManifestBtn" class="blue" runat="server" OnClick="ManifestBtn_Click" Text="Manifest"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="UnblockBLBtn" class="white" runat="server" OnClick="UnblockBLBtn_Click" Text="UnlockBL" Visible="false"
                    UseSubmitBehavior="true" />
                    &nbsp;                
                <asp:Button ID="ExportExcelBLBtn" class="green" runat="server" OnClick="ExportExcelBLBtn_Click" Text="ExcelBL"
                    UseSubmitBehavior="true" ToolTip="Export BL to Excel" />
                    &nbsp;
                <asp:Button ID="shipAdvBtn" class="blue" runat="server" OnClick="shipAdvBtn_Click" Text="ShipAdvice"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="ArrNotBtn" class="blue" runat="server" OnClick="ArrNotBtn_Click" Text="ArrivalNote"
                    UseSubmitBehavior="true" />
                    &nbsp;
                <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"
                    UseSubmitBehavior="true" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" AllowSorting="true" OnItemDataBound="ResultDG_ItemDataBound"
            AllowFilteringByColumn="true" Skin="Office2007" Height="500px">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling AllowScroll="True"></Scrolling>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="200" HierarchyLoadMode="Client">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="BLHEAD_Edit"
                                runat="server">
                                <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                    title="Edit" runat="server" /></a>
                            <a id="jbctnrEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBCTNR_Edit"
                                runat="server">
                                <img id="editImg" src="../../image/rcsdetl.gif" width="15" height="15" border="0" alt="Edit"
                                    title="TankInfoUpdate" runat="server" /></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="BLNo" DataField="blno" AllowFiltering="true"
                        ColumnGroupName="blno" SortExpression="blno" UniqueName="blno"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BLType" DataField="bltype" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="JobNo" DataField="jobno" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SONo" DataField="sono" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PrintFlag" DataField="printflag" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpackages" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="BLType" DataField="bltypedescr" AllowFiltering="true"
                        ColumnGroupName="bltypedescr" SortExpression="bltypedescr" UniqueName="bltypedescr"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="jbId" DataField="jbid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Marks&Nos" DataField="marksandnumbers" AllowFiltering="true"
                        ColumnGroupName="marksandnumbers" SortExpression="marksandnumbers" UniqueName="marksandnumbers"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DescriptionOfGoods" DataField="DescriptionOfGoods" AllowFiltering="true"
                        ColumnGroupName="DescriptionOfGoods" SortExpression="DescriptionOfGoods" UniqueName="DescriptionOfGoods"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NetWt" DataField="netwt" AllowFiltering="false"
                        Reorderable="true" DataFormatString="{0:#,0.00}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="GrossWt" DataField="GrossWt" AllowFiltering="false"
                        Reorderable="true" DataFormatString="{0:#,0.00}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Measurement" DataField="Measurement" AllowFiltering="false"
                        Reorderable="true" DataFormatString="{0:#,0.00}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SwitchFrom" DataField="SwitchFromHBLNo" AllowFiltering="true"
                        ColumnGroupName="SwitchFromHBLNo" SortExpression="SwitchFromHBLNo" UniqueName="SwitchFromHBLNo"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
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
