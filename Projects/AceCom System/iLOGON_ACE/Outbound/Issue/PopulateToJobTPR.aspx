<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="PopulateToJobTPR.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.PopulateToJobTPR" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssuePopulateToJobTPR</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript">
		    function SelectAllCheckboxesSpecific(spanChk) {
		        var IsChecked = spanChk.checked;
		        var Chk = spanChk;
		        Parent = document.getElementById('ResultDG');
		        var items = Parent.getElementsByTagName('input');
		        for (i = 0; i < items.length; i++) {
		            if (items[i].id != Chk && items[i].type == "checkbox") {
		                if (items[i].checked != IsChecked) {
		                    items[i].click();
		                }
		            }
		        }
		    }
 
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
        width="100%">
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="RetrieveBtn" runat="server" CssClass="detailbutton" Text="Retrieve"
                    OnClick="RetrieveBtn_Click" />
                &nbsp;<asp:Button ID="GenerateBtn" runat="server" CssClass="detailbutton" Text="Populate"
                    OnClick="GenerateBtn_Click" />
                &nbsp;<asp:Button ID="ResetBtn" runat="server" CssClass="detailbutton" Text="Reset"
                    OnClick="ResetBtn_Click" />
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="height: 65%">
        <asp:DataGrid ID="ResultDG" runat="server" BorderStyle="None" GridLines="Both" CellPadding="2"
            AutoGenerateColumns="False" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkAll" onclick="javascript:SelectAllCheckboxesSpecific(this);"
                            runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server" Checked="true"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn Visible="true" HeaderText="No">
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="acid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="accode" HeaderText="Account">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="number" HeaderText="IssueNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="exref2" HeaderText="CustRefNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="expdate" HeaderText="ExpDate" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shname" HeaderText="Consignee">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jobno" HeaderText="JobNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="noofpkg" SortExpression="noofpkg" HeaderText="Packages"
                    DataFormatString="{0:#,0}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="noofplt" SortExpression="noofplt" HeaderText="Pallets"
                    DataFormatString="{0:#,0}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="totaltu" SortExpression="totaltu" HeaderText=" Co-Load"
                    DataFormatString="{0:#,0}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="sphvehno" SortExpression="sphvehno" HeaderText="VehNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
