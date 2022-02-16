!(function(l) {
  var e,
    a =
      '<svg><symbol id="icon-game" viewBox="0 0 1279 1024"><path d="M683.2 588.8m-43.2 0a43.2 43.2 0 1 0 86.4 0 43.2 43.2 0 1 0-86.4 0Z" p-id="6816"></path><path d="M942.4 358.4c-30.4-17.6-64-25.6-97.6-25.6H555.2v-256c0-25.6-17.6-43.2-43.2-43.2s-43.2 17.6-43.2 43.2v256H174.4C81.6 332.8 0 414.4 0 512v299.2c0 97.6 81.6 179.2 174.4 179.2 84.8 0 158.4-64 174.4-145.6h324.8c17.6 81.6 84.8 145.6 174.4 145.6 97.6 0 174.4-81.6 174.4-179.2V512c1.6-59.2-28.8-120-80-153.6z m-4.8 456c0 51.2-36.8 94.4-88 94.4s-89.6-43.2-89.6-94.4c0-30.4-20.8-56-56-56H353.6c-64 0-84.8 25.6-84.8 56 0 51.2-43.2 89.6-89.6 89.6-51.2 0-89.6-43.2-89.6-94.4V507.2c-4.8-46.4 38.4-89.6 84.8-89.6H848c25.6 0 46.4 8 64 30.4 17.6 17.6 25.6 38.4 25.6 64v302.4z" p-id="6817"></path><path d="M340.8 545.6h-43.2v-43.2c0-25.6-17.6-43.2-43.2-43.2s-43.2 17.6-43.2 43.2v43.2h-43.2c-25.6 0-43.2 17.6-43.2 43.2s17.6 43.2 43.2 43.2h43.2v43.2c0 25.6 17.6 43.2 43.2 43.2s43.2-17.6 43.2-43.2v-43.2h43.2c25.6 0 43.2-17.6 43.2-43.2s-17.6-43.2-43.2-43.2z" p-id="6818"></path><path d="M852.8 588.8m-43.2 0a43.2 43.2 0 1 0 86.4 0 43.2 43.2 0 1 0-86.4 0Z" p-id="6819"></path><path d="M768 504m-43.2 0a43.2 43.2 0 1 0 86.4 0 43.2 43.2 0 1 0-86.4 0Z" p-id="6820"></path><path d="M768 673.6m-43.2 0a43.2 43.2 0 1 0 86.4 0 43.2 43.2 0 1 0-86.4 0Z" p-id="6821"></path></symbol></svg>',
    t = (e = document.getElementsByTagName("script"))[
      e.length - 1
    ].getAttribute("data-injectcss");
  if (t && !l.__iconfont__svg__cssinject__) {
    l.__iconfont__svg__cssinject__ = !0;
    try {
      document.write(
        "<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>"
      );
    } catch (e) {
      console && console.log(e);
    }
  }
  !(function(e) {
    if (document.addEventListener)
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState))
        setTimeout(e, 0);
      else {
        var t = function() {
          document.removeEventListener("DOMContentLoaded", t, !1), e();
        };
        document.addEventListener("DOMContentLoaded", t, !1);
      }
    else
      document.attachEvent &&
        ((i = e),
        (o = l.document),
        (c = !1),
        (a = function() {
          try {
            o.documentElement.doScroll("left");
          } catch (e) {
            return void setTimeout(a, 50);
          }
          n();
        })(),
        (o.onreadystatechange = function() {
          "complete" == o.readyState && ((o.onreadystatechange = null), n());
        }));
    function n() {
      c || ((c = !0), i());
    }
    var i, o, c, a;
  })(function() {
    var e, t, n, i, o, c;
    ((e = document.createElement("div")).innerHTML = a),
      (a = null),
      (t = e.getElementsByTagName("svg")[0]) &&
        (t.setAttribute("aria-hidden", "true"),
        (t.style.position = "absolute"),
        (t.style.width = 0),
        (t.style.height = 0),
        (t.style.overflow = "hidden"),
        (n = t),
        (i = document.body).firstChild
          ? ((o = n), (c = i.firstChild).parentNode.insertBefore(o, c))
          : i.appendChild(n));
  });
})(window);
