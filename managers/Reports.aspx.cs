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
        Redirect("~/Login.aspx");
    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e) 
    {
      MultiView1.ActiveViewIndex = Int32.Parse(e.Item.Value);
      int i;

      for (i=0; i< Menu1.Items.Count - 1; i++) {
        if (i == Int32.Parse(e.Item.Value)) {
          
        } else {
          
        }
      }
    }
}
