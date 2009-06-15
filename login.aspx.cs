using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{


  protected void Login1_LoggedIn(object sender, EventArgs e)
  {
    Login login = (Login)sender;

    // Depending on the role of the user, send them to the appropriate place.
    string[] aRoles = Roles.GetRolesForUser(login.UserName);

    if (aRoles.Length > 0)
      login.DestinationPageUrl = string.Format("{0}s/default.aspx", aRoles[0]);

      Response.Redirect(string.Format("{0}s/default.aspx", aRoles[0]));
  }
}
