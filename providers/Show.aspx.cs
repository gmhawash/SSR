using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrackerTableAdapters;
using System.Data.Linq;
using System.Configuration;
using System.Web.Security;

public partial class providers_Default2 : ZaytonaClasses.ZPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string Id = Request.QueryString["Id"];
    Session.Add("TicketId", Id);

    TicketsTableAdapter Adapter = new TicketsTableAdapter();
    Tracker.TicketsDataTable tickets = Adapter.GetTicketForShow(new Guid(Id));
    if (tickets.Count == 0)
      return;
    Tracker.TicketsRow ticket = tickets[0];

    ((Label)View1.FindControl("Id")).Text = ticket.Id.ToString();
    ((Label)View1.FindControl("Number")).Text = ticket.Number.ToString();

    ((Label)View1.FindControl("Summary")).Text = ticket.Summary;
    ((Label)View1.FindControl("Description")).Text = ticket.Description;
    ((Label)View1.FindControl("ReceivedOn")).Text = ticket.ReceivedOn.ToShortDateString();
    ((CheckBox)View1.FindControl("QARequired")).Checked = ticket.QARequired;
    ((Label)View1.FindControl("EstimatedHours")).Text = ticket.EstimatedHours.ToString();
    ((Label)View1.FindControl("EstimatedCost")).Text = ticket.EstimatedCost.ToString();
    ((Label)View1.FindControl("ActualHours")).Text = ticket.ActualHours.ToString();
    ((Label)View1.FindControl("ActualCost")).Text = ticket.ActualCost.ToString();
    //((Label)View1.FindControl("StartDate")).Text = ticket.StartDate.ToShortDateString();
    //((Label)View1.FindControl("EndDate")).Text = ticket.EndDate.ToShortDateString();
    //((Label)View1.FindControl("CanceledOn")).Text = ticket.CanceledOn.ToShortDateString();
    //((Label)View1.FindControl("CancelComment")).Text = ticket.CancelComment;
    //((Label)View1.FindControl("Dept")).Text = ticket.;
    //((Label)View1.FindControl("Group")).Text = ticket.Group;
    //((Label)View1.FindControl("Project")).Text = ticket.Project;
    //((Label)View1.FindControl("Team")).Text = ticket.Team;
    //((Label)View1.FindControl("Priority")).Text = ticket.Priority;
    //((Label)View1.FindControl("Creator")).Text = ticket.Creator;
    //((Label)View1.FindControl("Canceler")).Text = ticket.Canceler;


  }

  protected void AddNote_Click(object sender, EventArgs e)
  {
    string text = ((TextBox)View1.FindControl("Note")).Text;
    Guid ticketId = new Guid(((Label)View1.FindControl("Id")).Text);
    Guid author = (Guid)Membership.GetUser().ProviderUserKey;

      MessagesTableAdapter ta = new MessagesTableAdapter();
      ta.Insert(Guid.NewGuid(), text, DateTime.Now, ticketId, author);
      Response.Redirect(Request.Url.AbsoluteUri);
  }
  protected void Button1_Click(object sender, EventArgs e)
  {
    Response.Redirect("Default.aspx");
  }
}
