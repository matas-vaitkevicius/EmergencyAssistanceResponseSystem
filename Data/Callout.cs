//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Callout
    {
        public long Id { get; set; }
        public System.Guid Crew { get; set; }
        public string Route { get; set; }
        public System.Data.Entity.Spatial.DbGeography Location { get; set; }
        public System.DateTime LastSignal { get; set; }
        public bool IsFinished { get; set; }
        public Nullable<System.DateTime> LastBroadcast { get; set; }
    
        public virtual Crew Crew1 { get; set; }
    }
}
