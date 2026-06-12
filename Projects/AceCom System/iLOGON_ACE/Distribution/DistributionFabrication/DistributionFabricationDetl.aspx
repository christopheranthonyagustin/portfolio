<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionFabricationDetl.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionFabrication.DistributionFabricationDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                <br />
                <table style="width: 100%; height: 30px">
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                    </tr>
                </table>
                <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Metro" RenderMode="Lightweight"
                    OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" OnUpdateCommand="ResultDG_UpdateCommand" OnItemCommand="ResultDG_ItemCommand"
                    ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" OnEditCommand="ResultDG_EditCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="FabricationStageId" EditMode="InPlace" CommandItemDisplay="Top" TableLayout="Fixed">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="70px" ItemStyle-Width="70px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif"
                                        Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <a id="DeleteImgBtn" href='<%#DataBinder.Eval(Container,"DataItem.FabricationStageId")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="DeleteImgBtn_ServerClick" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                            title="Delete" runat="server" visible="true" /></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    &nbsp;
                                    <asp:ImageButton runat="server" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="SeqNo" HeaderText="SeqNo" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "SeqNo")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="SeqNoTxtBox" Text='<%# Eval("SeqNo") %>' Skin="WebBlue" Width="155px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="FabricationStageCode" HeaderText="Code" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "FabricationStageCode")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="FabricationStageCodeTxtBox" Text='<%# Eval("FabricationStageCode") %>' Skin="Sunset" BackColor="#ded7c6" Width="155px">
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="FabricationStageCodeTxtBox" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="FabricationStageDescr" HeaderText="Description" HeaderStyle-Width="190px" ItemStyle-Width="190px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "FabricationStageDescr")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="FabricationStageDescrTxtBox" Text='<%# Eval("FabricationStageDescr") %>' Skin="WebBlue" Width="155px">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="RemarksTxtBox" Text='<%# Eval("Remarks") %>' Skin="WebBlue" TextMode="MultiLine" Rows="3" Width="220px"
                                        Resize="Both">
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="FabricationStageStatusDescr" SortExpression="FabricationStageStatusDescr" HeaderText="Status" UniqueName="FabricationStageStatusDescr"
                                ReadOnly="true" HeaderStyle-Width="120px" ItemStyle-Width="120px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" SortExpression="AddDdate" HeaderText="AddDate" UniqueName="AddDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" SortExpression="AddUser" HeaderText="AddUser" UniqueName="AddUser"
                                ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" SortExpression="EditDate" HeaderText="EditDate" UniqueName="EditDate"
                                ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="true" HeaderStyle-Width="150px" ItemStyle-Width="150px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" SortExpression="EditUser" HeaderText="EditUser" UniqueName="EditUser"
                                ItemStyle-Wrap="false" ReadOnly="true" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FabricationStageStatusColorCode" Display="false"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
        </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
