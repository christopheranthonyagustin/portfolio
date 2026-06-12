<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelPayRoll.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelPayRoll" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PersonnelPayRoll</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="DescrLbl" runat="server" Visible="false"></asp:Label>
                    <asp:Button ID="AddBtn" runat="server" CssClass="detailButton" Text="NewLine" OnClick="AddBtn_Click">
                    </asp:Button>
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;</div>
            </td>
            <td align="left">
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" OnCancelCommand="ResultDG_Cancel"
            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" GridLines="Both"
            CellPadding="2" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="ResultDG_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="..\..\image\floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="..\..\image\arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="EffectiveDate" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <div style="position: relative">
                            <asp:TextBox runat="server" Width="100px" ID="EffDate1Txt" Text='<%# DataBinder.Eval(Container.DataItem, "effectivedate", "{0:dd/MMM/yyyy}") %>'>
                            </asp:TextBox>
                            <asp:CalendarExtender ID="EffDate1Txt_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="EffDate1Txt" DaysModeTitleFormat="dd/MMM/yyyy" TodaysDateFormat="dd/MMM/yyyy"
                                Format="dd/MMM/yyyy">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="EffDate1Req" runat="server" ErrorMessage="*" ControlToValidate="EffDate1Txt"
                                Enabled="false"></asp:RequiredFieldValidator>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "effectivedate", "{0:dd/MMM/yyyy}")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Items" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PerPayRollItemList" Enabled="True" DataTextField="Descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerPayRollItemListDS,DataBinder.Eval(Container.DataItem, "item").ToString())%>'
                            runat="server" DataSource='<%# PerPayRollItemListDS%>' Width="155px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "itemsdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Type" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PerPayRollTypeList" Enabled="True" DataTextField="Descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerPayRollTypeListDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'
                            runat="server" DataSource='<%# PerPayRollTypeListDS%>' Width="155px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "typedescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Cat" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PerPayRollCatList" Enabled="True" DataTextField="Descr" DataValueField="item"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerPayRollCatListDS,DataBinder.Eval(Container.DataItem, "cat").ToString())%>'
                            runat="server" DataSource='<%# PerPayRollCatListDS%>' Width="155px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "catdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="QtyTxt" runat="server" Width="80" AutoPostBack="true" Value='<%# DataBinder.Eval(Container.DataItem, "qty") %>' /><asp:RequiredFieldValidator
                            ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="QtyTxtZeroVal"
                                    runat="server" ControlToValidate="QtyTxt" EnableClientScript="True" ErrorMessage="#"
                                    Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %><br />
                        <asp:Label ID="QtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.##}") %>'
                            Visible="false" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Rate($)" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <asp:TextBox ID="RateTxt" runat="server" Width="80" Value='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>' /><asp:RequiredFieldValidator
                            ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt" ErrorMessage="*" /><asp:CompareValidator
                                ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt" EnableClientScript="True"
                                ErrorMessage="#" Operator="DataTypeCheck" Type="Double" /><asp:CompareValidator ID="RateTxtZeroVal"
                                    runat="server" ControlToValidate="RateTxt" EnableClientScript="True" ErrorMessage="#"
                                    Operator="GreaterThanEqual" ValueToCompare="0" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>
                        <asp:Label ID="RateLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'
                            Visible="false" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Remarks" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="RemTxt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'
                            TextMode="MultiLine" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "remarks") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserDef01" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="ud1Txt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef01") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "usrdef01")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserDef02" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="ud2Txt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef02") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "usrdef02")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserDef03" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="ud3Txt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef03") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "usrdef03")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserDef04" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="ud4Txt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef04") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "usrdef04")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="UserDef05" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <asp:TextBox ID="ud5Txt" runat="server" Width="155" Text='<%# DataBinder.Eval(Container.DataItem, "usrdef05") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "usrdef05")%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Status" ItemStyle-Wrap="false">
                    <EditItemTemplate>
                        <asp:DropDownList ID="PerPayRollStatusList" Enabled="True" DataTextField="Descr"
                            DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(PerPayRollStatusListDS,DataBinder.Eval(Container.DataItem, "status").ToString())%>'
                            runat="server" DataSource='<%# PerPayRollStatusListDS%>' Width="155px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "statusdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statuscolor" Visible="false"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
