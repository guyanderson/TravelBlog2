using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TravelBlog.Models.Repositories
{
    public interface ISuggestionRepository
    {
        IQueryable<Suggestion> Suggestions { get; }
        Suggestion Save(Suggestion item);
        Suggestion Edit(Suggestion item);
        void Remove(Suggestion item);
    }
}
