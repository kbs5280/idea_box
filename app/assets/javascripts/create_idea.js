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
      .fail(handleError)
    })
  }

  function createIdeaHTML( ideaData ) {
    return $("<div class='idea' data-id='"
    + ideaData.id
    + "'><h3> Title:"
    + "</h3><p id='title' contenteditable='true'>"
    + ideaData.title
    + "</p><h3>Quality:"
    + "</h3><p>"
    + ideaData.quality
    + "<br><button id='upvote-idea' name='button-upvote' class='btn btn-primary btn-md'"
    + "class='btn btn-default btn-xs'>Upvote</button>"
    + "<button id='downvote-idea' name='button-downvote' class='btn btn-primary btn-md'"
    + "class='btn btn-default btn-xs'>Downvote</button>"
    + "</p><h3> Body:"
    + "</h3><p id='body' contenteditable='true'>"
    + ideaData.body
    + "</p>"
    + "<button id='delete-idea' name='button-delete' class='btn btn-primary btn-md'"
    + "class='btn btn-default btn-xs'>Delete</button>"
    + "</div><br><br>")
  }

  function renderIdea( ideaData ) {
    $("#latest-ideas").prepend(ideaData);
  }
