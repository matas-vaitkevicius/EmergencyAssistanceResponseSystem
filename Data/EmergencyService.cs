﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core;

namespace Data
{
    public class EmergencyService
    {
        public string CreateOrUpdateLocation(string crewToken, string location, string route)
        {
            using (var db = new EarsEntities())
            {
                var crew = db.Crew.SingleOrDefault(o => o.GoogleUserId == crewToken);
                if (crew != null)
                {
                    if (!string.IsNullOrEmpty(route))
                    {
                        var callout = db.Callout.FirstOrDefault(o => o.Route == route);
                        if (callout != null)
                        {
                            callout.Location = location.ToDbGeography();
                            callout.LastSignal = DateTime.Now;
                            db.Entry(callout).Property(o => o.Location).IsModified = true;
                            db.Entry(callout).Property(o => o.LastSignal).IsModified = true;
                        }
                        else {
                           route = CreateNewCallout(db, crew, location);
                        }
                    }
                    else {
                        route = CreateNewCallout(db, crew, location);
                    }
                    db.SaveChanges();
                }
            }

            return route;
        }

        public string FinishCallout(string token, string route)
        {
            throw new NotImplementedException();
        }

        private string CreateNewCallout(EarsEntities db, Crew crew, string location)
        {
            var route = Guid.NewGuid().ToString();
            db.Callout.Add(new Callout { Crew = crew.Id, Location = location.ToDbGeography(), Route = route, IsFinished = false, LastSignal = DateTime.Now});
            return route;
        }

        public bool AddUser(string token, string location)
        {
            using (var db = new EarsEntities())
            {
                var user = db.Users.SingleOrDefault(o => o.GcmUserId == token);
                if (user == null)
                {
                    db.Users.Add(new Users { CreatedOn = DateTime.Now, GcmUserId = token, LastSeenOn = DateTime.Now, Location = location.ToDbGeography() });
                    db.SaveChanges();
                }

                return true;
            }
        }

        public bool AddCrew(string token, string coordinates)
        {
            using (var db = new EarsEntities())
            {
                var user = db.Crew.SingleOrDefault(o => o.GoogleUserId == token);
                if (user == null)
                {
                    db.Crew.Add(new Crew { CreatedOn = DateTime.Now, GoogleUserId = token, LastSeenOn = DateTime.Now, Location = coordinates.ToDbGeography() });
                    db.SaveChanges();
                }

                return true;
            }
        }
    }
}
