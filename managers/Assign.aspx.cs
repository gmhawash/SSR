using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using TrackerTableAdapters;

public partial class managers_Default2 : System.Web.UI.Page
{
  private static Guid m_ticketId;
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!Page.IsPostBack)
      m_ticketId = (Guid)Context.Items["TicketId"];
  }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Assign_Click(object sender, EventArgs e)
  {
    int count = Resources.Rows.Count;
    TicketsUsersTableAdapter trta = new TicketsUsersTableAdapter();

    MembershipUser myObject = Membership.GetUser();
    string UserID = myObject.ProviderUserKey.ToString();

    foreach (GridViewRow row in Resources.Rows)
    {
      CheckBox cb = row.FindControl("SelectUser") as CheckBox;

      Label txt = row.FindControl("UserId") as Label;
      int nRecords = (int)trta.DoesRecordExist(m_ticketId, new Guid(txt.Text));

      if ((nRecords == 0) && cb.Checked)
      {
        // store data in database...
        trta.Insert(new Guid(txt.Text), m_ticketId, DateTime.Now, new Guid(UserID));
      }
      else if ((nRecords > 0) && !cb.Checked)
      {
        // delete record...
        trta.DeleteTicketByUserId(new Guid(UserID), m_ticketId);
      }
    }

    Context.Items.Add((object)"TicketId", m_ticketId);
    Server.Transfer("ShowTicket.aspx", true);
  }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Cancel_Click(object sender, EventArgs e)
  {

  }
}
