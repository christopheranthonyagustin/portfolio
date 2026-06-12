$('#loginPage').localizationTool({
    'defaultLanguage': 'en_GB', /* (optional) although must be defined if you don't want en_GB */
    'showFlag': false,            /* (optional) show/hide the flag */
    'showCountry': false,         /* (optional) show/hide the country name */
    'showLanguage': true,        /* (optional) show/hide the country language */
    'languages': {
        'th_TH': {
            'language': 'Thai',
            'country': '',
            'languageTranslated': "Thai",
            'countryTranslated': "",
            'flag': {
                'url': ''
            }
        },
        'vn_VN': {
            'language': 'Vietnam',
            'country': '',
            'languageTranslated': "Vietnam",
            'countryTranslated': "",
            'flag': {
                'url': ''
            }
        },
        'id_ID': {
            'language': 'Indonesia',
            'country': '',
            'languageTranslated': "Indonesia",
            'countryTranslated': "",
            'flag': {
                'url': ''
            }
        }
    },

    'strings': {

        'class:login': {
            'th_TH': 'ให้ฉันอยู่ในระบบ',
            'vn_VN': 'Vui lòng hãy đăng nhập',
            'id_ID': 'Silahkan masuk'
        },

        'id:footer': {
            'th_TH': 'ลิขสิทธิ์© 2016 ระบบการจัดการ กองทัพเรือ สงวนลิขสิทธิ์',
            'vn_VN': 'bản quyền © 2016 Hệ thống quản lý đội xe. Tất cả các quyền',
            'id_ID': 'Copyright © 2016 Sistem Pengurusan Armada. Seluruh hak cipta'
        },

        'class:keeploggedin': {
            'th_TH': 'ให้ฉันอยู่ในระบบ',
            'vn_VN': 'Giữ cho tôi đăng nhập',
            'id_ID': 'Ingat Saya'
        },

        'class:clickpass': {
            'th_TH': ' &nbsp;Click Here',
            'vn_VN': ' &nbsp;Click Here',
            'id_ID': '&nbsp;Click Here'
        },

        'class:forgotpass': {
            'th_TH': 'ลืมรหัสผ่าน?',
            'vn_VN': 'Quên mật khẩu?',
            'id_ID': 'Lupa kata sandi'
        },

        'class:loginbtn': {
            'th_TH': 'เข้าสู่ระบบ',
            'vn_VN': 'Đăng nhập',
            'id_ID': 'Masuk'
        },

        'class:loginhere': {
            'th_TH': 'มีบัญชีอยู่แล้ว? เข้าสู่ระบบที่นี่',
            'vn_VN': 'Test',
            'id_ID': 'Silahkan masuk'
        },

        'class:provide': {
            'th_TH': 'โปรดระบุทั้งชื่อผู้ใช้และที่อยู่อีเมลที่จะได้รับรหัสผ่านใหม่',
            'vn_VN': 'Bạn co săn san để tạo một tai khoản? Đăng nhập tại đây',
            'id_ID': 'Sudah memiliki akun? Masuk disini'
        },

        'class:agree': {
            'th_TH': 'ผมเห็นด้วยกับข้อตกลงและเงื่อนไข',
            'vn_VN': 'Vui lòng cung cấp cả tên đăng nhập và địa chỉ email để nhận mật khẩu mới.',
            'id_ID': 'Harap berikan baik username dan alamat email untuk mendapatkan password baru.'
        },

        'class:reset': {
            'th_TH': 'รีเซ็ตรหัสผ่าน',
            'vn_VN': 'Đặt lại mật khẩu',
            'id_ID': 'reser'
        },

        'placeholder::id:username': {
            'th_TH': 'ชื่อผู้ใช้',
            'vn_VN': 'tên người dùng',
            'id_ID': 'Nama pengguna'
        },

        'placeholder::id:password': {
            'th_TH': 'รหัสผ่าน',
            'vn_VN': 'mật khẩu',
            'id_ID': 'Kata sandi'
        }
    }
});



$('#forgotPassword').localizationTool({

    'showFlag': false,
    'languages': {

        'th_TH': {
            'language': 'Thai',
            'country': '',
            'languageTranslated': "Thai",
            'countryTranslated': "",
            'flag': {
                'url': ''
            }
        }

    },

    'strings': {

        'class:login': {
            'th_TH': 'ให้ฉันอยู่ในระบบ'
        },

        'id:footer': {
            'th_TH': 'ลิขสิทธิ์© 2015 ระบบการจัดการ กองทัพเรือ สงวนลิขสิทธิ์'
        },

        'class:keeploggedin': {
            'th_TH': 'Keep me logged in'
        },

        'class:clickpass': {
            'th_TH': ' &nbsp;Click Here'
        },

        'class:forgotpass': {
            'th_TH': 'Forgot your password?'
        },

        'class:loginbtn': {
            'th_TH': 'Log In'
        },

        'class:loginhere': {
            'th_TH': 'มีบัญชีอยู่แล้ว? เข้าสู่ระบบที่นี่'
        },

        'class:provide': {
            'th_TH': 'กรุณาให้ทั้งชื่อและที่อยู่อีเมลที่จะได้รับรหัสผ่านใหม่'
        },

        'class:agree': {
            'th_TH': 'ผมเห็นด้วยกับข้อตกลงและเงื่อนไข'
        },

        'class:reset': {
            'th_TH': 'ตั้งค่ารหัสผ่าน'
        },

        'placeholder::id:usernameForgot': {
            'th_TH': 'ชื่อผู้ใช้'
        },
        'placeholder::id:emailForgot': {
            'th_TH': 'อีเมล์'
        }
    }
});



$('#lockScreen').localizationTool({

    'showFlag': false,
    'languages': {

        'th_TH': {
            'language': 'Thai',
            'country': '',
            'languageTranslated': "Thai",
            'countryTranslated': "",
            'flag': {
                'url': ''
            }
        }

    },

    'strings': {

        'id:footer': {
            'th_TH': 'Copyright &copy; 2015 Pest Control Management System. All Rights Reserved'
        },

        'class:loginbtnLock': {
            'th_TH': 'เข้าสู่ระบบ'
        },

        'class:forgotpassLock': {
            'th_TH': 'ลืมรหัสผ่าน?'
        },

        'placeholder::id:usernameLock': {
            'th_TH': 'ชื่อผู้ใช้'
        },
        'placeholder::id:passwordLock': {
            'th_TH': 'รหัสผ่าน'
        }
    }
});


