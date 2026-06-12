<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InboundSortingExplode.aspx.cs" Inherits="iWMS.Web.Inbound.InboundSorting.InboundSortingExplode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="TitleName"></title>
    <link rel="icon" sizes="190x130" href="../Image/URLLogo.png" />
    <link rel="stylesheet" href="../../css/style.css" type="text/css" />
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <telerik:RadCodeBlock runat="server">
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

            function GoPreviousPage() {

                window.parent.document.location.href = "InboundSortingSortGR.aspx?RCId=" + <%= "'" + ViewState["RECEIPTID"].ToString() + "'" %>;
            }

      
        </script>
    </telerik:RadCodeBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="True" CausesValidation="False" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="ExplodeCandidatesTab" Text="Explode Candidates" Value="0" readonly="readonly" runat="server" Selected="True">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
         &nbsp;<asp:Button ID="BackBtn" runat="server" Text="Back" CssClass="LongLabelWhite"
            OnClick="BackBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="100%" ID="HeaderRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Label Text="TUNO" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="TUNOTxt" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox runat="server" ID="TUNOTxt" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="Quantity" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="QuantityTxt" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox runat="server" ID="QuantityTxt" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="TU Type" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="TUTypeDDL" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadComboBox ID="TUTypeDDL" OnLoad="TUTypeDDL_Load" runat="server" Skin="Sunset" BackColor="#ded7c6" DropDownAutoWidth="Enabled" OnSelectedIndexChanged="TUTypeDDL_SelectedIndexChanged" AutoPostBack="true"
                                RenderMode="Lightweight" Width="155" Filter="Contains" AllowCustomText="false" HighlightTemplatedItems="true" DataTextField="Descr" DataValueField="Item">
                            </telerik:RadComboBox>
                        </td>
                        <td>
                            <asp:Label Text="TU Length" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="TULengthTxt" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox runat="server" ID="TULengthTxt" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="TU Width" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="TUWidthTxt" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox runat="server" ID="TUWidthTxt" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:Label Text="TU Height" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ControlToValidate="TUHeightTxt" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:RequiredFieldValidator>
                            <telerik:RadTextBox runat="server" ID="TUHeightTxt" Skin="Sunset" BackColor="#ded7c6" Width="155"></telerik:RadTextBox>
                        </td>
                        <td>
                            <br />
                            <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="white"
                                OnClick="SaveBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:HiddenField ID="Hidden1" runat="server" />
                <asp:HiddenField ID="Hidden2" runat="server" />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="true" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Visible="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnColumnCreated="ResultDG_ColumnCreated">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="CommitBtn" runat="server" Text="Commit" CssClass="white"
                                OnClick="CommitBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                            <asp:Button ID="BypassScanBtn" runat="server" Text="Bypass Scan" CssClass="white"
                                OnClick="BypassScanBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <iWMS:ModalPopup ID="ModalPopup" runat="server" />
                <br />
                <telerik:RadGrid ID="SecondResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowFilteringByColumn="false" EnableLinqExpressions="false" Visible="true" OnItemDataBound="SecondResultDG_ItemDataBound"
                    Skin="Metro" OnNeedDataSource="SecondResultDG_NeedDataSource" OnColumnCreated="SecondResultDG_ColumnCreated">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                        <Resizing AllowResizeToFit="true" AllowColumnResize="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                    <ItemStyle Wrap="true"></ItemStyle>
                    <HeaderStyle Wrap="true" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" DataKeyNames="TUNO"
                        Name="ParentGrid">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TUNO" HeaderText="TUNO" SortExpression="TUNO" DataField="TUNO">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TUNO")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="SKU" HeaderText="SKU" UniqueName="SKU" SortExpression="SKU"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn UniqueName="Quantity" HeaderText="Quantity" SortExpression="Quantity" DataField="Quantity">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TuType" HeaderText="TU Type" SortExpression="TuType" DataField="TuType">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TuType")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TuLength" HeaderText="TU Length" SortExpression="TuLength" DataField="TuLength">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TuLength")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TuWidth" HeaderText="TU Width" SortExpression="TuWidth" DataField="TuWidth">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TuWidth")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn UniqueName="TuHeight" HeaderText="TU Height" SortExpression="TuHeight" DataField="TuHeight">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "TuHeight")%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn Display="false" DataField="Scanned" UniqueName="Scanned" />
                            <telerik:GridBoundColumn Display="false" DataField="TUNO" UniqueName="BatchTUNO" />
                            <telerik:GridBoundColumn Display="false" DataField="Quantity" UniqueName="BatchQuantity" />
                            <telerik:GridBoundColumn Display="false" DataField="TuType" UniqueName="BatchTuType" />
                            <telerik:GridBoundColumn Display="false" DataField="TuLength" UniqueName="BatchTuLength" />
                            <telerik:GridBoundColumn Display="false" DataField="TuWidth" UniqueName="BatchTuWidth" />
                            <telerik:GridBoundColumn Display="false" DataField="TuHeight" UniqueName="BatchTuHeight" />
                            <telerik:GridBoundColumn Display="false" DataField="NominateVLM" UniqueName="BatchNominateVLM" />
                            <telerik:GridBoundColumn Display="false" DataField="SKUID" UniqueName="SKUID" />
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
