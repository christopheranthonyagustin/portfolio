<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamIncentiveForm.aspx.cs" Inherits="iWMS.Web.Master.Personnel.TeamIncentiveForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TeamIncentiveForm</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server" defaultbutton="UpdateBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab Text="Line" Value="100" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <asp:Label ID="pagetitleLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="MainRadPageView" Height="700px">
                &nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" class="white" />
                <br />
                <br />
                <table border="0" cellspacing="2" cellpadding="2" width="100%">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnUpdateCommand="ResultDG_Update"
                    AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnEditCommand="ResultDG_Edit"
                    OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id" EditMode="InPlace" CommandItemDisplay="Top">
                        <CommandItemSettings ShowRefreshButton="false" />
                        <Columns>
                           <telerik:GridTemplateColumn Reorderable="false" UniqueName="Detailicon" AllowFiltering="false"
                                HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="JBTeamDetlEdit"
                                        ImageUrl="..\..\image\pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                    <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="Delete"
                                        runat="server">
                                        <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Team Incentive"
                                            runat="server"></a>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="JBTeamDetlUpdate" ImageUrl="..\..\image\floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="JBTeamDetlCancel" ImageUrl="..\..\image\arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>                                  
                                </EditItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Personnel" HeaderStyle-Width="130px" ItemStyle-Width="130px" UniqueName="Personnel"
                                DataField="pername">
                                <ItemTemplate>
                                     <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="perList" runat="server" Skin="Office2007" 
                                        DropDownHeight="150px" DataSource='<%# personnelListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(personnelListDS,DataBinder.Eval(Container.DataItem, "pername").ToString())%>'
                                        DataTextField="name" DataValueField="id" RenderMode="Lightweight" Filter="Contains" CausesValidation="false">
                                    </telerik:RadComboBox> 
                                    <asp:RequiredFieldValidator ID="perListReqVal" runat="server" ControlToValidate="perList" ErrorMessage="*" />                                   
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Amount" DataField="amount" AllowFiltering="true" ItemStyle-CssClass="break-word"
                                ColumnGroupName="amount" SortExpression="amount" UniqueName="amount" Reorderable="true"
                                HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "amount")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="amountTxt" Text='<%# DataBinder.Eval(Container.DataItem, "amount") %>' Skin="Office2007"
                                        TextMode="MultiLine">
                                    </telerik:RadTextBox> 
                                    <asp:RequiredFieldValidator ID="amountTxtReqVal" runat="server" ControlToValidate="amountTxt" ErrorMessage="*" />                                   
                                    <asp:CompareValidator ID="CompareValidator" runat="server" CssClass="errorLabelBig"  ControlToValidate="amountTxt"
                                        ErrorMessage="#" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>                                   
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" ReadOnly="True">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="perid" SortExpression="perid" HeaderText="perid" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="70%" ID="LineRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
