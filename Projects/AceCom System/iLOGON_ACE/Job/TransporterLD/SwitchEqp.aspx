<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SwitchEqp.aspx.cs" Inherits="iWMS.Web.Job.TransporterLD.SwitchEqp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SwitchEqp</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>
     <script type="text/javascript">
         function GetRadWindow() {
             var oWindow = null; if (window.radWindow)
                 oWindow = window.radWindow; else if (window.frameElement.radWindow)
                 oWindow = window.frameElement.radWindow; return oWindow;
         }

         function closeWin(url) {
             GetRadWindow().BrowserWindow.location.href = url;
             GetRadWindow().close();
         }

         function close() {
             GetRadWindow().close();
         }
     </script>

    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td>
                <asp:Label ID="JobLbl" runat="server" Text="JobNo"></asp:Label><br />
                <asp:TextBox ID="JobNo" runat="server" OnTextChanged="JobNo_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="AccLbl" runat="server" Text="Account"></asp:Label><br />
                <asp:TextBox ID="accTxt" runat="server" Enabled="false"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Vessel<br />
                <asp:TextBox ID="VesselTxt" runat="server" Enabled="false"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="3">
                <table width="100%">
                    <tr>
                        <td valign="top" style="width: 35%">
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" OnItemDataBound="ResultDG_ItemDataBound"
                                AllowSorting="true" EnableLinqExpressions="false" Skin="Office2007">
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView DataKeyNames="id">
                                    <Columns>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="sno" AllowFiltering="false">
                                            <HeaderTemplate>
                                                S/N
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <%#Container.ItemIndex+1%>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="BookingReference" DataField="bkref" ColumnGroupName="bkref"
                                            SortExpression="bkref">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="ContainerNo" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="cntNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ctnrno") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="STC (SaidToContain)" DataField="descr" ColumnGroupName="descr"
                                            SortExpression="descr">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="status" AllowFiltering="false">
                                            <HeaderTemplate>
                                                status
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="StatusList" Enabled="True" DataTextField="descr" DataValueField="item"
                                                    SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(statusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                                                    runat="server" DataSource='<%#statusListDS%>' Width="100px"  />
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="NewCntNo" AllowFiltering="false">
                                            <HeaderTemplate>
                                                NewContainerNo
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="NewCntNoTxt" runat="server" OnTextChanged="NewCntNo_TextChanged"
                                                    AutoPostBack="true"></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="orgbkref" AllowFiltering="false">
                                            <HeaderTemplate>
                                                OriginalBkReference
                                            </HeaderTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="OrgBkRefLbl" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id" />
                                        <telerik:GridBoundColumn Display="False" DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="SaveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" CssClass="detailButton" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
