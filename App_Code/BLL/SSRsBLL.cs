using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SSRTableAdapters;

/// <summary>
/// Summary description for Class1
/// </summary>

[System.ComponentModel.DataObject]
public class SSRsBLL
{

  private DEPTTableAdapter _deptsAdapter = null;
  protected DEPTTableAdapter Adapter
  {
    get
    {
      if (_deptsAdapter == null)
        _deptsAdapter = new DEPTTableAdapter();
      return _deptsAdapter;
    }
  }

  [System.ComponentModel.DataObjectMethodAttribute
  (System.ComponentModel.DataObjectMethodType.Select, true)]
  public SSR.DEPTDataTable GetDepts()
  {
    return Adapter.GetDepts();    
  }

}
