using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamASP.NET.Models;
using Microsoft.Owin;
using System.Web.ModelBinding;

namespace ExamASP.NET
{
    public partial class DetailsArticle : System.Web.UI.Page
    {
        private ApplicationDbContext context;

        public DetailsArticle()
        {
            this.context = new ApplicationDbContext();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User==null)
            {
                this.FormViewButtons.Visible = false;
            }
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Article FromViewArticleDetails_GetItem(int? id)
        {
            if (Request.Params["id"]==null)
            {
                Response.Redirect("~/");
            }
            int curretnId = int.Parse(Request.Params["id"].ToString());
            return this.context.Aricles.Find(curretnId);
        }

        protected void NumberixBoxAge_ValueChanged(
            object sender, EventArgs e)
        {
           
            this.LabelInfo.Text = "changed";
        }
    }
}