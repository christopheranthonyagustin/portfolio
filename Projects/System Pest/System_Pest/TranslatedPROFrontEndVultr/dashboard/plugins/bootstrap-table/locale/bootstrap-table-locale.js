/**
 * Bootstrap Table English translation
 * Author: Zhixin Wen<wenzhixin2010@gmail.com>
 */

var getSessionstorageValueLanguage = sessionStorage.getItem('setSessionstorageValueLanguage');

if (getSessionstorageValueLanguage == "en"){

(function ($) {
    'use strict';

    $.fn.bootstrapTable.locales['en'] = {
        formatLoadingMessage: function () {
            return 'Loading, please wait...';
        },
        formatRecordsPerPage: function (pageNumber) {
            return pageNumber + ' records per page';
        },
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return 'Showing ' + pageFrom + ' to ' + pageTo + ' of ' + totalRows + ' rows';
        },
        formatSearch: function () {
            return 'Search';
        },
        formatNoMatches: function () {
            return 'No matching records found';
        },
        formatPaginationSwitch: function () {
            return 'Hide/Show pagination';
        },
        formatRefresh: function () {
            return 'Refresh';
        },
        formatToggle: function () {
            return 'Toggle';
        },
        formatColumns: function () {
            return 'Columns';
        },
        formatAllRows: function () {
            return 'All';
        }
    };

    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['en']);

})(jQuery);

}

else if (getSessionstorageValueLanguage == "th"){

(function ($) {
        'use strict';

        $.fn.bootstrapTable.locales['th'] = {
            formatLoadingMessage: function () {
                return 'กำลังโหลดข้อมูล, กรุณารอสักครู่...';
            },
            formatRecordsPerPage: function (pageNumber) {
                return pageNumber + ' รายการต่อหน้า';
            },
            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return 'รายการที่ ' + pageFrom + ' ถึง ' + pageTo + ' จากทั้งหมด ' + totalRows + ' รายการ';
            },
            formatSearch: function () {
                return 'ค้นหา';
            },
            formatNoMatches: function () {
                return 'ไม่พบรายการที่ค้นหา !';
            },
            formatRefresh: function () {
                return 'รีเฟรส';
            },
            formatToggle: function () {
                return 'สลับมุมมอง';
            },
            formatColumns: function () {
                return 'คอลัมน์';
            },
            formatAllRows: function () {
                return 'ทั้งหมด';
        }
        };

        $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['th']);

    })(jQuery);

}
else if (getSessionstorageValueLanguage == "vn") {

    (function ($) {
        'use strict';

        $.fn.bootstrapTable.locales['vn'] = {
            formatLoadingMessage: function () {
                return 'Tải, xin vui lòng chờ đợi...';
            },
            formatRecordsPerPage: function (pageNumber) {
                return pageNumber + ' ghi trên mỗi trang';
            },
            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return 'Hiển thị ' + pageFrom + ' đến ' + pageTo + ' hoặc ' + totalRows + ' hàng';
            },
            formatSearch: function () {
                return 'Tìm kiếm';
            },
            formatNoMatches: function () {
                return 'Không có hồ sơ phù hợp với tìm thấy !';
            },
            formatRefresh: function () {
                return 'Giấu/Buổi diễn sự đánh số trang';
            },
            formatToggle: function () {
                return 'Làm mới';
            },
            formatColumns: function () {
                return 'Cột';
            },
            formatAllRows: function () {
                return 'Tất cả';
            }
        };

        $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['vn']);

    })(jQuery);
}
else if (getSessionstorageValueLanguage == "id") {

    (function ($) {
        'use strict';

        $.fn.bootstrapTable.locales['id'] = {
            formatLoadingMessage: function () {
                return 'Mohon menunggu';
            },
            formatRecordsPerPage: function (pageNumber) {
                return pageNumber + ' rekor per halaman';
            },
            formatShowingRows: function (pageFrom, pageTo, totalRows) {
                return 'Pertunjukan ' + pageFrom + ' ke ' + pageTo + ' dari ' + totalRows + ' deretan';
            },
            formatSearch: function () {
                return 'Pencarian';
            },
            formatNoMatches: function () {
                return 'Tidak ada rekor yang serupa';
            },
            formatPaginationSwitch: function () {
                return 'Sembunyi/Tunjuk pagination';
            },
            formatRefresh: function () {
                return 'Refresh';
            },
            formatToggle: function () {
                return 'Beralih';
            },
            formatColumns: function () {
                return 'Kolom';
            },
            formatAllRows: function () {
                return 'Semua';
            }
        };

        $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['id']);

    })(jQuery);
}

