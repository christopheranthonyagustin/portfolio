<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocEnquiryV2.aspx.cs" Inherits="iWMS.Web.Graphlet.General.LocEnquiryV2"
    EnableEventValidation="false" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>LocationOccupancy</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script src="../../js/jquery.hoverflow.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#LocationCatList').change(function () {
                if ($('#LocationCatList').get(0).selectedIndex != 0) {
                    $('#btnGetGraphlet').removeAttr('disabled');
                } else {
                    $("#btnGetGraphlet").attr('disabled', 'disabled');
                }
            });
        });
    </script>
    <style type="text/css">
        a:link {
            color: white;
        }

        a:visited {
            color: White;
        }

        .errorLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 8pt;
            color: Red;
        }

        .aisleLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 20pt;
            color: DarkBlue;
        }

        .remarksLabel {
            font-family: Arial,Verdana,sans-serif;
            font-weight: bold;
            font-size: 12pt;
            color: DarkBlue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div id="content">
            <%--<span class="label">Site</span><asp:dropdownlist id="SiteList" runat="server"></asp:dropdownlist>
		<asp:CascadingDropDown ID="cddSite" runat="server"
		ServicePath="WebService1.asmx" ServiceMethod="GetAllSites"
		TargetControlID="SiteList" Category="Site" PromptText="[Select Site]" />
		<br />
		<span class="label">Category</span><asp:dropdownlist id="LocationCatList" runat="server"></asp:dropdownlist>
		<asp:CascadingDropDown ID="cddLocationCat" runat="server"
		ServicePath="WebService1.asmx" ServiceMethod="GetLocationCatForSite"
		TargetControlID="LocationCatList" ParentControlID="SiteList"
		Category="LocationCat" PromptText="[Select Category]" />
		<br />
		<span class="label">Aisle</span><asp:DropDownList ID="AisleList" runat="server"></asp:DropDownList>
		<asp:CascadingDropDown ID="cddAisle" runat="server"
		ServicePath="WebService1.asmx" ServiceMethod="GetAislesForSite" 
		TargetControlID="AisleList" ParentControlID="LocationCatList"
		Category="Aisle" PromptText="[Select Floor]" />--%>
           <table border="0" cellpadding="0" cellspacing="0" width="80%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="80%">
                            <tr>
                                <td width="8%">
                                    <asp:Label ID="Label2" runat="server" Text="Site" />
                                </td>
                                <td width="92%" colspan="4">
                                    <telerik:RadDropDownList ID="SiteList" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="SiteList_SelectedIndexChanged" AutoPostBack="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" height="3px">
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="8%">
                                    <asp:Label ID="Label3" runat="server" Text="Category" />
                                </td>
                                <td width="92%" colspan="4">
                                    <telerik:RadDropDownList ID="LocationCatList" runat="server" Skin="Sunset" BackColor="#ded7c6"
                                        OnSelectedIndexChanged="LocCatList_SelectedIndexChanged" AutoPostBack="True" Width="155px">
                                    </telerik:RadDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td width="8%" align="left" valign="top">
                                    <asp:Label ID="AisleLbl" runat="server" Text="Aisle" />
                                </td>
                                <td width="15%">
                                    <telerik:RadListBox runat="server" ID="AvailAisleList" Height="100px" Width="180px"
                                        ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedAisleList"
                                        TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                                        Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                                        OnTransferred="AvailAisleList_Transferred">
                                    </telerik:RadListBox>
                                </td>
                                <td width="25%">
                                    <telerik:RadListBox runat="server" ID="SelectedAisleList" Height="100px" Width="160px"
                                        Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                                        AllowDelete="false" BackColor="Yellow">
                                    </telerik:RadListBox>
                                </td>
                                <td width="25%"></td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:Button ID="btnGetGraphlet" CssClass="white" runat="server" OnClick="btnGetGraphlet_Click"
                                        Text="Submit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    <br />
                                    <br />
                                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>                   
                    </td>
                    <td></td>                   
                    <td valign="top" align="left">
                        <table>
                            <tr>
                                <td class="style1">
                                    <br />
                                    &nbsp;<asp:Label ID="Label1" Text="Processing Rules:" Font-Size="17px" Font-Bold="true" runat="server"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Label ID="Label4" Text="1. Locations with Flag='Inactive' will be excluded" Font-Size="15px" runat="server"></asp:Label>
                                    <br />
                                    &nbsp;<asp:Label ID="Label5" Text="2. Legends" Font-Size="15px" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <table style="width: 100%; text-align: left; border-collapse: collapse; border: 1px solid black">
                                        <tr>
                                            <td style="border: 1px solid black; background-color: red; width: 50px"></td>
                                            <td style="border: 1px solid black">Occupied</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: green; width: 50px"></td>
                                            <td style="border: 1px solid black">Empty</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: Gray; width: 50px"></td>
                                            <td style="border: 1px solid black">Unavailable</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: yellow; width: 50px"></td>
                                            <td style="border: 1px solid black">Occupied and pending putaway</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid black; background-color: blue; width: 50px"></td>
                                            <td style="border: 1px solid black">Empty and pending putaway</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <div class="padding25" style="border-bottom: 1px solid #ccc;">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <br />
            </div>
        </div>
    </form>
</body>
</html>
