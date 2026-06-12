<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocStats.aspx.cs" Inherits="iWMS.Web.Graphlet.General.LocStats"
    EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/login.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../js/jquery.js"></script>

    <script src="../../js/jquery.hoverflow.min.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        $('#LocationCatList').change(function() {
            if ($('#LocationCatList').get(0).selectedIndex != 0) {
                $('#btnGetGraphlet').removeAttr('disabled');
            } else {
                $("#btnGetGraphlet").attr('disabled', 'disabled');
            }
        });
    });
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="content">
        <span class="label">Account</span><asp:DropDownList ID="AccountList" runat="server">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="cddAccount" runat="server" ServicePath="WebService1.asmx"
            ServiceMethod="GetAccounts" TargetControlID="AccountList" Category="Account"
            PromptText="[Select Account]" />
        <br />
        <span class="label">Site</span><asp:DropDownList ID="SiteList" runat="server">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="cddSite" runat="server" ServicePath="WebService1.asmx"
            ServiceMethod="GetSitesForAccount" TargetControlID="SiteList" ParentControlID="AccountList"
            Category="Site" PromptText="[Select Site]" />
        <br />
        <%--		<span class="label">Zone</span><asp:dropdownlist id="ZoneList" runat="server"></asp:dropdownlist>
		<asp:CascadingDropDown ID="cddZone" runat="server"
		ServicePath="WebService1.asmx" ServiceMethod="GetZonesForSite"
		TargetControlID="ZoneList" ParentControlID="SiteList"
		Category="Zone" PromptText="[Select Zone]" />
		<br />--%>
        <span class="label">Category</span><asp:DropDownList ID="LocationCatList" runat="server">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="cddLocationCat" runat="server" ServicePath="WebService1.asmx"
            ServiceMethod="GetLocationCatForZone" TargetControlID="LocationCatList" ParentControlID="SiteList"
            Category="LocationCat" PromptText="[Select Category]" />
        <br />
        <br />
        <span class="label">Floor</span><asp:DropDownList ID="FloorList" runat="server">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="cddFloor" runat="server" ServicePath="WebService1.asmx"
            ServiceMethod="GetFloors" TargetControlID="FloorList" ParentControlID="LocationCatList"
            Category="Floor" PromptText="[Select Floor]" />
        <br />
        <span class="label">Section</span><asp:DropDownList ID="SectionList" runat="server">
        </asp:DropDownList>
        <asp:CascadingDropDown ID="cddSection" runat="server" ServicePath="WebService1.asmx"
            ServiceMethod="GetSections" TargetControlID="SectionList" ParentControlID="FloorList"
            Category="Section" PromptText="[Select Section]" />
        <br />
        <asp:Button ID="btnGetGraphlet" runat="server" Text="Get Graphlet" OnClick="btnGetGraphlet_Click" />
        <div class="padding25" style="border-bottom: 1px solid #ccc;">
        </div>
        <div class="padding25">
        </div>
        <asp:Literal ID="litOutput" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
