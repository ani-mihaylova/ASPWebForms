using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.EnterpriseServices;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamASP.NET.Controls
{
    public partial class NumericBox : System.Web.UI.UserControl
    {
        
        public int Value
        {
            get
            {
                try
                {
                    int value = Int32.Parse(this.TextBoxNumber.Text);
                    return value;
                }
                catch (Exception)
                {
                    return 1;
                }
            }

            set
            {
                string oldText = this.TextBoxNumber.Text;
                string newText = value.ToString(
                    CultureInfo.InvariantCulture);
                this.TextBoxNumber.Text = newText;
                if (oldText != newText)
                {
                    if (this.ValueChanged != null)
                    {
                        this.ValueChanged(this, EventArgs.Empty);
                    }
                }
            }
        }

        public event EventHandler ValueChanged;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonIncrease_Click(object sender, EventArgs e)
        {
            this.Value++;
        }

        protected void ButtonDecrease_Click(object sender, EventArgs e)
        {
            this.Value--;
        }
    }
}