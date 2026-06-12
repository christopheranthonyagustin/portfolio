<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BilllOfLadingWBForm.aspx.cs" Inherits="iWMS.Web.FreightManagement.BilllOfLadingWorkbench.BilllOfLadingWBForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BilllOfLadingWBForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
        .StatusBackground {
            background: BLACK;
            opacity: 0.001;
        }

        .btn1 {
            color: #fff;
            background-color: #8ea4d7;
            border-radius: 4px;
            height: 25px;
            width: 25px;
            text-align: center;
            padding: 1px 1px 1px 0px;
        }

            .btn1:hover {
                background: #6885ca;
            }
        /*Main menu*/
        .mainMenu {
            text-transform: uppercase;
        }

            .mainMenu .rmRootGroup .rmRootLink {
                padding: 2px 7px;
                line-height: 20px;
                height: 20px;
                border-bottom: solid 1px #b7b7b7;
                border-right: solid 1px #b7b7b7;
            }

                .mainMenu .rmRootGroup .rmRootLink .rmToggle {
                    height: 30px;
                }

        .WrappingItem {
            white-space: normal;
        }

            .WrappingItem:hover {
                color: black !important;
                background-color: white !important;
                font-weight: bold !important;
            }
    </style>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Billl Of Lading" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true" Width="100%">
                        <telerik:RadPageView runat="server" ID="BOLRadPageView">                           
                            <asp:Panel ID="Panel3" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Button ID="ADDBtn" runat="server" CssClass="white" Text="Update"
                                                OnClick="ADDBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <asp:UpdatePanel runat="server" ID="RadGridBLCtnr_UpdatePanel">
                                    <ContentTemplate>
                                        <table width="80%">
                                            <br />
                                            <tr>
                                                <td valign="top">
                                                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                                                    <br />
                                                    <telerik:RadGrid ID="RadGridBLCtnr" runat="server" AutoGenerateColumns="false" RenderMode="Lightweight" Width="70%"
                                                        EnableLinqExpressions="False" AllowPaging="True" Skin="Office2007" OnNeedDataSource="RadGridBLCtnr_NeedDataSource"
                                                        OnItemCommand="RadGridBLCtnr_ItemCommand" OnItemDataBound="RadGridBLCtnr_ItemDataBound">
                                                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                                            <Selecting AllowRowSelect="true" />
                                                        </ClientSettings>
                                                        <SortingSettings EnableSkinSortStyles="false" />
                                                        <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                                                        <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                                                        <HeaderStyle Wrap="false"></HeaderStyle>
                                                        <MasterTableView AllowMultiColumnSorting="true" Name="RadGridBLCtnrGrid" PageSize="50" DataKeyNames="Id">
                                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                            <Columns>
                                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton runat="server" Visible="True" ID="ChargeUpdate" ImageUrl="../../image/floppy.gif"
                                                                            Width="15" Height="15" AlternateText="Update" CommandName="ChargeUpdate" BackColor="Transparent"
                                                                            BorderWidth="0"></asp:ImageButton>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="number" ItemStyle-HorizontalAlign="Center" HeaderText="Container">
                                                                    <ItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="numberTxt" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "Number")%>'></telerik:RadTextBox>
                                                                    </ItemTemplate>
                                                           </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn UniqueName="SealNo1" ItemStyle-HorizontalAlign="Center" HeaderText="Seal">
                                                                    <ItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="SealTxt" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "SealNo1")%>'></telerik:RadTextBox>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>

                                                                <telerik:GridTemplateColumn UniqueName="vol" ItemStyle-HorizontalAlign="Center" HeaderText="Vol">
                                                                    <ItemTemplate>                                           
                                                                        <telerik:RadTextBox runat="server" ID="volTxt" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "vol")%>'></telerik:RadTextBox>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="GrossWT" ItemStyle-HorizontalAlign="Center" HeaderText="GrossWT">
                                                                    <ItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="GrossWTTxt" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "GrossWT")%>'></telerik:RadTextBox>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridTemplateColumn UniqueName="packs" ItemStyle-HorizontalAlign="Center" HeaderText="Packs">
                                                                    <ItemTemplate>
                                                                        <telerik:RadTextBox runat="server" ID="PacksTxt" Width="140px" Text='<%# DataBinder.Eval(Container.DataItem, "Packs")%>'></telerik:RadTextBox>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                            </Columns>
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </td>
                                                <td rowspan="9" colspan="9" valign="top">
                                                    <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                                                    <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function RadMenuClientOnClick(sender, args) {
            if (args.get_item().get_index() == 0 && args.get_item()._hasItems == true) {
                args.set_cancel(true);
            }
        }
    </script>
</body>
</html>