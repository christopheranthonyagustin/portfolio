<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DYSTARInterface.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.DYSTARInterface" %>

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
            Skin="Office2007" Height="460px">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
                Resizing-AllowColumnResize="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridBoundColumn HeaderText="Outbound Delivery No" DataField="OutboundDeliveryNo"
                        SortExpression="OutboundDeliveryNo" UniqueName="OutboundDeliveryNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Outbound Delivery Date" DataField="OutboundDeliveryDate"
                        DataFormatString="{0:dd/MMM/yyyy}" SortExpression="OutboundDeliveryDate" UniqueName="OutboundDeliveryDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Customer Code" DataField="VendorCode"
                        SortExpression="VendorCode" UniqueName="VendorCode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Customer Name" DataField="VendorName"
                        SortExpression="VendorName" UniqueName="VendorName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Files received" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="lines" DataField="lines"
                        SortExpression="lines" UniqueName="lines" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="INCOTerms" DataField="INCOTerms"
                        SortExpression="INCOTerms" UniqueName="INCOTerms" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="route" DataField="route"
                        SortExpression="route" UniqueName="route" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="GrossWeight" DataField="GrossWeight"
                        SortExpression="GrossWeight" UniqueName="GrossWeight" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Volume" DataField="Volume"
                        SortExpression="Volume" UniqueName="Volume" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Address" DataField="Address"
                        SortExpression="Address" UniqueName="Address" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="RouteDescription" DataField="RouteDescription"
                        SortExpression="RouteDescription" UniqueName="RouteDescription" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShippingConditionDescription" DataField="ShippingConditionDescription"
                        SortExpression="ShippingConditionDescription" UniqueName="ShippingConditionDescription" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ForwardingAgent" DataField="ForwardingAgent"
                        SortExpression="ForwardingAgent" UniqueName="ForwardingAgent" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="INCOTerms2" DataField="INCOTerms2"
                        SortExpression="INCOTerms2" UniqueName="INCOTerms2" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AgentCode" DataField="AgentCode"
                        SortExpression="AgentCode" UniqueName="AgentCode" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AgentName" DataField="AgentName"
                        SortExpression="AgentName" UniqueName="AgentName" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn HeaderText="AgentAddr1" DataField="AgentAddr1"
                        SortExpression="AgentAddr1" UniqueName="AgentAddr1" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
