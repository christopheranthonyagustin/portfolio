<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="EmailSchedule" Src="../../Control/EmailScheduleCtl.ascx" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueUpload.aspx.cs" Inherits="iWMS.Web.Outbound.Issue.IssueUpload" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>IssueUpload</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" class="style1">
                <table>
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </td> </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="RetrieveBtn" CausesValidation="false" runat="server" Text="Retrieve"
                CssClass="detailButton" OnClick="RetrieveBtn_Click"></asp:Button>&nbsp;&nbsp;
            <asp:Button ID="UploadBtn" CausesValidation="false" runat="server" Text="Upload"
                CssClass="detailButton" OnClick="UploadBtn_Click"></asp:Button>&nbsp;
            <br />
            <asp:Label ID="MessageLbl" runat="server" Visible="False" CssClass="errorLabel"></asp:Label>
            <br />
            <div id="div-datagrid">
                <asp:DataGrid ID="ResultDG" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    BorderStyle="None" CellPadding="2" DataKeyField="uniqueid" GridLines="Both" PageSize="8"
                    UseAccessibleHeader="True">
                    <AlternatingItemStyle CssClass="DGAlternateItem" />
                    <ItemStyle CssClass="DGItem" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="S/No" Visible="False">
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="exref1" HeaderText="CustomerRef" SortExpression="exref1">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="shname" HeaderText="Consignee" SortExpression="shname">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="statusdescr" HeaderText="Status" SortExpression="statusdescr">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="isid" HeaderText="Issue" SortExpression="isid">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundColumn>
                    </Columns>
                    <PagerStyle ForeColor="Black" HorizontalAlign="Left" Mode="NumericPages" />
                </asp:DataGrid>
            </div>
        </td>
    </tr>
    </table>
    </form>
</body>
</html>
