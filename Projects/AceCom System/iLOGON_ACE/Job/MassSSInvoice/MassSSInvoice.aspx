<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="MassSSInvoice.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.MassSSInvoice.MassSSInvoice" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>MassSSInvoice</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        //function CheckAll(chk) {
        //    all = document.getElementsByTagName("input");
        //    for (i = 0; i < all.length; i++) {
        //        if (all[i].type == "checkbox" && all[i].id.indexOf("ResultDG_ct") > -1) {
        //            all[i].checked = chk.checked;
        //        }
        //    }
        //}
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
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
                <br />
                <asp:Button ID="RetrieveBtn" runat="server" CssClass="white" Text="Retrieve"
                    OnClick="RetrieveBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="GenerateBtn" runat="server" CssClass="white" Text="Generate"
                    OnClick="GenerateBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="ResetBtn" runat="server" CssClass="white" Text="Reset"
                    OnClick="ResetBtn_Click"  UseSubmitBehavior="false" CausesValidation="false"/>
                &nbsp;
                <br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" BorderStyle="None" GridLines="Both" CellPadding="2"
            AutoGenerateColumns="False" DataKeyField="id" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                         <input type="checkbox" id="mainCB" onclick="javascript:selectAll(this);" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="acid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="accode" HeaderText="Account">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="acname" HeaderText="Name">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="qucode" HeaderText="Quotation">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="validtilldate" HeaderText="ValidTillDate" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="drid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="invno" HeaderText="Invoice">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="BillPeriod" HeaderText="BillPeriod">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="billingtype" HeaderText="BillingType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>

</body>
</html>
