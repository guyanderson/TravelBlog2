﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;



namespace TravelBlog.Models
{
    public class TravelBlogContext: IdentityDbContext<ApplicationUser>
    {
        public TravelBlogContext() { }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Experience> Experiences { get; set; }
        public DbSet<Person> People { get; set; }
        public DbSet<Region> Regions { get; set; }
        public virtual DbSet<Suggestion> Suggestions { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=TravelBlog;integrated security=True");
        }
        public TravelBlogContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
        public DbSet<Comment> Comments { get; set; }
    }
}
