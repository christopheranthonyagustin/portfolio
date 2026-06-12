<%@ Page Language="c#" CodeBehind="TripPlanningWorkBench2.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TripPlanning.TripPlanningWorkBench2" %>

<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
    <style type="text/css">
        .style2 {
            width: 125px;
        }

        .break-word {
            max-width: 350px !important;
            white-space: normal;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

    <script type="text/javascript">
        function popupDetail(id) {
            if (id.toString().trim() != "0")
                window.showModalDialog("TripDetail2.aspx?id=" + id, "myWindow", "dialogWidth:1400px;dialogHeight:800px;status:no;dialogHide:true;help:no;scroll:yes;resizable=yes;")
        }

        $(document).ready(function () {
            $(".show_hide_Detail").hide();
            $(".show_hide_Header").show();
            $('.show_hide_Header').click(function () {
                12
                $(".show_hide_Detail").slideToggle();
            });
        });
    </script>

</head>
<body id="bdy" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" runat="server">
    <form id="form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="style1">
                    <input type="hidden" id="tb1" value="1"><a onclick="document.getElementById('tb1').value=1;"><iWMS:Tabs
                        ID="MenuTabs" runat="server"></iWMS:Tabs>
                    </a>
                </td>
                <td class="NewModuleTitle" align="right">
                    <asp:Label ID="MenuLbl" runat="server">Trip Workbench</asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pHeader" runat="server" CssClass="show_hide_Header" align="center">
            <asp:Label ID="lblText" Text=" Hide / Show Search Filters" runat="server" />
            <asp:Label ID="lblProcessID" runat="server" Visible="False"></asp:Label>
        </asp:Panel>
        <br />
        <div id="div1" runat="server">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="style2">
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                    <td valign="bottom">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <asp:PlaceHolder ID="PH1" runat="server" />
                                    <a id="A1" runat="server" onserverclick="ExportExcel">&nbsp;</a>
                                </td>
                                <td width="30%">
                                    <asp:CheckBox ID="showTdy_cbox" runat="server" Text="ShowOnlyToday" />
                                </td>
                                <td>&nbsp;<asp:Button Style="z-index: 0" ID="refreshBtn" runat="server" CssClass="white"
                                    Text="Refresh" OnClick="refreshBtn_Click"></asp:Button>
                                    &nbsp;<asp:Label ID="LastLbl" runat="server">Last refresh</asp:Label>:
                                <asp:Label ID="LastRefreshLbl" runat="server"></asp:Label>&nbsp;<br />
                                    &nbsp;
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                    Visible="False"></asp:Label>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <a id="A2" runat="server" onserverclick="ExportExcel">
                            <img id="Img1" border="0" alt="Export to Excel" align="left" src="../../Image/excel.gif"
                                height="20" runat="server"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div style="height: 90%" id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="False"
                AllowPaging="True" OnPreRender="ResultDG_PreRender" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle></AlternatingItemStyle>
                <ItemStyle></ItemStyle>
                <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                <ExportSettings UseItemStyles="True">
                </ExportSettings>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="200">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" ItemStyle-Wrap="false"
                            UniqueName="No">
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex + 1%>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%-- <telerik:GridTemplateColumn HeaderText="Job Number" ItemStyle-Wrap="false" UniqueName="jbno">
                  <HeaderTemplate></HeaderTemplate>
                  <ItemTemplate>
                    <span><%# DataBinder.Eval(Container.DataItem, "jbno")%> </span>
                  </ItemTemplate>
                </telerik:GridTemplateColumn>--%>
                        <telerik:GridTemplateColumn HeaderText="VehNo" ItemStyle-Wrap="false" UniqueName="VehNo">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <span>
                                    <%# DataBinder.Eval(Container.DataItem, "vehno") %>
                                    <%# DataBinder.Eval(Container.DataItem, "vehtype") %>
                                    <asp:Label ID="vehcolorLbl" Text='<%#Eval("vehcolor") %>' runat="server" Visible="false" />
                                </span>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="A" ItemStyle-Wrap="false" UniqueName="1" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s1CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>'
                            ToolTip='<%#Eval("s1Job") %>' OnClientClick='<%# Eval("s1CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s1ctnrno" Text='<%#Eval("s1ctnrno") %>' runat="server" />
                                &nbsp;
                            <asp:Label ID="s1ctnrtype" Text='<%#Eval("s1ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S1SvcPtFrTo" Text='<%#Eval("S1SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s1ColorLbl" Text='<%#Eval("s1color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s1PernameLbl" Text='<%#Eval("s1Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="B" ItemStyle-Wrap="false" UniqueName="2" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s2CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>'
                            ToolTip='<%#Eval("s2Job") %>' OnClientClick='<%# Eval("s2CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s2ctnrno" Text='<%#Eval("s2ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s2ctnrtype" Text='<%#Eval("s2ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S2SvcPtFrTo" Text='<%#Eval("S2SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s2ColorLbl" Text='<%#Eval("s2color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s2PernameLbl" Text='<%#Eval("s2Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="C" ItemStyle-Wrap="false" UniqueName="3" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("s3Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s3CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("s3Job") %>'
                            ToolTip='<%#Eval("s3Job") %>' OnClientClick='<%# Eval("s3CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s3ctnrno" Text='<%#Eval("s3ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s3ctnrtype" Text='<%#Eval("s3ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S3SvcPtFrTo" Text='<%#Eval("S3SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s3ColorLbl" Text='<%#Eval("s3color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s3PernameLbl" Text='<%#Eval("s3Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="D" ItemStyle-Wrap="false" UniqueName="4" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("s4Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s4CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("s4Job") %>'
                            ToolTip='<%#Eval("s4Job") %>' OnClientClick='<%# Eval("s4CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s4ctnrno" Text='<%#Eval("s4ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s4ctnrtype" Text='<%#Eval("s4ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S4SvcPtFrTo" Text='<%#Eval("S4SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s4ColorLbl" Text='<%#Eval("s4color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s4PernameLbl" Text='<%#Eval("s4Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="E" ItemStyle-Wrap="false" UniqueName="5" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("s5Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s5CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("s5Job") %>'
                            ToolTip='<%#Eval("s5Job") %>' OnClientClick='<%# Eval("s5CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s5ctnrno" Text='<%#Eval("s5ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s5ctnrtype" Text='<%#Eval("s5ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S5SvcPtFrTo" Text='<%#Eval("S5SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s5ColorLbl" Text='<%#Eval("s5color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s5PernameLbl" Text='<%#Eval("s5Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="F" ItemStyle-Wrap="false" UniqueName="6" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("s6Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s6CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("s6Job") %>'
                            ToolTip='<%#Eval("s6Job") %>' OnClientClick='<%# Eval("s6CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s6ctnrno" Text='<%#Eval("s6ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s6ctnrtype" Text='<%#Eval("s6ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S6SvcPtFrTo" Text='<%#Eval("S6SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s6ColorLbl" Text='<%#Eval("s6color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s6PernameLbl" Text='<%#Eval("s6Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="G" ItemStyle-Wrap="false" UniqueName="7" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("s7Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s7CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("s7Job") %>'
                            ToolTip='<%#Eval("s7Job") %>' OnClientClick='<%# Eval("s7CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s7ctnrno" Text='<%#Eval("s7ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s7ctnrtype" Text='<%#Eval("s7ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S7SvcPtFrTo" Text='<%#Eval("S7SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s7ColorLbl" Text='<%#Eval("s7color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s7PernameLbl" Text='<%#Eval("s7Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="H" ItemStyle-Wrap="false" UniqueName="8" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname8" runat="server" Text='<%#Eval("s8Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s8CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname8" runat="server" Text='<%#Eval("s8Job") %>'
                            ToolTip='<%#Eval("s8Job") %>' OnClientClick='<%# Eval("s8CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s8ctnrno" Text='<%#Eval("s8ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s8ctnrtype" Text='<%#Eval("s8ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S8SvcPtFrTo" Text='<%#Eval("S8SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s8ColorLbl" Text='<%#Eval("s8color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s8PernameLbl" Text='<%#Eval("s8Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="I" ItemStyle-Wrap="false" UniqueName="9" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname9" runat="server" Text='<%#Eval("s9Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s9CtrId")  %>' />
                                <%-- <asp:LinkButton ForeColor="Black" ID="lnkname9" runat="server" Text='<%#Eval("s9Job") %>'
                            ToolTip='<%#Eval("s9Job") %>' OnClientClick='<%# Eval("s9CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s9ctnrno" Text='<%#Eval("s9ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s9ctnrtype" Text='<%#Eval("s9ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S9SvcPtFrTo" Text='<%#Eval("S9SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s9ColorLbl" Text='<%#Eval("s9color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s9PernameLbl" Text='<%#Eval("s9Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="J" ItemStyle-Wrap="false" UniqueName="10" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname10" runat="server" Text='<%#Eval("s10Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s10CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname10" runat="server" Text='<%#Eval("s10Job") %>'
                            ToolTip='<%#Eval("s10Job") %>' OnClientClick='<%# Eval("s10CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s10ctnrno" Text='<%#Eval("s10ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s10ctnrtype" Text='<%#Eval("s10ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S10SvcPtFrTo" Text='<%#Eval("S10SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s10ColorLbl" Text='<%#Eval("s10color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s10PernameLbl" Text='<%#Eval("s10Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="K" ItemStyle-Wrap="false" UniqueName="11" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname11" runat="server" Text='<%#Eval("s11Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s11CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname11" runat="server" Text='<%#Eval("s11Job") %>'
                            ToolTip='<%#Eval("s11Job") %>' OnClientClick='<%# Eval("s11CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s11ctnrno" Text='<%#Eval("s11ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s11ctnrtype" Text='<%#Eval("s11ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S11SvcPtFrTo" Text='<%#Eval("S11SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s11ColorLbl" Text='<%#Eval("s11color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s11PernameLbl" Text='<%#Eval("s11Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="L" ItemStyle-Wrap="false" UniqueName="12" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname12" runat="server" Text='<%#Eval("s12Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s12CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname12" runat="server" Text='<%#Eval("s12Job") %>'
                            ToolTip='<%#Eval("s12Job") %>' OnClientClick='<%# Eval("s12CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s12ctnrno" Text='<%#Eval("s12ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s12ctnrtype" Text='<%#Eval("s12ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S12SvcPtFrTo" Text='<%#Eval("S12SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s12ColorLbl" Text='<%#Eval("s12color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s12PernameLbl" Text='<%#Eval("s12Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="M" ItemStyle-Wrap="false" UniqueName="13" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname13" runat="server" Text='<%#Eval("s13Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s13CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname13" runat="server" Text='<%#Eval("s13Job") %>'
                            ToolTip='<%#Eval("s13Job") %>' OnClientClick='<%# Eval("s13CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s13ctnrno" Text='<%#Eval("s13ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s13ctnrtype" Text='<%#Eval("s13ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S13SvcPtFrTo" Text='<%#Eval("S13SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s13ColorLbl" Text='<%#Eval("s13color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s13PernameLbl" Text='<%#Eval("s13Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="N" ItemStyle-Wrap="false" UniqueName="14" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname14" runat="server" Text='<%#Eval("s14Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s14CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname14" runat="server" Text='<%#Eval("s14Job") %>'
                            ToolTip='<%#Eval("s14Job") %>' OnClientClick='<%# Eval("s14CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s14ctnrno" Text='<%#Eval("s14ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s14ctnrtype" Text='<%#Eval("s14ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S14SvcPtFrTo" Text='<%#Eval("S14SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s14ColorLbl" Text='<%#Eval("s14color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s14PernameLbl" Text='<%#Eval("s14Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="O" ItemStyle-Wrap="false" UniqueName="15" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname15" runat="server" Text='<%#Eval("s15Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s15CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname15" runat="server" Text='<%#Eval("s15Job") %>'
                            ToolTip='<%#Eval("s15Job") %>' OnClientClick='<%# Eval("s15CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s15ctnrno" Text='<%#Eval("s15ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s15ctnrtype" Text='<%#Eval("s15ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S15SvcPtFrTo" Text='<%#Eval("S15SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s15ColorLbl" Text='<%#Eval("s15color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s15PernameLbl" Text='<%#Eval("s15Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="P" ItemStyle-Wrap="false" UniqueName="16" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname16" runat="server" Text='<%#Eval("s16Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s16CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname16" runat="server" Text='<%#Eval("s16Job") %>'
                            ToolTip='<%#Eval("s16Job") %>' OnClientClick='<%# Eval("s16CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s16ctnrno" Text='<%#Eval("s16ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s16ctnrtype" Text='<%#Eval("s16ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S16SvcPtFrTo" Text='<%#Eval("S16SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s16ColorLbl" Text='<%#Eval("s16color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s16PernameLbl" Text='<%#Eval("s16Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Q" ItemStyle-Wrap="false" UniqueName="17" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname17" runat="server" Text='<%#Eval("s17Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s17CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname17" runat="server" Text='<%#Eval("s17Job") %>'
                            ToolTip='<%#Eval("s17Job") %>' OnClientClick='<%# Eval("s17CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s17ctnrno" Text='<%#Eval("s17ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s17ctnrtype" Text='<%#Eval("s17ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S17SvcPtFrTo" Text='<%#Eval("S17SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s17ColorLbl" Text='<%#Eval("s17color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s17PernameLbl" Text='<%#Eval("s17Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="R" ItemStyle-Wrap="false" UniqueName="18" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname18" runat="server" Text='<%#Eval("s18Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s18CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname18" runat="server" Text='<%#Eval("s18Job") %>'
                            ToolTip='<%#Eval("s18Job") %>' OnClientClick='<%# Eval("s18CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s18ctnrno" Text='<%#Eval("s18ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s18ctnrtype" Text='<%#Eval("s18ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S18SvcPtFrTo" Text='<%#Eval("S18SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s18ColorLbl" Text='<%#Eval("s18color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s18PernameLbl" Text='<%#Eval("s18Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="S" ItemStyle-Wrap="false" UniqueName="19" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname19" runat="server" Text='<%#Eval("s19Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s19CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname19" runat="server" Text='<%#Eval("s19Job") %>'
                            ToolTip='<%#Eval("s19Job") %>' OnClientClick='<%# Eval("s19CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s19ctnrno" Text='<%#Eval("s19ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s19ctnrtype" Text='<%#Eval("s19ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S19SvcPtFrTo" Text='<%#Eval("S19SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s19ColorLbl" Text='<%#Eval("s19color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s19PernameLbl" Text='<%#Eval("s19Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="T" ItemStyle-Wrap="false" UniqueName="20" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname20" runat="server" Text='<%#Eval("s20Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s20CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname20" runat="server" Text='<%#Eval("s20Job") %>'
                            ToolTip='<%#Eval("s20Job") %>' OnClientClick='<%# Eval("s20CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s20ctnrno" Text='<%#Eval("s20ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s20ctnrtype" Text='<%#Eval("s20ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S20SvcPtFrTo" Text='<%#Eval("S20SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s20ColorLbl" Text='<%#Eval("s20color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s20PernameLbl" Text='<%#Eval("s20Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="U" ItemStyle-Wrap="false" UniqueName="21" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname21" runat="server" Text='<%#Eval("s21Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s21CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname21" runat="server" Text='<%#Eval("s21Job") %>'
                            ToolTip='<%#Eval("s21Job") %>' OnClientClick='<%# Eval("s21CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s21ctnrno" Text='<%#Eval("s21ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s21ctnrtype" Text='<%#Eval("s21ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S21SvcPtFrTo" Text='<%#Eval("S21SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s21ColorLbl" Text='<%#Eval("s21color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s21PernameLbl" Text='<%#Eval("s21Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="V" ItemStyle-Wrap="false" UniqueName="22" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname22" runat="server" Text='<%#Eval("s22Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s22CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname22" runat="server" Text='<%#Eval("s22Job") %>'
                            ToolTip='<%#Eval("s22Job") %>' OnClientClick='<%# Eval("s22CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s22ctnrno" Text='<%#Eval("s22ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s22ctnrtype" Text='<%#Eval("s22ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S22SvcPtFrTo" Text='<%#Eval("S22SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s22ColorLbl" Text='<%#Eval("s22color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s22PernameLbl" Text='<%#Eval("s22Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="W" ItemStyle-Wrap="false" UniqueName="23" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname23" runat="server" Text='<%#Eval("s23Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s23CtrId")  %>' />
                                <%-- <asp:LinkButton ForeColor="Black" ID="lnkname23" runat="server" Text='<%#Eval("s23Job") %>'
                            ToolTip='<%#Eval("s23Job") %>' OnClientClick='<%# Eval("s23CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s23ctnrno" Text='<%#Eval("s23ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s23ctnrtype" Text='<%#Eval("s23ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S23SvcPtFrTo" Text='<%#Eval("S23SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s23ColorLbl" Text='<%#Eval("s23color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s23PernameLbl" Text='<%#Eval("s23Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="X" ItemStyle-Wrap="false" UniqueName="24" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname24" runat="server" Text='<%#Eval("s24Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s24CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname24" runat="server" Text='<%#Eval("s24Job") %>'
                            ToolTip='<%#Eval("s24Job") %>' OnClientClick='<%# Eval("s24CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s24ctnrno" Text='<%#Eval("s24ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s24ctnrtype" Text='<%#Eval("s24ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S24SvcPtFrTo" Text='<%#Eval("S24SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s24ColorLbl" Text='<%#Eval("s24color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s24PernameLbl" Text='<%#Eval("s24Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Y" ItemStyle-Wrap="false" UniqueName="25" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname25" runat="server" Text='<%#Eval("s25Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s25CtrId")  %>' />
                                <%-- <asp:LinkButton ForeColor="Black" ID="lnkname25" runat="server" Text='<%#Eval("s25Job") %>'
                            ToolTip='<%#Eval("s25Job") %>' OnClientClick='<%# Eval("s25CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s25ctnrno" Text='<%#Eval("s25ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s25ctnrtype" Text='<%#Eval("s25ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S25SvcPtFrTo" Text='<%#Eval("S25SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s25ColorLbl" Text='<%#Eval("s25color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s25PernameLbl" Text='<%#Eval("s25Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Z" ItemStyle-Wrap="false" UniqueName="26" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname26" runat="server" Text='<%#Eval("s26Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s26CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname26" runat="server" Text='<%#Eval("s26Job") %>'
                            ToolTip='<%#Eval("s26Job") %>' OnClientClick='<%# Eval("s26CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s26ctnrno" Text='<%#Eval("s26ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s26ctnrtype" Text='<%#Eval("s26ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S26SvcPtFrTo" Text='<%#Eval("S26SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s26ColorLbl" Text='<%#Eval("s26color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s26PernameLbl" Text='<%#Eval("s26Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AA" ItemStyle-Wrap="false" UniqueName="27" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname27" runat="server" Text='<%#Eval("s27Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s27CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname27" runat="server" Text='<%#Eval("s27Job") %>'
                            ToolTip='<%#Eval("s27Job") %>' OnClientClick='<%# Eval("s27CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s27ctnrno" Text='<%#Eval("s27ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s27ctnrtype" Text='<%#Eval("s27ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S27SvcPtFrTo" Text='<%#Eval("S27SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s27ColorLbl" Text='<%#Eval("s27color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s27PernameLbl" Text='<%#Eval("s27Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AB" ItemStyle-Wrap="false" UniqueName="28" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname28" runat="server" Text='<%#Eval("s28Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s28CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname28" runat="server" Text='<%#Eval("s28Job") %>'
                            ToolTip='<%#Eval("s28Job") %>' OnClientClick='<%# Eval("s28CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s28ctnrno" Text='<%#Eval("s28ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s28ctnrtype" Text='<%#Eval("s28ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S28SvcPtFrTo" Text='<%#Eval("S28SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s28ColorLbl" Text='<%#Eval("s28color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s28PernameLbl" Text='<%#Eval("s28Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AC" ItemStyle-Wrap="false" UniqueName="29" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname29" runat="server" Text='<%#Eval("s29Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s29CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname29" runat="server" Text='<%#Eval("s29Job") %>'
                            ToolTip='<%#Eval("s29Job") %>' OnClientClick='<%# Eval("s29CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s29ctnrno" Text='<%#Eval("s29ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s29ctnrtype" Text='<%#Eval("s29ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S29SvcPtFrTo" Text='<%#Eval("S29SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s29ColorLbl" Text='<%#Eval("s29color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s29PernameLbl" Text='<%#Eval("s29Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AD" ItemStyle-Wrap="false" UniqueName="30" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname30" runat="server" Text='<%#Eval("s30Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s30CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname30" runat="server" Text='<%#Eval("s30Job") %>'
                            ToolTip='<%#Eval("s30Job") %>' OnClientClick='<%# Eval("s30CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s30ctnrno" Text='<%#Eval("s30ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s30ctnrtype" Text='<%#Eval("s30ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S30SvcPtFrTo" Text='<%#Eval("S30SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s30ColorLbl" Text='<%#Eval("s30color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s30PernameLbl" Text='<%#Eval("s30Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AE" ItemStyle-Wrap="false" UniqueName="31" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname31" runat="server" Text='<%#Eval("s31Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s31CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname31" runat="server" Text='<%#Eval("s31Job") %>'
                            ToolTip='<%#Eval("s31Job") %>' OnClientClick='<%# Eval("s31CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s31ctnrno" Text='<%#Eval("s31ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s31ctnrtype" Text='<%#Eval("s31ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S31SvcPtFrTo" Text='<%#Eval("S31SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s31ColorLbl" Text='<%#Eval("s31color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s31PernameLbl" Text='<%#Eval("s31Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AF" ItemStyle-Wrap="false" UniqueName="32" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname32" runat="server" Text='<%#Eval("s32Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s32CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname32" runat="server" Text='<%#Eval("s32Job") %>'
                            ToolTip='<%#Eval("s32Job") %>' OnClientClick='<%# Eval("s32CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s32ctnrno" Text='<%#Eval("s32ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s32ctnrtype" Text='<%#Eval("s32ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S32SvcPtFrTo" Text='<%#Eval("S32SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s32ColorLbl" Text='<%#Eval("s32color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s32PernameLbl" Text='<%#Eval("s32Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AG" ItemStyle-Wrap="false" UniqueName="33" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname33" runat="server" Text='<%#Eval("s33Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s33CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname33" runat="server" Text='<%#Eval("s33Job") %>'
                            ToolTip='<%#Eval("s33Job") %>' OnClientClick='<%# Eval("s33CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s33ctnrno" Text='<%#Eval("s33ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s33ctnrtype" Text='<%#Eval("s33ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S33SvcPtFrTo" Text='<%#Eval("S33SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s33ColorLbl" Text='<%#Eval("s33color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s33PernameLbl" Text='<%#Eval("s33Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AH" ItemStyle-Wrap="false" UniqueName="34" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname34" runat="server" Text='<%#Eval("s34Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s34CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname34" runat="server" Text='<%#Eval("s34Job") %>'
                            ToolTip='<%#Eval("s34Job") %>' OnClientClick='<%# Eval("s34CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s34ctnrno" Text='<%#Eval("s34ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s34ctnrtype" Text='<%#Eval("s34ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S34SvcPtFrTo" Text='<%#Eval("S34SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s34ColorLbl" Text='<%#Eval("s34color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s34PernameLbl" Text='<%#Eval("s34Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AI" ItemStyle-Wrap="false" UniqueName="35" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname35" runat="server" Text='<%#Eval("s35Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s35CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname35" runat="server" Text='<%#Eval("s35Job") %>'
                            ToolTip='<%#Eval("s35Job") %>' OnClientClick='<%# Eval("s35CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s35ctnrno" Text='<%#Eval("s35ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s35ctnrtype" Text='<%#Eval("s35ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S35SvcPtFrTo" Text='<%#Eval("S35SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s35ColorLbl" Text='<%#Eval("s35color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s35PernameLbl" Text='<%#Eval("s35Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AJ" ItemStyle-Wrap="false" UniqueName="36" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname36" runat="server" Text='<%#Eval("s36Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s36CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname36" runat="server" Text='<%#Eval("s36Job") %>'
                            ToolTip='<%#Eval("s36Job") %>' OnClientClick='<%# Eval("s36CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s36ctnrno" Text='<%#Eval("s36ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s36ctnrtype" Text='<%#Eval("s36ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S36SvcPtFrTo" Text='<%#Eval("S36SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s36ColorLbl" Text='<%#Eval("s36color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s36PernameLbl" Text='<%#Eval("s36Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AK" ItemStyle-Wrap="false" UniqueName="37" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname37" runat="server" Text='<%#Eval("s37Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s37CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname37" runat="server" Text='<%#Eval("s37Job") %>'
                            ToolTip='<%#Eval("s37Job") %>' OnClientClick='<%# Eval("s37CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s37ctnrno" Text='<%#Eval("s37ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s37ctnrtype" Text='<%#Eval("s37ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S37SvcPtFrTo" Text='<%#Eval("S37SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s37ColorLbl" Text='<%#Eval("s37color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s37PernameLbl" Text='<%#Eval("s37Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AL" ItemStyle-Wrap="false" UniqueName="38" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname38" runat="server" Text='<%#Eval("s38Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s38CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname38" runat="server" Text='<%#Eval("s38Job") %>'
                            ToolTip='<%#Eval("s38Job") %>' OnClientClick='<%# Eval("s38CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s38ctnrno" Text='<%#Eval("s38ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s38ctnrtype" Text='<%#Eval("s38ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S38SvcPtFrTo" Text='<%#Eval("S38SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s38ColorLbl" Text='<%#Eval("s38color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s38PernameLbl" Text='<%#Eval("s38Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AM" ItemStyle-Wrap="false" UniqueName="39" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname39" runat="server" Text='<%#Eval("s39Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s39CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname39" runat="server" Text='<%#Eval("s39Job") %>'
                            ToolTip='<%#Eval("s39Job") %>' OnClientClick='<%# Eval("s39CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s39ctnrno" Text='<%#Eval("s39ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s39ctnrtype" Text='<%#Eval("s39ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S39SvcPtFrTo" Text='<%#Eval("S39SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s39ColorLbl" Text='<%#Eval("s39color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s39PernameLbl" Text='<%#Eval("s39Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="AN" ItemStyle-Wrap="false" UniqueName="40" ItemStyle-CssClass="break-word">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname40" runat="server" Text='<%#Eval("s40Job") %>'
                                    OnCommand="RadWindow_Popup" CommandArgument='<%# Eval("s40CtrId")  %>' />
                                <%--<asp:LinkButton ForeColor="Black" ID="lnkname40" runat="server" Text='<%#Eval("s40Job") %>'
                            ToolTip='<%#Eval("s40Job") %>' OnClientClick='<%# Eval("s40CtrId", "return popupDetail(\"{0}\");") %>' />--%>
                            &nbsp;
                            <asp:Label ID="s40ctnrno" Text='<%#Eval("s40ctnrno") %>' runat="server" />&nbsp;
                            <asp:Label ID="s40ctnrtype" Text='<%#Eval("s40ctnrtype") %>' runat="server" /><br />
                                <asp:Label ID="S40SvcPtFrTo" Text='<%#Eval("S40SvcPtFrTo") %>' runat="server" />
                                <asp:Label ID="s40ColorLbl" Text='<%#Eval("s40color") %>' runat="server" Visible="false" />
                                <asp:Label ID="s40PernameLbl" Text='<%#Eval("s40Pername") %>' runat="server" CssClass="break-word" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
