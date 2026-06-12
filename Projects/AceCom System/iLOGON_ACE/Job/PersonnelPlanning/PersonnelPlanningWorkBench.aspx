<%@ Page Language="c#" CodeBehind="PersonnelPlanningWorkBench.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.PersonnelPlanning.PersonnelPlanningWorkBench" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>PersonnelWorkbench</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2
        {
            width: 125px;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        function popupDetail(id) {
            if (id.toString().trim() != "0")
                window.showModalDialog("PersonnelDetail.aspx?jbPerDetlId=" + id, "myWindow", "dialogWidth:850px;dialogHeight:550px;status:no;dialogHide:true;help:no;scroll:no")
        }

        $(document).ready(function() {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function() {
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
        <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
        <asp:Label ID="lblProcessID" runat="server" Visible="False" />
    </asp:Panel>
    <div class="show_hide_Detail">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="style2"><br />
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    &nbsp;<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                        Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                    &nbsp;<asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                    <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>
                    <br />
                    &nbsp;
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div id="div-datagrid" style="height: 95%">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
            GridLines="Both" CellPadding="2" UseAccessibleHeader="True" HorizontalAlign="Center">
            <AlternatingItemStyle CssClass="DGItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGAlternateItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Personnel" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="pername" Text='<%#Eval("pername") %>' runat="server" />
                        <asp:Label ID="pervocation" Text='<%#Eval("pervocation") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="A" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>'
                            ToolTip='<%#Eval("s1Job") %>' OnClientClick='<%# Eval("s1PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s1perhno" Text='<%#Eval("s1perhno") %>' runat="server" />
                        &nbsp;
                        <asp:Label ID="s1perhtype" Text='<%#Eval("s1perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S1SvcPtFrTo" Text='<%#Eval("S1SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="B" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>'
                            ToolTip='<%#Eval("s2Job") %>' OnClientClick='<%# Eval("s2PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s2perhno" Text='<%#Eval("s2perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s2perhtype" Text='<%#Eval("s2perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S2SvcPtFrTo" Text='<%#Eval("S2SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="C" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("s3Job") %>'
                            ToolTip='<%#Eval("s3Job") %>' OnClientClick='<%# Eval("s3PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s3perhno" Text='<%#Eval("s3perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s3perhtype" Text='<%#Eval("s3perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S3SvcPtFrTo" Text='<%#Eval("S3SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="D" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("s4Job") %>'
                            ToolTip='<%#Eval("s4Job") %>' OnClientClick='<%# Eval("s4PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s4perhno" Text='<%#Eval("s4perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s4perhtype" Text='<%#Eval("s4perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S4SvcPtFrTo" Text='<%#Eval("S4SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="E" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("s5Job") %>'
                            ToolTip='<%#Eval("s5Job") %>' OnClientClick='<%# Eval("s5PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s5perhno" Text='<%#Eval("s5perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s5perhtype" Text='<%#Eval("s5perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S5SvcPtFrTo" Text='<%#Eval("S5SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="F" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("s6Job") %>'
                            ToolTip='<%#Eval("s6Job") %>' OnClientClick='<%# Eval("s6PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s6perhno" Text='<%#Eval("s6perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s6perhtype" Text='<%#Eval("s6perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S6SvcPtFrTo" Text='<%#Eval("S6SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="G" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("s7Job") %>'
                            ToolTip='<%#Eval("s7Job") %>' OnClientClick='<%# Eval("s7PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s7perhno" Text='<%#Eval("s7perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s7perhtype" Text='<%#Eval("s7perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S7SvcPtFrTo" Text='<%#Eval("S7SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="H" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname8" runat="server" Text='<%#Eval("s8Job") %>'
                            ToolTip='<%#Eval("s8Job") %>' OnClientClick='<%# Eval("s8PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s8perhno" Text='<%#Eval("s8perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s8perhtype" Text='<%#Eval("s8perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S8SvcPtFrTo" Text='<%#Eval("S8SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="I" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname9" runat="server" Text='<%#Eval("s9Job") %>'
                            ToolTip='<%#Eval("s9Job") %>' OnClientClick='<%# Eval("s9PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s9perhno" Text='<%#Eval("s9perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s9perhtype" Text='<%#Eval("s9perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S9SvcPtFrTo" Text='<%#Eval("S9SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="J" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname10" runat="server" Text='<%#Eval("s10Job") %>'
                            ToolTip='<%#Eval("s10Job") %>' OnClientClick='<%# Eval("s10PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s10perhno" Text='<%#Eval("s10perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s10perhtype" Text='<%#Eval("s10perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S10SvcPtFrTo" Text='<%#Eval("S10SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="K" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname11" runat="server" Text='<%#Eval("s11Job") %>'
                            ToolTip='<%#Eval("s11Job") %>' OnClientClick='<%# Eval("s11PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s11perhno" Text='<%#Eval("s11perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s11perhtype" Text='<%#Eval("s11perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S11SvcPtFrTo" Text='<%#Eval("S11SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="L" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname12" runat="server" Text='<%#Eval("s12Job") %>'
                            ToolTip='<%#Eval("s12Job") %>' OnClientClick='<%# Eval("s12PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s12perhno" Text='<%#Eval("s12perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s12perhtype" Text='<%#Eval("s12perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S12SvcPtFrTo" Text='<%#Eval("S12SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="M" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname13" runat="server" Text='<%#Eval("s13Job") %>'
                            ToolTip='<%#Eval("s13Job") %>' OnClientClick='<%# Eval("s13PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s13perhno" Text='<%#Eval("s13perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s13perhtype" Text='<%#Eval("s13perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S13SvcPtFrTo" Text='<%#Eval("S13SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="N" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname14" runat="server" Text='<%#Eval("s14Job") %>'
                            ToolTip='<%#Eval("s14Job") %>' OnClientClick='<%# Eval("s14PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s14perhno" Text='<%#Eval("s14perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s14perhtype" Text='<%#Eval("s14perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S14SvcPtFrTo" Text='<%#Eval("S14SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="O" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname15" runat="server" Text='<%#Eval("s15Job") %>'
                            ToolTip='<%#Eval("s15Job") %>' OnClientClick='<%# Eval("s15PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s15perhno" Text='<%#Eval("s15perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s15perhtype" Text='<%#Eval("s15perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S15SvcPtFrTo" Text='<%#Eval("S15SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="P" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname16" runat="server" Text='<%#Eval("s16Job") %>'
                            ToolTip='<%#Eval("s16Job") %>' OnClientClick='<%# Eval("s16PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s16perhno" Text='<%#Eval("s16perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s16perhtype" Text='<%#Eval("s16perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S16SvcPtFrTo" Text='<%#Eval("S16SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Q" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname17" runat="server" Text='<%#Eval("s17Job") %>'
                            ToolTip='<%#Eval("s17Job") %>' OnClientClick='<%# Eval("s17PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s17perhno" Text='<%#Eval("s17perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s17perhtype" Text='<%#Eval("s17perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S17SvcPtFrTo" Text='<%#Eval("S17SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="R" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname18" runat="server" Text='<%#Eval("s18Job") %>'
                            ToolTip='<%#Eval("s18Job") %>' OnClientClick='<%# Eval("s18PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s18perhno" Text='<%#Eval("s18perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s18perhtype" Text='<%#Eval("s18perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S18SvcPtFrTo" Text='<%#Eval("S18SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="S" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname19" runat="server" Text='<%#Eval("s19Job") %>'
                            ToolTip='<%#Eval("s19Job") %>' OnClientClick='<%# Eval("s19PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s19perhno" Text='<%#Eval("s19perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s19perhtype" Text='<%#Eval("s19perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S19SvcPtFrTo" Text='<%#Eval("S19SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="T" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname20" runat="server" Text='<%#Eval("s20Job") %>'
                            ToolTip='<%#Eval("s20Job") %>' OnClientClick='<%# Eval("s20PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s20perhno" Text='<%#Eval("s20perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s20perhtype" Text='<%#Eval("s20perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S20SvcPtFrTo" Text='<%#Eval("S20SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="U" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname21" runat="server" Text='<%#Eval("s21Job") %>'
                            ToolTip='<%#Eval("s21Job") %>' OnClientClick='<%# Eval("s21PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s21perhno" Text='<%#Eval("s21perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s21perhtype" Text='<%#Eval("s21perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S21SvcPtFrTo" Text='<%#Eval("S21SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="V" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname22" runat="server" Text='<%#Eval("s22Job") %>'
                            ToolTip='<%#Eval("s22Job") %>' OnClientClick='<%# Eval("s22PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s22perhno" Text='<%#Eval("s22perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s22perhtype" Text='<%#Eval("s22perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S22SvcPtFrTo" Text='<%#Eval("S22SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="W" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname23" runat="server" Text='<%#Eval("s23Job") %>'
                            ToolTip='<%#Eval("s23Job") %>' OnClientClick='<%# Eval("s23PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s23perhno" Text='<%#Eval("s23perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s23perhtype" Text='<%#Eval("s23perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S23SvcPtFrTo" Text='<%#Eval("S23SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="X" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname24" runat="server" Text='<%#Eval("s24Job") %>'
                            ToolTip='<%#Eval("s24Job") %>' OnClientClick='<%# Eval("s24PerdID", "return popupDetail(\"{0}\");") %>' />
                        &nbsp;
                        <asp:Label ID="s24perhno" Text='<%#Eval("s24perhno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s24perhtype" Text='<%#Eval("s24perhtype") %>' runat="server" /><br />
                        <asp:Label ID="S24SvcPtFrTo" Text='<%#Eval("S24SvcPtFrTo") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="vehcolor" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s1Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s2Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s3Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s4Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s5Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s6Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s7Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s8Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s9Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s10Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s11Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s12Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s13Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s14Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s15Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s16Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s17Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s18Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s19Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s20Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s21Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s22Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s23Color" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="s24Color" Visible="False"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
