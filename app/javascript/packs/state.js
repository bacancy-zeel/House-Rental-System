document.addEventListener("turbolinks:load", function(){
    var state = document.getElementById("state");

    state.addEventListener("change", function(){
        $.ajax({
          url: "/users?state=" + state.value,
          type: "GET"
        })
      })

})