$(document).ready(function () {
    $("#username").change(function () { var username = $('#username').val(); sessionStorage.setItem("SetUsername", username); }); $("#password").change(function () { var password = $('#password').val(); sessionStorage.setItem("SetPassword", password); }); var getUsername = sessionStorage.getItem("SetUsername"); var getPassword = sessionStorage.getItem("SetPassword"); var user = $('#username').val(getUsername); var pass = $('#password').val(getPassword); try {
        if (rememberCheckbox.checked) { var username = $('#username').val(); var password = $('#password').val(); sessionStorage.setItem("SetUsername", username); sessionStorage.setItem("SetPassword", password); }
        else { sessionStorage.removeItem("SetUsername"); sessionStorage.removeItem("SetPassword"); $('input[type=text]').each(function () { $(this).val(''); }); $('input[type=password]').each(function () { $(this).val(''); }); }
    }
    catch (e) { console.log('You got this error: ' + e); }
});