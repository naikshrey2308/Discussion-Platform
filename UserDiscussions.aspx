<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDiscussions.aspx.cs" Inherits="DiscussionPanel.UserDiscussions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="styles/base.css"/>
</head>
<body class="position-relative">
    <form id="form1" runat="server">
    <div class="min-vh-100 row gx-0">
       <!-- #include file="~/Navbar.html" -->
        <div class="col-3">&nbsp;</div>
        <div class="col-8 mx-auto p-5 br-10 my-5">
            <asp:DataList ID="DataList1" CssClass="w-100" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="alert p-3">
                        <asp:Label ID="HeadingLabel" runat="server" Text='<%# Eval("Heading") %>' />
                    </div>
                    <div class="text-end">
                        <asp:Label ID="CreatorLabel" runat="server" Text='<%# Eval("Creator") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
        <p>
            &nbsp;</p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT [Heading], [Creator] FROM [Doubts] ORDER BY [Id] DESC"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
