using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class managers_Default2 : ZaytonaClasses.ZPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      MembershipUser mu = Membership.GetUser();
      if (mu == null)
        Server.Execute("~/Login.aspx");

      Session.Add("UserId", Membership.GetUser().ProviderUserKey);
    }
}
