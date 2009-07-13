using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class providers_Tickets : ZaytonaClasses.ZPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      Session.Add("UserId", Membership.GetUser().ProviderUserKey);

    }

}
