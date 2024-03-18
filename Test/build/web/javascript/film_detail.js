function showDetail() {
        document.getElementById("detail").style.display = "block";
        document.getElementById("trailer").style.display = "none";
        document.getElementById("review").style.display = "none";

        document.getElementById("hiddenDetail").classList.add("active");
        document.getElementById("hiddenTrailer").classList.remove("active");
        document.getElementById("hiddenReview").classList.remove("active");
      }

      function showTrailer() {
        document.getElementById("detail").style.display = "none";
        document.getElementById("trailer").style.display = "block";
        document.getElementById("review").style.display = "none";

        document.getElementById("hiddenDetail").classList.remove("active");
        document.getElementById("hiddenTrailer").classList.add("active");
        document.getElementById("hiddenReview").classList.remove("active");
      }

      function showReview() {
        document.getElementById("detail").style.display = "none";
        document.getElementById("trailer").style.display = "none";
        document.getElementById("review").style.display = "block";

        document.getElementById("hiddenDetail").classList.remove("active");
        document.getElementById("hiddenTrailer").classList.remove("active");
        document.getElementById("hiddenReview").classList.add("active");
      }

      function postComment() {
        var comment = document.getElementById("comment").value;
        // Xử lý đăng comment ở đây
        alert("Bạn đã đăng comment: " + comment);
      }

      function addComment() {
        const commentInput = document.getElementById("comment");
        const commentText = commentInput.value.trim();

        if (commentText !== "") {
          const commentContainer = document.getElementById("comments");
          const newComment = document.createElement("div");
          newComment.classList.add("comment");
          newComment.innerText = commentText;
          commentContainer.appendChild(newComment);

          commentInput.value = "";
        }
      }
      function displayComments() {
        var commentSection = document.getElementById("commentSection");
        commentSection.innerHTML = "";

        comments.forEach(function (comment, index) {
          var commentDiv = document.createElement("div");
          commentDiv.classList.add("comment");
          commentDiv.innerHTML =
            "<strong>Ý kiến " + (index + 1) + ":</strong> " + comment;
          commentSection.appendChild(commentDiv);
        });
      }

      // Gọi hàm để hiển thị các ý kiến đã có khi trang load
      displayComments();

