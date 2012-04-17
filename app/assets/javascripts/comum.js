// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function showNotification(success, message) {

  $("#divNotificacao").remove();

  var body = "<div id='divNotificacao'>";
  body += "<table border='1' width='100%'>";
  body += "<tr>";
  body += "<td id='tabelaNotificacao' align='center'>";
  body += message;
  body += "</td>";
  body += "</tr>";
  body += "</table>";
  body += "</div>";

  $(document.body).append(body);

  $("#divNotificacao").hide();
  $("#divNotificacao").css("position", "absolute");

  $("#tabelaNotificacao").css("font-weight", "bold");

  $("#tabelaNotificacao").css("font-size", "13px");
  $("#tabelaNotificacao").css("color", "white");
  $("#tabelaNotificacao").css("align", "center");
 
  $("#tabelaNotificacao").css("padding", "15px 200px 12px 160px");
  $("#divNotificacao").css("padding-left", "300px");
  $("#divNotificacao").css("top", "-1px");
  $("#divNotificacao").css("align", "center");
  $("#divNotificacao").slideDown("slow");
  $("#divNotificacao").maxZIndex();

  if (success) {
     $("#tabelaNotificacao").css("background-color", "#6D9C34");
  } else {
     $("#tabelaNotificacao").css("background-color", "#D43F3F");
  }

  setTimeout("hiddenNotification();", 3500);
}

function hiddenNotification() {
  $("#divNotificacao").slideUp();
}

$.maxZIndex = $.fn.maxZIndex = function(opt) {
  var def = { inc: 10, group: "*" };
  $.extend(def, opt);
  var zmax = 0;
  $(def.group).each(function() {
     var cur = parseInt($(this).css('z-index'));
     zmax = cur > zmax ? cur : zmax;
  });
  if (!this.jquery)
     return zmax;

  return this.each(function() {
     zmax += def.inc;
     $(this).css("z-index", zmax);
  });
};