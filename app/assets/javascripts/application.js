// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery.turbolinks
//= require_tree .

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parents(".answer_fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().prev().append(content.replace(regexp, new_id));
}

$(document).ready(function(){
  init();
  if(document.getElementById("suggest-question-button") != null){
    document.getElementById("suggest-question-button").onclick = modal_show;
  }
})

var count;
var t = null;
var timespan;

function init(){
  if(document.getElementById("timer") != null){
    var time= document.getElementById("timer").innerText;
    count=parseInt(time)-1;
    timespan = document.getElementById("timer");
    document.getElementById("exam-save").onclick = save;
    document.getElementById("exam-resume").onclick = resume;
    start();
  }
}

function display() {
  var min = parseInt(count/60);
  var sec = count%60;
  timespan.innerHTML =  min + " : "+sec;
}

function countdowns() {
  display();
  if (count == 0) {
    document.getElementById("exam-submit").click();
  }else{
    count--;
    document.getElementById("exam_time").value = count;
    t = setTimeout("countdowns()", 1000);
 }
}

function start(){
  if (t==null && count>0){
    countdowns();
  }
  document.getElementById("exam-resume").style.display = "none";
  document.getElementById("exam-save").style.display = "block";
  block_form_action(false);
}

function stop() {
  clearTimeout(t);
  t = null;
  block_form_action(true);
  document.getElementById("exam-resume").style.display = "none";
  document.getElementById("exam-save").style.display = "none";
  timespan.style.display = "none";

}

function save() {
  clearTimeout(t);
  t = null;
  document.getElementById("exam-resume").style.display = "block";
  document.getElementById("exam-save").style.display = "none";
  block_form_action(true);
}

function resume() {
  start();
}

window.onbeforeunload = function(event){
  document.getElementById("exam-submit").click();
}

function block_form_action(action) {
  var inputs = document.getElementsByTagName("input");
  for (var i = 0; i < inputs.length; i++) {
    if (inputs[i].type === "radio") {
      inputs[i].disabled = action;
    }
  }
}

function modal_show() {
  $("#question-modal").modal("show");
}
