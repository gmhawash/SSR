using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrackerTableAdapters;
using System.Web.Security;

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
    bll.canceledBy = (Guid)Membership.GetUser().ProviderUserKey;
    bll.cancelComment = CancelComment.Text;
    bll.canceledOn = DateTime.Now;
    bll.Id = m_ticketId;
    bll.Update();
    Server.Transfer(PrevPage);
  }

  protected void No_Click(object sender, EventArgs e)
  {
    Server.Transfer(PrevPage);
  }
}
