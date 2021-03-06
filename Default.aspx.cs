﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class _Default : ZaytonaClasses.ZPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string[] aRoles = Roles.GetRolesForUser(User.Identity.Name);

    if (aRoles.Length > 0)
      Response.Redirect(string.Format("{0}s/default.aspx", aRoles[0]));
  }
}
