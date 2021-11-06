$(document).ready(function() {
	$(".b1").click(function() {
		$(this).parent().parent().parent().find("input").hide();
		$(this).parent().parent().parent().find(".b1, .b2").hide();
		$(this).parent().parent().parent().find("span").show();
		$(this).parent().parent().parent().find(".b0").show();
	})
	$(".b0").click(function() {
		$(this).parent().parent().parent().find("input").show();
		$(this).parent().parent().parent().find(".b1, .b2").show();
		$(this).parent().parent().parent().find("span").hide();
		$(this).hide();
	})
	$(".modal-close").click(function() {
		$(".my-modal").hide();
	})
})

