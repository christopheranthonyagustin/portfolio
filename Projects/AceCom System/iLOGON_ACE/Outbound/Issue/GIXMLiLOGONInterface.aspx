<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GIXMLiLOGONInterface.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.GIXML11iLOGONInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DYSTARInterfaceUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Interface" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label runat="server" ID="TitleLbl" CssClass="BoldText" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label runat="server" ID="FilePathLbl" Text="Path" />
                    <telerik:RadTextBox runat="server" ID="FilePathTxt" Width="250px" Skin="Office2007"
                        ReadOnly="true">
                    </telerik:RadTextBox>
                    &nbsp;
                    <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                        DropDownWidth="150px" Skin="WebBlue" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="StatusDDL_Changed">
                    </telerik:RadDropDownList>
                    &nbsp;
                    <asp:Button ID="UploadBtn" runat="server" Text="Upload" OnClick="UploadBtn_Click" OnClientClick="disableBtn(this.id,false)"
                        ToolTip="Click to Upload Selected Files" UseSubmitBehavior="false" CssClass="white" />&nbsp;
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowMultiRowSelection="true"
            Skin="Office2007">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" ScrollHeight="650" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Width="200%">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridBoundColumn HeaderText="AccountCode" DataField="AccountCode"
                        SortExpression="AccountCode" UniqueName="AccountCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SaleOrderNo" DataField="SalesOrderNo"
                        SortExpression="SalesOrderNo" UniqueName="SalesOrderNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SalesOrderDate" DataField="SalesOrderDate" DataFormatString="{0:dd/MMM/yyyy}"
                        SortExpression="SalesOrderDate" UniqueName="SalesOrderDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OrderType" DataField="OrderType"
                        SortExpression="OrderType" UniqueName="OrderType" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OrderPriority" DataField="OrderPriority"
                        SortExpression="OrderPriority" UniqueName="OrderPriority" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PurchaseOrderNo" DataField="PurchaseOrderNo"
                        SortExpression="PurchaseOrderNo" UniqueName="PurchaseOrderNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExpectedDate" DataField="ExpectedDate" DataFormatString="{0:dd/MMM/yyyy}"
                        SortExpression="ExpectedDate" UniqueName="ExpectedDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SiteCode" DataField="SiteCode"
                        SortExpression="SiteCode" UniqueName="SiteCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="OrderBy" DataField="OrderBy"
                        SortExpression="OrderBy" UniqueName="OrderBy" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToCode" DataField="ShipToCode"
                        SortExpression="ShipToCode" UniqueName="ShipToCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToName" DataField="ShipToName"
                        SortExpression="ShipToName" UniqueName="ShipToName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToAddress1" DataField="ShipToAddress1"
                        SortExpression="ShipToAddress1" UniqueName="ShipToAddress1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToAddress2" DataField="ShipToAddress2"
                        SortExpression="ShipToAddress2" UniqueName="ShipToAddress2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToAddress3" DataField="ShipToAddress3"
                        SortExpression="ShipToAddress3" UniqueName="ShipToAddress3" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToAddress4" DataField="ShipToAddress4"
                        SortExpression="ShipToAddress4" UniqueName="ShipToAddress4" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToCountryCode" DataField="ShipToCountryCode"
                        SortExpression="ShipToCountryCode" UniqueName="ShipToCountryCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShipToPostalCode" DataField="ShipToPostalCode"
                        SortExpression="ShipToPostalCode" UniqueName="ShipToPostalCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="RouteCode" DataField="RouteCode"
                        SortExpression="RouteCode" UniqueName="RouteCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SoldToCode" DataField="SoldToCode"
                        SortExpression="SoldToCode" UniqueName="SoldToCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SoldToName" DataField="SoldToName"
                        SortExpression="SoldToName" UniqueName="SoldToName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SoldToAddress" DataField="SoldToAddress"
                        SortExpression="SoldToAddress" UniqueName="SoldToAddress" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks1" DataField="Remarks1" ItemStyle-Wrap="true"
                        SortExpression="Remarks1" UniqueName="Remarks1" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Remarks2" DataField="Remarks2" ItemStyle-Wrap="true"
                        SortExpression="Remarks2" UniqueName="Remarks2" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filename" DataField="filename" ItemStyle-Wrap="true"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Files received" DataField="filereceived" DataFormatString="{0:dd/MMM/yyyy hh:mm}"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="upisid" DataField="upisid"
                       UniqueName="upisid" Display="false"/>
                        <telerik:GridBoundColumn HeaderText="processid" DataField="processid"
                       UniqueName="processid" Display="false"/>
                            <telerik:GridBoundColumn HeaderText="uniqueId" DataField="uniqueId"
                       UniqueName="uniqueId" Display="false"/>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
