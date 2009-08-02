using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrackerTableAdapters;

/// <summary>
/// Summary description for Utility
/// </summary>
public class Utility
{
    public static string TrimString(object stringtotrim)
    {
      if (!(stringtotrim is string) || String.IsNullOrEmpty(stringtotrim as String))
        return null;
      else {
        string totrim = stringtotrim as String;
        return (totrim.Length > 25) ? totrim.Substring(0, 24) + "  <span style='color:red;'>...more.</span>" : totrim;
      }
    }

    public static string IsNew(object CreatedOn)
    {
      if ((CreatedOn is DateTime)) {
        DateTime cdate = (DateTime) CreatedOn;

        if (cdate.ToBinary() == 0L || DateTime.Now < cdate.AddMinutes (20))
          return @"<span style='color:red;'>New</span>";
      }
      return "";
    }

    public static Guid? StatusId(string status)
    {
      TicketsBLL bll = new TicketsBLL(); 

      StatusesTableAdapter ta = new StatusesTableAdapter();
      Guid? id = ta.GetId(status);
      return id;
    }

    public static bool IsAssigned(object id)
    {
      TicketsUsersTableAdapter trta = new TicketsUsersTableAdapter();
      return (int)trta.spIsAssigned((Guid)id) > 0;
    }
}
