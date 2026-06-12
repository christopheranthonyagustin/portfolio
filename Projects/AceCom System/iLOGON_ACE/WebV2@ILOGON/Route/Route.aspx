<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Route.aspx.cs" Inherits="iWMS.Web.WebV2_ILOGON.Route.Route" %>

<%@ Register TagPrefix="iWMS" TagName="WebV2Menu" Src="~/WebV2@ILOGON/Control/Menu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Route</title>
    <link rel="stylesheet" href="../Style/WebV2.css" />
    <%--For DDL and Textbox style--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script type="text/javascript" src="../Script/WebV2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <iWMS:WebV2Menu ID="WebV2Menu" runat="server"></iWMS:WebV2Menu>

        <div class="RouteContainer">
            <div>
                <h3 style="font-weight: bold; font-family: Arial; padding-top: 10px; font-size: 15px; color: #636b75;">Routes</h3>
                <hr style="height: 1px; border: none; color: #d1d4da; background-color: #d1d4da;" />
            </div>
            <asp:Panel runat="server" ID="TotalRoutePanel"></asp:Panel>
            <asp:Panel runat="server" ID="AddNewRoutePanel"></asp:Panel>
        </div>
        <div class="RouteDetlContainer">
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label Text="Route" runat="server" Font-Size="16.5px" Font-Names="Arial"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ID="RouteReqVal" ControlToValidate="RouteTxtBox" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="RouteTxtBox" AutoPostBack="true" CausesValidation="false" OnTextChanged="RouteTxtBox_TextChanged" runat="server" CssClass="form-control input-box" Width="177px" Height="32px" Style="border-radius: 5px; font-size: 15px; margin-top: 3px;"></asp:TextBox>
                        </td>
                        <td style="padding-left: 100px;">
                            <asp:Label Text="Description" runat="server" Font-Size="16.5px" Font-Names="Arial"></asp:Label>
                            <asp:RequiredFieldValidator runat="server" ID="DescrReqVal" ControlToValidate="DescrTxtBox" ValidationGroup="Success" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="DescrTxtBox" runat="server" CssClass="form-control input-box" Width="300px" Height="32px" Style="border-radius: 5px; font-size: 15px; margin-top: 3px;"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="float: right; margin-right: 15%;">
                    <tr>
                        <td>
                            <asp:LinkButton ID="AddRouteDetlBtn" OnClientClick="DisableBtn(this.id, false)" OnClick="AddRouteDetlBtn_Click" AutoPostBack="true" CssClass="btn" BackColor="#0f4d92" ForeColor="White" Width="90px" CausesValidation="false" runat="server" Font-Size="13px">&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Add</span>&nbsp;&nbsp;</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" RenderMode="Lightweight"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" Width="85%" Font-Size="14px"
                    AllowPaging="false" Skin="Office2010Blue" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true" CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle Wrap="true" CssClass="DGItem" Height="45px"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="Type" UniqueName="Type" SortExpression="Type" AllowFiltering="true" HeaderStyle-Width="300px" ItemStyle-Width="300px">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="TypeTxtBox" runat="server" Width="400px" Height="30px" Skin="Bootstrap"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "Type") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="FrPostalCode" UniqueName="FrPostalCode" SortExpression="FrPostalCode" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="FrPostalCodeTxtBox" AutoPostBack="true" CausesValidation="false" runat="server" Width="100" Height="30px" Skin="Bootstrap" OnTextChanged="FrPostalCodeTxtBox_TextChanged" Style="text-align: center;"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "FrPostalCode") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="ToPostalCode" UniqueName="ToPostalCode" SortExpression="ToPostalCode" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="ToPostalCodeTxtBox" runat="server" Width="100" AutoPostBack="true" CausesValidation="false" Height="30px" Skin="Bootstrap" OnTextChanged="ToPostalCodeTxtBox_TextChanged" Style="text-align: center;"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="RouteDeleteIcon" AllowFiltering="false" HeaderStyle-Width="20px" ItemStyle-Width="20px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="DeleteRouteDetlImg" runat="server" OnClick="DeleteRouteDetlImg_Click"
                                        AlternateText="Delete" ImageUrl="../Image/red_bin.png" OnClientClick="return confirm('Are you sure you want delete?');"
                                        Height="26px" Width="25px" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="RouteDetlId" Display="false">
                                <ItemTemplate>
                                    <telerik:RadTextBox ID="RouteDetlTxtBox" runat="server" Skin="WebBlue"
                                        Text='<%# DataBinder.Eval(Container.DataItem, "RouteDetlId") %>'>
                                    </telerik:RadTextBox>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <br />
                <div style="text-align:center; float: right; margin-right: 15%;">
                    <asp:LinkButton ID="DeleteRouteBtn" OnClientClick="DisableBtn(this.id, false);return confirm('Are you sure you want delete Route?');" OnClick="DeleteRouteBtn_Click" AutoPostBack="true" CssClass="btn" BackColor="Red" ForeColor="White" CausesValidation="false" runat="server" Font-Size="13px">&nbsp;&nbsp;<span style="font-family: Arial; font-size: 13px;">Delete Route</span>&nbsp;&nbsp;</asp:LinkButton> &nbsp;&nbsp;
                    <asp:LinkButton ID="SaveRouteDetlChangesBtn" CssClass="btn" OnClientClick="Validate(this.id);" OnClick="SaveRouteDetlChangesBtn_Click" ValidationGroup="Success" AutoPostBack="true" runat="server" Font-Size="13px" BackColor="#0f4d92" ForeColor="White"><span style="font-family: Arial; font-size: 13px;">Save Changes</span></asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
