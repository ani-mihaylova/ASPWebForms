<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtcleDetailsAdmin.aspx.cs" Inherits="ExamASP.NET.Admin.ArtcleDetailsAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server"
         ID="FromViewArticleDetails"
         ItemType="ExamASP.NET.Models.Article"
          SelectMethod="FromViewArticleDetails_GetItem">
        <HeaderTemplate>

        </HeaderTemplate>
        <ItemTemplate>
            <div>
                <h1 runat="server"><%# Item.Title %></h1>
                <h3 runat="server">Catagory <%# Item.Category.Name %></h3>
                <asp:Literal Text="<%#: Item.Content %>" runat="server" />
                <asp:Label CssClass="pull-left" Text='<%#: string.Format("Authr: {0}",Item.Author.UserName) %>' runat="server" />
                <asp:Label CssClass="pull-right" Text='<%#: string.Format("{0:D} ",Item.DateCreated) %>' runat="server" />
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
