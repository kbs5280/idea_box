$(document).ready(function() {

  createIdea();

});

  function createIdea() {
    $("#create-idea").on("click", function() {
      console.log('creating post...')
      var title = $("idea-title").val();
      var body = $("idea-body").val();

      var ideaParams = {
        idea: {
          title: title,
          body: body
        }
      }

      $.ajax({
        url: "/api/v1/ideas",
        data: ideaParams,
        type: "POST"
      })//.then(createIdeaHTML)
      //.then(renderIdea)
      //.fail(handleError)
      console.log('should have routing error...')
    })
  }
