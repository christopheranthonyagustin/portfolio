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
            }
        };

        $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['th']);

    })(jQuery);

}