$(document).ready(function() {

	$(".modal-close").click(function() {
		$(".my-modal").hide();
	})

	$(".btn-show").click(function() {
		$("#g0").val($(this).attr("g0"));
		$("#g1").val($(this).attr("g1"));
		$("#g2").val($(this).attr("g2"));
		$("#g3").val($(this).attr("g3"));
		$("#g4").val($(this).attr("g4"));
		$("#g5").val($(this).attr("g5"));
		$("#g6").val($(this).attr("g6"));
		$("#g7").val($(this).attr("g7"));
		$("#g8").val($(this).attr("g8"));
		$("#hidden-date").val($(this).attr("hidden-date"));
		$("#hidden-companyId").val($(this).attr("hidden-companyId"));
		$("#province-head").text($(this).attr("hidden-province"));
		$("#date-head").text($(this).attr("dateFormat"));
	})

	$("#btn-fix-lottery").click(function() {
		$("#fix-lottery input").removeAttr("disabled");
		$("#btn-fix-lottery").hide();
		$("#submit-fix-lottery").show();
	})

	$("#cancel-fix-lottery").click(function() {
		$("#fix-lottery input").attr("disabled", "disabled");
		$("#btn-fix-lottery").show();
		$("#submit-fix-lottery").hide();
	})

	$(".submit-delete-one").click(function() {
		$("#date-and-id-form").val($(this).attr("date-and-id"));
	})

	$("#check-box-all").click(function() {
		if (this.checked) {
			$(".check-items").each(function() {
				if (!this.checked) {
					$(this).prop("checked", true);
				}
			})
			$("#btn-delete-many").prop("disabled",false)
		} else {
			$(".check-items").each(function() {
				if (this.checked) {
					$(this).prop("checked",false);
				}
			})
			$("#btn-delete-many").prop("disabled", true);
		}
	})

	$(".check-items").click(function() {
		let x = false
		$(".check-items").each(function() {
			if (this.checked) {
				x = true
			}
		})
		if (x == true) $("#btn-delete-many").removeAttr("disabled");
		else $("#btn-delete-many").attr("disabled", "disabled");
	})

})