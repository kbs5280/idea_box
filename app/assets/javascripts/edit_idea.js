  function updateTitle() {
    $("#latest-ideas").on("blur", "#title", function(){
      var $idea = $(this).closest(".idea")
      var title = $(this).parent().find("#title").html()

      var updateTitle = {
        idea: {
          title: title
        }
      }

      $.ajax({
        url: "api/v1/ideas/" + $idea.data("id") + ".json",
        data: updateTitle,
        method: "PUT"
      }).then(wipeIdeas).then(fetchIdeas)
    })
  }

  function updateBody() {
    $("#latest-ideas").on("blur", "#body", function(){
      var $idea = $(this).closest(".idea")
      var body = $(this).parent().find("#body").html()

      var updateBody = {
        idea: {
          body: body
        }
      }

      $.ajax({
        url: "api/v1/ideas/" + $idea.data("id") + ".json",
        data: updateBody,
        method: "PUT"
      }).then(wipeIdeas).then(fetchIdeas)
    })
  }
