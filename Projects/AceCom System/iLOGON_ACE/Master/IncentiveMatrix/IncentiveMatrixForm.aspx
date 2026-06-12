<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncentiveMatrixForm.aspx.cs" Inherits="iWMS.Web.Master.IncentiveMatrix.IncentiveMatrixForm" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>TeamForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Include & Exclude" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="90%" ID="HeaderRadPageView">
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" class="white" />
                <br />
                <br />
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound"
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
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
                                    <telerik:GridTemplateColumn HeaderText="Type" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="type"
                                        DataField="typedescr">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "typedescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="IncentiveTypeList" runat="server" Skin="Office2007"
                                                DropDownHeight="150px" DataSource='<%# IncentiveTypeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(IncentiveTypeListDS,DataBinder.Eval(Container.DataItem, "typedescr").ToString())%>'
                                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains" CausesValidation="false">
                                            </telerik:RadComboBox>
                                            <asp:RequiredFieldValidator ID="IncentiveTypeListReqVal" runat="server" ControlToValidate="IncentiveTypeList" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="qty" HeaderText="Qty">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Width="100px">
                                            </telerik:RadTextBox>
                                            <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                                EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Rate" UniqueName="rate">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "rate", "{0:#,0.##}")  %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px"></telerik:RadTextBox>
                                            <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                            <asp:CompareValidator ID="RaeteTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="TripOption" HeaderText="TripOption">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "tripoption")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="tripoption" runat="server"
                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# TripOptionListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionListDS,DataBinder.Eval(Container.DataItem, "tripoption").ToString())%>'
                                                DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="ManpowerOption" HeaderText="ManpowerOption">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "manpoweroption")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="manpoweroption" runat="server"
                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# ManpowerOptionListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripOptionListDS,DataBinder.Eval(Container.DataItem, "manpoweroption").ToString())%>'
                                                DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn UniqueName="RouteOption" HeaderText="RouteOption">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "routeoption")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="routeoption" runat="server"
                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# RouteOptionListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RouteOptionListDS,DataBinder.Eval(Container.DataItem, "routeoption").ToString())%>'
                                                DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                                        ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                        ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                        ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                                        HeaderText="EditUser" ReadOnly="true" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" SortExpression="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" Height="89%" ID="IncludeAndExcludeRadPageView">
                <br />
                <asp:Button ID="UpdateIncAndExcBtn" runat="server" Text="Update" OnClick="UpdateIncAndExcBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" class="white" />
                <br />
                <table border="0" cellpadding="0" cellspacing="0" width="1000px">
                    <tbody>
                        <tr>
                            <td style="width: 400px" valign="top">
                                <asp:Label ID="IncludeAccount" runat="server">Include Account</asp:Label><br />
                                <telerik:RadListBox runat="server" ID="IncludeAccountList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIncludeAccountList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" ButtonSettings-ShowTransferAll="false"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                    DataTextField="Descr" DataValueField="item" OnTransferred="IncludeAccountList_Transferred">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedIncludeAccountList" Height="120px" Width="200px" ButtonSettings-ShowTransferAll="false"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" Skin="WebBlue"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                            &nbsp;
                           
                                <td style="width: 400px" valign="top">
                                    <asp:Label ID="ExcludeAccount" runat="server">Exclude Account</asp:Label><br />
                                    <telerik:RadListBox runat="server" ID="ExcludeAccountList" Height="120px" Width="200px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedExcludeAccountList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" ButtonSettings-ShowTransferAll="false"
                                        Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                        DataTextField="Descr" DataValueField="item">
                                    </telerik:RadListBox>
                                    <telerik:RadListBox runat="server" ID="SelectedExcludeAccountList" Height="120px" Width="200px" ButtonSettings-ShowTransferAll="false"
                                        ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" Skin="WebBlue"
                                        AllowDelete="false">
                                    </telerik:RadListBox>
                        </tr>
                    </tbody>
                </table>
                <br />
                <table border="0" cellpadding="0" cellspacing="0" width="1000px">
                    <tbody>
                        <tr>
                            <td style="width: 400px" valign="top">
                                <asp:Label ID="IncludeBillSizeType" runat="server">Include BillSizeType</asp:Label><br />
                                <telerik:RadListBox runat="server" ID="IncludeBillSizeTypeList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedIncludeBillSizeTypeList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" ButtonSettings-ShowTransferAll="false"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                    DataTextField="Descr" DataValueField="item">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedIncludeBillSizeTypeList" Height="120px" Width="200px" ButtonSettings-ShowTransferAll="false"
                                    ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false" Skin="WebBlue"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                            &nbsp;

                            <td style="width: 400px" valign="top">
                                <asp:Label ID="ExcludeBillSizeType" runat="server">Exclude BillSizeType</asp:Label><br />
                                <telerik:RadListBox runat="server" ID="ExcludeBillSizeTypeList" Height="120px" Width="200px"
                                    ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedExcludeBillSizeTypeList"
                                    TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple" ButtonSettings-ShowTransferAll="false"
                                    Skin="WebBlue" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="false"
                                    ButtonSettings-AreaHeight="30px"
                                    DataTextField="Descr" DataValueField="item">
                                </telerik:RadListBox>
                                <telerik:RadListBox runat="server" ID="SelectedExcludeBillSizeTypeList" Height="120px" Width="200px" ButtonSettings-ShowTransferAll="false"
                                    ButtonSettings-AreaWidth="35px" ButtonSettings-AreaHeight="30px" SelectionMode="Multiple" AllowReorder="false" Skin="WebBlue"
                                    AllowDelete="false">
                                </telerik:RadListBox>
                            </td>
                        </tr>
                    </tbody>
                </table>
                 <br /> <br /> <br />
                 <table style="width: 100%">
                    <tr>
                        <td class="style1">
                            &nbsp;<asp:Label ID="Label5" Text="Release Notes:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                            <br />
                            &nbsp;<asp:Label ID="Label6" Text="1. If no specific value is selected for a particular Include filter, then all available values will automatically qualify. " Font-Size="15px" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                
            </telerik:RadPageView>
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
        </telerik:RadMultiPage>
    </form>
</body>
</html>
