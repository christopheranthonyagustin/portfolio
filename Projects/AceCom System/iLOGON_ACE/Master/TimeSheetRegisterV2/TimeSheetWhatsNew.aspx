<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeSheetWhatsNew.aspx.cs" Inherits="iWMS.Web.Master.TimeSheetRegisterV2.TimeSheetWhatsNew" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>WhatsNew</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Pragma" content="no-cache" />
    <style>
        .StatusBackground {
            background-color: black;
            opacity: 0.001;
        }

        .popupHeader {
            padding: 5px 0px 0px 0px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background: #859DD4;
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
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellpadding="2" cellspacing="2" runat="server">
            <tr>
                <td>
                    <asp:Button ID="BuildBtn" class="white" runat="server" OnClick="BuildBtn_Click"
                        Text="Build" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
                <td>
                    <asp:Button ID="PDFBtn" class="blue" runat="server" OnClick="PDFBtn_Click"
                        Text="PDF" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <%--Status popup area start--%>
        <asp:Button runat="server" ID="btnTargetControl" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeFunctionPopup" runat="server" PopupControlID="pnlFunctionBox"
            TargetControlID="btnTargetControl" CancelControlID="btnFunctionCancel" BackgroundCssClass="StatusBackground" Y="60">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlFunctionBox" BackColor="LAVENDER" Width="225px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 225px;">
                <asp:Label ID="Label2" Text="Close Job" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnFunctionCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 160px; width: 225px;">
                <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                    <tr>
                        <td>WhatsNew
                            <br />
                            <telerik:RadTextBox ID="WhatsNewtxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>NewVersionNo
                            <asp:Label ID="lbltxtReq" runat="server" Text="*"></asp:Label>
                            <br />
                            <telerik:RadTextBox ID="NewVersionNotxt" runat="server" Width="155px">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="PopupBuildBtn" CssClass="white" runat="server" OnClick="PopupBuildBtn_Click" Text="Build"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <%--Status popup area end--%>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" AllowMultiRowSelection="true"
            Skin="Metro" OnDetailTableDataBind="ResultDG_DetailTableDataBind" OnEditCommand="ResultDG_EditCommand" OnUpdateCommand="ResultDG_UpdateCommand">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="VersionNo" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                EditMode="InPlace" Width="100%" AutoGenerateColumns="false">
                <DetailTables>
                    <telerik:GridTableView Name="ChildGrid" SkinID="Telerik" AutoGenerateColumns="false" EditMode="InPlace" DataKeyNames="id">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                            </telerik:GridClientSelectColumn>
                            <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                                        AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="id" HeaderText="id" AllowFiltering="true"
                                DataField="id">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "id")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="WhatsNewType" UniqueName="WhatsNewType"
                                DataField="WhatsNewType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "WhatsNewType")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="WhatsNewTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                        DataSource='<%# WhatsNewTypeDDLDS%>'  SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WhatsNewTypeDDLDS,DataBinder.Eval(Container.DataItem, "WhatsNewType").ToString()) %>'
                                         Skin="WebBlue" Width="150px" DropDownWidth="150px">
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="WhatsNewModule" UniqueName="WhatsNewModule"
                                DataField="WhatsNewModule">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "WhatsNewModule")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="WhatsNewModuleCombo" runat="server" DataTextField="descr" DataValueField="item"
                                        DataSource='<%# WhatsNewModuleComboDS%>' AutoPostBack="true" Skin="WebBlue" Width="150px"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(WhatsNewModuleComboDS,DataBinder.Eval(Container.DataItem, "WhatsNewModule").ToString()) %>'
                                        DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains">
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="WhatsNewDescr" UniqueName="WhatsNewDescr"
                                DataField="WhatsNewDescr">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "WhatsNewDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="WhatsNewDescrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "WhatsNewDescr") %>'
                                        TextMode="MultiLine" Enabled="true">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="trandate" HeaderText="Date" AllowFiltering="true"
                                DataField="trandate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "trandate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PERSONNEL" HeaderText="PERSONNEL" AllowFiltering="true"
                                DataField="PERSONNEL">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "PERSONNEL")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="AddUser" HeaderText="AddUser" AllowFiltering="true"
                                DataField="AddUser">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="ADDDATE" HeaderText="ADDDATE" AllowFiltering="true"
                                DataField="ADDDATE">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "ADDDATE", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridBoundColumn DataField="VersionNo" SortExpression="VersionNo" HeaderText="VersionNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Entries" SortExpression="Entries" HeaderText="Entries">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

    </form>
</body>
</html>
