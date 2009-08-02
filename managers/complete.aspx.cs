using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class managers_Default2 : ZaytonaClasses.ZPage
{
  private static Guid m_ticketId;
  protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
        m_ticketId = new Guid(Request.QueryString["Id"]);
    }

  protected void Yes_Click(object sender, EventArgs e)
  {
    TicketsBLL bll = new TicketsBLL();
    try { bll.implementationDate = Convert.ToDateTime(ImplemenatationDate.Text); }
    catch { }
    bll.statusId = (Guid)Utility.StatusId("Complete");
    bll.Id = m_ticketId;
    bll.Update();
    GoBack();
  }

  protected void No_Click(object sender, EventArgs e)
  {
    GoBack();
  }

}
