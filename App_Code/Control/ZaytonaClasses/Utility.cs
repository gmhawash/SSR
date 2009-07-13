using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        return (totrim.Length > 25) ? totrim.Substring(0, 24) + "  <span style='color:red'>...</span>" : totrim;
      }
    }

}
