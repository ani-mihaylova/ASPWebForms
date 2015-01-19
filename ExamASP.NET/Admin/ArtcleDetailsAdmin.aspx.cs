using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExamASP.NET.Models;

namespace ExamASP.NET.Admin
{
    public partial class ArtcleDetailsAdmin : System.Web.UI.Page
    {
        private ApplicationDbContext context;

        public ArtcleDetailsAdmin()
        {
            this.context = new ApplicationDbContext();
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Article FromViewArticleDetails_GetItem(int id)
        {
            if (Request.Params["id"] == null)
            {
                Response.Redirect("~/");
            }
            int curretnId = int.Parse(Request.Params["id"].ToString());
            return this.context.Aricles.Find(curretnId);
        }
    }
}