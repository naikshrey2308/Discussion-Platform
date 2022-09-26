<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="DiscussionPanel.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="row gx-0">
           <!-- #include file="~/Navbar.html" -->
        <form id="form1" style="transform:translate(-50%, -50%)" class="col-12 col-md-8 col-lg-6 col-xl-4 border p-3 position-absolute top-50 start-50" runat="server">
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
                        <asp:Button ID="Button1" CssClass="btn btn-base w-100" runat="server" OnClick="updateProfileBtn_Click" Text="Update My Profile" />
                        <br /><br />
                        <asp:Button ID="Button2" CssClass="btn btn-light text-danger w-100" runat="server" OnClick="LogoutBtn_Click" Text="Logout" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
