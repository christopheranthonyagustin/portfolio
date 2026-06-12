<%@ Page Language="c#" CodeBehind="JobStatusMonitor.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Graphlet.JobStatusMonitor.JobStatusMonitor" %>

<html>
<head>
    <title>JobStatusMonitor</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <table cellspacing="1" cellpadding="2" width="100%" border="0">
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="AcCode2Lbl" runat="server">Account </asp:Label>
                    &nbsp;:
                    <asp:Label ID="AcCodeLbl" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="Site2Lbl" runat="server">Site </asp:Label>
                    &nbsp;:
                    <asp:Label ID="SiteLbl" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="Refresh2Lbl" runat="server">Refresh Interval</asp:Label>
                    :&nbsp;
									<asp:Label ID="RefreshLbl" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>
                    :
									<asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                    <br>
                </td>
            </tr>
        </table>
        <br />
        <div id="div2" style="height: 15%">
            <asp:DataGrid ID="jobSummaryDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                GridLines="Both" CellPadding="2" UseAccessibleHeader="True" HorizontalAlign="Center">
                <AlternatingItemStyle CssClass="DGAlternateItem_LargeBoldFont" HorizontalAlign="Center"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem_LargeBoldFont" HorizontalAlign="Center"></ItemStyle>
                <Columns>
                    <asp:BoundColumn DataField="jobtype" HeaderText="Job Type" HeaderStyle-Width="20%">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_LargeBoldFont"></HeaderStyle>
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="totjob" HeaderText="Total Outstanding" HeaderStyle-Width="20%">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_LargeBoldFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="totjobpend" HeaderText="Pending" HeaderStyle-Width="20%">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_LargeBoldFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="totjobwip" HeaderText="WIP" HeaderStyle-Width="20%">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_LargeBoldFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="totjobdone" HeaderText="Completed" HeaderStyle-Width="20%">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_LargeBoldFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
            <br />
            <br />
            <asp:DataGrid ID="jobDetailDG" runat="server" AutoGenerateColumns="False"
                BorderStyle="None" CellPadding="2" UseAccessibleHeader="True"
                HorizontalAlign="Center">
                <AlternatingItemStyle CssClass="DGAlternateItem_MedFont"></AlternatingItemStyle>
                <ItemStyle CssClass="DGItem_MedFont"></ItemStyle>
                <Columns>
                    <asp:TemplateColumn HeaderStyle-CssClass="DGHeader_MedFont">
                        <HeaderTemplate>
                            No
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="DGHeader_MedFont"></HeaderStyle>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="expdate" HeaderText="ExpDate" DataFormatString="{0:dd/MMM/yyyy}">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="jobno" HeaderText="Job">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="typedescr" HeaderText="Type">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="srcjobno" HeaderText="SourceJob">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="acname" HeaderText="Account">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="exref" HeaderText="Exref">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="exname" HeaderText="Exname">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="statusdescr" HeaderText="Status">
                        <HeaderStyle Wrap="False" CssClass="DGHeader_MedFont"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="statuscolor" HeaderText="statuscolor"
                        Visible="False"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
</body>
</html>
