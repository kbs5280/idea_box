  function upVoteIdea(){
    var upVote = {
      idea: {
        vote: "upvote"
      }
    }
     $("#latest-ideas").on("click", "#upvote-idea", function(){
       var $idea = $(this).closest(".idea")
       $.ajax({
         url: "api/v1/ideas/" + $idea.data("id") + ".json",
         data: upVote,
         method: "PUT"
       }).then(wipeIdeas).then(fetchIdeas)
     })
   }

  function downVoteIdea(){
    var downVote = {
      idea: {
        vote: "downvote"
      }
    }
     $("#latest-ideas").on("click", "#downvote-idea", function(){
       var $idea = $(this).closest(".idea")
       $.ajax({
         url: "api/v1/ideas/" + $idea.data("id") + ".json",
         data: downVote,
         method: "PUT"
       }).then(wipeIdeas).then(fetchIdeas)
     })
   }
