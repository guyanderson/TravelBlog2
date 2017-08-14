using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Xunit;
using TravelBlog.Controllers;
using TravelBlog.Models;
using Moq;
using TravelBlog.Models.Repositories;
using TravelBlog.Tests.Models;

namespace TravelBlog.Tests.ControllerTests
{
    public class SuggestionControllerTest
    {
        EFSuggestionRepository db = new EFSuggestionRepository(new TestDbContext());

        Mock<ISuggestionRepository> mock = new Mock<ISuggestionRepository>();

            private void DbSetup()
            {
                mock.Setup(m => m.Suggestions).Returns(new Suggestion[]
                {
                    new Suggestion { SuggestionId = 1, Destination = "France" },
                    new Suggestion { SuggestionId = 2, Destination = "Italy" },
                    new Suggestion { SuggestionId = 3, Destination = "Germany" },
                }.AsQueryable());
            }

        [Fact]
        public void Mock_GetViewResultIndex_Test() //Confirms route returns view
        {
            //Arrange
            DbSetup();
            SuggestionController controller = new SuggestionController(mock.Object);

            //Act
            var result = controller.Index();

            //Assert
            Assert.IsType<ViewResult>(result);
        }

        [Fact]
        public void Mock_IndexListOfSuggestions_Test() //Confirms model as list of suggestions
        {
            // Arrange
            DbSetup();
            ViewResult indexView = new SuggestionController(mock.Object).Index() as ViewResult;

            // Act
            var result = indexView.ViewData.Model;

            // Assert
            Assert.IsType<List<Suggestion>>(result);
        }

        [Fact]
        public void Mock_ConfirmEntry_Test() //Confirms presence of known entry
        {
            // Arrange
            DbSetup();
            SuggestionController controller = new SuggestionController(mock.Object);
            Suggestion testSuggestion = new Suggestion();
            testSuggestion.Destination = "France";
            testSuggestion.SuggestionId = 1;

            // Act
            ViewResult indexView = controller.Index() as ViewResult;
            var collection = indexView.ViewData.Model as IEnumerable<Suggestion>;

            // Assert
            Assert.Contains<Suggestion>(testSuggestion, collection);
        }

        [Fact]
        public void DB_CreateNewEntry_Test()
        {
            // Arrange
            SuggestionController controller = new SuggestionController(db);
            Suggestion testSuggestion = new Suggestion();
            testSuggestion.Destination = "TestDb Suggestion";

            // Act
            controller.Create(testSuggestion);
            var collection = (controller.Index() as ViewResult).ViewData.Model as IEnumerable<Suggestion>;

            // Assert
            Assert.Contains<Suggestion>(testSuggestion, collection);
        }

        public void Dispose() //needed?
        {
            db.RemoveAll(db.Suggestions);
        }

    }
}
