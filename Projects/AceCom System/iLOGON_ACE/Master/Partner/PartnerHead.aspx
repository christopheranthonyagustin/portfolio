<%@ Page Language="c#" CodeBehind="PartnerHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Partner.PartnerHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>PartnerHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <!-- added -->
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <table>
            <tr>
                <td>
                    <br />
                    <asp:Button ID="RefreshBtn" CssClass="White" runat="server" OnClick="RefreshBtn_Click" Text="Refresh"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="EditBtn" CssClass="White" runat="server" OnClick="EditBtn_Click" Text="Edit"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="DeleteBtn" CssClass="White" runat="server" OnClick="DeleteBtn_Click" Text="Delete"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                         <asp:Button ID="ActiveBtn" runat="server" CssClass="LongLabelWhite" Text="Set As Active"
                             OnClick="ActiveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                         <asp:Button ID="InActiveBtn" runat="server" CssClass="LongLabelWhite" Text="Set As InActive"
                             OnClick="InActiveBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                    &nbsp;
                </td>

                <td align="right">
                    <br />
                    <asp:Button ID="SwapBtn" CssClass="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
                </td>
            </tr>
        </table>
        <br />
        <div id="div1" style="height: 92%">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />&nbsp;
                               <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                    onserverclick="Partner_Delete" runat="server">
                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Partner"
                                        runat="server"></a>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                    HeaderStyle-ForeColor="Black">
                    <HeaderTemplate>
                        S/No
                    </HeaderTemplate>
                    <HeaderStyle Wrap="false" HorizontalAlign="Center"/>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" AllowFiltering="false" HeaderText="Account">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="code" SortExpression="Code" HeaderText="Code">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="code2" SortExpression="Code2" HeaderText="Code2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                        </telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn DataField="entname" SortExpression="entname" HeaderText="Entity">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="partnertype" SortExpression="partnertype" HeaderText="Type">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="HomePortDescr" SortExpression="HomePortDescr" HeaderText="HomePort">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ManagedByCode" SortExpression="ManagedByCode" HeaderText="ManagedBy">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TaxNo" SortExpression="TaxNo" HeaderText="TaxNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Addr" SortExpression="Addr" HeaderText="Address">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr1" SortExpression="addr1" HeaderText="Address#1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr2" SortExpression="addr2" HeaderText="Address#2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr3" SortExpression="addr3" HeaderText="Address#3">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="addr4" SortExpression="addr4" HeaderText="Address#4">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zipcode" SortExpression="zipcode" HeaderText="Zip Code">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="citycode" SortExpression="citycode" HeaderText="City">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="countrycode" SortExpression="countrycode" HeaderText="Country">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="biztypedescr" SortExpression="biztypedescr" HeaderText="BusinessType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="smancodedescr" SortExpression="smancodedescr" HeaderText="SalesMan">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="paytermsdescr" SortExpression="paytermsdescr" HeaderText="PaymentTerms">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="taxprofiledescr" SortExpression="taxprofiledescr" HeaderText="TaxProfileCode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolour" Display="false"></telerik:GridBoundColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
