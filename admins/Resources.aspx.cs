using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admins_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ResourcesGridView_RowDeleted(object sender, EventArgs e)
    {
      Guid Id = (Guid)ResourcesGridView.DataKeys[0].Value;

      MembershipUser mu = Membership.GetUser(Id);
      Membership.DeleteUser(mu.UserName, true);
    }
}
