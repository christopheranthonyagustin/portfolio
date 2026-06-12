<%@ Page Language="c#" CodeBehind="TripPlanningWorkBench.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningWorkBench" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TripPlanningWorkBench</title>
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
                window.showModalDialog("TripDetail.aspx?id=" + id, "myWindow", "dialogWidth:850px;dialogHeight:550px;status:no;dialogHide:true;help:no;scroll:no")
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
    </asp:Panel>
    <div class="show_hide_Detail">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td class="style2">
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="30%">
                                <asp:CheckBox ID="showTdy_cbox" runat="server" Text="ShowOnlyToday" />
                            </td>
                            <td>
                                &nbsp;<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="detailbutton"
                                    Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                                &nbsp;<asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label><br />
                                &nbsp;
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
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
                <asp:TemplateColumn HeaderText="Vehicle" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="vehno" Text='<%#Eval("vehno") %>' runat="server" /><br />
                        <asp:Label ID="vehtype" Text='<%#Eval("vehtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq01" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>'
                            ToolTip='<%#Eval("s1Job") %>' OnClientClick='<%# Eval("s1CtrId", "return popupDetail(\"{0}\");") %>' />
                        <br />
                        <asp:Label ID="S1SvcPtFrTo" Text='<%#Eval("S1SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s1ctnrno" Text='<%#Eval("s1ctnrno") %>' runat="server" />
                        &nbsp;
                        <asp:Label ID="s1ctnrtype" Text='<%#Eval("s1ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq02" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>'
                            ToolTip='<%#Eval("s2Job") %>' OnClientClick='<%# Eval("s2CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S2SvcPtFrTo" Text='<%#Eval("S2SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s2ctnrno" Text='<%#Eval("s2ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s2ctnrtype" Text='<%#Eval("s2ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq03" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("s3Job") %>'
                            ToolTip='<%#Eval("s3Job") %>' OnClientClick='<%# Eval("s3CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S3SvcPtFrTo" Text='<%#Eval("S3SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s3ctnrno" Text='<%#Eval("s3ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s3ctnrtype" Text='<%#Eval("s3ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq04" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("s4Job") %>'
                            ToolTip='<%#Eval("s4Job") %>' OnClientClick='<%# Eval("s4CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S4SvcPtFrTo" Text='<%#Eval("S4SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s4ctnrno" Text='<%#Eval("s4ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s4ctnrtype" Text='<%#Eval("s4ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq05" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("s5Job") %>'
                            ToolTip='<%#Eval("s5Job") %>' OnClientClick='<%# Eval("s5CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S5SvcPtFrTo" Text='<%#Eval("S5SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s5ctnrno" Text='<%#Eval("s5ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s5ctnrtype" Text='<%#Eval("s5ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq06" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("s6Job") %>'
                            ToolTip='<%#Eval("s6Job") %>' OnClientClick='<%# Eval("s6CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S6SvcPtFrTo" Text='<%#Eval("S6SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s6ctnrno" Text='<%#Eval("s6ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s6ctnrtype" Text='<%#Eval("s6ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq07" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("s7Job") %>'
                            ToolTip='<%#Eval("s7Job") %>' OnClientClick='<%# Eval("s7CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S7SvcPtFrTo" Text='<%#Eval("S7SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s7ctnrno" Text='<%#Eval("s7ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s7ctnrtype" Text='<%#Eval("s7ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq08" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname8" runat="server" Text='<%#Eval("s8Job") %>'
                            ToolTip='<%#Eval("s8Job") %>' OnClientClick='<%# Eval("s8CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S8SvcPtFrTo" Text='<%#Eval("S8SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s8ctnrno" Text='<%#Eval("s8ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s8ctnrtype" Text='<%#Eval("s8ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq09" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname9" runat="server" Text='<%#Eval("s9Job") %>'
                            ToolTip='<%#Eval("s9Job") %>' OnClientClick='<%# Eval("s9CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S9SvcPtFrTo" Text='<%#Eval("S9SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s9ctnrno" Text='<%#Eval("s9ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s9ctnrtype" Text='<%#Eval("s9ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq10" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname10" runat="server" Text='<%#Eval("s10Job") %>'
                            ToolTip='<%#Eval("s10Job") %>' OnClientClick='<%# Eval("s10CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S10SvcPtFrTo" Text='<%#Eval("S10SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s10ctnrno" Text='<%#Eval("s10ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s10ctnrtype" Text='<%#Eval("s10ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq11" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname11" runat="server" Text='<%#Eval("s11Job") %>'
                            ToolTip='<%#Eval("s11Job") %>' OnClientClick='<%# Eval("s11CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S11SvcPtFrTo" Text='<%#Eval("S11SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s11ctnrno" Text='<%#Eval("s11ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s11ctnrtype" Text='<%#Eval("s11ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq12" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname12" runat="server" Text='<%#Eval("s12Job") %>'
                            ToolTip='<%#Eval("s12Job") %>' OnClientClick='<%# Eval("s12CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S12SvcPtFrTo" Text='<%#Eval("S12SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s12ctnrno" Text='<%#Eval("s12ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s12ctnrtype" Text='<%#Eval("s12ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq13" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname13" runat="server" Text='<%#Eval("s13Job") %>'
                            ToolTip='<%#Eval("s13Job") %>' OnClientClick='<%# Eval("s13CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S13SvcPtFrTo" Text='<%#Eval("S13SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s13ctnrno" Text='<%#Eval("s13ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s13ctnrtype" Text='<%#Eval("s13ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq14" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname14" runat="server" Text='<%#Eval("s14Job") %>'
                            ToolTip='<%#Eval("s14Job") %>' OnClientClick='<%# Eval("s14CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S14SvcPtFrTo" Text='<%#Eval("S14SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s14ctnrno" Text='<%#Eval("s14ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s14ctnrtype" Text='<%#Eval("s14ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq15" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname15" runat="server" Text='<%#Eval("s15Job") %>'
                            ToolTip='<%#Eval("s15Job") %>' OnClientClick='<%# Eval("s15CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S15SvcPtFrTo" Text='<%#Eval("S15SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s15ctnrno" Text='<%#Eval("s15ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s15ctnrtype" Text='<%#Eval("s15ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq16" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname16" runat="server" Text='<%#Eval("s16Job") %>'
                            ToolTip='<%#Eval("s16Job") %>' OnClientClick='<%# Eval("s16CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S16SvcPtFrTo" Text='<%#Eval("S16SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s16ctnrno" Text='<%#Eval("s16ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s16ctnrtype" Text='<%#Eval("s16ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq17" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname17" runat="server" Text='<%#Eval("s17Job") %>'
                            ToolTip='<%#Eval("s17Job") %>' OnClientClick='<%# Eval("s17CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S17SvcPtFrTo" Text='<%#Eval("S17SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s17ctnrno" Text='<%#Eval("s17ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s17ctnrtype" Text='<%#Eval("s17ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq18" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname18" runat="server" Text='<%#Eval("s18Job") %>'
                            ToolTip='<%#Eval("s18Job") %>' OnClientClick='<%# Eval("s18CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S18SvcPtFrTo" Text='<%#Eval("S18SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s18ctnrno" Text='<%#Eval("s18ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s18ctnrtype" Text='<%#Eval("s18ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq19" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname19" runat="server" Text='<%#Eval("s19Job") %>'
                            ToolTip='<%#Eval("s19Job") %>' OnClientClick='<%# Eval("s19CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S19SvcPtFrTo" Text='<%#Eval("S19SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s19ctnrno" Text='<%#Eval("s19ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s19ctnrtype" Text='<%#Eval("s19ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq20" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname20" runat="server" Text='<%#Eval("s20Job") %>'
                            ToolTip='<%#Eval("s20Job") %>' OnClientClick='<%# Eval("s20CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S20SvcPtFrTo" Text='<%#Eval("S20SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s20ctnrno" Text='<%#Eval("s20ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s20ctnrtype" Text='<%#Eval("s20ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq21" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname21" runat="server" Text='<%#Eval("s21Job") %>'
                            ToolTip='<%#Eval("s21Job") %>' OnClientClick='<%# Eval("s21CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S21SvcPtFrTo" Text='<%#Eval("S21SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s21ctnrno" Text='<%#Eval("s21ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s21ctnrtype" Text='<%#Eval("s21ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq22" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname22" runat="server" Text='<%#Eval("s22Job") %>'
                            ToolTip='<%#Eval("s22Job") %>' OnClientClick='<%# Eval("s22CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S22SvcPtFrTo" Text='<%#Eval("S22SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s22ctnrno" Text='<%#Eval("s22ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s22ctnrtype" Text='<%#Eval("s22ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq23" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname23" runat="server" Text='<%#Eval("s23Job") %>'
                            ToolTip='<%#Eval("s23Job") %>' OnClientClick='<%# Eval("s23CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S23SvcPtFrTo" Text='<%#Eval("S23SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s23ctnrno" Text='<%#Eval("s23ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s23ctnrtype" Text='<%#Eval("s23ctnrtype") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Seq24" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ForeColor="Black" ID="lnkname24" runat="server" Text='<%#Eval("s24Job") %>'
                            ToolTip='<%#Eval("s24Job") %>' OnClientClick='<%# Eval("s24CtrId", "return popupDetail(\"{0}\");") %>' /><br />
                        <asp:Label ID="S24SvcPtFrTo" Text='<%#Eval("S24SvcPtFrTo") %>' runat="server" />
                        <br />
                        <asp:Label ID="s24ctnrno" Text='<%#Eval("s24ctnrno") %>' runat="server" />&nbsp;
                        <asp:Label ID="s24ctnrtype" Text='<%#Eval("s24ctnrtype") %>' runat="server" />
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
