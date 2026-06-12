

$(document).ready(function() {


	// CHOSEN
	// =================================================================
	// Require Chosen
	// http://harvesthq.github.io/chosen/
	// =================================================================
	$('#chosen-select').chosen();
	$('#cs-multiselect').chosen({width:'100%'});



	// DEFAULT RANGE SLIDER
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-def").noUiSlider({
		start: [ 20 ],
		connect : 'lower',
		range: {
			'min': [  0 ],
			'max': [ 100 ]
		}
	}).Link('lower').to($("#range-def-val"));


	// RANGE SLIDER - SLIDER STEP BY STEP
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-step").noUiSlider({
		start: [ 20 ],
		connect : 'lower',
		step:10,
		range: {
		'min': [  0 ],
		'max': [ 100 ]
		}
	}).Link('lower').to($("#range-step-val"));


	// VERTICAL RANGE SLIDER
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-ver1").noUiSlider({
		start: [ 80 ],
		connect: 'lower',
		range: {
			'min':  [20],
			'max':  [100]
		},
		orientation: 'vertical',
		direction: 'rtl'
	});

	$("#range-ver2").noUiSlider({
		start: [ 50 ],
		connect: 'lower',
		range: {
			'min':  [20],
			'max':  [100]
		},
		orientation: 'vertical',
		direction: 'rtl'
	});

	$("#range-ver3").noUiSlider({
		start: [ 30 ],
		connect: 'lower',
		range: {
			'min':  [20],
			'max':  [100]
		},
		orientation: 'vertical',
		direction: 'rtl'
	});

	$("#range-ver4").noUiSlider({
		start: [ 50 ],
		connect: 'lower',
		range: {
			'min':  [20],
			'max':  [100]
		},
		orientation: 'vertical',
		direction: 'rtl'
	});

	$("#range-ver5").noUiSlider({
		start: [ 80 ],
		connect: 'lower',
		range: {
		'min':  [20],
		'max':  [100]
		},
		orientation: 'vertical',
		direction: 'rtl'
	});


	// RANGE SLIDER - DRAG
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-drg").noUiSlider({
		start: [ 40, 60 ],
		behaviour: 'drag',
		connect: true,
		range: {
		'min':  20,
		'max':  80
		}
	});

	// RANGE SLIDER - DRAG-FIXED
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-fxt").noUiSlider({
		start: [ 40, 60 ],
		behaviour: 'drag-fixed',
		connect: true,
		range: {
			'min':  20,
			'max':  80
		}
	});

	// RANGE SLIDER - DRAG TAP
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-com").noUiSlider({
		start: [ 40, 60 ],
		behaviour: 'drag-tap',
		connect: true,
		range: {
			'min':  20,
			'max':  80
		}
	});



	// RANGE SLIDER PIPS
	// =================================================================
	var range_all_sliders = {
		'min': [ 0 ],
		'25%': [ 50 ],
		'50%': [ 100 ],
		'75%': [ 150 ],
		'max': [ 200 ]
	};



	// RANGE SLIDER - HORIZONTAL PIPS
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-hpips").noUiSlider({
		range: range_all_sliders,
		connect: 'lower',
		start: 90
	});


	// RANGE SLIDER - VERTICAL PIPS
	// =================================================================
	// Require noUiSlider
	// http://refreshless.com/nouislider/
	// =================================================================
	$("#range-vpips").noUiSlider({
		range: range_all_sliders,
		start: 90,
		connect: 'lower',
		orientation: 'vertical',
		direction: 'rtl'
	});
	$(".pips").noUiSlider_pips({
		mode: 'range',
		density: 5
	});



	// BOOTSTRAP TIMEPICKER
	// =================================================================
	// Require Bootstrap Timepicker
	// http://jdewit.github.io/bootstrap-timepicker/
	// =================================================================
	$('#tp-com').timepicker();



	// BOOTSTRAP TIMEPICKER - COMPONENT
	// =================================================================
	// Require Bootstrap Timepicker
	// http://jdewit.github.io/bootstrap-timepicker/
	// =================================================================
	$('#tp-textinput').timepicker({
		minuteStep: 5,
		showInputs: false,
		disableFocus: true
	});


	// BOOTSTRAP DATEPICKER
	// =================================================================
	// Require Bootstrap Datepicker
	// http://eternicode.github.io/bootstrap-datepicker/
	// =================================================================
	$('#dp-txtinput input').datepicker();


	// BOOTSTRAP DATEPICKER WITH AUTO CLOSE
	// =================================================================
	// Require Bootstrap Datepicker
	// http://eternicode.github.io/bootstrap-datepicker/
	// =================================================================
	$('#dp-component .input-group.date').datepicker({autoclose:true});


	// BOOTSTRAP DATEPICKER WITH RANGE SELECTION
	// =================================================================
	// Require Bootstrap Datepicker
	// http://eternicode.github.io/bootstrap-datepicker/
	// =================================================================
	$('#dp-range .input-daterange').datepicker({
		format: "MM dd, yyyy",
		todayBtn: "linked",
		autoclose: true,
		todayHighlight: true
	});


	// INLINE BOOTSTRAP DATEPICKER
	// =================================================================
	// Require Bootstrap Datepicker
	// http://eternicode.github.io/bootstrap-datepicker/
	// =================================================================
	$('#dp-inline div').datepicker({
	format: "MM dd, yyyy",
	todayBtn: "linked",
	autoclose: true,
	todayHighlight: true
	});



	// SWITCHERY - CHECKED BY DEFAULT
	// =================================================================
	// Require Switchery
	// http://abpetkov.github.io/switchery/
	// =================================================================
	new Switchery(document.getElementById('sw-checked'));


	// SWITCHERY - UNCHECKED BY DEFAULT
	// =================================================================
	// Require Switchery
	// http://abpetkov.github.io/switchery/
	// =================================================================
	new Switchery(document.getElementById('sw-unchecked'));


	// SWITCHERY - CHECKING STATE
	// =================================================================
	// Require Switchery
	// http://abpetkov.github.io/switchery/
	// =================================================================
	var changeCheckbox = document.getElementById('sw-checkstate'), changeField = document.getElementById('sw-checkstate-field');
	new Switchery(changeCheckbox)
	changeField.innerHTML = changeCheckbox.checked;
	changeCheckbox.onchange = function() {
		changeField.innerHTML = changeCheckbox.checked;
	};


	// SWITCHERY - COLORED
	// =================================================================
	// Require Switchery
	// http://abpetkov.github.io/switchery/
	// =================================================================
	new Switchery(document.getElementById('sw-clr1'), {color:'#489eed'});
	new Switchery(document.getElementById('sw-clr2'), {color:'#35b9e7'});
	new Switchery(document.getElementById('sw-clr3'), {color:'#44ba56'});
	new Switchery(document.getElementById('sw-clr4'), {color:'#f0a238'});
	new Switchery(document.getElementById('sw-clr5'), {color:'#e33a4b'});
	new Switchery(document.getElementById('sw-clr6'), {color:'#2cd0a7'});
	new Switchery(document.getElementById('sw-clr7'), {color:'#8669cc'});
	new Switchery(document.getElementById('sw-clr8'), {color:'#ef6eb6'});


	// SWITCHERY - SIZES
	// =================================================================
	// Require Switchery
	// http://abpetkov.github.io/switchery/
	// =================================================================
	new Switchery(document.getElementById('sw-sz-lg'), { size: 'large' });
	new Switchery(document.getElementById('sw-sz'));
	new Switchery(document.getElementById('sw-sz-sm'), { size: 'small' });






	// DROPZONE.JS
	// =================================================================
	// Require Dropzone
	// http://www.dropzonejs.com/
	// =================================================================
	Dropzone.options.demoDropzone = { // The camelized version of the ID of the form element
		// The configuration we've talked about above
		autoProcessQueue: false,
		//uploadMultiple: true,
		//parallelUploads: 25,
		//maxFiles: 25,

		// The setting up of the dropzone
		init: function() {
		var myDropzone = this;
		//  Here's the change from enyo's tutorial...
		//  $("#submit-all").click(function (e) {
		//  e.preventDefault();
		//  e.stopPropagation();
		//  myDropzone.processQueue();
			//
		//}
		//    );

		}

	}



	// SUMMERNOTE
	// =================================================================
	// Require Summernote
	// http://hackerwins.github.io/summernote/
	// =================================================================
	$('#summernote').summernote({height: 250});




});
