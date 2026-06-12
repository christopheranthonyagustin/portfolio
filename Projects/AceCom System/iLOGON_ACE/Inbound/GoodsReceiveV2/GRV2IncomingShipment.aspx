<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GRV2IncomingShipment.aspx.cs" Inherits="iWMS.Web.Inbound.GoodsReceiveV2.GRV2IncomingShipment" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head runat="server">
    <title>IncomingShipment</title>
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
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="IncomingShipment" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <br />
        &nbsp;
        <asp:Button ID="AcceptBtn" CssClass="blue" runat="server" OnClick="AcceptBtn_Click" Text="Accept"
            OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
        <br />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true" AllowPaging="true" Skin="Metro">
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
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="checkbox" AllowFiltering="false" ItemStyle-Width="30px">
                        <HeaderTemplate>
                            <label id="completelbl">
                            </label>
                            &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" Exportable="false" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ShowRCImage" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Edit Order Register"
                                BorderWidth="0" BackColor="Transparent" OnClick="ShowRCImage_Click" CausesValidation="False"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sitecode" SortExpression="sitecode" HeaderText="Site">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReceiptNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ETADate" SortExpression="ETADate" HeaderText="ETA Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Uploaded Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustomerReference">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="acid" SortExpression="acid" UniqueName="acid" Display="false" />
                    <telerik:GridBoundColumn DataField="statuscolor" SortExpression="statuscolor" UniqueName="statuscolor" Display="false" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px" 
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>
</body>
</html>
