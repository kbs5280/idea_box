$(document).ready(function() {

  createIdea();
  fetchIdeas();

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
        type: "POST" // removed trailing comma
        // success: function(data){ //this function is the same and .then(createIdeaHTML) passing data implicitly
        //   createIdeaHTML(data);
        // };
      }).then(createIdeaHTML)
      .then(renderIdea)
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
    + "</p>"
    + "<button id='delete-idea' name='button-fetch'"
    + "class='btn btn-default btn-xs'>Delete</button>"
    + "</div>")
  }

  function renderIdea( ideaData ) {
    $("#latest-ideas").append(ideaData);
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
