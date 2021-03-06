;
(function ($) {
    var states=false;
    var methods = {
        pageInit: function (options) {
            /**
             * [opts this plug propertys]
             * @type {Obeject}
             */
            var opts = $.extend({}, $.fn.zPager.defaults, options);
            return $(this).each(function (k, v) {
                var _v = $(v);
                _v.data("options", opts);
                methods.pageData(_v, opts.current);
            })
        },
        pageData: function (_v, _current) {
            var opts = _v.data("options");
            var t = opts.totalData,
                p = opts.pageData,
                ajaxOpts = null;
            if (opts.ajaxSetData && (typeof (opts.ajaxSetData) === 'boolean')) {
                if (opts.url !== '' && typeof (opts.url) === 'string') {
                    ajaxOpts = methods.ajaxData(opts.url, _current);
                    t = opts.totalData = ajaxOpts.total;
                    if (ajaxOpts.rows.length > 0) {
                        var ishasDataRender = (opts.dataRender && typeof (opts.dataRender) === 'function');
                        ishasDataRender ? opts.dataRender(ajaxOpts.rows) : methods.dataRender(_v, ajaxOpts.rows);
                    }
                } else {
                    $.pageError(2);
                }
            }
            if (t % p === 0) {
                opts.pageCount = parseInt(t / p);
            } else {
                opts.pageCount = parseInt(t / p) + 1;
            }
            if (opts.pageCount > 0) {
                _v.data("options", opts);
                methods.pageRender(_v, _current);
            }
        },
        dataRender: function (_v, _data) {

            var opts = _v.data("options");
            var cells = '';
            for (var i = 0; i < _data.length; i++) {
                cells += '<div class="cc_cells"><a href=""><span>' + _data[i].id + '-' + Math.random() +
                    '</span>';
                cells += '<span>' + _data[i].title + '</span>';
                cells += '<span>' + _data[i].starttime + '</span>';
                cells += '<span>' + _data[i].endtime + '</span>';
                cells += '</a></div>';
            }
            if (opts.htmlBox === '' || (typeof (opts.htmlBox) !== 'Obeject')) {
                var abx = _v.prev();
                if (!abx.hasClass('pagerHtmlWrap')) {
                    var d = '<div class="pagerHtmlWrap"></div>';
                    _v.before(d);
                }
                _v.prev().html(cells);
            } else {
                opts.htmlBox.html(cells);
            }
        },
        pageRender: function (_v, _current) {
            // ????????????
            currentPage(_current,states);

            /**
             * [o this plug propertys]
             * @type {Obeject}
             */
            var o = _v.data("options");
            var _page = o.pageCount;

            var _middle = parseInt(o.pageStep / 2);
            var _tep = _middle - 2;
            var _html = '';
            if (_page > o.pageStep && _current <= _page) {
                _html += methods.setPrevNext(o, 'prev');
                if (_current <= _middle) {
                    _html += methods.forEach(1, o.pageStep, _current, o.active);
                    _html += methods.elliPsis();
                } else if (_current > _middle && _current < (_page - _tep)) {
                    _html += methods.pageBtn(1);
                    _html += methods.elliPsis();
                    _html += methods.forEach(_current - _tep, _current - (-_tep) - (-1), _current, o.active);
                    _html += methods.elliPsis();
                } else if (_current >= (_page - _tep)) {
                    _html += methods.pageBtn(1);
                    _html += methods.elliPsis();
                    _html += methods.forEach(_page - 2 * _tep - 1, _page - (-1), _current, o.active);
                }
                _html += methods.setPrevNext(o, 'next');
            } else if (_page <= o.pageStep) {
                if (_page > o.minPage) {
                    _html += methods.setPrevNext(o, 'prev');
                }
                _html += methods.forEach(1, _page - (-1), _current, o.active);
                if (_page > o.minPage) {
                    _html += methods.setPrevNext(o, 'next');
                }
            }
            _v.html(_html);
            methods.bindEvent(_v);
        },
        bindEvent: function (_v) {
            /**
             * [o this plug propertys]
             * @type {Obeject}
             */
            var o = _v.data("options");
            var _a = _v.find("a");
            $.each(_a, function (index, item) {
                var _this = $(this);
                _this.on("click", function () {
                    if (_this.attr("disabled")) {
                        return false;
                    }
                    var _p = _this.attr("page-id");
                    o.current = _p;
                    states=true;
                    _v.data("options", o);
                    // methods.options.current = _p;
                    methods.pageData(_v, _p);
                })
            })
        },
        forEach: function (_start, length, _current, curclass) {
            /**
             * [s page elements]
             * @type {String}
             */
            var s = '';
            for (var i = _start; i < length; i++) {
                if (i === parseInt(_current)) {
                    s += methods.pageCurrent(i, curclass);
                } else {
                    s += methods.pageBtn(i);
                }
            }
            return s;
        },
        pageCurrent: function (_id, _class) {
            /**
             * [class current page element calss]
             * @type {String}
             */
            return '<span  class="' + _class + '" page-id="' + _id + '">' + _id + '</span>';
        },
        elliPsis: function () {
            /**
             * [class ellipses...]
             * @type {String}
             */
            return '<span class="els">...</span>';
        },
        pageBtn: function (_id) {
            /**
             * [id page id]
             * @type {String}
             */
            states=true;
            // console.log(states);
            return '<a page-id="' + _id + '">' + _id + '</a>';
        },
        addBtn: function (_property, _page, _count) {
            /**
             * [disabled is it can click button]
             * @type {Boolean}
             */
            var disabled = '';
            if (_count) {
                disabled = (_page === 0 || _page === _count - (-1)) ? 'disabled="true"' : '';
            }

            return '<a class="' + _property + '" page-id="' + _page + '" ' + disabled + '></a>';
        },
        setPrevNext: function (_o, _type) {
            /**
             * [s string create prev or next buttons elements]
             * @type {String}
             */
            var s = '';

            function prev() {
                if (_o.btnShow) {
                    s += methods.addBtn(_o.firstBtn, 1);
                }
                if (_o.btnBool) {
                    s += methods.addBtn(_o.prevBtn, _o.current - 1, _o.pageCount);
                }
                return s;
            }

            function next() {
                if (_o.btnBool) {
                    s += methods.addBtn(_o.nextBtn, _o.current - (-1), _o.pageCount);
                }
                if (_o.btnShow) {
                    s += methods.addBtn(_o.lastBtn, _o.pageCount);
                }
                return s;
            }
            return _type === 'prev' ? prev() : next();
        },
        ajaxData: function (_url, _current) {
            /**
             * [ajax get data and pagenumber]
             * @param  {Object} ){ var parms [ajax url,current page number]
             * @return {[type]}            [obj total rows]
             */
            var _total = $.fn.zPager.defaults.totalData;
            return (function () {
                var parms = {
                    'total': _total,
                    'rows': []
                };
                $.ajax({
                    url: '../jsp/list?page='+_current,
                    type: 'get',
                    data: {
                        "page": _current
                    },
                    dataType: 'json',
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data.total && (data.total !== 0)) {
                            parms['total'] = data.total;
                            parms['rows'] = data.rows;
                        } else {
                            $.pageError(3);
                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var msg = '';
                        switch (XMLHttpRequest.readyState) {
                            case 0:
                                msg = '?????????????????????????????????send()??????';
                                break;
                            case 1:
                                msg = '?????????????????????send()???????????????????????????';
                                break;
                            case 2:
                                msg = '??????????????????send()??????????????????????????????????????????????????????';
                                break;
                            case 3:
                                msg = '????????????????????????????????????';
                                break;
                            case 4:
                                msg = '??????????????????????????????????????????????????????????????????';
                                break;
                        }
                        console.log(textStatus + '???' + XMLHttpRequest.readyState + '-' +
                            msg);
                    }
                })
                return parms;
            })();
        }
    }

    $.extend({
        pageError: function (type) {
            /**
             * [switch error type]
             * @param  {[type]} type [no this function]
             * @return {[type]}      [ajax error]
             */
            switch (type) {
                case 1:
                    console.log('method' + method + 'dose not exist on jQuery.zPager');
                    break;
                case 2:
                    console.log('no ajax');
                    break;
                case 3:
                    console.log('no data');
                    break;
                default:
                    console.log('default error');
            }
        }
    })

    $.fn.extend({
        zPager: function (method) {
            /**
             * [if has this method]
             * @param  {[type]} methods[method] [apply this method]
             * @return {[type]}                 [return property]
             */
            if (methods[method]) {
                return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
            } else if (typeof method === 'object' || !method) {
                 return methods.pageInit.apply(this, arguments);
            } else {
                $.pageError(1);
            }
        }
    })

    $.fn.zPager.defaults = {
        totalData: 10, //???????????????
        pageData: 5, //??????????????????
        pageCount: 0, //?????????
        current: count4, //???????????????
        pageStep: 4, //??????????????????????????????
        minPage: 0, //?????????????????????????????????????????????????????????????????????
        active: 'current', //??????????????????
        prevBtn: 'pg-prev', //???????????????
        nextBtn: 'pg-next', //???????????????
        btnBool: true, //??????????????????????????????
        firstBtn: 'pg-first', //???????????????
        lastBtn: 'pg-last', //??????????????????
        btnShow: true, //??????????????????????????????????????????
        disabled: true, //??????????????????
        ajaxSetData: true, //????????????ajax???????????? ????????????????????????url???htmlBox?????????
        url: '', //ajax??????
        htmlBox: '' //ajax??????????????????
    }

})(jQuery,count4)