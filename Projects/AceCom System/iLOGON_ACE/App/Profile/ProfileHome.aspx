<%@ Page Language="c#" CodeBehind="ProfileHome.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.App.Profile.ProfileHome" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>ProfileHome</title>
    <meta content="IE=9" />
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/bootstrap_4.5.3.css" />
    <script src="../../js/jquery_3.6.1.js" type="text/javascript"></script>
    <script src="../../js/bootstrap_4.5.3.js" type="text/javascript"></script>

    <style type="text/css">
        .style1 {
            width: 3px;
        }

        .style2 {
            width: 100%;
        }

        body {
            background-color: #edeef1;
        }
    </style>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
            <tr>
                <td class="style2" valign="top">
                    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
                        RenderMode="Lightweight" AutoPostBack="true" SelectedIndex="0" CausesValidation="false"
                        Skin="Windows7" OnTabClick="RadTabStrip1_TabClick">
                        <Tabs>
                            <telerik:RadTab Text="Company Profile" Value="350" runat="server" PageViewID="RadPageView1">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Personnel" Value="100" runat="server" PageViewID="RadPageView3">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Outbound" Value="150" runat="server" PageViewID="RadPageView4" Visible="false">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Inbound" Value="200" runat="server" PageViewID="RadPageView5" Visible="false">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Resource" Value="250" runat="server" PageViewID="RadPageView6" Visible="false">
                            </telerik:RadTab>
                            <telerik:RadTab Text="ContainerTrucking" Value="300" runat="server" PageViewID="ContainerTruckingRadPageView" Visible="false">
                            </telerik:RadTab>
                            <telerik:RadTab ID="YourProfile" Text="Your Profile" Value="430" runat="server" PageViewID="YourProfileRadPageView">
                            </telerik:RadTab>
                            <telerik:RadTab Text="Warehouse" Value="450" runat="server" PageViewID="WarehouseRadPageView" Visible="false">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
                        RenderSelectedPageOnly="true">
                        <telerik:RadPageView runat="server" Height="850px" ID="RadPageView1" />
                        <telerik:RadPageView runat="server" Height="580px" ID="RadPageView3" />
                        <telerik:RadPageView runat="server" Height="800px" ID="RadPageView4" />
                        <telerik:RadPageView runat="server" Height="485px" ID="RadPageView5" />
                        <telerik:RadPageView runat="server" Height="800px" ID="RadPageView6" />
                        <telerik:RadPageView runat="server" Height="800px" ID="ContainerTruckingRadPageView" />
                        <telerik:RadPageView runat="server" Height="800px" ID="YourProfileRadPageView" ContentUrl="~/App/Profile/YourProfileResource.aspx" />
                        <telerik:RadPageView runat="server" Height="800px" ID="WarehouseRadPageView" />
                    </telerik:RadMultiPage>
                </td>
                <td align="center" valign="top">
                    <asp:Panel ID="panel" runat="server">
                    </asp:Panel>
                </td>
            </tr>
        </table>


        <div class="modal fade" runat="server" id="SplashModalPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Label CssClass="modal-title" ID="SplashTitleLbl" runat="server" Font-Bold="true" Font-Size="18px" Font-Names="arial, helvetica, sans-serif"></asp:Label>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="ModalClose();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label runat="server" ID="SplashMessageLbl" Font-Size="18px" Font-Names="arial, helvetica, sans-serif"></asp:Label>
                        <br />
                        <asp:Image ID="SplashImage" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="ModalClose();">&nbsp;Close&nbsp;</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="MsgPopup" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-xl" id="PopupSizeDiv" runat="server">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Medium">User Message</asp:Label>
                        <button type="button" class="close" data-dismiss="modal" onclick="MsgPopupClose();">&times;</button>
                    </div>
                    <div class="modal-body" id="content">
                        <iframe id="BodyFrame" runat="server" width="100%" frameborder="0" height="480" src="UserMessageDisplay.aspx"></iframe>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="white" data-dismiss="modal" onclick="MsgPopupClose();">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script type="text/javascript">
        var TimeOut = null;
        var MultiSplashMessage = "";
        var SplashMessageArr = "";
        var MultiSplashTitle = "";
        var SplashTitleArr = "";
        var MultiSplashImagePath = "";
        var SplashImagePathArr = "";

        function ShowSplashScreenPopup() {

            clearTimeout(TimeOut);

            TimeOut = setTimeout(function () {

                if (SplashTitleArr.length == 0 && MultiSplashTitle == "") {
                    MultiSplashTitle = '<%=SPLASH_TITLE%>';
                    SplashTitleArr = MultiSplashTitle.split("^");

                    MultiSplashMessage = '<%=SPLASH_MESSAGE%>';
                    SplashMessageArr = MultiSplashMessage.split("^");

                    MultiSplashImagePath = '<%=SPLASH_IMAGE_PATH%>';
                    SplashImagePathArr = MultiSplashImagePath.split("^");
                }

                console.log(SplashImagePathArr);

                if (SplashTitleArr.length > 0) {

                    var SplashTitleLbl = document.getElementById("SplashTitleLbl");
                    var SplashMessageLbl = document.getElementById("SplashMessageLbl");
                    var SplashImageLbl = document.getElementById("SplashImage");

                    if (SplashTitleLbl != null) {
                        if (SplashTitleArr.length > 0) {
                            if (SplashMessageArr.length > 0) {
                                if (SplashTitleArr[0] != null && SplashTitleArr[0].toString() != "" && SplashTitleArr[0].toString() != "NoValue") {
                                    SplashTitleLbl.innerHTML = SplashTitleArr[0].toString();
                                }
                                else {
                                    SplashTitleLbl.innerHTML = "";
                                }
                                SplashTitleArr = SplashTitleArr.slice(1);
                            }
                        }
                        else {
                            SplashTitleArr = null;
                        }
                    }

                    if (SplashMessageLbl != null) {
                        if (SplashMessageArr.length > 0) {
                            if (SplashMessageArr[0] != null && SplashMessageArr[0].toString() != "" && SplashMessageArr[0].toString() != "NoValue") {
                                SplashMessageLbl.innerHTML = SplashMessageArr[0].toString();
                            }
                            else {
                                SplashMessageLbl.innerHTML = "";
                            }
                            SplashMessageArr = SplashMessageArr.slice(1);
                        }
                        else {
                            SplashMessageArr = null;
                        }
                    }

                    if (SplashImageLbl != null) {
                        if (SplashImagePathArr.length > 0) {
                            if (SplashImagePathArr[0] != null && SplashImagePathArr[0].toString() != "" && SplashImagePathArr[0].toString() != "NoValue") {
                                $("#<%= SplashImage.ClientID %>").attr("src", "SplashScreenMakeThumbNail.aspx?FilePath=" + SplashImagePathArr[0].toString());
                            }
                            else {
                                $("#<%= SplashImage.ClientID %>").removeAttr("src");
                            }
                            SplashImagePathArr = SplashImagePathArr.slice(1);
                        }
                        else {
                            SplashImagePathArr = null;
                        }
                    }

                    parent.parent.parent.document.getElementById("HeaderFrame").style.pointerEvents = "None"; // Disable Header Frame Disable
                    parent.parent.parent.document.getElementById("MenuFrame").style.pointerEvents = "None"; // Disable Left Side Vertical Menu Bar

                    var HorizontalMenuFrame = parent.document.getElementsByTagName("frame")[0];
                    var HorizontalMenuFrameDoc = HorizontalMenuFrame.contentDocument || HorizontalMenuFrame.contentWindow.document;
                    var HorizontalMenuAnchor = HorizontalMenuFrameDoc.getElementsByTagName("a");
                    for (var i = 0; i < HorizontalMenuAnchor.length; i++) {
                        HorizontalMenuAnchor[i].style.pointerEvents = "none"; // Disable Horizontal Menu Bar
                    }

                    HorizontalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#C0C0C2"; //Disable Horizontal Menu Color

                    var VerticalMenuFrame = parent.parent.parent.document.getElementById("MenuFrame");
                    if (VerticalMenuFrame != null) {
                        var VerticalMenuFrameDoc = VerticalMenuFrame.contentDocument || VerticalMenuFrame.contentWindow.document;
                        if (VerticalMenuFrameDoc.getElementById("RadTreeView1") != null) {
                            VerticalMenuFrameDoc.getElementById("RadTreeView1").style.backgroundColor = "#C0C0C2"; //Disable Menu Tree View Color
                        }

                        if (VerticalMenuFrameDoc.getElementsByTagName("body")[0] != null) {
                            VerticalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#C0C0C2"; //Disable Vertial Menu Body Color
                        }
                    }

                    $('#SplashModalPopup').modal('show'); // Modal popup show
                }

            }, 1500) // sleep 1.5 seconds coz we need to give time to load some function first.
        }

        function ModalClose() {

            parent.parent.parent.document.getElementById("HeaderFrame").style.pointerEvents = "auto"; // Enable Header Frame
            parent.parent.parent.document.getElementById("MenuFrame").style.pointerEvents = "auto"; // Enable Left Side Vertical Menu Bar
            var HorizontalMenuFrame = parent.document.getElementsByTagName("frame")[0];
            var HorizontalMenuFrameDoc = HorizontalMenuFrame.contentDocument || HorizontalMenuFrame.contentWindow.document;
            var HorizontalMenuAnchor = HorizontalMenuFrameDoc.getElementsByTagName("a");
            for (var i = 0; i < HorizontalMenuAnchor.length; i++) {
                HorizontalMenuAnchor[i].style.pointerEvents = "auto";
            }
            HorizontalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#f5f6fb"; //Orginal Horizontal Menu Color

            var VerticalMenuFrame = parent.parent.parent.document.getElementById("MenuFrame");
            var VerticalMenuFrameDoc = VerticalMenuFrame.contentDocument || VerticalMenuFrame.contentWindow.document;
            VerticalMenuFrameDoc.getElementById("RadTreeView1").style.backgroundColor = "#f5f6fb"; //Orginal Menu Tree View Color
            VerticalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#f5f6fb";  //Orginal Vertial Menu Body Color

            if (SplashTitleArr != null) {
                ShowSplashScreenPopup();
            }
        }

        function MessagingPopup() {


            parent.parent.parent.document.getElementById("HeaderFrame").style.pointerEvents = "None"; // Disable Header Frame Disable
            parent.parent.parent.document.getElementById("MenuFrame").style.pointerEvents = "None"; // Disable Left Side Vertical Menu Bar

            var HorizontalMenuFrame = parent.document.getElementsByTagName("frame")[0];
            var HorizontalMenuFrameDoc = HorizontalMenuFrame.contentDocument || HorizontalMenuFrame.contentWindow.document;
            var HorizontalMenuAnchor = HorizontalMenuFrameDoc.getElementsByTagName("a");
            for (var i = 0; i < HorizontalMenuAnchor.length; i++) {
                HorizontalMenuAnchor[i].style.pointerEvents = "none"; // Disable Horizontal Menu Bar
                HorizontalMenuAnchor[i].style.opacity = "0.5";
            }

            HorizontalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#C0C0C2"; //Disable Horizontal Menu Color

            var VerticalMenuFrame = parent.parent.parent.document.getElementById("MenuFrame");
            if (VerticalMenuFrame != null) {
                var VerticalMenuFrameDoc = VerticalMenuFrame.contentDocument || VerticalMenuFrame.contentWindow.document;
                if (VerticalMenuFrameDoc.getElementById("RadTreeView1") != null) {
                    VerticalMenuFrameDoc.getElementById("RadTreeView1").style.backgroundColor = "#C0C0C2"; //Disable Menu Tree View Color
                }

                if (VerticalMenuFrameDoc.getElementsByTagName("body")[0] != null) {
                    VerticalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#C0C0C2"; //Disable Vertial Menu Body Color
                }
            }

            $('#MsgPopup').modal('show'); // Modal popup show
        }

        function MsgPopupClose() {
            parent.parent.parent.document.getElementById("HeaderFrame").style.pointerEvents = "auto"; // Enable Header Frame
            parent.parent.parent.document.getElementById("MenuFrame").style.pointerEvents = "auto"; // Enable Left Side Vertical Menu Bar
            var HorizontalMenuFrame = parent.document.getElementsByTagName("frame")[0];
            var HorizontalMenuFrameDoc = HorizontalMenuFrame.contentDocument || HorizontalMenuFrame.contentWindow.document;
            var HorizontalMenuAnchor = HorizontalMenuFrameDoc.getElementsByTagName("a");
            for (var i = 0; i < HorizontalMenuAnchor.length; i++) {
                HorizontalMenuAnchor[i].style.pointerEvents = "auto";
            }
            HorizontalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#f5f6fb"; //Orginal Horizontal Menu Color

            var VerticalMenuFrame = parent.parent.parent.document.getElementById("MenuFrame");
            var VerticalMenuFrameDoc = VerticalMenuFrame.contentDocument || VerticalMenuFrame.contentWindow.document;
            VerticalMenuFrameDoc.getElementById("RadTreeView1").style.backgroundColor = "#f5f6fb"; //Orginal Menu Tree View Color
            VerticalMenuFrameDoc.getElementsByTagName("body")[0].style.backgroundColor = "#f5f6fb";  //Orginal Vertial Menu Body Color
        }
    </script>
</body>
</html>
