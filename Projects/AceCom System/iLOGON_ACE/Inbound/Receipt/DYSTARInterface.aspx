<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DYSTARInterface.aspx.cs" Inherits="iWMS.Web.Inbound.Receipt.DYSTARInterface" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DYSTARInterfaceUpload</title>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <base target="_self" />
</head>
<body>
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" AllowMultiRowSelection="true" CellPadding="2"
            UseAccessibleHeader="True" Skin="Metro" Height="430px" ClientSettings-AllowColumnsReorder="true">
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
                <Scrolling AllowScroll="true" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" />
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridBoundColumn HeaderText="Inbound Delivery No" DataField="InboundDeliveryNo"
                        SortExpression="InboundDeliveryNo" UniqueName="InboundDeliveryNo" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Inbound Delivery Date" DataField="InboundDeliveryDate"
                        DataFormatString="{0:dd/MMM/yyyy}" SortExpression="InboundDeliveryDate" UniqueName="InboundDeliveryDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Expected Delivery Date" DataField="DeliveryDate"
                        SortExpression="DeliveryDate" UniqueName="DeliveryDate" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Bill of Lading No" DataField="BillofLading"
                        SortExpression="BillofLading" UniqueName="BillofLading" Reorderable="true" Display="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Vendor Code" DataField="VendorCode"
                        SortExpression="VendorCode" UniqueName="VendorCode" Reorderable="true">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="Vendor Name" DataField="VendorName"
                        SortExpression="VendorName" UniqueName="VendorName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filename" DataField="filename"
                        SortExpression="filename" UniqueName="filename" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Files received" DataField="filereceived"
                        SortExpression="filereceived" UniqueName="filereceived" Reorderable="true" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="filepath" DataField="filepath"
                        SortExpression="filepath" UniqueName="filepath" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="lines" DataField="lines"
                        SortExpression="lines" UniqueName="lines" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Shipmentline1" DataField="Shipmentline1"
                        SortExpression="Shipmentline1" UniqueName="Shipmentline1" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Shipmentline2" DataField="Shipmentline2"
                        SortExpression="Shipmentline2" UniqueName="Shipmentline2" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="INCOTerms" DataField="INCOTerms"
                        SortExpression="INCOTerms" UniqueName="INCOTerms" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="INCOTerms2" DataField="INCOTerms2"
                        SortExpression="INCOTerms2" UniqueName="INCOTerms2" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ShippingCondition" DataField="ShippingCondition"
                        SortExpression="ShippingCondition" UniqueName="ShippingCondition" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="NetWt" DataField="NetWt"
                        SortExpression="NetWt" UniqueName="NetWt" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AgentName2" DataField="AgentName2"
                        SortExpression="AgentName2" UniqueName="AgentName2" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn HeaderText="MeansofTransportType" DataField="MeansofTransportType"
                        SortExpression="MeansofTransportType" UniqueName="MeansofTransportType" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ETADate" DataField="ETADate"
                        SortExpression="ETADate" UniqueName="ETADate" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AgentCode" DataField="AgentCode"
                        SortExpression="AgentCode" UniqueName="AgentCode" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AgentName" DataField="AgentName"
                        SortExpression="AgentName" UniqueName="AgentName" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExRef1" DataField="ExRef1"
                        SortExpression="ExRef1" UniqueName="ExRef1" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ExRef3" DataField="ExRef3"
                        SortExpression="ExRef3" UniqueName="ExRef3" Reorderable="true" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
