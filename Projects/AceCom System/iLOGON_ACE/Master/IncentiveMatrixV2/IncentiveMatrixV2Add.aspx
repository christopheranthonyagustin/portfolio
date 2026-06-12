<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncentiveMatrixV2Add.aspx.cs" Inherits="iWMS.Web.Master.IncentiveMatrixV2.IncentiveMatrixV2Add" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IncentiveMatrixCTSAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="AddBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="700px">
                <br />
                &nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="Add" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" class="white" />
                <br />
                <br />
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false" HorizontalAlign="Center"></AlternatingItemStyle>
                    <ItemStyle Wrap="false" HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top"
                        EditMode="InPlace">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="icon">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="ResultDG_Delete" runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" /></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="typedescr" HeaderText="Type">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "typedescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="TypeCombo" runat="server"
                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%#TypeDS%>'
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TypeDS,DataBinder.Eval(Container.DataItem, "typedescr").ToString())%>'
                                        DataTextField="descr" DataValueField="item">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Rate" UniqueName="rate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "rate", "{0:#,0.##}")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="150px"></telerik:RadTextBox>
                                    <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="billsizetype" HeaderText="BillSizeType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "billsizetype")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="BillSizeTypeCombo" runat="server"
                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# BillSizeTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeListDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                        DataTextField="descr" DataValueField="item">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripType" HeaderText="TripType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="TripType" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300"
                                        DataSource='<%# TripTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeListDS,DataBinder.Eval(Container.DataItem, "TripTypeDescr").ToString())%>'
                                        DataTextField="Descr" DataValueField="Item">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="TripOptionDescr" HeaderText="TripOption">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TripOptionDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="TripOption" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300"
                                        DataSource='<%# TripOptionListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionListDS,DataBinder.Eval(Container.DataItem, "TripOptionDescr").ToString())%>'
                                        DataTextField="Descr" DataValueField="Item">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TrailerType" HeaderText="TrailerType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TrailerTypeDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="TrailerType" runat="server" CausesValidation="false" EnableVirtualScrolling="true" ShowMoreResultsBox="true" Skin="WebBlue"
                                        RenderMode="Lightweight" AllowCustomText="false" Filter="Contains" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" DropDownAutoWidth="Enabled" Width="155" Height="300"
                                        DataSource='<%# TrailerTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TrailerTypeListDS,DataBinder.Eval(Container.DataItem, "TrailerTypeDescr").ToString())%>'
                                        DataTextField="Descr" DataValueField="Item">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="PHSundayRate" UniqueName="PHSundayRate">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PHSundayRate", "{0:#,0.##}")  %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="PHSundayRateTxt" Skin="Office2007" Width="150px"></telerik:RadTextBox>
                                    <asp:CompareValidator ID="PHSundayRateTxtCompVal" runat="server" ControlToValidate="PHSundayRateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="PHSundayRateTxtZeroVal" runat="server" ControlToValidate="PHSundayRateTxt"
                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="FromServicePT" HeaderText="FromServicePT">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "FrServicePT")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="FrServicePT" runat="server"
                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# FrServicePTListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(FrServicePTListDS,DataBinder.Eval(Container.DataItem, "FrServicePT").ToString())%>'
                                        DataTextField="descr" DataValueField="item" AllowCustomText="false">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ToServicePT" HeaderText="ToServicePT">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ToServicePT")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="ToservicePT" runat="server"
                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# ToServicePTListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ToServicePTListDS,DataBinder.Eval(Container.DataItem, "ToServicePT").ToString())%>'
                                        DataTextField="descr" DataValueField="item" AllowCustomText="false">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="true">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        </telerik:RadMultiPage>


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

