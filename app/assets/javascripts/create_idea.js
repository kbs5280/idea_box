$(document).ready(function() {

  createIdea();
  fetchIdeas();
  upVoteIdea();
  deleteIdea();

});

  function createIdea() {
    $("#create-idea").on("click", function(event) {
      event.preventDefault();
      var title = $("#idea-title").val()
      var body = $("#idea-body").val()

      var ideaParams = {
        idea: {
          title: title,
          body: body
        }
      }

      $.ajax({
        url: "api/v1/ideas",
        data: ideaParams,
        type: "POST"
      }).then(createIdeaHTML)
      .then(renderIdea)
      .then(resetFormValues)
      //.fail(handleError)
    })
  }

  function createIdeaHTML( ideaData ) {
    return $("<div class='idea' data-id='"
    + ideaData.id
    + "'><h3> Title: "
    + ideaData.title
    + "</h3><p>"
    + ideaData.body
    + "</p><p>"
    + ideaData.quality
    + "</p>"
    + "<button id='upvote-idea' name='button-upvote'"
    + "class='btn btn-default btn-xs'>Upvote</button>"
    + "<br>"
    + "<button id='downvote-idea' name='button-downvote'"
    + "class='btn btn-default btn-xs'>Downvote</button>"
    + "<br>"
    + "<button id='delete-idea' name='button-delete'"
    + "class='btn btn-default btn-xs'>Delete</button>"
    + "</div>")
  }

  function renderIdea( ideaData ) {
    $("#latest-ideas").append(ideaData);
  }

  function resetFormValues() {
    $("#idea-title").val('')
    $("#idea-body").val('')
  }

  function fetchIdeas() {
    $.ajax({
      url: "api/v1/ideas",
      type: "GET"
    }).then(collectIdeas)
    .then(renderIdeas)
  }

  function collectIdeas( ideasData ) {
    return ideasData.map(createIdeaHTML);
  }

  function renderIdeas( ideasData ) {
    $("#latest-ideas").html(ideasData);
  }

  function deleteIdea(){
     $("#latest-ideas").on("click", "#delete-idea", function(){
       var $idea = $(this).closest(".idea")
       $.ajax({
         url: "api/v1/ideas/" + $idea.data("id") + ".json",
         method: "DELETE"
       }).then( function(){
         $idea.remove()
       })//.fail(handleError)
     })
   }

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

   function wipeIdeas() {
     $(".idea").remove();
   }
