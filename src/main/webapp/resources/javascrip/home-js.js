/**
 * 
 */
$(document).ready(function() {
	// Search result box sticky
	
	window.onscroll = function() {
		myFunction()
	};

	var navbar = document.getElementById("check");
	var sticky = navbar.offsetTop;

	function myFunction() {
		if (window.pageYOffset >= 470) {
			navbar.classList.add("sticky")
		} else {
			navbar.classList.remove("sticky");
		}
	}

	//menu user
	$(".user-logo").click(function() {
		$(".user-drop").toggle(200);
	})

});
