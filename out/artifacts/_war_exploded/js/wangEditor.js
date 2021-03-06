(function (t, M) {
    function e() {
        return H + "_" + I++
    }
    function x(b) {
        return b.parent().is('div[contenteditable="true"]') ? b : "body" === b[0].nodeName.toLowerCase() ? n.children()
            .last() : b.is('div[contenteditable="true"]') ? b.children().last() : x(b.parent())
    }
    function y(b, a, c, z) {
        var k;
        if (h) {
            var l;
            u ? (l = f.getSelection(), l.removeAllRanges(), l.addRange(h)) : (l = f.selection.createRange(), l.setEndPoint(
                "EndToEnd", h), 0 === h.text.length ? l.collapse(!1) : l.setEndPoint("StartToStart", h), l.select())
        }
        if (h) {
            try {
                k = f.queryCommandEnabled(a)
            } catch (e) {
                k = !1
            }!0 === k ? f.execCommand(a, !1, c) : (k = A[a]) && k(a, c);
            z && z.call(n);
            B();
            E.find(".modal").hide();
            v.hide()
        }
        b.preventDefault()
    }
    function B() {
        w || (w = p.find("a[commandName]"));
        w.each(function () {
            var b = a(this),
                d = a.trim(b.attr("commandName")).toLowerCase();
            "insertunorderedlist" !== d && "insertorderedlist" !== d && (f.queryCommandState(d) ? b.addClass(
                "btn-selected") : b.removeClass("btn-selected"))
        })
    }
    if (t.jQuery) {
        var f = t.document,
            a = t.jQuery,
            u = "function" === typeof f.createRange,
            q, h, n = a('<div contenteditable="true" class="textarea" ></div>'),
            p = a('<div class="btn-container"></div>'),
            v = a('<div class="mask"></div>'),
            E = a("<div></div>"),
            w, A, H = "wangeditor_" + Math.random().toString().replace(".", "") + "_",
            I = 1,
            J =
                "\u5b8b\u4f53;\u9ed1\u4f53;\u6977\u4f53;\u96b6\u4e66;\u5e7c\u5706;\u5fae\u8f6f\u96c5\u9ed1;Arial;Verdana;Georgia;Times New Roman;Trebuchet MS;Courier New;Impact;Comic Sans MS"
                    .split(";"),
            C = {
                "#880000": "\u6697\u7ea2\u8272",
                "#800080": "\u7d2b\u8272",
                "#ff0000": "\u7ea2\u8272",
                "#ff00ff": "\u9c9c\u7c89\u8272",
                "#000080": "\u6df1\u84dd\u8272",
                "#0000ff": "\u84dd\u8272",
                "#00ffff": "\u6e56\u84dd\u8272",
                "#008080": "\u84dd\u7eff\u8272",
                "#008000": "\u7eff\u8272",
                "#808000": "\u6a44\u6984\u8272",
                "#00ff00": "\u6d45\u7eff\u8272",
                "#ffcc00": "\u6a59\u9ec4\u8272",
                "#808080": "\u7070\u8272",
                "#c0c0c0": "\u94f6\u8272",
                "#000000": "\u9ed1\u8272"
            },
            K = {
                1: "10px",
                2: "13px",
                3: "16px",
                4: "19px",
                5: "22px",
                6: "25px",
                7: "28px"
            };
        A = {
            insertHTML: function (b, d) {
                var c;
                h && (c = u ? h.commonAncestorContainer : h.parentElement(), c = x(a(c)), 0 === c.next().length &&
                (d += "<p>&nbsp;</p>"), c.after(a(d)))
            }
        };
        q = [{
            title: "\u5b57\u4f53",
            type: "dropMenu",
            txt: "fa fa-font",
            command: "fontName ",
            dropMenu: function () {
                var b = [];
                a.each(J, function (a, c) {
                    b.push(
                        '<li><a href="#" commandValue="${value}" style="font-family:${family};">${txt}</a></li>'
                            .replace("${value}", c).replace("${family}", c).replace("${txt}", c)
                    )
                });
                return a("<ul>" + b.join("") + "</ul>")
            }()
        }, {
            title: "\u5b57\u53f7",
            type: "dropMenu",
            txt: "fa fa-text-height",
            command: "fontSize",
            dropMenu: function () {
                var b = [];
                a.each(K, function (a, c) {
                    b.push(
                        '<li><a href="#" commandValue="${value}" style="font-size:${fontsize};">${txt}</a></li>'
                            .replace("${value}",
                                a).replace("${fontsize}", c).replace("${txt}", c))
                });
                return a("<ul>" + b.join("") + "</ul>")
            }()
        }, "split", {
            title: "\u52a0\u7c97",
            type: "btn",
            txt: "fa fa-bold",
            command: "bold",
            callback: function () {}
        }, {
            title: "\u4e0b\u5212\u7ebf",
            type: "btn",
            txt: "fa fa-underline",
            command: "underline "
        }, {
            title: "\u659c\u4f53",
            type: "btn",
            txt: "fa fa-italic",
            command: "italic "
        }, "split", {
            title: "\u524d\u666f\u8272",
            type: "dropMenu",
            txt: "fa fa-pencil|color:#4a7db1",
            command: "foreColor ",
            dropMenu: function () {
                var b = [];
                a.each(C, function (a, c) {
                    b.push(
                        '<li><a href="#" commandValue="${value}" style="color:${color};">${txt}</a></li>'
                            .replace("${value}",
                                a).replace("${color}", a).replace("${txt}", c))
                });
                return a("<ul>" + b.join("") + "</ul>")
            }()
        }, {
            title: "\u80cc\u666f\u8272",
            type: "dropMenu",
            txt: "fa fa-paint-brush|color:Red",
            command: "backColor ",
            dropMenu: function () {
                var b = [];
                a.each(C, function (a, c) {
                    b.push(
                        '<li><a href="#" commandValue="${value}" style="background-color:${color};color:#ffffff;">${txt}</a></li>'
                            .replace("${value}", a).replace("${color}", a).replace("${txt}", c)
                    )
                });
                return a("<ul>" + b.join("") + "</ul>")
            }()
        }, "split", {
            title: "\u65e0\u5e8f\u5217\u8868",
            type: "btn",
            txt: "fa fa-list-ul",
            command: "InsertUnorderedList "
        }, {
            title: "\u6709\u5e8f\u5217\u8868",
            type: "btn",
            txt: "fa fa-list-ol",
            command: "InsertOrderedList "
        }, "split", {
            title: "\u5de6\u5bf9\u9f50",
            type: "btn",
            txt: "fa fa-align-left",
            command: "JustifyLeft "
        }, {
            title: "\u5c45\u4e2d",
            type: "btn",
            txt: "fa fa-align-center",
            command: "JustifyCenter"
        }, {
            title: "\u53f3\u5bf9\u9f50",
            type: "btn",
            txt: "fa fa-align-right",
            command: "JustifyRight "
        }, "split", {
            title: "\u63d2\u5165\u94fe\u63a5",
            type: "modal",
            txt: "fa fa-link",
            modal: function () {
                var b =
                        e(),
                    d = e();
                $modal = a('<div>   <input id="' + b +
                    '" type="text" style="width:300px;"/>   <button id="' + d +
                    '" type="button">\u63d2\u5165\u94fe\u63a5</button></div>');
                callback = function () {
                    $modal.find("#" + b).val("")
                };
                $modal.find("#" + d).click(function (c) {
                    var d = a.trim($modal.find("#" + b).val());
                    d || (d = f.getElementById(b).value);
                    "" !== d && y(c, "createLink", d, callback)
                });
                return $modal
            }()
        }, {
            title: "\u53d6\u6d88\u94fe\u63a5",
            type: "btn",
            txt: "fa fa-unlink",
            command: "unLink "
        }, "split", {
            title: "\u63d2\u5165\u8868\u683c",
            type: "modal",
            txt: "fa fa-table",
            modal: function () {
                var b = e(),
                    d = e(),
                    c = e(),
                    f = e(),
                    k = a('<div>   \u884c\u6570\uff1a<input id="' + b +
                        '" type="text" style="width:30px;"/>   \u5217\u6570\uff1a<input id="' + d +
                        '" type="text"  style="width:30px;"/>   \u663e\u793a\u6807\u9898\u884c\uff1a<input id="' +
                        c + '" type="checkbox">   <button id="' + f +
                        '">\u63d2\u5165\u8868\u683c</button>', "</div>"),
                    l = function () {
                        k.find("input").val("")
                    };
                k.find("#" + f).click(function (a) {
                    var D = k.find("#" + b).val(),
                        D = "" === D || isNaN(+D) ? 3 : D,
                        f = k.find("#" + d).val(),
                        f =
                            "" === f || isNaN(+f) ? 5 : f,
                        L = k.find("#" + c).is(":checked"),
                        r, F;
                    r = "";
                    var h, m = [],
                        e = [],
                        g = '<td style="width:100px; ${style}">&nbsp;</td>';
                    h =
                        '<table border="0" cellpadding="0" cellspacing="0" style="${style}" > ${content} </table>'
                            .replace("${style}",
                                "border-left:1px solid #cccccc;border-top:1px solid #cccccc;");
                    g = g.replace("${style}",
                        "border-bottom:1px solid #cccccc;border-right:1px solid #cccccc;");
                    for (r = 0; r < D; r++) {
                        e = [];
                        for (F = 0; F < f; F++) e.push(g);
                        0 === r && L ? m.push(
                            '<tr style="font-weight:bold;background-color:#f1f1f1;">${content}</tr>'
                                .replace("${content}",
                                    e.join(""))) : m.push("<tr>${content}</tr>".replace(
                            "${content}", e.join("")))
                    }
                    r = h.replace("${content}", m.join(""));
                    y(a, "insertHTML", r, l)
                });
                return k
            }()
        }, {
            title: "\u63d2\u5165\u56fe\u7247",
            type: "modal",
            txt: "fa fa-image",
            modal: function () {
                var b = e(),
                    d = e();
                $modal = a('<div>   <input id="' + b +
                    '" type="text" style="width:300px;"/>   <button id="' + d +
                    '" type="button">\u63d2\u5165\u56fe\u7247</button></div>');
                callback = function () {
                    $modal.find("#" + b).val("")
                };
                $modal.find("#" + d).click(function (c) {
                    var d = a.trim($modal.find("#" +
                        b).val());
                    d || (d = f.getElementById(b).value);
                    "" !== d && y(c, "insertImage", d, callback)
                });
                return $modal
            }()
        }, "split", {
            title: "\u64a4\u9500",
            type: "btn",
            txt: "fa fa-undo",
            command: function (a) {
                f.execCommand("undo");
                a.preventDefault()
            },
            callback: function () {}
        }, {
            title: "\u91cd\u590d",
            type: "btn",
            txt: "fa fa-repeat",
            command: function (a) {
                f.execCommand("redo");
                a.preventDefault()
            }
        }];
        a.fn.wangEditor = function (b) {
            function d(b) {
                if ("split" === b.toString()) return a('<div class="split"></div>');
                var c = b.type,
                    d = b.txt,
                    f = b.title,
                    e = b.command,
                    h = b.dropMenu,
                    m = b.modal,
                    n = b.callback,
                    g = a('<a class="btn btn-default" href="#"></a>');
                "string" === typeof e && (e = a.trim(e)); - 1 !== d.indexOf("|") ? (b = d.split("|"), d =
                    '<i class="' + b[0] + '" style="' + b[1] + '"></i>') : d = '<i class="' + d + '"></i>';
                g.html(d);
                f && g.attr("title", f);
                if ("btn" === c) "string" === typeof e && g.attr("commandName", e), "string" === typeof e && g.click(
                    function (a) {
                        y(a, e, void 0, n)
                    }), "function" === typeof e && g.click(function (a) {
                    e(a)
                });
                else if ("dropMenu" === c) {
                    var p = function () {
                        h.hide()
                    };
                    g.addClass("btn-drop");
                    g.append(a('<i class="fa fa-angle-down"></i>'));
                    h.attr("class", "drop-menu");
                    k.append(h);
                    g.click(function (a) {
                        var b = g.offset().top,
                            c = g.offset().left,
                            d = g.height();
                        h.css({
                            top: b + d + 5 + "px",
                            left: c + "px"
                        });
                        h.show();
                        a.preventDefault()
                    }).blur(function (a) {
                        setTimeout(p, 100)
                    });
                    h.on("click", "a[commandValue]", function (b) {
                        var c = a(this).attr("commandValue");
                        y(b, e, c)
                    })
                } else "modal" === c && (m.attr("class", "modal modal-small"), m.prepend(a(
                    '<div class="header"><a href="#" class="close"><i class="fa fa-close"></i></a><b>' +
                    f + '</b><div class="clear-both"></div><div class="line"></div></div>')),
                    E.append(m), g.click(function (a) {
                    var b = w.width(),
                        c = w.height(),
                        d = m.width();
                    m.height();
                    v.width(b);
                    v.height(c);
                    m.css({
                        top: "100px",
                        left: (b - d) / 2 + "px"
                    });
                    v.show();
                    m.show();
                    a.preventDefault()
                }), m.find(".close").click(function (a) {
                    v.hide();
                    m.hide();
                    a.preventDefault()
                }));
                if (f) {
                    var t = function () {
                        s.show()
                    };
                    g.attr("title", "");
                    var q, u, x, s = a('<div class="toolTip"></div>'),
                        c = a('<div class="content">' + f + "</div>"),
                        f = a('<div class="footer"><i class="fa fa-caret-down"></i></div>'),
                        z, A, B, C, G;
                    s.append(c).append(f);
                    l.append(s);
                    g.mouseenter(function () {
                        q = g.offset().top;
                        u = g.offset().left;
                        x = g.width();
                        z = s.height();
                        A = s.width();
                        B = q - z + 5;
                        C = u - (A - x) / 2 + 3;
                        s.css({
                            top: B + "px",
                            left: C + "px"
                        });
                        G = setTimeout(t, 200)
                    }).mouseleave(function () {
                        clearTimeout(G);
                        s.hide()
                    })
                }
                return g
            }
            var c = this.height(),
                e = this.html(),
                k = a("<div></div>"),
                l = a("<div></div>"),
                w = a(t);
            b && (q = a.extend(q, b));
            a.each(q, function () {
                var a = d(this);
                p.append(a)
            });
            p.append(a('<div class="clear-both"></div>')).append(a('<div class="line"></div>'));
            n.on("focus click keyup", function (b) {
                var c = !1;
                if (c = "click" === b.type || "focus" === b.type || "keyup" === b.type && -1 !==
                    " 33, 34, 35, 36, 37, 38, 39, 40, 8, 46 ".indexOf(b.keyCode)) {
                    var d, e, c = n[0];
                    u ? (b = f.getSelection(), b.getRangeAt && b.rangeCount && (d = f.getSelection().getRangeAt(
                        0), e = d.commonAncestorContainer)) : (d = f.selection.createRange(), e = d
                        .parentElement());
                    h = e && (e.id = c.id || a.contains(c, e)) ? d : void 0;
                    B()
                }
            });
            this.attr("class", "wangEditor");
            this.html("").append(l).append(v).append(k).append(E).append(p).append(n);
            n.html(e);
            c = c - p.height() - 11;
            n.height(50 <=
            c ? c : 100);
            return n
        }
    }
})(window);