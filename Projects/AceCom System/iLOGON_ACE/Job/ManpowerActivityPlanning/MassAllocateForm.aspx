<%@ Page Language="c#" CodeBehind="MassAllocateForm.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.ManpowerActivityPlanning.MassAllocateForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manpower Personnel Allocation</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

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

</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td class="ModuleTitle" align="right">
                    <asp:Label ID="Label3" Style="color: Black; font-size: medium; font-weight: bold; padding-right: 25px;" runat="server">Manpower Personnel Allocation</asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Atvtlbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
            </tr>
        </table>
        <table id="table1" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                    <br />
                    <asp:Button Style="z-index: 0" ID="AddBtn" runat="server" CssClass="detailButton"
                        Visible="false" Text="Add" OnClick="AddBtn_Click"></asp:Button>
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="OpenBtn" runat="server" Text="Open" Visible="true"
                        CssClass="detailButton" OnClick="OpenBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="AssignBtn" runat="server" Text="Assign" Visible="true" CssClass="detailButton"
                        OnClick="AssignBtn_Click" Width="100px"></asp:Button>
                    &nbsp;<asp:Button ID="CompletedBtn" runat="server" Text="Completed" Visible="true"
                        CssClass="detailButton" OnClick="CompletedBtn_Click" Width="100px"></asp:Button>
                    &nbsp;
                <asp:Button Style="z-index: 0" ID="Cancel" runat="server" CssClass="detailButton"
                    Visible="True" Text="Cancel" OnClick="CancelBtn_Click" CausesValidation="false"></asp:Button>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;
                <asp:Label ID="QuaManpowerTypeLbl" runat="server" Font-Bold="true" Text="QualifyManpowerType"></asp:Label>
                    <telerik:RadComboBox ID="QuaManpowerTypeDDL" runat="server" DataMember="" OnSelectedIndexChanged="QuaManpowerTypeLbl_SelectedIndexChanged"
                        DataTextField="descr" DataValueField="item" AutoPostBack="true" Skin="WebBlue"
                        Width="300px" RenderMode="Lightweight" Filter="Contains">
                    </telerik:RadComboBox>
                </td>
            </tr>
        </table>
        <table border="0">
            <tr>
                <td style="width: 95px;" align="right">
                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="ActivityExpStartDate"></asp:Label>
                </td>
                <td style="width: 180px;">
                    <asp:TextBox ID="jbperatvtFromDateTxt" runat="server" Enabled="false"></asp:TextBox>
                </td>
                <td style="width: 95px;" align="right">
                    <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="PerPlanStartDate"></asp:Label>
                    <asp:Label ID="originalFrExpDateLbl" runat="server" Visible="false" />
                </td>
                <td style="width: 180px;">
                    <telerik:RadDateTimePicker ID="FrDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                        Skin="Office2007" PopupDirection="TopRight" AutoPostBackControl="Both" OnSelectedDateChanged="FrDateTimePicker_OnDateSelectedChanged">
                        <Calendar>
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque">
                                    <ItemStyle BackColor="Bisque"></ItemStyle>
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
                        <TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>
                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                        <DateInput DisplayDateFormat="dd/MMM/yyyy HH:mm" DateFormat="dd/MMM/yyyy HH:mm" LabelWidth="40%"
                            AutoPostBack="True">
                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                            <FocusedStyle Resize="None"></FocusedStyle>
                            <DisabledStyle Resize="None"></DisabledStyle>
                            <InvalidStyle Resize="None"></InvalidStyle>
                            <HoveredStyle Resize="None"></HoveredStyle>
                            <EnabledStyle Resize="None"></EnabledStyle>
                        </DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:RadDateTimePicker>
                    <asp:RequiredFieldValidator runat="server" ID="RFV1" ControlToValidate="FrDateTimePicker"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="certrequiredLbl" runat="server" Text="test"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;<asp:Label ID="frservicept" runat="server" Text="test"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;<asp:Label ID="toservicept" runat="server" Text="test"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 95px;" align="right">
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="ActivityExpEndDate"></asp:Label>
                </td>
                <td style="width: 180px;">
                    <asp:TextBox ID="jbperatvtToDateTxt" runat="server" Enabled="false"></asp:TextBox>
                </td>
                <td style="width: 95px;" align="right">
                    <asp:Label ID="Label17" runat="server" Font-Bold="true" Text="PerPlanEndDate"></asp:Label>
                </td>
                <td style="width: 180px;">
                    <telerik:RadDateTimePicker ID="ToDateTimePicker" Width="100%" runat="server" DateInput-DateFormat="dd/MMM/yyyy HH:mm"
                        Skin="Office2007" PopupDirection="TopRight">
                        <Calendar>
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                        <TimeView Interval="00:30:00" TimeFormat="HH:mm" />
                    </telerik:RadDateTimePicker>
                    <asp:RequiredFieldValidator runat="server" ID="RFV2" ControlToValidate="ToDateTimePicker"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="manpowerqtyLbl" runat="server" Text="test"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;
                <asp:Label ID="manpowerremarksLbl" runat="server" Text="test"></asp:Label>
                    </br>
                </td>
                <td>&nbsp;&nbsp;<asp:Label ID="activityremarksLbl" runat="server" Text="test"></asp:Label>
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowFilteringByColumn="true"
            OnNeedDataSource="ResultDG_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
            <ItemStyle Wrap="true"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="type"
                        Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="name" SortExpression="name" HeaderText="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="perAbsent" SortExpression="perAbsent" HeaderText="Absent"
                        ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Red">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="docket" SortExpression="docket" HeaderText="Docket(s)"
                        Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
