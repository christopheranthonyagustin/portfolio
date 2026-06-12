
$(document).ready(function() {



	// FORM WIZARD
	// =================================================================
	// Require Bootstrap Wizard
	// http://vadimg.com/twitter-bootstrap-wizard-example/
	// =================================================================


	// MAIN FORM WIZARD
	// =================================================================
	$('#main-wz').bootstrapWizard({
		tabClass		: 'wz-steps',
		nextSelector	: '.next',
		previousSelector	: '.previous',
		onTabClick: function(tab, navigation, index) {
			return false;
		},
		onInit : function(){
			$('#main-wz').find('.finish').hide().prop('disabled', true);
		},
		onTabShow: function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = ($current/$total) * 100;
			var wdt = 100/$total;
			var lft = wdt*index;

			$('#main-wz').find('.progress-bar').css({ width: wdt + '%', left: lft + "%", 'position': 'relative', 'transition': 'all .5s' });


			// If it's the last tab then hide the last button and show the finish instead
			if($current >= $total) {
				$('#main-wz').find('.next').hide();
				$('#main-wz').find('.finish').show();
				$('#main-wz').find('.finish').prop('disabled', false);
			} else {
				$('#main-wz').find('.next').show();
				$('#main-wz').find('.finish').hide().prop('disabled', true);
			}
		},

		onNext: function () {
		    isValid = null;
		    $('#bv-wz-form').bootstrapValidator('validate');


		    if (isValid === false) return false;
		}

	});




	// CLASSIC FORM WIZARD
	// =================================================================
	$('#demo-cls-wz').bootstrapWizard({
		tabClass		: 'wz-classic',
		nextSelector	: '.next',
		previousSelector	: '.previous',
		onTabClick: function(tab, navigation, index) {
			return false;
		},
		onInit : function(){
			$('#demo-cls-wz').find('.finish').hide().prop('disabled', true);
		},
		onTabShow: function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = ($current/$total) * 100;
			var wdt = 100/$total;
			var lft = wdt*index;
			$('#demo-cls-wz').find('.progress-bar').css({width:$percent+'%'});

			// If it's the last tab then hide the last button and show the finish instead
			if($current >= $total) {
				$('#demo-cls-wz').find('.next').hide();
				$('#demo-cls-wz').find('.finish').show();
				$('#demo-cls-wz').find('.finish').prop('disabled', false);
			} else {
				$('#demo-cls-wz').find('.next').show();
				$('#demo-cls-wz').find('.finish').hide().prop('disabled', true);
			}
		}
	});




	// CIRCULAR FORM WIZARD
	// =================================================================
	$('#demo-step-wz').bootstrapWizard({
		tabClass		: 'wz-steps',
		nextSelector	: '.next',
		previousSelector	: '.previous',
		onTabClick: function(tab, navigation, index) {
			return false;
		},
		onInit : function(){
			$('#demo-step-wz').find('.finish').hide().prop('disabled', true);
		},
		onTabShow: function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = (index/$total) * 100;
			var wdt = 100/$total;
			var lft = wdt*index;
			var margin = (100/$total)/2;
			$('#demo-step-wz').find('.progress-bar').css({width:$percent+'%', 'margin': 0 + 'px ' + margin + '%'});


			// If it's the last tab then hide the last button and show the finish instead
			if($current >= $total) {
				$('#demo-step-wz').find('.next').hide();
				$('#demo-step-wz').find('.finish').show();
				$('#demo-step-wz').find('.finish').prop('disabled', false);
			} else {
				$('#demo-step-wz').find('.next').show();
				$('#demo-step-wz').find('.finish').hide().prop('disabled', true);
			}
		}
	});



	// CIRCULAR FORM WIZARD
	// =================================================================
	$('#demo-cir-wz').bootstrapWizard({
		tabClass		: 'wz-steps',
		nextSelector	: '.next',
		previousSelector	: '.previous',
		onTabClick: function(tab, navigation, index) {
		return false;
		},
		onInit : function(){
		$('#demo-cir-wz').find('.finish').hide().prop('disabled', true);
		},
		onTabShow: function(tab, navigation, index) {
		var $total = navigation.find('li').length;
		var $current = index+1;
		var $percent = (index/$total) * 100;
		var margin = (100/$total)/2;
		$('#demo-cir-wz').find('.progress-bar').css({width:$percent+'%', 'margin': 0 + 'px ' + margin + '%'});

		navigation.find('li:eq('+index+') a').trigger('focus');


		// If it's the last tab then hide the last button and show the finish instead
		if($current >= $total) {
			$('#demo-cir-wz').find('.next').hide();
			$('#demo-cir-wz').find('.finish').show();
			$('#demo-cir-wz').find('.finish').prop('disabled', false);
		} else {
			$('#demo-cir-wz').find('.next').show();
			$('#demo-cir-wz').find('.finish').hide().prop('disabled', true);
		}
		}
	})




	// FORM WIZARD WITH VALIDATION
	// =================================================================
	$('#demo-bv-wz').bootstrapWizard({
		tabClass		: 'wz-steps',
		nextSelector	: '.next',
		previousSelector	: '.previous',
		onTabClick: function(tab, navigation, index) {
			return false;
		},
		onInit : function(){
			$('#demo-bv-wz').find('.finish').hide().prop('disabled', true);
		},
		onTabShow: function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = (index/$total) * 100;
			var margin = (100/$total)/2;
			$('#demo-bv-wz').find('.progress-bar').css({width:$percent+'%', 'margin': 0 + 'px ' + margin + '%'});

			navigation.find('li:eq('+index+') a').trigger('focus');


			// If it's the last tab then hide the last button and show the finish instead
			if($current >= $total) {
				$('#demo-bv-wz').find('.next').hide();
				$('#demo-bv-wz').find('.finish').show();
				$('#demo-bv-wz').find('.finish').prop('disabled', false);
			} else {
				$('#demo-bv-wz').find('.next').show();
				$('#demo-bv-wz').find('.finish').hide().prop('disabled', true);
			}
		},
		onNext: function(){
			isValid = null;
			$('#demo-bv-wz-form').bootstrapValidator('validate');


			if(isValid === false)return false;
		}
	});




	// FORM VALIDATION
	// =================================================================
	// Require Bootstrap Validator
	// http://bootstrapvalidator.com/
	// =================================================================

	var isValid;
	$('#bv-wz-form').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
		valid: 'fa fa-check-circle fa-lg text-success',
		invalid: 'fa fa-times-circle fa-lg',
		validating: 'fa fa-refresh'
		},
		fields: {
		    Perimeter: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The Perimeter is required and cannot be empty'
		                message: 'ปริมณฑล จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            }
		            
		        }
		    },
		    apn: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The APN is required and cannot be empty'
		                message: 'APN จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            }
		        }
		    },
		    port: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The port is required and cannot be empty'
		                message: 'พอร์ตที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            },
		            digits: {
		                //message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    pollingInterval: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The polling interval is required and cannot be empty'
		                message: 'ช่วง เลือกตั้ง จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            digits: {
		                //message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    imeiCode: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The IMEI code is required and cannot be empty'
		                message: 'รหัส IMEI จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            }
		        }
		    },
		    deviceName: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The device name is required and cannot be empty'
		                message: 'ชื่ออุปกรณ์ที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            }
		        }
		    },
		    deviceNameEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The device name is required and cannot be empty'
		            }
		        }
		    },
		    confirmPassword: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The confirm password is required and cannot be empty'
		                message: 'ยืนยัน รหัสผ่านที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            },
		            identical: {
		                field: 'userPassword',
		                //message: 'The password and its confirm are not the same'
		                message: 'ใช้รหัสผ่านและ ยืนยัน ที่ จะไม่เหมือนกัน'
		            }
		        }
		    },
		    confirmPasswordEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The confirm password is required and cannot be empty'
		            },
		            identical: {
		                field: 'userPasswordEN',
		                message: 'The password and its confirm are not the same'
		            }
		        }
		    },
		    //password: {
		    //    container: 'tooltip',
		    //    validators: {
		    //        notEmpty: {
		    //            //message: 'The password is required and cannot be empty'
		    //            message: 'รหัสผ่านที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		    //        },
		    //        identical: {
		    //            field: 'confirmPassword',
		    //            //message: 'The password and its confirm are not the same'
		    //            message: 'ใช้รหัสผ่านและ ยืนยัน ที่ จะไม่เหมือนกัน'
		    //        }
		    //    }
		    //},
		    userPassword: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The password is required and cannot be empty'
		                message: 'รหัสผ่านที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            },
		            identical: {
		                field: 'confirmPassword',
		                //message: 'The password and its confirm are not the same'
		                message: 'ใช้รหัสผ่านและ ยืนยัน ที่ จะไม่เหมือนกัน'
		            }
		        }
		    },
		    userPasswordEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The password is required and cannot be empty'
		            },
		            identical: {
		                field: 'confirmPasswordEN',
		                message: 'The password and its confirm are not the same'
		            }
		        }
		    },
		    userFullName: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The full name is required'
		                message: 'ชื่อเต็ม จะต้อง'
		            }
		        }
		    },
		    userFullNameEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The full name is required'
		            }
		        }
		    },
		    smsLimit: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The sms limit is required and cannot be empty'
		                message: 'ขีด จำกัด ของ sms ที่ จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            digits: {
		                //message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    vehicleLimit: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The vehicle limit is required and cannot be empty'
		                message: 'ขีด จำกัด ของ ยานพาหนะ ที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            },
		            digits: {
		                //message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    zoneLimit: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The zone limit is required and cannot be empty'
		                message: 'โซน จำกัดจำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            digits: {
		                //message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    userLimit: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The user limit is required and cannot be empty'
		                message: 'ขีด จำกัด ของ ผู้ใช้จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            digits: {
		                // message: 'The value can contain only digits'
		                message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
		            }
		        }
		    },
		    companyAddress: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The company address is required'
		                message: 'ที่อยู่ของ บริษัทจะต้อง'
		            }
		        }
		    },
		    companyName: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The company name is required'
		                message: 'ชื่อ บริษัทจำเป็นต้องมี'
		            }
		        }
		    },
		    companyNameEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The company name is required'
		            }
		        }
		    },
		    zoneName: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The zone name is required'
		                message: 'ชื่อ โซนที่จำเป็น'
		            }
		        }
		    },
		    zoneNameEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The zone name is required'
		            }
		        }
		    },
		    assetName: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                //message: 'The vehicle name is required and cannot be empty'
		                message: 'ชื่อ ยานพาหนะที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
		            }
		        }
		    },
		    assetNameEN: {
		        container: 'tooltip',
		        validators: {
		            notEmpty: {
		                message: 'The vehicle name is required and cannot be empty'		                
		            }
		        }
		    },
		    //username: {
		    //    container: 'tooltip',
		    //    message: 'The username is not valid',
		    //    validators: {
		    //        notEmpty: {
		    //            //message: 'The username is required and cannot be empty'
		    //            message: 'ชื่อผู้ใช้จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		    //        },
		    //        stringLength: {
		    //            min: 4,
		    //            max: 30,
		    //            //message: 'The username must be more than 4 and less than 30 characters long'
		    //            message: 'ชื่อผู้ใช้ ต้องมากกว่า 4 และน้อยกว่า 30 ตัวอักษร'
		    //        },
		    //        regexp: {
		    //            regexp: /^[a-zA-Z0-9_\.]+$/,
		    //            // message: 'The username can only consist of alphabetical, number, dot and underscore'
		    //            message: 'ชื่อผู้ใช้สามารถ ประกอบด้วย ตัวอักษร ตัวเลข และ ขีด จุด'
		    //        },
		    //        different: {
		    //            field: 'password',
		    //            //message: 'The username and password cannot be the same as each other'
		    //            message: 'ชื่อผู้ใช้ และรหัสผ่านที่ ไม่สามารถ เป็นเช่นเดียวกับ คนอื่น ๆ'
		    //        }
		    //    }
		    //},
		    UserName: {
		        container: 'tooltip',
		        message: 'The username is not valid',
		        validators: {
		            notEmpty: {
		                //message: 'The username is required and cannot be empty'
		                message: 'ชื่อผู้ใช้จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            stringLength: {
		                min: 4,
		                max: 30,
		                //message: 'The username must be more than 4 and less than 30 characters long'
		                message: 'ชื่อผู้ใช้ ต้องมากกว่า 4 และน้อยกว่า 30 ตัวอักษร'
		            },
		            regexp: {
		                regexp: /^[a-zA-Z0-9_\.]+$/,
		                // message: 'The username can only consist of alphabetical, number, dot and underscore'
		                message: 'ชื่อผู้ใช้สามารถ ประกอบด้วย ตัวอักษร ตัวเลข และ ขีด จุด'
		            },
		            different: {
		                field: 'password',
		                //message: 'The username and password cannot be the same as each other'
		                message: 'ชื่อผู้ใช้ และรหัสผ่านที่ ไม่สามารถ เป็นเช่นเดียวกับ คนอื่น ๆ'
		            }
		        }
		    },
		    UserNameEN: {
		        container: 'tooltip',
		        message: 'The username is not valid',
		        validators: {
		            notEmpty: {
		                message: 'The username is required and cannot be empty'
		            },
		            stringLength: {
		                min: 4,
		                max: 30,
		                message: 'The username must be more than 4 and less than 30 characters long'
		            },
		            regexp: {
		                regexp: /^[a-zA-Z0-9_\.]+$/,
		                message: 'The username can only consist of alphabetical, number, dot and underscore'
		            },
		            different: {
		                field: 'password',
		                message: 'The username and password cannot be the same as each other'
		            }
		        }
		    },
		email: {
		    container: 'tooltip',
			validators: {
				notEmpty: {
				    //message: 'The email address is required and can\'t be empty'
				    message: 'ที่อยู่ อีเมลที่ถูก ต้อง และไม่สามารถ ที่ว่างเปล่า'
				},
				emailAddress: {
				    //message: 'The input is not a valid email address'
				    message: 'การป้อนข้อมูลที่ ไม่ได้เป็น ที่อยู่ อีเมลที่ถูกต้อง'
				}
			}
		},
		firstName: {
		    container: 'tooltip',
			validators: {
				notEmpty: {
				    //message: 'The first name is required and cannot be empty'
				    message: 'ชื่อแรก จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
				    //message: 'The first name can only consist of alphabetical characters and spaces'
					message: 'ชื่อแรก เท่านั้นที่สามารถ ประกอบด้วย อักขระ ตัวอักษร และช่องว่าง'
				}
			}
		},
		lastName: {
		    container: 'tooltip',
			validators: {
				notEmpty: {
				    //message: 'The last name is required and cannot be empty'
				    message: 'นามสกุล ที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
				    //message: 'The last name can only consist of alphabetical characters and spaces'
					message: 'นามสกุล เท่านั้นที่สามารถ ประกอบด้วย อักขระ ตัวอักษร และช่องว่าง'
				}
			}
		},
		phoneNumber: {
		    container: 'tooltip',
			validators: {
				notEmpty: {
				    //message: 'The phone number is required and cannot be empty'
				    message: 'หมายเลขโทรศัพท์ที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
				},
				digits: {
				    //message: 'The value can contain only digits'
				    message: 'ค่าสามารถมี ตัวเลข เท่านั้น'
				}
			}
		},
		address: {
		    container: 'tooltip',
			validators: {
				notEmpty: {
				    //message: 'The address is required'
				    message: 'ที่อยู่ จะต้อง'
				}
			}
		}
		}
	}).on('success.field.bv', function(e, data) {
		// $(e.target)  --> The field element
		// data.bv      --> The BootstrapValidator instance
		// data.field   --> The field name
		// data.element --> The field element

		var $parent = data.element.parents('.form-group');

		// Remove the has-success class
		$parent.removeClass('has-success');


		// Hide the success icon
		//$parent.find('.form-control-feedback[data-bv-icon-for="' + data.field + '"]').hide();
	}).on('error.form.bv', function(e) {
		isValid = false;
	});



});
