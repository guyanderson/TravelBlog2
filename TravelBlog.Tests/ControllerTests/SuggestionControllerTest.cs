using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Xunit;
using TravelBlog.Controllers;
using TravelBlog.Models;

namespace TravelBlog.Tests.ControllerTests
{
    public class SuggestionControllerTest
    {

        [Fact]
        public void Post_MethodAddsSuggestion_Test()
        {
            // Arrange
            SuggestionController controller = new SuggestionController();
            Suggestion testSuggestion = new Suggestion();
            testSuggestion.Destination = "test item";

            // Act
            controller.Create(testSuggestion);
            ViewResult indexView = new SuggestionController().Index() as ViewResult;
            var collection = indexView.ViewData.Model as IEnumerable<Suggestion>;

            // Assert
            Assert.Contains<Suggestion>(testSuggestion, collection);
        }

    }
}
