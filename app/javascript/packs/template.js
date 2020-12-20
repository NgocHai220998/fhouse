import "./theme-change";
import "./jquery.waypoints.min";
import "./jquery.countup";
import "./owl.carousel";
import "./jquery.magnific-popup.min";
import "./preview_image";

let star = 1;

$(".btnrating").on("click", function (e) {
	var previous_value = $("#selected_rating").val();

	star = $(this).attr("data-attr");
	$("#selected_rating").val(star);

	$(".selected-rating").empty();
	$(".selected-rating").html(star);

	for (let i = 1; i <= star; ++i) {
		$("#rating-star-" + i).toggleClass("btn-warning");
		$("#rating-star-" + i).toggleClass("btn-dark");
	}

	for (let ix = 1; ix <= previous_value; ++ix) {
		$("#rating-star-" + ix).toggleClass("btn-warning");
		$("#rating-star-" + ix).toggleClass("btn-dark");
	}
});

$("#btn-submit-review-house").on("click", function () {
	let content = $("#text-review-house").val();
	if (content == "") {
		alert("Bình luận không được để trống")
		return;
	}
	let userId = $(this).attr("data-user");
	let houseId = $(this).attr("data-house");

	window
		.fetch("http://localhost:3000/comment", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				data: {
					user_id: userId,
					house_id: houseId,
					star: star,
					content: content,
				},
			}),
		})
		.then((res) => res.json())
		.then(({ comment, username, time }) => {
			let elStar = "";
			for (let ix = 0; ix < 5; ++ix) {
				elStar +=
					ix < comment.star
						? `<span style="padding-left: 4px; display: inline-block" class="fa fa-star star-checked"></span>`
						: `<span style="padding-left: 4px; display: inline-block" class="fa fa-star"></span>`;
			}

			const elComment = `<div class="list-comment-review-house-item">
											<div class="list-comment-top row">
												<div class="col-3 list-comment-top-name">
													${username}
												</div>
												<div class="col-6 list-comment-top-star">
													${elStar}
												</div>
												<div class="col-3 list-comment-top-time">
													${time}
												</div>
											</div>
											<div class="list-comment-content row">
												<p>
													${comment.content}
												</p>
											</div>
										</div>`;

			let elListComment = document.getElementById("list-comment-review-house");
			let preCommnents = elListComment.innerHTML;

			$("#text-review-house").val("")

			elListComment.innerHTML = elComment + preCommnents;
		})
		.catch((e) => console.log(e));
});
