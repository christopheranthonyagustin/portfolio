<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportTimeSheet.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportTimeSheet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TransportTimeSheet</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                </div>
            </td>
            <td align="left">
                <asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" Text="Save" OnClick="SaveBtn_Click">
                </asp:Button>&nbsp;
                <asp:Button ID="GenerateBtn" runat="server" CssClass="detailButton" Text="Generate"
                    OnClick="GenerateBtn_Click" />&nbsp;
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid" style="height: auto;">
        <asp:DataGrid ID="JBTimeSheetDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
            CellPadding="2" UseAccessibleHeader="True" Height="100%">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" HorizontalAlign="Left"></ItemStyle>
            <Columns>
                <asp:BoundColumn Visible="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid">
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="id" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="jbsvcchitIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="jbcttrid" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="jbcttrIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "jbcttrid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ExpectedDate" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "frexpdate","{0:dd/MMM/yyyy ddd}") %>'
                            ID="frexpdateLbl" /><br>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn ItemStyle-Wrap="False" HeaderText="SvcChitNo" SortExpression="svcchitno">
                    <HeaderTemplate>
                        SvcChitNo
                        <br />
                        <a id="lnkmasssvchitTxt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="svchitTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "svcchitno") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="FrActualTime" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        FrActualTime
                        <br />
                        <a id="lnkmassfrtimeList" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="frtimeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%# iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(timeListDS,DataBinder.Eval(Container.DataItem, "frtime1").ToString()) %>'
                            DataSource='<%# timeListDS%>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ToActualTime" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        ToActualTime
                        <br />
                        <a id="lnkmasstotimeList" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="totimeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%# iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(timeListDS,DataBinder.Eval(Container.DataItem, "totime1").ToString()) %>'
                            DataSource='<%# timeListDS%>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="NormalHrs" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                    <HeaderTemplate>
                        NormalHrs
                        <br />
                        <a id="lnkmassnrmlhrsTxt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="nrmlhrsTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "normalhrs", "{0:#,0.00}") %>'></asp:TextBox>
                        <asp:CompareValidator ID="nrmlhrsTxtCompVal" runat="server" ControlToValidate="nrmlhrsTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="WorkThruLunch" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right">
                    <HeaderTemplate>
                        WorkThruLunch
                        <br />
                        <a id="lnkmassworkthruLunch_ChkBox" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="workthruLunch_ChkBox" runat="server" Checked='<%# CheckWTL( Eval("workthrulunch"))%>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="OThours" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        OThours
                        <br />
                        <a id="lnkmassothrTxt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="othrTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "overtimehrs", "{0:#,0.00}") %>'></asp:TextBox>
                        <asp:CompareValidator ID="othrTxtCompVal" runat="server" ControlToValidate="othrTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="TripCount" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        TripCount
                        <br />
                        <a id="lnkmasstripcntTxt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="tripcntTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "tripcount", "{0:#,0.00}") %>'></asp:TextBox>
                        <asp:CompareValidator ID="tripcntTxtCompVal" runat="server" ControlToValidate="tripcntTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="EqpFrTime" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        EqpFrTime
                        <br />
                        <a id="lnkmasseqpfrtimeList" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="eqpfrtimeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%# iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(timeListDS,DataBinder.Eval(Container.DataItem, "eqpfrtime").ToString()) %>'
                            DataSource='<%# timeListDS%>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="EqpToTime" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        EqpToTime
                        <br />
                        <a id="lnkmasseqptotimeList" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="eqptotimeList" Enabled="True" DataTextField="Descr" DataValueField="Item"
                            runat="server" SelectedIndex='<%# iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(timeListDS,DataBinder.Eval(Container.DataItem, "eqptotime").ToString()) %>'
                            DataSource='<%# timeListDS%>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="OThours" HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        EqpOThours
                        <br />
                        <a id="lnkmasseqpothrTxt" onserverclick="Control_Fill" runat="server">AutoFill</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="eqpothrTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "eqpovertimehrs", "{0:#,0.00}") %>'></asp:TextBox>
                        <asp:CompareValidator ID="eqpothrTxtCompVal" runat="server" ControlToValidate="eqpothrTxt"
                            EnableClientScript="True" ErrorMessage="*" Operator="DataTypeCheck" Type="Double" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:TextBox ID="RemarksTxt" runat="server" Width="400" Height="55" TextMode="MultiLine"
                            Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
