using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ExamASP.NET.Models;

namespace ExamASP.NET
{
    public partial class _Default : Page
    {
        private ApplicationDbContext contex;

        public _Default()
        {
            this.contex = new ApplicationDbContext();
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
        public IQueryable<Article> ListViewArticles_GetData()
        {
            var result = this.contex.Aricles.OrderByDescending(a => a.Likes.Value).Take(3);
            return result;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Category> ListViewCategory_GetData()
        {
            return this.contex.Categories;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Article> ListViewArticlesInCategories_GetData()
        {
            return this.contex.Aricles.OrderByDescending(a=>a.DateCreated).Take(3);
        }
    }
}