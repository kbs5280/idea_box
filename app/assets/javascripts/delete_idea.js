   function deleteIdea(){
     $("#latest-ideas").on("click", "#delete-idea", function(){
       var $idea = $(this).closest(".idea")
       $.ajax({
         url: "api/v1/ideas/" + $idea.data("id") + ".json",
         method: "DELETE"
       }).then( function(){
         $idea.remove()
       }).fail(handleError)
     })
   }
