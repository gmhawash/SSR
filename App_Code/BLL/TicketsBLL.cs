﻿using System;
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
               teamId, canceledBy, requestedBy, createdBy, businessUnitRep;
  public int number, estimatedHours, estimatedCost, actualHours, actualCost;
  public string summary, description, cancelComment;
  public DateTime receivedOn, startDate, endDate, qaStartDate, qaDueDate, qaCompleteDate,
                   canceledOn, userTestDate, userTestCompleteDate, implementationDate, plannedImplementationDate,
                   createdOn;
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


  void SetDate(DateTime src, DateTime dst)
  {
    
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
    Id = ticket.Id = Guid.NewGuid();
    if (groupId != null) ticket.GroupId = groupId;
    if (teamId != null) ticket.TeamId = teamId;
    if (statusId != null) ticket.StatusId = statusId;
    if (summary != null) ticket.Summary = summary;
    if (description != null) ticket.Description = description;
    if (projectId != null) ticket.ProjectId = projectId;
    if (deptId != null) ticket.DeptId = deptId;
    if (priorityId != null) ticket.PriorityId = priorityId;
    if (projectId != null) ticket.ProjectId = projectId;
    if (canceledBy != null) //ticket.CanceledBy = canceledBy;
    if (createdBy != null) ticket.CreatedBy = createdBy;
    if (businessUnitRep != null) ticket.BusinessUnitRep = businessUnitRep;
    if (requestedBy != null) ticket.RequestedBy = requestedBy;
    if (number != 0) ticket.Number = number;
    if (estimatedCost != null) ticket.EstimatedCost = estimatedCost;
    if (estimatedHours != null) ticket.EstimatedHours = estimatedHours;
    if (actualCost != null) ticket.ActualCost = actualCost;
    if (actualHours != null) ticket.ActualHours = actualHours;
    if (cancelComment != null) ticket.CancelComment = cancelComment;
    if (canceledOn != null && canceledOn.ToBinary() != 0L) ticket.CanceledOn = qaCompleteDate;

    if (receivedOn != null && receivedOn.ToBinary() != 0L) ticket.ReceivedOn = receivedOn;
    if (qaStartDate != null && qaStartDate.ToBinary() != 0L) ticket.QAStartDate = qaStartDate;
    if (qaCompleteDate != null && qaCompleteDate.ToBinary() != 0L) ticket.QACompletedDate = qaCompleteDate;
    if (userTestCompleteDate != null && userTestCompleteDate.ToBinary() != 0L) ticket.UserTestCompleteDate = userTestCompleteDate;
    if (userTestDate != null && userTestDate.ToBinary() != 0L) ticket.UserTestDueDate= userTestDate;
    if (implementationDate != null && implementationDate.ToBinary() != 0L) ticket.ImplementationDate = implementationDate;
    ticket.CreatedOn = DateTime.Now;
    
    if (qaRequired != null) ticket.QARequired = qaRequired;
    object x = Adapter.MaxTicketNumber(ticket.GroupId);
    ticket.Number  = (x == null) ? 1 : (int)x + 1;

    tickets.AddTicketsRow(ticket);
    int rowsAffected = Adapter.Update(tickets);
    // Return true if precisely one row was inserted,
    // otherwise false
    return rowsAffected == 1;
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Update, true)]
  public bool Update()
  {
    // Create a new DeptRow instance 
    Tracker.TicketsDataTable tickets = Adapter.GetTicket(Id);
    if (tickets.Count == 0)
      return false;

    Tracker.TicketsRow ticket = tickets[0];
    if (groupId != Guid.Empty ) ticket.GroupId = groupId;
    if (teamId != Guid.Empty) ticket.TeamId = teamId;
    if (statusId != Guid.Empty) ticket.StatusId = statusId;
    if (summary != null) ticket.Summary = summary;
    if (description != null) ticket.Description = description;
    if (projectId != Guid.Empty) ticket.ProjectId = projectId;
    if (deptId != Guid.Empty) ticket.DeptId = deptId;
    if (priorityId != Guid.Empty) ticket.PriorityId = priorityId;
    if (createdBy != Guid.Empty) ticket.CreatedBy = createdBy;
    if (businessUnitRep != null) ticket.BusinessUnitRep = businessUnitRep;
    if (requestedBy != Guid.Empty) ticket.RequestedBy = requestedBy;
    if (estimatedCost != 0) ticket.EstimatedCost = estimatedCost;
    if (estimatedHours != 0) ticket.EstimatedHours = estimatedHours;
    if (actualCost != 0) ticket.ActualCost = actualCost;
    if (actualHours != 0) ticket.ActualHours = actualHours;
    if (cancelComment != null) ticket.CancelComment = cancelComment;
    if (qaRequired != null) ticket.QARequired = qaRequired;
    if (canceledBy != Guid.Empty) ticket.CanceledBy = canceledBy;
    if (cancelComment != null) ticket.CancelComment = cancelComment;

    if (canceledOn != null && canceledOn.ToBinary() != 0L) ticket.CanceledOn = canceledOn;
    if (receivedOn != null && receivedOn.ToBinary() != 0L) ticket.ReceivedOn = receivedOn;
    if (qaStartDate != null && qaStartDate.ToBinary() != 0L) ticket.QAStartDate = qaStartDate;
    if (qaCompleteDate != null && qaCompleteDate.ToBinary() != 0L) ticket.QACompletedDate = qaCompleteDate;
    if (userTestCompleteDate != null && userTestCompleteDate.ToBinary() != 0L) ticket.UserTestCompleteDate = userTestCompleteDate;
    if (userTestDate != null && userTestDate.ToBinary() != 0L) ticket.UserTestDueDate = userTestDate;
    if (implementationDate != null && implementationDate.ToBinary() != 0L) ticket.ImplementationDate = implementationDate;
    if (plannedImplementationDate != null && plannedImplementationDate.ToBinary() != 0L) ticket.PlannedImplementationDate = plannedImplementationDate;

    int rowsAffected = Adapter.Update(tickets);
    // Return true if precisely one row was inserted,
    // otherwise false
    return rowsAffected == 1;
  }
}






