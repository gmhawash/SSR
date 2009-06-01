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
public class DeptsBLL
{

  private DeptsTableAdapter _DeptsAdapter = null;
  protected DeptsTableAdapter Adapter
  {
    get
    {
      if (_DeptsAdapter == null)
        _DeptsAdapter = new DeptsTableAdapter();
      return _DeptsAdapter;
    }
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public Tracker.DeptsDataTable GetDepts()
  {
    return Adapter.GetDepts();    
  }
}
