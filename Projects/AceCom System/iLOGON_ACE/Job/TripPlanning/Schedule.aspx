<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="iWMS.Web.Job.TripPlanning.Schedule" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function fun1(id) {
            //var abc = document.getElementById(window.event.srcElement.id).getAttribute("ID");
            window.showModalDialog("Detail.aspx?id=" + id);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="ResultDG" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="vehno" HeaderText="VehNo" SortExpression="VehNo" />
                <asp:TemplateField HeaderText="s1Job">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkname1" runat="server" Text='<%#Eval("s1Job") %>' ToolTip='<%#Eval("S2Color") %>'
                            OnClientClick='<%# Eval("s1Job", "return fun1(\"{0}\");") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="s2Job">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkname2" runat="server" Text='<%#Eval("s2Job") %>' PostBackUrl='<%#"~/Job/TripPlanning/Detail.aspx?ID="+Eval("S2CtrId") %>'>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
