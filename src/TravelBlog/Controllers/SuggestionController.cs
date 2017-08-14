using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TravelBlog.Models;
using Microsoft.EntityFrameworkCore;
using TravelBlog.Models.Repositories;

namespace TravelBlog.Controllers
{
    public class SuggestionController : Controller
    {
        private ISuggestionRepository suggestionRepo;

        public SuggestionController(ISuggestionRepository thisRepo = null)
        {
            if (thisRepo == null)
            {
                this.suggestionRepo = new EFSuggestionRepository();
            }
            else
            {
                this.suggestionRepo = thisRepo;
            }
        }

        public ViewResult Index()
        {
            return View(suggestionRepo.Suggestions.ToList());
        }

        public IActionResult Details(int id)
        {
            Suggestion thisSuggestion = suggestionRepo.Suggestions.FirstOrDefault(x => x.SuggestionId == id);
            return View(thisSuggestion);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Suggestion suggestion)
        {
            suggestionRepo.Save(suggestion);
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Suggestion thisSuggestion = suggestionRepo.Suggestions.FirstOrDefault(x => x.SuggestionId == id);
            return View(thisSuggestion);
        }

        [HttpPost]
        public IActionResult Edit(Suggestion suggestion)
        {
            suggestionRepo.Edit(suggestion);
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            Suggestion thisSuggestion = suggestionRepo.Suggestions.FirstOrDefault(x => x.SuggestionId == id);
            return View(thisSuggestion);
        }


        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            Suggestion thisSuggestion = suggestionRepo.Suggestions.FirstOrDefault(x => x.SuggestionId == id);
            suggestionRepo.Remove(thisSuggestion);
            return RedirectToAction("Index");
        }

    }
}
