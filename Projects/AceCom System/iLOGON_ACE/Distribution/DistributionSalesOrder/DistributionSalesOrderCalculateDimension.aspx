<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderCalculateDimension.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderCalculateDimension" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Calculate Dimension</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function GetRadWindow() {
                var oWindow = null; if (window.radWindow)
                    oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
            }

            function close() {
                GetRadWindow().close();
                window.parent.location.href = "../DistributionSalesOrder/DistributionSalesOrderItem.aspx?&InternalLength=" + <%= "'" + ViewState[INTERNAL_LENGTH].ToString() + "'" %> + "&InternalWidth=" + <%= "'" + ViewState[INTERNAL_WIDTH].ToString() + "'" %> + "&InternalHeight=" + <%= "'" + ViewState[INTERNAL_HEIGHT].ToString() + "'" %> + "&ExternalWidth=" + <%= "'" + ViewState[EXTERNAL_WIDTH].ToString() + "'" %> + "&ExternalHeight=" + <%= "'" + ViewState[EXTERNAL_HEIGHT].ToString() + "'" %> + "&ExternalLength=" + <%= "'" + ViewState[EXTERNAL_LENGTH].ToString() + "'" %> + "&ItemId=" + <%= "'" + ViewState["ItemId"].ToString() + "'" %>
                    +"&InterLength=" + <%= "'" + ViewState["InterLength"].ToString() + "'" %> + "&InterWidth=" + <%= "'" + ViewState["InterWidth"].ToString() + "'" %> + "&InterHeight=" + <%= "'" + ViewState["InterHeight"].ToString() + "'" %> + "&InterWt=" + <%= "'" + ViewState["InterWt"].ToString() + "'" %> + "&InterNetWt=" + <%= "'" + ViewState["InterNetWt"].ToString() + "'" %>
                    + "&ExtLength=" + <%= "'" + ViewState["ExtLength"].ToString() + "'" %> + "&ExtWidth=" + <%= "'" + ViewState["ExtWidth"].ToString() + "'" %> + "&ExtHeight=" + <%= "'" + ViewState["ExtHeight"].ToString() + "'" %> + "&ExtWt=" + <%= "'" + ViewState["ExtWt"].ToString() + "'" %> + "&ExtNetWt=" + <%= "'" + ViewState["ExtNetWt"].ToString() + "'" %>
                    + "&SalesOrderId=" + <%= "'" + ViewState["SalesOrderId"].ToString() + "'" %> + "&SalesOrderItemIdArr=" + <%= "'" + ViewState["SalesOrderItemIdArr"].ToString() + "'" %> + "&entId=" + <%= "'" + ViewState["EntId"].ToString() + "'" %> + "&channelcode=" + + <%= "'" + ViewState["ChannelCode"].ToString() + "'" %> + "&srcpage=" + <%= "'" + ViewState["SRCPage"].ToString() + "'" %> + "&ItemUOM=" + <%= "'" + ViewState["ItemUOM"].ToString() + "'" %> + "&SourceProcess=" + <%= "'" + ViewState["SourceProcess"].ToString() + "'" %>                    
                    + "&ItemType=" + <%= "'" + ViewState["ItemType"].ToString() + "'" %> + "&ItemQty=" + <%= "'" + ViewState["ItemQty"].ToString() + "'" %>
                    + "&ItemUnitPrice=" + <%= "'" + ViewState["ItemUnitPrice"].ToString() + "'" %> + "&Notes=" + <%= "'" + ViewState["Notes"].ToString() + "'" %> + "&CRow=" + <%= "'" + ViewState["CurrentRow"].ToString() + "'" %>
                    + "&FabricationId=" + <%= "'" + ViewState["FabricationId"].ToString() + "'" %> + "&SalesOrderCtnrId =" + <%= "'" + ViewState["SalesOrderCtnrId"].ToString() + "'" %> +
                    + "&Status=" + <%= "'" + ViewState["Status"].ToString() + "'" %> + "&RowCount=" + <%= "'" + ViewState["RowCount"].ToString() + "'" %>
                    + "&CollectionStatus=" + <%= "'" + ViewState["CollectionStatus"].ToString() + "'" %> + "&IsCollectionItem=" + <%= "'" + ViewState["IsCollectionItem"].ToString() + "'" %> + "&CalculatedDimension=" + <%= "'" + ViewState["CalculatedDimension"].ToString() + "'" %>;
            }
        </script>
    </telerik:RadCodeBlock>

</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="ItemGroupLbl" Text="Item Group" runat="server" CssClass="align">
                    </telerik:RadLabel>
                    <telerik:RadDropDownList ID="ItemGroupDDL" DataTextField="descr" DataValueField="item" Skin="WebBlue"
                        runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ItemGroupDDL_SelectedIndexChanged" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    &nbsp;
                    <telerik:RadLabel ID="LengthLbl" Text="Length" runat="server" CssClass="align" Enabled="false">
                    </telerik:RadLabel>
                </td>
                <td>
                    &nbsp;
                    <telerik:RadLabel ID="WidthLbl" Text="Width" runat="server" CssClass="align" Enabled="false">
                    </telerik:RadLabel>

                </td>
                <td>
                    &nbsp;
                    <telerik:RadLabel ID="HeightLbl" Text="Height" runat="server" CssClass="align" Enabled="false">
                    </telerik:RadLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadLabel ID="InternalPackingLbl" Text="Internal Packing by" runat="server" CssClass="align">
                    </telerik:RadLabel>
                </td>
                <td>&nbsp;&nbsp;
                    <telerik:RadTextBox ID="IPackingLenghtTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
                <td>
                    <br />
                    <telerik:RadTextBox ID="IPackingWidthTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
                <td>
                    <br />
                    <telerik:RadTextBox ID="IPackingHeightTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <telerik:RadLabel ID="ExternalPackingLbl" Text="External Packing by" runat="server" CssClass="align">
                    </telerik:RadLabel>
                </td>
                <td>&nbsp;&nbsp;
                    <telerik:RadTextBox ID="EPackingLenghtTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
                <td>
                    <br />
                    <telerik:RadTextBox ID="EPackingWidthTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
                <td>
                    <br />
                    <telerik:RadTextBox ID="EPackingHeightTxtBox" runat="server" Skin="WebBlue" Width="140px">
                    </telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <br />
                    <br />
                    <asp:Button ID="CalculateBtn" runat="server" Text=" Calculate " CssClass="White" OnClick="CalculateBtn_Click" OnClientClick="disableBtn(this.id,true)" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
