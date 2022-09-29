<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thread.aspx.cs" Inherits="DiscussionPanel.Thread" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="ReplayDataSource">
                <ItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    Heading:
                    <asp:Label ID="HeadingLabel" runat="server" Text='<%# Eval("Heading") %>' />
                    <br />
                    Content:
                    <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                    <br />
                    Creator:
                    <asp:Label ID="CreatorLabel" runat="server" Text='<%# Eval("Creator") %>' />
                    <br />
                    Category:
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="ReplayDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT * FROM [Doubts] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:TextBox ID="ReplyContent" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ReplyBtn" runat="server" OnClick="ReplyBtn_Click" Text="Reply" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                </tr>
            </table>
            <asp:DataList ID="DataList2" runat="server" DataKeyField="Id" DataSourceID="ShowReplies">
                <ItemTemplate>
                    Content:
                    <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                    <br />
                    Replier:
                    <asp:Label ID="ReplierLabel" runat="server" Text='<%# Eval("Replier") %>' />
                    <br />
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="ShowReplies" runat="server" ConnectionString="<%$ ConnectionStrings:UserDiscussionsConn %>" SelectCommand="SELECT [Content], [Replier], [Id] FROM [Reply] WHERE ([Doubt] = @Doubt)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Doubt" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
