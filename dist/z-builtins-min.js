// z-builtins v0.2.0
// Jakob Mattsson 2014-03-18
(function(b){function a(b,d){if({}.hasOwnProperty.call(a.cache,b))return a.cache[b];var e=a.resolve(b);if(!e)throw new Error('Failed to resolve module '+b);var c={id:b,require:a,filename:b,exports:{},loaded:!1,parent:d,children:[]};d&&d.children.push(c);var f=b.slice(0,b.lastIndexOf('/')+1);return a.cache[b]=c.exports,e.call(c.exports,c,c.exports,f,b),c.loaded=!0,a.cache[b]=c.exports}a.modules={},a.cache={},a.resolve=function(b){return{}.hasOwnProperty.call(a.modules,b)?a.modules[b]:void 0},a.define=function(b,c){a.modules[b]=c},a.define('/lib/index.js',function(c,b,d,e){(function(){var h,A,z,y,x,u,m,d,f,e,i,j,l,k,s,t,w,v,n,o,p,q,r,g=[].slice;f=a('/lib/methods.js',c),m=a('/lib/logging.js',c),u=Array.isArray||function(a){return Object.prototype.toString.call(a)==='[object Array]'},x=function(){return this}(),A=function(a){return b[a]=function(){var b;return b=1<=arguments.length?g.call(arguments,0):[],this.value[a].apply(this.value,b)}},z=function(a){return b[a]=function(){var c,b;if(c=1<=arguments.length?g.call(arguments,0):[],!Array.isArray(this.value))throw new Error('Must be an array');return b=this.value.slice(0),b[a].apply(b,c),b}},h=function(a,c){return b[a]=function(){var a;return a=1<=arguments.length?g.call(arguments,0):[],c.apply(null,[this.value].concat(g.call(a)))}};for(e in m)y=m[e],b[e]=y;for(n=f.plain,i=0,s=n.length;i<s;i++)d=n[i],A(d);for(o=f.mutators,j=0,t=o.length;j<t;j++)d=o[j],z(d);for(p=f.globals,l=0,w=p.length;l<w;l++)d=p[l],h(d,x[d]);q=f.methods;for(e in q)d=q[e],h(e,d);for(r=f.maths,k=0,v=r.length;k<v;k++)d=r[k],h(d,Math[d]);b.length=function(){if(typeof this.value!=='string'&&!u(this.value))throw new Error('Function "length" can only be called on strings and arrays');return this.value.length},b.get=function(a){return this.value[a]},b.toStr=function(){return this.value.toString()},b['if']=function(b,a){return this.value?b():a?a():void 0}}.call(this))}),a.define('/lib/logging.js',function(c,b,d,e){(function(){var d;d=function(a){return(typeof console!=='undefined'&&console!==null?console.log!=null:!1)?console.log(a):void 0},b.log=function(){return d(this.value)},b.print=function(){var b,e;return b=a('util',c),e=b.inspect(this.value,{depth:null}),d(JSON.stringify(this.value))}}.call(this))}),a.define('util',function(b,a,c,d){(function(){a.inspect=function(a){return JSON.stringify(a)}}.call(this))}),a.define('/lib/methods.js',function(b,a,c,d){(function(){a.plain=['charAt','charCodeAt','concat','indexOf','lastIndexOf','localeCompare','match','replace','search','slice','split','substr','substring','toLocaleLowerCase','toLocaleUpperCase','toLowerCase','toUpperCase','trim','concat','join','slice','indexOf','lastIndexOf','forEach','every','some','filter','map','reduce','reduceRight','toLocaleString','apply','bind','call','toExponential','toFixed','toLocaleString','toPrecision','exec','test'],a.mutators=['reverse','sort','pop','shift','push','splice','unshift'],a.globals=['eval','isFinite','isNaN','parseFloat','parseInt','decodeURI','decodeURIComponent','encodeURI','encodeURIComponent','escape','unescape'],a.methods={isArray:Array.isArray,stringify:JSON.stringify,parseJSON:JSON.parse,logarithm:Math.log},a.maths=['abs','acos','asin','atan','atan2','ceil','cos','exp','floor','max','min','pow','round','sin','sqrt','tan']}.call(this))}),b.zBuiltins=a('/lib/index.js')}.call(this,this))
