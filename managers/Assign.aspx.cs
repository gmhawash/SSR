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
    m_ticketId = (Guid)Session["TicketId"];
    if (!Page.IsPostBack) {
      TicketsUsersTableAdapter trta = new TicketsUsersTableAdapter();
      Tracker.TicketsUsersDataTable dt = trta.GetTicketsByTicketId(m_ticketId);

      foreach (GridViewRow row in Resources.Rows) {
        Label id = row.FindControl("Id") as Label;
        foreach (Tracker.TicketsUsersRow tr in dt) {
          if (tr.UserId.ToString().Equals(id.Text)) {
            CheckBox cb = row.FindControl("SelectUser") as CheckBox;
            cb.Checked = true;
          }
        }
      }
    }
  }


  protected void Resources_PreRender(object sender, EventArgs e)
  {

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

    foreach (GridViewRow row in Resources.Rows) {
      object name = row.FindControl("Username") as object;
      CheckBox cb = row.FindControl("SelectUser") as CheckBox;

      Label txt = row.FindControl("Id") as Label;
      Guid id = new Guid(txt.Text);
      int nRecords = (int)trta.DoesRecordExist(m_ticketId, id);

      if ((nRecords == 0) && cb.Checked) {
        // store data in database...
        trta.Insert(id, m_ticketId, DateTime.Now, new Guid(UserID));
      } else if ((nRecords > 0) && !cb.Checked) {
        // delete record...
        trta.DeleteTicketByUserId(id, m_ticketId);
      }
    }

    Context.Items.Add("TicketId", m_ticketId);
    Server.Transfer("Tickets.aspx");
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
