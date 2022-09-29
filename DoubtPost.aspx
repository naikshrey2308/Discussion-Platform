<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoubtPost.aspx.cs" Inherits="DiscussionPanel.DoubtPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body style="background: white; background-size: 25% 25%;" class="position-relative">
    <div class="min-vh-100 row gx-0">
       <!-- #include file="~/Navbar.html" -->
        <div class="col-2">&nbsp;</div>
        <div class="col-6 bg-light mx-auto p-5 border br-10 my-5">

            <form id="form1" class="form p-3 mx-auto" runat="server">
                <div class="alert bg-base p-3">
                    <asp:Label ID="StatusText" runat="server"></asp:Label>
                </div>
                <br />

            <h3 class="display-4 text-black">Start a discussion here!</h3>
            <br />
            <img src="images/doubt.svg" width="200px" class="d-block mx-auto" />
            <br />
                <asp:DropDownList ID="SelectCategory" CssClass="btn btn-default dropdown-toggle" runat="server" >
                    <asp:ListItem CssClass="dropdown-item p-5" Selected="True">Select category</asp:ListItem>
                    <asp:ListItem CssClass="p-5 dropdown-item">Food</asp:ListItem>
                    <asp:ListItem CssClass="dropdown-item">Science</asp:ListItem>
                    <asp:ListItem CssClass="dropdown-item">Sports</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
               <asp:TextBox ID="DoubtHeading" CssClass="form-control" placeholder="Add a heading for your doubt ..." runat="server"></asp:TextBox>
               <br />
               <asp:TextBox ID="DoubtContent" runat="server" CssClass="form-control  p-3 textarea" Rows="12" Columns="95" placeholder="Where are you stuck? Write your doubt here." TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:Button ID="PostDoubtBtn" runat="server" CssClass="btn btn-base float-end" OnClick="PostDoubtBtn_Click" Text="Post Doubt" />
            </form>
        </div>
    </div>
</body>
</html>
