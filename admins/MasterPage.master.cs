using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admins_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["FlashError"] != null)
      {
        Flash.Visible = true;
        Flash.Text = Session["FlashError"].ToString();
        Session.Remove("FlashError");
      }
      else
      {
        Flash.Visible = false;
      }
    }

}
