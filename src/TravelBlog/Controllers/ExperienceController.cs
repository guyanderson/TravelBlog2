﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TravelBlog.Models;
using Microsoft.EntityFrameworkCore;

namespace TravelBlog.Controllers
{
    public class ExperienceController : Controller
    {
        private TravelBlogContext db = new TravelBlogContext();
        //View List Of Experiences
        public IActionResult Index()
        {
            return View(db.Experiences.Include(something => something.Location).ToList());
        }
        public IActionResult Details(int id)
        {
            var thisExperience = db.Experiences.FirstOrDefault(something => something.ExperienceId == id);
            var foundLocation = db.Locations.FirstOrDefault(something => something.LocationId == thisExperience.LocationId);
            ViewBag.Location = foundLocation.Name;
            ViewBag.LocationId = thisExperience.LocationId;
           
            return View(thisExperience);         
        }
    }
}
