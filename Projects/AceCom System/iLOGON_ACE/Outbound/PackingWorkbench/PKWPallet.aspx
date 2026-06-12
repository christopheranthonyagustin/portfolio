<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWPallet.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWPallet" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pallet summary@ Packing Workbench</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script src="../../js/telerikScrip.js" type="text/javascript"></script>

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
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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

        .MessageBoxPopupBackground {
            background-color: black;
            opacity: 0.001;
        }

        .RadWindow {
            z-index: 8010 !important;
        }

        .RadMenu {
            z-index: 600 !important; /*For Bootstrap Modal Popup crashed with Radmenu Position*/
        }
    </style>


</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
            <Tabs>
                <telerik:RadTab Id="PalletSummaryTab" Text="Pallet summary" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="PalletCartonTab" Text="Pallet carton" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CartonNotPalletizedTab" Text="Carton not palletized" Value="200" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="PalletRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="DeletePalletBtn" class="white" runat="server" OnClick="DeletePalletBtn_Click"
                                Text="Delete Pallet" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="PalletLabelBtn" CssClass="LongLabelBlue" runat="server" OnClick="PalletLabelBtn_Click"
                                Text="Pallet Label" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;
                        </td>
                        <td>
                            <asp:Button ID="CartonLabelBtn" CssClass="LongLabelBlue" runat="server" OnClick="CartonLabelBtn_Click"
                                Text="Carton Label" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" EnableLinqExpressions="false"
                    AllowMultiRowSelection="true" MasterTableView-AllowSorting="true" Height="98%" ExportSettings-UseItemStyles="true" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnBatchEditCommand="ResultDG_BatchEditCommand">
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="PackManifestPalletId" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                        HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="Top" TableLayout="Auto" EditMode="Batch">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="S/No" HeaderText="S/No" SortExpression="S/No">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("S/No")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PalletNo" HeaderText="Pallet No" SortExpression="PalletNo" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("PalletNo")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="PalletCount" HeaderText="Pallet Count" SortExpression="PalletCount" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("PalletCount")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="SequenceNo" HeaderText="Sequence No" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("SequenceNo")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="SequenceNoTxt" Skin="WebBlue" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Markings" HeaderText="Markings" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Markings")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="MarkingsTxt" Skin="WebBlue" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Notes" HeaderText="Notes" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Notes")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="NotesTxt" Resize="Both" TextMode="MultiLine" Width="140px" Skin="WebBlue">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Dimension" HeaderText="Dimension" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Dimension")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="DimensionTxt" Skin="WebBlue" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Height" HeaderText="Height" SortExpression="Height" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Height")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Weight")) %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="WeightTxt" Skin="WebBlue" Width="140px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" SortExpression="Status" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("Status")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="ModifiedOn" HeaderText="ModifiedOn" SortExpression="ModifiedOn" ItemStyle-Width="155px" HeaderStyle-Width="155px">
                                <ItemTemplate>
                                    <%# string.Format("{0:}",Eval("ModifiedOn")) %>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridBoundColumn DataField="PackManifestPalletId" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PalletStatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PalletNo" UniqueName="DisplayPalletNo" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="PalletCartonRadPageView">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="90%" ID="CartonNotPalletizedRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="ConfirmYesBtn">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfirmMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfirmMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" CssClass="white" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" CssClass="white" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--<table>
            <tr>
                <td>
                     <asp:Button ID="ConfirmDeleteBtn" Text="" Style="display: none;" OnClick="ConfirmDeleteBtn_Click" runat="server" />
                </td>
            </tr>
        </table>--%>
    </form>

</body>
</html>
