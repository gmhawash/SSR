using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.Security;

namespace ZaytonaClasses
{
  public class ZPage : System.Web.UI.Page
  {
    protected static string _prevPage;
    protected string PrevPage 
    {
      get {return _prevPage;}
      set {_prevPage = value;}
    }

    protected override void OnLoad(EventArgs e)
    {
      if (!User.Identity.IsAuthenticated)
        FormsAuthentication.RedirectToLoginPage();

      if (!IsPostBack && Request.UrlReferrer != null)
        PrevPage = Request.UrlReferrer.OriginalString;

      // Be sure to call the base class's OnLoad method!
      base.OnLoad(e);
    }

    protected void Redirect(string url)
    {
      Response.Redirect(this.ResolveUrl(url));
    }

    protected void GoBack()
    { 
      Response.Redirect (PrevPage);
    }

  }
}
