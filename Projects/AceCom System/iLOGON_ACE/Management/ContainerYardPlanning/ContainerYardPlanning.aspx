<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerYardPlanning.aspx.cs"
    Inherits="iWMS.Web.Management.ContainerYardPlanning.ContainerYardPlanning" EnableEventValidation="false" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="Tabs" Src="../../Control/Tabs.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="title1" runat="server"></title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <base target="_self">
    <style type="text/css">
        .style2
        {
            width: 150px;
        }
    </style>

    <script src="../../js/jquery.hideNshow.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="10">
    <form id="form1" runat="server" method="post">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table id="table1" runat="server" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="20%">
                <%--  <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>--%>
            </td>
            <td width="60%" align="center">
                <asp:Button ID="prevBtn" runat="server" Text="<<" ToolTip="View Previous Mth Schedule"
                    OnClick="prevnextBtn_Clicked" />
                <asp:Label ID="mthyrLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <asp:Button ID="nextBtn" runat="server" Text=">>" ToolTip="View Next Mth Schedule"
                    OnClick="prevnextBtn_Clicked" />
            </td>
            <td width="20%">
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid">
        <asp:UpdatePanel ID="updatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:DataGrid ID="ResultDG" runat="server" GridLines="Both" CellPadding="2" AutoGenerateColumns="False"
                    AllowSorting="False" UseAccessibleHeader="True" Width="100%" Height="100%">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="Sun" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname1" runat="server" Text='<%#Eval("typeDesc01") %>'
                                    CommandArgument='<%# Eval("typeDesc01") %>' ToolTip='Click to view Yard Planning Detail'
                                    OnCommand="RadWindow_PopupDetail" CommandName="Open" />
                                <asp:Label ID="type1" Text='<%#Eval("type01") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr1" Text='<%#Eval("noofCtnr01") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail01" Text='<%#Eval("CtnrDetail01") %>' runat="server" />
                                <asp:Label ID="clr1" Text='<%#Eval("clr01") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Mon" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname2" runat="server" Text='<%#Eval("typeDesc02") %>'
                                    ToolTip='Click to view Yard Planning Detail' OnCommand="RadWindow_PopupDetail"
                                    CausesValidation="false" CommandArgument='<%# Eval("typeDesc02") %>' />
                                <asp:Label ID="type2" Text='<%#Eval("type02") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr2" Text='<%#Eval("noofCtnr02") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail02" Text='<%#Eval("CtnrDetail02") %>' runat="server" />
                                <asp:Label ID="clr2" Text='<%#Eval("clr02") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Tue" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname3" runat="server" Text='<%#Eval("typeDesc03") %>'
                                    CommandArgument='<%# Eval("typeDesc03") %>' ToolTip='Click to view Yard Planning Detail'
                                    CausesValidation="false" OnCommand="RadWindow_PopupDetail" />
                                <asp:Label ID="type3" Text='<%#Eval("type03") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr3" Text='<%#Eval("noofCtnr03") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail03" Text='<%#Eval("CtnrDetail03") %>' runat="server" />
                                <asp:Label ID="clr3" Text='<%#Eval("clr03") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Wed" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname4" runat="server" Text='<%#Eval("typeDesc04") %>'
                                    CommandArgument='<%# Eval("typeDesc04") %>' ToolTip='Click to view Yard Planning Detail'
                                    CausesValidation="false" OnCommand="RadWindow_PopupDetail" />
                                <asp:Label ID="type4" Text='<%#Eval("type04") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr4" Text='<%#Eval("noofCtnr04") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail04" Text='<%#Eval("CtnrDetail04") %>' runat="server" />
                                <asp:Label ID="clr4" Text='<%#Eval("clr04") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Thu" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname5" runat="server" Text='<%#Eval("typeDesc05") %>'
                                    CommandArgument='<%# Eval("typeDesc05") %>' ToolTip='Click to view Yard Planning Detail'
                                    CausesValidation="false" OnCommand="RadWindow_PopupDetail" />
                                <asp:Label ID="type5" Text='<%#Eval("type04") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr5" Text='<%#Eval("noofCtnr05") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail05" Text='<%#Eval("CtnrDetail05") %>' runat="server" />
                                <asp:Label ID="clr5" Text='<%#Eval("clr05") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Fri" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname6" runat="server" Text='<%#Eval("typeDesc06") %>'
                                    CommandArgument='<%# Eval("typeDesc06") %>' ToolTip='Click to view Yard Planning Detail'
                                    CausesValidation="false" OnCommand="RadWindow_PopupDetail" />
                                <asp:Label ID="type6" Text='<%#Eval("type06") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr6" Text='<%#Eval("noofCtnr06") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail06" Text='<%#Eval("CtnrDetail06") %>' runat="server" />
                                <asp:Label ID="clr6" Text='<%#Eval("clr06") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Sat" ItemStyle-Wrap="true" ItemStyle-CssClass="style2">
                            <ItemTemplate>
                                <asp:LinkButton ForeColor="Black" ID="lnkname7" runat="server" Text='<%#Eval("typeDesc07") %>'
                                    CommandArgument='<%# Eval("typeDesc07") %>' ToolTip='Click to view Yard Planning Detail'
                                    CausesValidation="false" OnCommand="RadWindow_PopupDetail" />
                                <asp:Label ID="type7" Text='<%#Eval("type06") %>' runat="server" Visible="false" />
                                <asp:Label ID="noofCtnr7" Text='<%#Eval("noofCtnr07") %>' runat="server" /><br />
                                <asp:Label ID="CtnrDetail07" Text='<%#Eval("CtnrDetail07") %>' runat="server" />
                                <asp:Label ID="clr7" Text='<%#Eval("clr07") %>' runat="server" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </ContentTemplate>
            <%-- <Triggers>
                <asp:AsyncPostBackTrigger ControlID="prevBtn" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="nextBtn" EventName="Click" />
            </Triggers>--%>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
