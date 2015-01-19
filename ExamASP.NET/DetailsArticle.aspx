<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DetailsArticle.aspx.cs" Inherits="ExamASP.NET.DetailsArticle" %>
<%@ Register src="~/Controls/NumericBox.ascx" tagname="NumericBox"
    tagprefix="userControls" %>
<asp:Content ID="ContentArticleDetails" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:FormView runat="server"
                ID="FormViewButtons"
                ItemType="ExamASP.NET.Models.Article"
                SelectMethod="FromViewArticleDetails_GetItem">
                <ItemTemplate>
                    <usercontrols:numericbox runat="server"
                        id="NumberixBoxAge" value="<%# BindItem.Likes.Value %>"
                        onValueChanged="NumberixBoxAge_ValueChanged" />
                    
                </ItemTemplate>
            </asp:FormView>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="LabelInfo" runat="server" Visible ="false"/>
    <asp:FormView runat="server"
        ID="FromViewArticleDetails"
        ItemType="ExamASP.NET.Models.Article"
        SelectMethod="FromViewArticleDetails_GetItem">
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
