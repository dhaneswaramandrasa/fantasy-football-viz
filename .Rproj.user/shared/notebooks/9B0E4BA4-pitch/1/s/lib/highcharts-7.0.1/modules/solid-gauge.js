/*
  Highcharts JS v7.0.1 (2018-12-19)
 Solid angular gauge module

 (c) 2010-2018 Torstein Honsi

 License: www.highcharts.com/license
*/
(function(l){"object"===typeof module&&module.exports?module.exports=l:"function"===typeof define&&define.amd?define(function(){return l}):l("undefined"!==typeof Highcharts?Highcharts:void 0)})(function(l){(function(f){var l=f.pInt,u=f.pick,q=f.isNumber,w=f.wrap,v;w(f.Renderer.prototype.symbols,"arc",function(a,g,d,c,f,b){a=a(g,d,c,f,b);b.rounded&&(c=((b.r||c)-b.innerR)/2,b=["A",c,c,0,1,1,a[12],a[13]],a.splice.apply(a,[a.length-1,0].concat(["A",c,c,0,1,1,a[1],a[2]])),a.splice.apply(a,[11,3].concat(b)));
return a});v={initDataClasses:function(a){var g=this.chart,d,c=0,r=this.options;this.dataClasses=d=[];a.dataClasses.forEach(function(b,h){b=f.merge(b);d.push(b);b.color||("category"===r.dataClassColor?(h=g.options.colors,b.color=h[c++],c===h.length&&(c=0)):b.color=f.color(r.minColor).tweenTo(f.color(r.maxColor),h/(a.dataClasses.length-1)))})},initStops:function(a){this.stops=a.stops||[[0,this.options.minColor],[1,this.options.maxColor]];this.stops.forEach(function(a){a.color=f.color(a[1])})},toColor:function(a,
g){var d=this.stops,c,f,b=this.dataClasses,h,e;if(b)for(e=b.length;e--;){if(h=b[e],c=h.from,d=h.to,(void 0===c||a>=c)&&(void 0===d||a<=d)){f=h.color;g&&(g.dataClass=e);break}}else{this.isLog&&(a=this.val2lin(a));a=1-(this.max-a)/(this.max-this.min);for(e=d.length;e--&&!(a>d[e][0]););c=d[e]||d[e+1];d=d[e+1]||c;a=1-(d[0]-a)/(d[0]-c[0]||1);f=c.color.tweenTo(d.color,a)}return f}};f.seriesType("solidgauge","gauge",{colorByPoint:!0},{translate:function(){var a=this.yAxis;f.extend(a,v);!a.dataClasses&&a.options.dataClasses&&
a.initDataClasses(a.options);a.initStops(a.options);f.seriesTypes.gauge.prototype.translate.call(this)},drawPoints:function(){var a=this,g=a.yAxis,d=g.center,c=a.options,r=a.chart.renderer,b=c.overshoot,h=q(b)?b/180*Math.PI:0,e;q(c.threshold)&&(e=g.startAngleRad+g.translate(c.threshold,null,null,null,!0));this.thresholdAngleRad=u(e,g.startAngleRad);a.points.forEach(function(b){var e=b.graphic,k=g.startAngleRad+g.translate(b.y,null,null,null,!0),t=l(u(b.options.radius,c.radius,100))*d[2]/200,m=l(u(b.options.innerRadius,
c.innerRadius,60))*d[2]/200,n=g.toColor(b.y,b),p=Math.min(g.startAngleRad,g.endAngleRad),q=Math.max(g.startAngleRad,g.endAngleRad);"none"===n&&(n=b.color||a.color||"none");"none"!==n&&(b.color=n);k=Math.max(p-h,Math.min(q+h,k));!1===c.wrap&&(k=Math.max(p,Math.min(q,k)));p=Math.min(k,a.thresholdAngleRad);k=Math.max(k,a.thresholdAngleRad);k-p>2*Math.PI&&(k=p+2*Math.PI);b.shapeArgs=m={x:d[0],y:d[1],r:t,innerR:m,start:p,end:k,rounded:c.rounded};b.startR=t;e?(t=m.d,e.animate(f.extend({fill:n},m)),t&&(m.d=
t)):(b.graphic=e=r.arc(m).attr({fill:n,"sweep-flag":0}).add(a.group),a.chart.styledMode||("square"!==c.linecap&&e.attr({"stroke-linecap":"round","stroke-linejoin":"round"}),e.attr({stroke:c.borderColor||"none","stroke-width":c.borderWidth||0})));e&&e.addClass(b.getClassName(),!0)})},animate:function(a){a||(this.startAngleRad=this.thresholdAngleRad,f.seriesTypes.pie.prototype.animate.call(this,a))}})})(l)});
//# sourceMappingURL=solid-gauge.js.map
