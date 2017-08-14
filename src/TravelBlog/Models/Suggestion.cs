using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TravelBlog.Models
{
    [Table("Suggestion")]
    public class Suggestion
    {
        [Key]
        public int SuggestionId { get; set; }
        public string Destination { get; set; }
        public override bool Equals(System.Object otherSuggestion)
        {
            if (!(otherSuggestion is Suggestion))
            {
                return false;
            }
            else
            {
                Suggestion newSuggestion = (Suggestion)otherSuggestion;
                return this.SuggestionId.Equals(newSuggestion.SuggestionId);
            }
        }

        public override int GetHashCode()
        {
            return this.SuggestionId.GetHashCode();
        }
    }
}
