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
    public partial class Categories : System.Web.UI.Page
    {
        private ApplicationDbContext context;

        public Categories()
        {
            this.context = new ApplicationDbContext();
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
        public IQueryable<Category> ListViewEditCatagory_GetData()
        {
            return this.context.Categories;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewEditCatagory_DeleteItem(int id)
        {
            var categoryToDelete=this.context.Categories.Find(id);
            this.context.Categories.Remove(categoryToDelete);
            this.context.SaveChanges();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListViewEditCatagory_UpdateItem(int id)
        {
            Category item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = this.context.Categories.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            
            TryUpdateModel(item);
            if (item.Name == null || item.Name == "")
            {
                ErrorSuccessNotifier.AddErrorMessage("Name is requiered!");
            }
            if (ModelState.IsValid)
            {
                this.context.SaveChanges();

            }
        }

        public void ListViewEditCatagory_InsertItem()
        {
            var item = new Category();
            if (item.Name==null || item.Name=="")
            {
                ErrorSuccessNotifier.AddErrorMessage("Name is requiered!");
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                this.context.Categories.Add(item);
                this.context.SaveChanges();

            }
        }
    }
}