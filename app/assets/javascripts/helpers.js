
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

  function resetFormValues() {
    $("#idea-title").val('')
    $("#idea-body").val('')
  }

  function wipeIdeas() {
    $(".idea").remove();
  }

  function handleError(error){ console.log(error) }
