using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data.Common;
using TrackerTableAdapters;

/// <summary>
/// Summary description for Class1
/// </summary>

[System.ComponentModel.DataObject]
public class TicketsBLL
{
  public Guid Id, projectId, deptId, priorityId, statusId, groupId,
               teamId, canceledBy, requestedBy, createdBy;
  public int number, estimatedHours, estimatedCost, actualHours, actualCost;
  public string summary, description, workOrderNumber, cancelComment;
  public DateTime receivedOn, startDate, endDate, qaStartDate, qaDueDate, qaCompleteDate,
                   canceledOn;
  public bool qaRequired;

  public TicketsBLL() { }

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

   /// <summary>
   /// 
   /// </summary>
   /// <param name="Id"></param>
   /// <returns></returns>
  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, false)]
  public Tracker.TicketsDataTable GetTicketsByRequesterId(Guid Id)
  {
    return Adapter.GetTicketsByRequestedBy(Id);
  }

  /// <summary>
  /// 
  /// </summary>
  /// <param name="bll"></param>
  /// <returns></returns>
  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Insert, true)]
  public bool AddTicket()
  {
    // Create a new DeptRow instance 
    Tracker.TicketsDataTable tickets = new Tracker.TicketsDataTable();

    Tracker.TicketsRow ticket = tickets.NewTicketsRow();
    ticket.Id = Guid.NewGuid();
    ticket.GroupId = groupId;
    ticket.TeamId = teamId;
    ticket.StatusId = statusId;
    ticket.Summary = summary;
    ticket.Description = description;
    ticket.ProjectId = projectId;
    ticket.DeptId = deptId;
    ticket.PriorityId = priorityId;
    ticket.ProjectId = projectId;
    ticket.CanceledBy = canceledBy;
    ticket.CreatedBy = createdBy;
    ticket.RequestedBy = requestedBy;
    ticket.Number = number;
    ticket.EstimatedCost = estimatedCost;
    ticket.EstimatedHours = estimatedHours;
    ticket.ActualCost = actualCost;
    ticket.ActualHours = actualHours;
    ticket.WorkOrderNumber = workOrderNumber;
    ticket.CancelComment = cancelComment;
    ticket.ReceivedOn = new DateTime(1992,12,12);
    //ticket.StartDate = startDate;
    //ticket.EndDate = endDate;
    //ticket.QACompletedDate = qaCompleteDate;
    //ticket.QADueDate = qaDueDate;
    //ticket.QARequired = qaRequired;
    //ticket.QAStartDate = qaStartDate;
    //ticket.CaneledOn = canceledOn;
    ticket.Number = 1;
    tickets.AddTicketsRow(ticket);

    int rowsAffected = Adapter.Update(tickets);
    // Return true if precisely one row was inserted,
    // otherwise false
    return rowsAffected == 1;
  }

}






