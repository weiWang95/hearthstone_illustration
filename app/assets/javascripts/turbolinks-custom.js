(function() {
  this.App || (this.App = {});
  if (App.turbolinksCustomJsInited) { return; }
  App.turbolinksCustomJsInited = true;

  //
  Turbolinks.reload = function() {
    Turbolinks.visit(window.location.href);
  }
}).call(this);