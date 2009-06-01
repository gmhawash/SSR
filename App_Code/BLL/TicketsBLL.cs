using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TrackerTableAdapters;

/// <summary>
/// Summary description for Class1
/// </summary>

[System.ComponentModel.DataObject]
public class TicketsBLL
{

  private TicketsTableAdapter _ticketsAdapter = null;
  protected TicketsTableAdapter Adapter
  {
    get
    {
      if (_ticketsAdapter == null)
        _ticketsAdapter = new TicketsTableAdapter();
      return _ticketsAdapter;
    }
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public Tracker.TicketsDataTable GetTickets()
  {
    return Adapter.GetTickets();    
  }
}
