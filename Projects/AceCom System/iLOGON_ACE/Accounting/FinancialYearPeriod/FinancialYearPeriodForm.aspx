<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancialYearPeriodForm.aspx.cs" Inherits="iWMS.Web.Accounting.FinancialYearPeriod.FinancialYearPeriodForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FinancialYearPeriodForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">

                <br />
                <asp:Button ID="UpdateDtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                    OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="NONE" EditMode="InPlace">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="FinYearPeriodEdit"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton runat="server" Visible="True" ID="FinYearPeriodUpdate" ImageUrl="../../image/floppy.gif"
                                        Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                        BorderWidth="0"></asp:ImageButton>
                                    <asp:ImageButton runat="server" Visible="True" ID="FinYearPeriodCancel" ImageUrl="../../image/arrow6.gif"
                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                                
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="code" HeaderText="Code">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "code")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox runat="server" ID="CodeTxt" Skin="Sunset" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="CodeTxtReqVal" runat="server" ControlToValidate="CodeTxt" ErrorMessage="*" />
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="FrDate" UniqueName="FrDate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "frdate","{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="FrdateTxt" DataField="frdate" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ToDate" UniqueName="ToDate">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "todate", "{0:dd/MMM/yyyy}")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDatePicker ID="TodateTxt" DataField="todate" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy"
                                        DateInput-DisplayDateFormat="dd/MMM/yyyy" DateInput-Display="true" Skin="Sunset">
                                    </telerik:RadDatePicker>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn SortExpression="status" UniqueName="status" HeaderText="Status">
                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "statusdescr") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadDropDownList ID="statusDDL" runat="server" Skin="Office2007" DataSource='<%# statusDS %>' DataTextField="descr" DataValueField="item"
                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'>
                                    </telerik:RadDropDownList>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>

    </form>
</body>
</html>
