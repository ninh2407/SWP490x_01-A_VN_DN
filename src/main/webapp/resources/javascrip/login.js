$(document).ready(function() {

	$(".modal-close").click(function() {
		$(".my-modal").hide();
	})

	$("#btn-email").click(function() {
		if ($("#email-reset").val() != "") {
			$("#staticBackdrop").hide();
			$("#my-modal-hidden").show();
		}
	})
})