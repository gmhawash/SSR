<%@ Application Language="C#" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>

<script RunAt="server">

  void Application_Start(Object sender, EventArgs e)
  {

    string[] roles = Roles.GetAllRoles();
    /*      MembershipUserCollection muc = Membership.GetAllUsers();
        foreach (MembershipUser user in muc) {
          foreach (string role in roles) {
             if(Roles.IsUserInRole(user.UserName, role))
               Roles.RemoveUserFromRole(user.UserName, role);
          }
        }

        foreach (string role in Roles.GetAllRoles ()) {
          Roles.DeleteRole(role); 
        }
    */
    // Code that runs on application startup
    if (Roles.Enabled) {
      string[] asRoles = { "Admin", "Manager", "Provider" };
      foreach (string role in asRoles) {
        if (!Roles.RoleExists(role))
          Roles.CreateRole(role);
      }

      roles = Roles.GetAllRoles();

      foreach (string role in roles) {
        MembershipCreateStatus rStatus;
        if (Membership.GetUser(role) == null) {
          Membership.CreateUser(role, string.Format("{0}!!", role), "gm@gmail.com", "what", "it is", true, out rStatus);
          Roles.AddUserToRole(role, role);
        }
      }
    }
  }

  void Application_End(Object sender, EventArgs e)
  {
    //  Code that runs on application shutdown

  }

  void Application_Error(Object sender, EventArgs e)
  {
    // Code that runs when an unhandled error occurs
      Exception ex = Server.GetLastError().GetBaseException();
      Server.ClearError();
      Session.Add("FlashError", ex.Message);
      Response.Redirect(Request.Url.ToString());
  }

  void Application_BeginRequest(Object sender, EventArgs e)
  {
  }
  void Session_Start(Object sender, EventArgs e)
  {
    // Code that runs when a new session is started
  }

  void Session_End(Object sender, EventArgs e)
  {
    // Code that runs when a session ends. 
    // Note: The Session_End event is raised only when the sessionstate mode
    // is set to InProc in the Web.config file. If session mode is set to StateServer 
    // or SQLServer, the event is not raised.

  }
       
</script>

