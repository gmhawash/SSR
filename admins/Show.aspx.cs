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
using ZaytonaClasses;
using System.Text;

public partial class providers_Default2 : ZPage
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


    string[] col1 = { "Number", "Priority", "Status", "Product;Project", "Department;Dept", "Group", "Team" };
    string[] col2 = { "Created By;Creator","QA Due Date;QADueDate", "QA Completed Date;QACompletedDate", "User Test Due Date;UserTestDueDate", 
                      "User Test Complete Date;UserTestCompleteDate", "Planned Implementation Date;PlannedImplementationDate", "Implementation Date;ImplementationDate" };
    string[] col3 = { "Received On;ReceivedOn", "Actual Hours;Project", "Actual Cost;ActualCost", "Canceled On;CanceledOn", "Canceled By;Canceler" };
    string[] col4 = { "Summary", "Description", "CancelComment" };
    string[][] cols = { col1, col2, col3 };

    // create controls from above array..
    foreach (string[] col in cols)
    {
      TableCell tc = new TableCell();   TableRow1.Cells.Add(tc);
      foreach (string cell in col)
      {
        string[] cells = cell.Split(';');
        object value = ticket[cells.Length == 1 ? cells[0] : cells[1]];
        if (value.GetType() == typeof(DateTime))
          value = ((DateTime)value).ToShortDateString();
        tc.Text += "<div class='showfield'><div>" + cells[0] + ": </div><label>" + value + "</label></div>";
      }
    }

    foreach (string cell in col4)
    {
      if (!DBNull.Value.Equals(ticket[cell]))
        ((TextBox)View1.FindControl(cell)).Text = (string)ticket[cell];
    }
  }

  protected void Back_Click(object sender, EventArgs e)
  {
    GoBack();
  }

  protected void AddNote_Click(object sender, EventArgs e)
  {
    string text = ((TextBox)View1.FindControl("Note")).Text;
    Guid ticketId = new Guid(Request["Id"]);
    Guid author = (Guid)Membership.GetUser().ProviderUserKey;

    MessagesTableAdapter ta = new MessagesTableAdapter();
    ta.Insert(Guid.NewGuid(), text, DateTime.Now, ticketId, author);
    Response.Redirect(Request.Url.AbsoluteUri);
  }
}
