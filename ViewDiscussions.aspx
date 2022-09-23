<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDiscussions.aspx.cs" Inherits="DiscussionPanel.ViewDiscussions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
<body class="position-relative">
    <div class="min-vh-100 row gx-0">
        <div class="bg-base-gradient col-2">
            <div class="d-flex br-10 flex-column justify-content-start bg-white m-2" style="height: 97vh;">
                <div class="menu-item w-100 p-3 mx-auto">
                    <img src="images/2.png" width="100%" class="p-3" />
                </div>
                <div class="menu-item w-100 p-3 my-2">
                    <img src="images/home.svg" width="25" class="mx-3" /> Home
                </div>
                <div class="menu-item w-100 p-3 my-2">
                    <img src="images/plus.svg" width="25" class="mx-3" /> Create
                </div>
                <div class="menu-item mt-auto w-100 p-3 my-2">
                    <button class="btn w-100 text-start" onclick="profilepop();">
                        <img src="images/profile.svg" width="25" class="mx-3" /> Profile
                    </button>
                </div>
            </div>
        </div>
        <div class="col">
            &nbsp;
        </div>
    </div>
    <div id="profile-section" class="col-3 p-3 position-absolute top-0 end-0 min-vh-100 border-start bg-light">
        <button class="btn btn-close float-end m-3" onclick="profilehide();"></button>
        <form id="form1" class="form" runat="server">
            <br /><br />
                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="ProfileEmail" ErrorMessage="Please enter a valid email." Font-Size="Small" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                        <br />
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox required="true" placeholder="Email" CssClass="form-control" ID="ProfileEmail" runat="server" ReadOnly="True"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="NameValidator" runat="server" ControlToValidate="ProfileName" ErrorMessage="Please enter a valid name." Font-Size="Small" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox required="true" placeholder="Name" CssClass="form-control" ID="ProfileName" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox required="true" placeholder="Password" CssClass="form-control" ID="ProfilePassword" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList CssClass="form-control" ID="ProfileGender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="text-end">
                        <asp:Button ID="updateProfileBtn" CssClass="btn btn-base w-100" runat="server" OnClick="updateProfileBtn_Click" Text="Update My Profile" />
                        <br /><br />
                        <asp:Button ID="LogoutBtn" CssClass="btn btn-light text-danger w-100" runat="server" OnClick="LogoutBtn_Click" Text="Logout" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </div>

    <script>
        function profilepop() {
            let profiler = document.getElementById("profile-section");
            profiler.style.display = "block";
        }

        function profilehide() {
            let profiler = document.getElementById("profile-section");
            profiler.style.display = "none";
        }
    </script>
</body>
</html>
