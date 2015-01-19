using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamASP.NET.Controls.ErrorSuccessNotifier;
using ExamASP.NET.Models;

namespace ExamASP.NET.Admin
{
    public partial class Articles : System.Web.UI.Page
    {
        private ApplicationDbContext cotext;

        public Articles()
        {
            this.cotext = new ApplicationDbContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Article> ListViewEditArticle_GetData()
        {
            return this.cotext.Aricles;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewEditArticle_DeleteItem(int id)
        {
            var article = this.cotext.Aricles.Find(id);
            this.cotext.Aricles.Remove(article);
            this.cotext.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewEditArticle_UpdateItem(int id)
        {
            ExamASP.NET.Models.Article item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = this.cotext.Aricles.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (item.Title == null || item.Title == "")
            {
                ErrorSuccessNotifier.AddErrorMessage("Title is requiered!");
            }
            if (item.Content == null || item.Content == "")
            {
                ErrorSuccessNotifier.AddErrorMessage("Content is requiered!");
            }
            if (ModelState.IsValid)
            {
                this.cotext.SaveChanges();

            }
        }

        public void ListViewEditArticle_InsertItem()
        {
            var item = new Article();
            var userName = HttpContext.Current.User.Identity.Name;
            ApplicationUser user = this.cotext.Users.FirstOrDefault(u => u.UserName == userName);
            if (user==null)
            {
                Response.Redirect("~/Register.aspx");
            }

            item.Author = user;
            item.DateCreated = DateTime.Now;
            var defaultLike = this.cotext.Likes.FirstOrDefault(l => l.Value == 0);
            if (defaultLike==null)
            {
                defaultLike=new Like()
                {
                     Value=0
                };
                this.cotext.Likes.Add(defaultLike);
                this.cotext.SaveChanges();
            }

            item.Likes = this.cotext.Likes.FirstOrDefault(l => l.Value == 0);

            TryUpdateModel(item);

            if (item.Title==null || item.Title=="")
            {
                ErrorSuccessNotifier.AddErrorMessage("Title is requied!");
            }

            if (item.Content == null || item.Content == "")
            {
                ErrorSuccessNotifier.AddErrorMessage("Content is requied!");
            }

            if (ModelState.IsValid)
            {
                this.cotext.Aricles.Add(item);
                this.cotext.SaveChanges();
            }
        }

        public IQueryable<Category> DropDownListCategoriesEdit_GetData()
        {
            return this.cotext.Categories.OrderBy(b => b.Name);
        }

        public IQueryable<Category> DropDownListCategoriesInsert_GetData()
        {
            return this.cotext.Categories.OrderBy(b => b.Name);
        }
    }
}