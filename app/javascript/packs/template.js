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
		alert("Bình luận không được để trống");
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

			$("#text-review-house").val("");

			elListComment.innerHTML = elComment + preCommnents;
		})
		.catch((e) => console.log(e));
});

const addCare = () => $("#btn-care-add").on("click", function () {
	let userId = $(this).attr("data-user");
	let houseId = $(this).attr("data-house");
	let careId = $(this).attr("data-care");
	window
		.fetch("http://localhost:3000/care", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				data: {
					user_id: userId,
					house_id: houseId,
				},
			}),
		})
		.then((res) => res.json())
		.then((response) => {
			let boxContentCare = $("#box-content-care").html(`<div id="btn-care-remove" data-care="${response.id}" data-user="${response.user_id}" data-house="${response.house_id}" class="btn btn-danger">
																											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
																												<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
																												<path fill-rule="evenodd" d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683z"></path>
																												<path d="M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"></path>
																											</svg>
																											Het Quan tâm
																										</div>`)
			removeCare()
		})
		.catch((e) => console.log(e));
})

const removeCare = () => $("#btn-care-remove").on("click", function () {
	let userId = $(this).attr("data-user");
	let houseId = $(this).attr("data-house");
	let careId = $(this).attr("data-care");
	window
		.fetch("http://localhost:3000/care/" + careId, {
			method: "DELETE",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				data: {
					user_id: userId,
					house_id: houseId,
				},
			}),
		})
		.then((res) => res.json())
		.then((response) => {
			let boxContentCare = $("#box-content-care").html(`<div id="btn-care-add" data-user="${userId}" data-house="${houseId}" class="btn btn-primary">
																											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16">
																												<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
																												<path fill-rule="evenodd" d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"></path>
																											</svg>
																											Quan tâm
																										</div>`)
			addCare()
		})
		.catch((e) => console.log(e));
	
})

removeCare()
addCare()

if (
	window.location.pathname === "/users/password/new" ||
	window.location.pathname === "/users/password/edit" ||
	window.location.pathname === "/users/sign_up" ||
	window.location.pathname === "/users/sign_in" ||
	window.location.pathname === "/signin" ||
	window.location.pathname === "/signup"
) {
	$("#root_header").addClass("display_none");
}
