

$(document).ready(function() {


	// FORM VALIDATION
	// =================================================================
	// Require Bootstrap Validator
	// http://bootstrapvalidator.com/
	// =================================================================


	// FORM VALIDATION FEEDBACK ICONS
	// =================================================================
	var faIcon = {
		valid: 'fa fa-check-circle fa-lg text-success',
		invalid: 'fa fa-times-circle fa-lg',
		validating: 'fa fa-refresh'
	}



	// FORM VALIDATION ON TABS
	// =================================================================
	$('#regForm').bootstrapValidator({
		excluded: [':enabled'],
		feedbackIcons: faIcon,
		fields: {

		    apn: {
		        validators: {
		            notEmpty: {
		                message: 'The APN is required and cannot be empty'
		            }
		        }
		    },
		    port: {
		        validators: {
		            notEmpty: {
		                message: 'The port is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    pollingInterval: {
		        validators: {
		            notEmpty: {
		                message: 'The polling interval is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    imeiCode: {
		        validators: {
		            notEmpty: {
		                message: 'The IMEI code is required and cannot be empty'
		            }
		        }
		    },
		    deviceName: {
		        validators: {
		            notEmpty: {
		                message: 'The device name is required and cannot be empty'
		            }
		        }
		    },
		    confirmPassword: {
		        validators: {
		            notEmpty: {
		                message: 'The confirm password is required and can\'t be empty'
		            },
		            identical: {
		                field: 'password',
		                message: 'The password and its confirm are not the same'
		            }
		        }
		    },
		    password: {
		        validators: {
		            notEmpty: {
		                message: 'The password is required and can\'t be empty'
		            },
		            identical: {
		                field: 'confirmPassword',
		                message: 'The password and its confirm are not the same'
		            }
		        }
		    },
		    username: {
		        message: 'The username is not valid',
		       // message: 'ชื่อผู้ใช้ ไม่ถูกต้อง',
		        validators: {
		            notEmpty: {
		                message: 'The username is required and cannot be empty'
		                //message: 'ชื่อผู้ใช้จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
		            },
		            stringLength: {
		                min: 4,
		                max: 30,
		                message: 'The username must be more than 4 and less than 30 characters long'
		                //message: 'ชื่อผู้ใช้ ต้องมากกว่า 4 และน้อยกว่า 30 ตัวอักษร'
		            },
		            regexp: {
		                regexp: /^[a-zA-Z0-9_\.]+$/,
		                message: 'The username can only consist of alphabetical, number, dot and underscore'
		                //message: 'ชื่อผู้ใช้สามารถ ประกอบด้วย ตัวอักษร ตัวเลข และ ขีด จุด'
		            },
		            different: {
		                field: 'password',
		                message: 'The username and password cannot be the same as each other'
		                //message: 'ชื่อผู้ใช้ และรหัสผ่านที่ ไม่สามารถ เป็นเช่นเดียวกับ คนอื่น ๆ'
		            }
		        }
		    },
		    smsLimit: {
		        validators: {
		            notEmpty: {
		                message: 'The sms limit is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    vehicleLimit: {
		        validators: {
		            notEmpty: {
		                message: 'The vehicle limit is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    zoneLimit: {
		        validators: {
		            notEmpty: {
		                message: 'The zone limit is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    userLimit: {
		        validators: {
		            notEmpty: {
		                message: 'The user limit is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
		    companyName: {
		        validators: {
		            notEmpty: {
		                message: 'The company name is required'
		            }
		        }
		    },
		    zoneName: {
		        validators: {
		            notEmpty: {
		                message: 'The zone name is required'
		            }
		        }
		    },

		    email: {
		        validators: {
		            notEmpty: {
		                message: 'The email address is required and cannot be empty'
		            },
		            emailAddress: {
		                message: 'The input is not a valid email address'
		            }
		        }
		    },
		    phoneNumber: {
		        validators: {
		            notEmpty: {
		                message: 'The phone number is required and cannot be empty'
		            },
		            digits: {
		                message: 'The value can contain only digits'
		            }
		        }
		    },
            manPower: {
			validators: {
				notEmpty: {
					message: 'The Manpower is required'
				}
			}
		},
            vehicleName: {
			validators: {
				notEmpty: {
					message: 'The Vehicle name is required'
				}
			}
		},
		fullName: {
			validators: {
				notEmpty: {
					message: 'The full name is required'
				}
			}
		},
		company: {
			validators: {
				notEmpty: {
					message: 'The company name is required'
				}
			}
		},
		memberType: {
			validators: {
				notEmpty: {
					message: 'Please choose the membership type that best meets your needs'
				}
			}
		},
		address: {
			validators: {
				notEmpty: {
					message: 'The address is required'
				}
			}
		},
		city: {
			validators: {
				notEmpty: {
					message: 'The city is required'
				}
			}
		},
		country: {
			validators: {
				notEmpty: {
					message: 'The city is required'
				}
			}
		}
		}
	}).on('status.field.bv', function(e, data) {
		var $form     = $(e.target),
		validator = data.bv,
		$tabPane  = data.element.parents('.tab-pane'),
		tabId     = $tabPane.attr('id');

		if (tabId) {
		var $icon = $('a[href="#' + tabId + '"][data-toggle="tab"]').parent().find('i');

		// Add custom class to tab containing the field
		if (data.status == validator.STATUS_INVALID) {
			$icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
		} else if (data.status == validator.STATUS_VALID) {
			var isValidTab = validator.isValidContainer($tabPane);
			$icon.removeClass(faIcon.valid).addClass(isValidTab ? faIcon.valid : faIcon.invalid);
		}
		}
	});


	// FORM VALIDATION ON ACCORDION
	// =================================================================
	$('#bv-accordion').bootstrapValidator({
		message: 'This value is not valid',
		excluded: ':disabled',
		feedbackIcons: faIcon,
		fields: {
		firstName: {
			validators: {
				notEmpty: {
					message: 'The first name is required and cannot be empty'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
					message: 'The first name can only consist of alphabetical characters and spaces'
				}
			}
		},
		lastName: {
			validators: {
				notEmpty: {
					message: 'The last name is required and cannot be empty'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
					message: 'The last name can only consist of alphabetical characters and spaces'
				}
			}
		},
		username: {
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
			validators: {
				notEmpty: {
					message: 'The email address is required and cannot be empty'
				},
				emailAddress: {
					message: 'The input is not a valid email address'
				}
			}
		},
		password: {
			validators: {
				notEmpty: {
					message: 'The password is required and cannot be empty'
				},
				different: {
					field: 'username',
					message: 'The password cannot be the same as username'
				}
			}
		},
		memberType: {
			validators: {
				notEmpty: {
					message: 'The gender is required'
				}
			}
		},
		bio:{
			validators: {
				notEmpty: {
					message: 'The bio is required and cannot be empty'
				},
			}
		},
		phoneNumber: {
			validators: {
				notEmpty: {
					message: 'The phone number is required and cannot be empty'
				},
				digits: {
					message: 'The value can contain only digits'
				}
			}
		},
		city:{
			validators: {
				notEmpty: {
					message: 'The city is required and cannot be empty'
				},
			}
		}
		}
	}).on('status.field.bv', function(e, data) {
		var $form = $(e.target),
		validator = data.bv,
		$collapsePane = data.element.parents('.collapse'),
		colId = $collapsePane.attr('id');

		if (colId) {
		var $anchor = $('a[href="#' + colId + '"][data-toggle="collapse"]');
		var $icon = $anchor.find('i');

		// Add custom class to panel containing the field
		if (data.status == validator.STATUS_INVALID) {
			$anchor.addClass('bv-col-error');
			$icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
		} else if (data.status == validator.STATUS_VALID) {
			var isValidCol = validator.isValidContainer($collapsePane);
			if (isValidCol) {
				$anchor.removeClass('bv-col-error');
			}else{
				$anchor.addClass('bv-col-error');
			}
			$icon.removeClass(faIcon.valid + " " + faIcon.invalid).addClass(isValidCol ? faIcon.valid : faIcon.invalid);
		}
		}
	});


	// FORM VALIDATION CUSTOM ERROR CONTAINER
	// =================================================================
	// Indicate where the error messages are shown.
	// Tooltip, Popover, Custom Container.
	// =================================================================
    $('#logForm').bootstrapValidator({
		message: 'This value is not valid',
		excluded: [':disabled'],
		feedbackIcons: faIcon,
		fields: {
		    
		name: {
			container: 'tooltip',
			validators: {
				notEmpty: {
					message: 'The first name is required and cannot be empty'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
					message: 'The first name can only consist of alphabetical characters and spaces'
				}
			}
		},
		lastName: {
			validators: {
				notEmpty: {
					message: 'The last name is required and cannot be empty'
				},
				regexp: {
					regexp: /^[A-Z\s]+$/i,
					message: 'The last name can only consist of alphabetical characters and spaces'
				}
			}
		},
		email: {
			container: 'tooltip',
			validators: {
				notEmpty: {
					message: 'The email address is required and can\'t be empty'
				},
				emailAddress: {
					message: 'The input is not a valid email address'
				}
			}
		},
		username: {
			container: 'tooltip',
			message: 'The username is not valid',
			validators: {
				notEmpty: {
				    message: 'The username is required and cannot be empty'
				    //message: 'ชื่อผู้ใช้จำเป็นต้องมีและ ต้องไม่ว่างเปล่า'
				},
				stringLength: {
					min: 4,
					max: 30,
				    message: 'The username must be more than 4 and less than 30 characters long'
					//message: 'ชื่อผู้ใช้ ต้องมากกว่า 4 และ น้อยกว่า 30 ตัวอักษร'
				},
				regexp: {
					regexp: /^[a-zA-Z0-9_\.]+$/,
				    message: 'The username can only consist of alphabetical, number, dot and underscore'
					//message: 'ชื่อผู้ใช้สามารถ ประกอบด้วย ตัวอักษร ตัวเลข และ ขีด จุด'
				},
				different: {
					field: 'password',
					message: 'The username and password cannot be the same as each other'
					//message: 'ชื่อผู้ใช้ และรหัสผ่านที่ ไม่สามารถ เป็นเช่นเดียวกับ คนอื่น ๆ'
				}
			}
		},
		usernameEN: {
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
		password: {
			container: 'tooltip',
				validators: {
					notEmpty: {
					    message: 'The password is required and cannot be empty'
					    //message: 'รหัสผ่านที่จำเป็นและ ไม่สามารถเป็น ที่ว่างเปล่า'
					},
					different: {
						field: 'username',
					    message: 'The password cannot be the same as username'
						//message: 'รหัสผ่านที่ ไม่สามารถ เป็นเช่นเดียวกับ ชื่อผู้ใช้'
					}
				}
		},
		passwordEN: {
		    container: 'tooltip',
		    validators: {
		        notEmpty: {
		            message: 'The password is required and cannot be empty'
		        },
		        different: {
		            field: 'username',
		            message: 'The password cannot be the same as username'
		        }
		    }
		},
		phoneNumber: {
			container: '#error-container',
			validators: {
				notEmpty: {
					message: 'The phone number is required and cannot be empty'
				},
				digits: {
					message: 'The value can contain only digits'
				}
				}
		},
		city:{
			container: '#error-container',
			validators: {
				notEmpty: {
					message: 'The city is required and cannot be empty'
				},
			}
		}
		}
	}).on('status.field.bv', function(e, data) {
		var $form     = $(e.target),
		validator = data.bv,
		$tabPane  = data.element.parents('.tab-pane'),
		tabId     = $tabPane.attr('id');

		if (tabId) {
		var $icon = $('a[href="#' + tabId + '"][data-toggle="tab"]').parent().find('i');
		// Add custom class to tab containing the field
		if (data.status == validator.STATUS_INVALID) {
			$icon.removeClass(faIcon.valid).addClass(faIcon.invalid);
		} else if (data.status == validator.STATUS_VALID) {
			var isValidTab = validator.isValidContainer($tabPane);
			$icon.removeClass(faIcon.valid).addClass(isValidTab ? faIcon.valid : faIcon.invalid);
		}
		}
	});


	$('.formNotice span').click(function () {
	    $("#bv-errorcnt").toggle();
	    $("#regForm").toggle();
	});


	// FORM VARIOUS VALIDATION
	// =================================================================
	$('#bvd-notempty').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: faIcon,
		fields: {
		username: {
			message: 'The username is not valid',
			validators: {
				notEmpty: {
					message: 'The username is required.'
				}
			}
		},
		acceptTerms: {
			validators: {
				notEmpty: {
					message: 'You have to accept the terms and policies'
				}
			}
		},
		password: {
			validators: {
				notEmpty: {
					message: 'The password is required and can\'t be empty'
				},
				identical: {
					field: 'confirmPassword',
					message: 'The password and its confirm are not the same'
				}
			}
		},
		confirmPassword: {
			validators: {
				notEmpty: {
					message: 'The confirm password is required and can\'t be empty'
				},
				identical: {
					field: 'password',
					message: 'The password and its confirm are not the same'
				}
			}
		},
		member: {
			validators: {
				notEmpty: {
					message: 'The gender is required'
				}
			}
		},
		'programs[]': {
			validators: {
				choice: {
					min: 2,
					max: 4,
					message: 'Please choose 2 - 4 programming languages you are good at'
				}
			}
		},
		integer: {
			validators: {
				notEmpty: {
					message: 'The number is required and can\'t be empty'
				},
				integer: {
					message: 'The value is not a number'
				}
			}
		},
		numeric: {
			validators: {
				notEmpty: {
					message: 'The number is required and can\'t be empty'
				},
				numeric: {
					message: 'The value is not a number'
				}
			}
		},
		greaterthan: {
			validators: {
				notEmpty: {
					message: 'The number is required and can\'t be empty'
				},
				greaterThan: {
					inclusive:false,
					//If true, the input value must be greater than or equal to the comparison one.
					//If false, the input value must be greater than the comparison one
					value: 50,
					message: 'Please enter a value greater than 50'
				}
			}
		},
		lessthan: {
			validators: {
				notEmpty: {
					message: 'The number is required and can\'t be empty'
				},
				lessThan: {
					inclusive:false,
					//If true, the input value must be less than or equal to the comparison one.
					//If false, the input value must be less than the comparison one
					value: 25,
					message: 'Please enter a value less than 25'
				}
			}
		},
		range: {
			validators: {
				inclusive:true,
				notEmpty: {
					message: 'The number is required and can\'t be empty'
				},
				between: {
					min:1,
					max:100,
					message: 'Please enter a number between 1 and 100'
				}
			}
		},
		uppercase:{
			validators: {
				notEmpty: {
					message: 'The card holder is required and can\'t be empty'
				},
				// Since case is a Javascript keyword,
				// you should place it between quotes (like 'case' or "case")
				// to make it work in all browsers
				stringCase: {
					message: 'The card holder must be in uppercase',
					'case': 'upper'
				}
			}
		},
		email: {
			validators: {
				notEmpty: {
					message: 'The email address is required and can\'t be empty'
				},
				emailAddress: {
					message: 'The input is not a valid email address'
				}
			}
		},
		website: {
			validators: {
				notEmpty: {
					message: 'The website address is required and can\'t be empty'
				},
				uri: {
					allowLocal: false,
					message: 'The input is not a valid URL'
				}
			}
		},
		color: {
			validators: {
				notEmpty: {
					message: 'The hex color is required and can\'t be empty'
				},
				hexColor: {
					message: 'The input is not a valid hex color'
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
	});








});


      