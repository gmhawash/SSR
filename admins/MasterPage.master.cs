using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admins_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

      string[] aRoles = Roles.GetRolesForUser();
      

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
