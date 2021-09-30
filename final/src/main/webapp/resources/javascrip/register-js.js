/**
 * 
 */
$(document).ready(function() {
	var $submitBtn = $("#btn-submit");
	var $passwordBox = $("#password");
	var $confirmBox = $("#re-password");
	var $errorMsg = $('<p id="error_msg">Passwords do not match.</p>');

	// This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
	$submitBtn.removeAttr("disabled");

	function checkMatchingPasswords() {
		if ($confirmBox.val() != "" && $passwordBox.val != "") {
			if ($confirmBox.val() != $passwordBox.val()) {
				$submitBtn.attr("disabled", "disabled");
				$("#arlet").append($errorMsg);
			}
		}
	}

	function resetPasswordError() {
		$submitBtn.removeAttr("disabled");
		var $errorCont = $("#error_msg");
		if ($errorCont.length > 0) {
			$errorCont.remove();
		}
	}


	$("#re-password, #password")
		.on("keydown", function(e) {
			/* only check when the tab or enter keys are pressed
			 * to prevent the method from being called needlessly  */
			if (e.keyCode == 13 || e.keyCode == 9) {
				checkMatchingPasswords();
			}
		})
		.on("blur", function() {
			// also check when the element looses focus (clicks somewhere else)
			checkMatchingPasswords();
		})
		.on("focus", function() {
			// reset the error message when they go to make a change
			resetPasswordError();
		})
	
	$("#name, #phone, #user, #password").on("focus", function(e) {
		var $error = $("#error-email");
		if ($error.length > 0) $error.remove();
	})

});