// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
function drawEquityChart(id, data) {
  equity_options = {
    title: 'Equity Chart',
    legend: 'none',
    width: 600,
    height: 220,
    backgroundColor:{
      fill: 'mintcream'
    },
    chartArea:{
      left: 110
    },
    colors: ['maroon'],
    animation:{
      duration: 1000,
      easing: 'out',
    }        
  };  
  equity_chart = new google.visualization.LineChart(document.getElementById(id));
  equity_chart.draw(data, equity_options);
}
$(function(){
  $("body").mbTooltip({ // also $([domElement]).mbTooltip  >>  in this case only children element are involved
    opacity : .95,       //opacity
    wait:800,           //before show
    cssClass:"default",  // default = default
    timePerWord:70,      //time to show in milliseconds per word
    hasArrow:false,     // if you whant a little arrow on the corner
    hasShadow:true,
    imgPath:"images/",
    anchor:"mouse", //"parent"  you can anchor the tooltip to the mouse position or at the bottom of the element
    shadowColor:"black", //the color of the shadow
    mb_fade:200 //the time to fade-in
  });
});